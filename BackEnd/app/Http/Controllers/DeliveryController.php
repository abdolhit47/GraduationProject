<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class DeliveryController extends Controller
{
    public function index(){
        $transletCountry = [
            'uae' => 'الإمارات العربية المتحدة',
            'turkey' => 'تركيا',
            'china' => 'الصين',
        ];
        $transletStatus = [
            'delivering' => 'قيد التسليم',
            'delivered' => 'تم التسليم',
        ];
        $days = [
            'Saturday' => 'السبت',
            'Sunday' => 'الأحد',
            'Monday' => 'الاثنين',
            'Tuesday' => 'الثلاثاء',
            'Wednesday' => 'الأربعاء',
            'Thursday' => 'الخميس',
            'Friday' => 'الجمعة',
        ];
        $orders = Order::with('customer','commission')
            ->select('id','order_number','status','commission_id','expected_delivery_time','created_at')
            ->where('status','delivering')
            ->get();
        $orders = $orders->map(function($order)use($transletCountry,$transletStatus,$days){
            $createdAt = $order->created_at ? \Carbon\Carbon::parse($order->created_at) : null;
            $expectedDeliveryDays = $order->expected_delivery_time ?? 0;

            $deliveryDate = $createdAt ? $createdAt->copy()->addDays($expectedDeliveryDays) : null; // تاريخ التسليم المتوقع
            $formattedDeliveryDate = $deliveryDate ? $deliveryDate->format('Y-m-d') : null; // تنسيق تاريخ التسليم
            $dayOfWeek = $deliveryDate ? $deliveryDate->dayName : null; // يوم التسليم المتوقع

            return [
                'id' => $order->id,
                'order_number' => $order->order_number,
                'status' => strtr($order->status,$transletStatus),
                'country' => strtr($order->commission->country,$transletCountry),
                'order_date' => $createdAt ? $createdAt->format('Y-m-d') : null, // تاريخ الطلب
                'delivery_date' => $formattedDeliveryDate, // تاريخ التسليم المتوقع
                'delivery_day' => $days[$dayOfWeek] // يوم التسليم المتوقع
            ];
        });
        return response()->json($orders);
    }

    public function updateDelivery($id){
        $order = Order::find($id);
        $order->status = 'delivered';
        $order->save();
        return response()->json('success');
    }
}
