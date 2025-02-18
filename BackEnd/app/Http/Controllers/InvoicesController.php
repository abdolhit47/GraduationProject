<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class InvoicesController extends Controller
{
    public function index()
    {
        $Invoices = Order::with('commission')->select('id', 'weight', 'order_number','shipping_cost')
            ->where('commission_id', Auth::user()->id)
//            ->where('status', 'delivered')
            ->get();
        $Invoices = $Invoices->map(function ($Invoice) {

            return [
                'id' => $Invoice->id,
                'weight' => $Invoice->weight,
                'order_number' => $Invoice->order_number,
                'shipping_cost' => $Invoice->shipping_cost,
                'total' => $Invoice->weight + $Invoice->shipping_cost + $Invoice->commission->commission
            ];
        });
        return response()->json($Invoices);
    }

}
