<?php

namespace App\Http\Controllers;

use App\Models\EmloyeeSalary;
use App\Models\Expense;
use App\Models\Order;
use App\Models\Commission;
use App\Models\Rental;
use App\Models\Task;
use App\Models\User;
use Illuminate\Http\Request;

class ReportsController extends Controller {

    public function index($year) {
        $ordersByMonth = Order::selectRaw('MONTH(created_at) as month, COUNT(*) as count')
            ->whereYear('created_at', $year)
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

    public function Earnings() {//EarningsReport
        $year = $year ?? date('Y');
        $month = $month ?? date('m');
        //الايجار
        $rentalMonthly = Rental::selectRaw('
                SUM(amount) as total_rental
            ')
            ->whereYear('created_at', $year)
            ->whereMonth('created_at', $month)
            ->get();
//        dd($rentalMonthly);
        // رواتب الموظفين
        $salaryMonthly = EmloyeeSalary::selectRaw('
                SUM(final_salary) as total_salary
            ')
            ->whereYear('created_at', $year)
            ->whereMonth('created_at', $month)
            ->get();

        // مصروفات أخرى
        $expenseMonthly = Expense::selectRaw('
                SUM(amount) as total_expense
            ')
            ->whereYear('created_at', $year)
            ->whereMonth('created_at', $month)
            ->get();
        dd($expenseMonthly);
    }
}
