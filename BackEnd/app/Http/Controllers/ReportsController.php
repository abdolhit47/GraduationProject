<?php

namespace App\Http\Controllers;

use App\Models\EmloyeeSalary;
use App\Models\Order;
use App\Models\Commission;
use App\Models\Task;
use App\Models\User;
use Illuminate\Http\Request;

class ReportsController extends Controller {

    public function index() {
        $ordersByMonth = Order::selectRaw('MONTH(created_at) as month, COUNT(*) as count')
            ->whereYear('created_at', date('Y'))
            ->groupBy('month')
            ->pluck('count', 'month');
        $arabicMonths = [
            1 => 'يناير',
            2 => 'فبراير',
            3 => 'مارس',
            4 => 'أبريل',
            5 => 'مايو',
            6 => 'يونيو',
            7 => 'يوليو',
            8 => 'أغسطس',
            9 => 'سبتمبر',
            10 => 'أكتوبر',
            11 => 'نوفمبر',
            12 => 'ديسمبر'
        ];
        $allMonths = collect(range(1, 12))->mapWithKeys(function ($month) use ($ordersByMonth,$arabicMonths) {
            $monthName = $arabicMonths[$month]; // الحصول على اسم الشهر بالعربية
            return [$monthName => $ordersByMonth->get($month, 0)];
        });
        $counts = [
            'orders' => $allMonths,
            'tasks' => Task::count(),
            'users' => User::where('role', '!=', 'customer')->count(),
            'costumers' => User::where('role', 'customer')->count(),
        ];
        return response()->json($counts);
    }
    public function generateRevenueReport($year) {
        // أسماء الأشهر بالعربية
        $arabicMonths = [
            1 => 'يناير',
            2 => 'فبراير',
            3 => 'مارس',
            4 => 'أبريل',
            5 => 'مايو',
            6 => 'يونيو',
            7 => 'يوليو',
            8 => 'أغسطس',
            9 => 'سبتمبر',
            10 => 'أكتوبر',
            11 => 'نوفمبر',
            12 => 'ديسمبر'
        ];

        // الإيرادات الشهرية للسنة المحددة
        $monthlyRevenue = Order::selectRaw('
        YEAR(orders.created_at) as year,
        MONTH(orders.created_at) as month,
        SUM(orders.shipping_cost + (orders.weight * commissions.price_per_kg) + commissions.commission) as total_revenue,
        COUNT(*) as orders_count
    ')
            ->join('commissions', 'orders.commission_id', '=', 'commissions.id')
            ->whereYear('orders.created_at', $year) // <-- إضافة الفلترة حسب السنة
            ->groupBy('year', 'month')
            ->get()
            ->map(function ($item) use ($arabicMonths) {
                return [
                    'month' => $arabicMonths[$item->month],
                    'year' => $item->year,
                    'revenue' => $item->total_revenue
                ];
            });

        // الإيرادات السنوية للسنة المحددة
        $yearlyRevenue = Order::selectRaw('
        SUM(orders.shipping_cost + (orders.weight * commissions.price_per_kg) + commissions.commission) as total_revenue,
        COUNT(*) as orders_count
    ')
            ->join('commissions', 'orders.commission_id', '=', 'commissions.id')
            ->whereYear('orders.created_at', $year) // <-- إضافة الفلترة حسب السنة
            ->first(); // <-- استخدام first() بدل get() لأننا لا نحتاج تجميع

        // بيانات الطلبات للسنة المحددة
        $orders = Order::with('commission')
            ->whereYear('created_at', $year) // <-- إضافة الفلترة حسب السنة
            ->get()
            ->map(function ($order) {
                $commissionAmount =
                    ((float)$order->weight * (float)$order->commission->price_per_kg)
                    ;

                return [
                    'order_number' => $order->order_number,
                    'shipping_cost' => $order->shipping_cost,
                    'weight' => $order->weight,
                    'price_per_kg' => $order->commission->price_per_kg ?? 0,
                    'commission' => $order->commission->commission,
                    'total' => $commissionAmount + (float)$order->shipping_cost + (float)$order->commission->commission,
                    'date' => $order->created_at->format('Y-m-d')
                ];
            });

        return response()->json([
            'orders' => $orders,
            'monthlyRevenue' => $monthlyRevenue,
            'yearlyRevenue' => $yearlyRevenue
        ]);
    }

    public function viewExpenses() {
        $EmloyeeSalary = EmloyeeSalary::all();
    }

    public function generateProfitReport(Request $request) {
        $orderQuery = Order::query();
        $commissionQuery = Commission::query();

        if ($request->has('start_date')) {
            $orderQuery->whereDate('created_at', '>=', $request->start_date);
            $commissionQuery->whereDate('created_at', '>=', $request->start_date);
        }
        if ($request->has('end_date')) {
            $orderQuery->whereDate('created_at', '<=', $request->end_date);
            $commissionQuery->whereDate('created_at', '<=', $request->end_date);
        }

        $revenue = $orderQuery->sum('shipping_cost');
        $expenses = $commissionQuery->sum('commission');
        $profit = $revenue - $expenses;

        return response()->json([
            'revenue' => $revenue,
            'expenses' => $expenses,
            'profit' => $profit,
            'profit_margin' => $revenue > 0 ? ($profit / $revenue) * 100 : 0
        ]);
    }

    public function generateOrderStatusReport() {
        $ordersByStatus = Order::select('status')
            ->selectRaw('COUNT(*) as count')
            ->selectRaw('SUM(shipping_cost) as total_revenue')
            ->groupBy('status')
            ->get();

        return response()->json([
            'orders_by_status' => $ordersByStatus
        ]);
    }
}
