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

        $allMonths = collect(range(1, 12))->map(function ($month) use ($ordersByMonth, $arabicMonths) {
            return [
                'value' => $ordersByMonth->get($month, 0),
                'month' => $arabicMonths[$month]
            ];
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

    public function viewExpenses($year = null) {
        $year = $year ?? date('Y');

        // إنشاء هيكل أساسي لجميع أشهر السنة
        $months = [];
        for ($m = 1; $m <= 12; $m++) {
            $monthNumber = str_pad($m, 2, '0', STR_PAD_LEFT);
            $monthName = \Carbon\Carbon::createFromDate(null, $m, 1)->translatedFormat('F');
            $months[$monthNumber] = [
                'month_number' => $m,
                'month_name' => $monthName,
                'rentals' => [],
                'rental_total' => 0,
                'salaries' => [],
                'salary_total' => 0,
                'expenses' => [],
                'expense_total' => 0,
                'total' => 0,
            ];
        }

        // معالجة الإيجارات
        $rentals = Rental::select('id','name', 'amount', 'created_at')->whereYear('created_at', $year)->get();
        foreach ($rentals as $rental) {
            $month = $rental->created_at->format('m');
            $months[$month]['rentals'][] = $rental;
            $months[$month]['rental_total'] += $rental->amount;
            $months[$month]['total'] += $rental->amount;
        }

        // معالجة الرواتب
        $salaries = EmloyeeSalary::with('employee')->select('id', 'employee_id', 'final_salary', 'created_at')->whereYear('created_at', $year)->get();
        foreach ($salaries as $salary) {

            $month = $salary->created_at->format('m');
            $rentalData = $salary->toArray();
            $rentalData['employee_name'] = $salary->employee->getFullNameAttribute();
            unset($rentalData['employee']);
            unset($rentalData['employee_id']);
            $months[$month]['salaries'][] = $rentalData;
            $months[$month]['salary_total'] += $rentalData['final_salary'];
            $months[$month]['total'] += $rentalData['final_salary'];
        }

        // معالجة المصروفات
        $expenses = Expense::select('id', 'type', 'amount', 'created_at')->whereYear('created_at', $year)->get();
        foreach ($expenses as $expense) {
            $month = $expense->created_at->format('m');
            $months[$month]['expenses'][] = $expense;
            $months[$month]['expense_total'] += $expense->amount;
            $months[$month]['total'] += $expense->amount;
        }

        // تحويل المصفوفة إلى قائمة مرتبة
        $orderedMonths = array_values($months);

        return response()->json($orderedMonths);
    }
//    private function getAllMonths($Earnings){
//        $monthlyRentals = [];
//        foreach ($Earnings as $rental) {
//            $month = $rental->created_at->format('m'); // رقم الشهر (01 إلى 12)
//            $monthName = $rental->created_at->translatedFormat('F'); // اسم الشهر بالعربية
//
//            if (!isset($monthlyRentals[$month])) {
//                $monthlyRentals[$month] = [
//                    'month_name' => $monthName,
//                    'records' => []
//                ];
//            }
//            $rentalData = $rental->toArray();
//            // Extract employee name
//            if($rental->employee){
//                $rentalData['employee_name'] = $rental->employee->getFullNameAttribute();
//                unset($rentalData['employee']);
//                unset($rentalData['employee_id']);
//            }
//
//            unset($rentalData['created_at']);
//            $monthlyRentals[$month]['records'][] = $rentalData;
//        }
//        // إنشاء مصفوفة لجميع أشهر السنة (حتى الفارغة)
//        $allMonths = [];
//        for ($m = 1; $m <= 12; $m++) {
//            $monthNumber = str_pad($m, 2, '0', STR_PAD_LEFT);
//            $monthName = now()->month($m)->translatedFormat('F');
//
//            $allMonths[$monthNumber] = [
//                'month_name' => $monthName,
//                'records' => $monthlyRentals[$monthNumber]['records'] ?? []
//            ];
//        }
//        return $allMonths;
//    }


    public function Earnings($year = null, $month = null) {//EarningsReport
        $year = $year ?? date('Y');
        $month = $month ?? null;

        $query = Order::join('commissions', 'orders.commission_id', '=', 'commissions.id')
            ->selectRaw('SUM( commissions.commission) as total_commission')
            ->whereYear('orders.created_at', $year);

        if ($month) {
            $query->whereMonth('orders.created_at', $month);
        }

        $result = $query->first();
        $dateFilter = function($query) use ($year, $month) {
            $query->whereYear('created_at', $year);
            if ($month) $query->whereMonth('created_at', $month);
        };

        // حساب الإيجارات
        $rentalQuery = Rental::where($dateFilter);
        $rentalTotal = $rentalQuery->sum('amount');

        // حساب الرواتب
        $salaryQuery = EmloyeeSalary::where($dateFilter);
        $salaryTotal = $salaryQuery->sum('final_salary');

        // حساب المصروفات (مع مراعاة حقل payment_date)
        $expenseQuery = Expense::whereYear('payment_date', $year);
        if ($month) $expenseQuery->whereMonth('payment_date', $month);
        $expenseTotal = $expenseQuery->sum('amount');

        // الإجمالي الكلي
        $overallTotal = $rentalTotal + $salaryTotal + $expenseTotal;
        return [
            'total_commission' => $result->total_commission ?? 0,
            'period' => $month ? "Month $month, $year" : "Year $year",
            'Expense total' => $overallTotal,
            'Earnings total'=> $result->total_commission - $overallTotal
        ];
    }

}
