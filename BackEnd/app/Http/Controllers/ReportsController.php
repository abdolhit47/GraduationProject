<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Commission;
use Illuminate\Http\Request;

class ReportsController extends Controller {
    public function generateRevenueReport(Request $request) {
        $query = Order::query();
        
        if ($request->has('start_date')) {
            $query->whereDate('created_at', '>=', $request->start_date);
        }
        if ($request->has('end_date')) {
            $query->whereDate('created_at', '<=', $request->end_date);
        }

        $revenue = $query->sum('shipping_cost');
        $ordersCount = $query->count();

        return response()->json([
            'revenue' => $revenue,
            'orders_count' => $ordersCount,
            'average_order_value' => $ordersCount > 0 ? $revenue / $ordersCount : 0
        ]);
    }

    public function generateExpenseReport(Request $request) {
        $query = Commission::query();
        
        if ($request->has('start_date')) {
            $query->whereDate('created_at', '>=', $request->start_date);
        }
        if ($request->has('end_date')) {
            $query->whereDate('created_at', '<=', $request->end_date);
        }

        $expenses = $query->sum('commission');
        return response()->json([
            'expenses' => $expenses,
            'period' => [
                'start' => $request->start_date ?? 'all time',
                'end' => $request->end_date ?? 'present'
            ]
        ]);
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
