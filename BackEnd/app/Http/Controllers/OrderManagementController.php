<?php

namespace App\Http\Controllers;

use App\Models\Commission;
use App\Models\CommUser;
use App\Models\Order;
use App\Models\User;
use App\Notifications\NewNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;


class OrderManagementController extends Controller {

    public function commissionOrders() {//عرض شحنات في واجهة إضافة طلب جديد
        $orders = CommUser::with('commission')->where('user_id',auth()->user()->id)->get();
        $orders = $orders->pluck('commission');
        $orders = $orders->map(function($order){
            return['value'=>$order->id,
            'lable'=>$order->country];
        });
        return response()->json($orders,200);
    }
    public function addOrder(Request $request) {
        $validator = Validator::make($request->all(), [
            'customer_id' => ['required', 'exists:users,id'],//زبون
            'commission_id' => ['required', 'exists:commissions,id',
                function ($attribute, $value, $fail) {
                    if (!CommUser::where('user_id', auth()->user()->id)->where('commission_id', $value)->exists()) {
                        $fail('Commission ID does not belong to the current user.');
                    }
                },
                ],//ID شحنة
            'product_name' => ['required', 'string'],//اسم المنتج
            'product_type' => ['required', 'string', Rule::in(['electronics', 'clothes', 'home_supplies', 'cosmetics', 'toys', 'sports', 'other'])],//نوع المنتج
            'weight' => ['required', 'numeric', 'min:0'],//الوزن
            'shipping_cost' => ['required', 'numeric', 'min:0'],//تكلفة الشحن
            'shipping_address' => ['required', 'string'],//عنوان الشحن إلى الزبون
            'expected_delivery_time' => ['required', 'integer'],//تاريخ التسليم المتوقع
        ], [
            'customer_id.required' => 'Customer ID is required',
            'customer_id.exists' => 'Customer ID is invalid',
            'commission_id.required' => 'Commission ID is required',
            'commission_id.exists' => 'Commission ID is invalid',
            'product_type.required' => 'Product type is required',
            'product_type.string' => 'Product type must be a string',
            'weight.required' => 'Weight is required',
            'weight.numeric' => 'Weight must be a number',
            'shipping_cost.required' => 'Shipping cost is required',
            'shipping_cost.numeric' => 'Shipping cost must be a number',
            'shipping_cost.min' => 'Shipping cost must be at least 0',
            'shipping_address.required' => 'Shipping address is required',
            'expected_delivery_time.required' => 'Expected delivery date is required',
            'expected_delivery_time.integer' => 'Expected delivery date must be an integer',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors(),
            ], 400);
        }
        $validator->setData($validator->getData() + [
            'user_id' => auth()->user()->id,
            'order_number' => random_int(100000, 999999),
            'status' => 'pending',
        ]);

        $order = Order::create($validator->getData());
        $user = User::find($order->customer_id);
        $user->notify(new NewNotification(
            NewNotification::NEW_ORDER, // يجب تغيير النوع هنا
            $order,
            'طلبية جديدة مخصصة لك: ' . $order->product_name
        ));
        return response()->json([
            'Message' => 'Order added successfully',
            'success' => true,

        ], 201);
    }

    public function index() {
        $orders = Order::with('customer','user')->whereIn('status',['pending', 'purchased', 'shipping'])->get();
        $orders = $orders->map(function ($order){
            return[
                'value' => $order->id,
                'label' => $order->order_number,
            ];
        });
        return response()->json($orders,200);
    }
    public function indexID($id){
        $order = Order::with('customer','user')->where('id',$id)->whereIn('status',['pending', 'purchased', 'shipping'])->first();
        if(!$order){
            return response()->json('not found');
        }
        $order = [
                'product_name' => $order->product_name,
                'shipping_cost' => (float)$order->shipping_cost,
                'customer_name' => $order->customer->getFullNameAttribute(),
                'status' => $order->status,
                'value'=>$order->user->id,
                'lable'=>$order->user->role,
            ];
        return response()->json($order,200);
    }
    public function viewOrders() {
        $orders = Order::with('customer','commission')->whereIn('status',['pending', 'purchased', 'shipping', 'delivering'])->get();
        return response()->json($this->orderview($orders));
    }
    public function viewOrderTR(){
        $orders = Order::with('customer','commission')->whereIn('status',['pending', 'purchased', 'shipping', 'delivering'])->where('commission_id','2')->get();
        return response()->json($this->orderview($orders));
    }
    public function viewOrderUEA(){
        $orders = Order::with('customer','commission')->whereIn('status',['pending', 'purchased', 'shipping', 'delivering'])->where('commission_id','3')->get();
        return response()->json($this->orderview($orders));
    }
    public function viewOrderCH(){
        $orders = Order::with('customer','commission')->whereIn('status',['pending', 'purchased', 'shipping', 'delivering'])->where('commission_id','1')->get();
        return response()->json($this->orderview($orders));
    }
     function orderview($orders){
        $orders = $orders->map(function($order){
            return [
                'id' => $order->id,
                'order_number' => $order->order_number,
                'product_name' => $order->product_name,
                'shipping_cost' => (float)$order->shipping_cost,
                'order_cost' => ($order->weight * $order->commission->price_per_kg) + $order->shipping_cost + $order->commission->commission,
                'customer_name' => $order->customer->getFullNameAttribute(),
                'customer_phone' => $order->customer->phone,
                'shipping_address' => $order->shipping_address,
                'expected_delivery_time' => $order->expected_delivery_time,
                'product_type' => $order->product_type,
                'status' => $order->status,
            ];
        });
        return $orders;
    }

    public function viewbytype($type) {
        if($type == 'turkey') {
            $commission = Commission::select('id')->where('country', $type)->first();

            $orders = Order::select('id', 'order_number')->whereIn('status', ['pending', 'purchased', 'shipping'])->where('commission_id', $commission->id)->get();
        }
        elseif ($type == 'uae') {
            $commission = Commission::select('id')->where('country', $type)->first();
            $orders = Order::select('id', 'order_number')->whereIn('status', ['pending', 'purchased', 'shipping'])->where('commission_id', $commission->id)->get();
        }
        elseif ($type == 'china') {
            $commission = Commission::select('id')->where('country', $type)->first();
            $orders = Order::select('id', 'order_number')->whereIn('status', ['pending', 'purchased', 'shipping'])->where('commission_id', $commission->id)->get();
        }
        $orders = $orders->map(function($order){
            return['value'=>$order->id,
                'lable'=>$order->order_number];
        });
        return response()->json($orders);
    }
    public function getOrder($orderId) {
        $order = Order::findOrFail($orderId);
        if(!$order){
            return response()->json('not found');
        }
        $order = [
            'customer_name' => $order->customer->getFullNameAttribute(),
            'product_name' => $order->product_name,
            'shipping_cost' => (float)$order->shipping_cost,
            'status' => $order->status,
            'phone' => $order->customer->phone,
            'address' => $order->shipping_address,
            'expected_delivery_time' => $order->expected_delivery_time,
        ];
        return response()->json($order);
    }
    public function editOrder(Request $request, $orderId) {
        $order = Order::findOrFail($orderId);

        $validator = Validator::make($request->all(), [
            'product_name' => ['nullable', 'string'],//اسم المنتج
            'shipping_cost' => ['nullable', 'numeric', 'min:0'],//تكلفة الشحن
            'shipping_address' => ['nullable', 'string'],//عنوان الشحن إلى الزبون
            'expected_delivery_time' => ['nullable', 'integer'],//تاريخ التسليم المتوقع
            'status' => ['nullable', 'string', Rule::in(['pending', 'purchased', 'shipping', 'delivering', 'delivered', 'cancelled'])],
        ], [
            'shipping_cost.numeric' => 'Shipping cost must be a number',
            'shipping_cost.min' => 'Shipping cost must be at least 0',
            'expected_delivery_time.integer' => 'Expected delivery date must be an integer',
            'status.in' => 'Status must be one of the following: pending, purchased, shipping, delivering, delivered, cancelled',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors(),
            ], 400);
        }
        if($validator->getData()['status'] == 'delivering') {
            $validator->setData($validator->getData() + [
                    'delivery_agent_id' =>User::select('id')->where('role', 'delivery_agent')->first()->id,
                ]);
        }
        if($validator->getData()['status'] == $order->status) {
            $order->update($validator->getData());
        }else{
            $order->update($validator->getData());
            $user = User::find($order->customer_id);
            $user->notify(new NewNotification(
                NewNotification::ORDER_STATUS, // يجب تغيير النوع هنا
                $order,
                'تم تحديث حالة الطلبية: ' . $order->product_name
            ));
        }
        return response()->json([
            'success' => true,
            'message' => 'Order updated successfully',
        ]);
    }
    public function deleteOrder(Request $request, $orderId) {
        $order = Order::findOrFail($orderId);


        // Delete order items first
        $order->items()->delete();

        $order->delete();
        return response()->json([
            'success' => true,
            'message' => 'Order deleted successfully'
        ]);
    }

    public function transferOrder(Request $request, $orderId) {
        $validator = Validator::make($request->all(),[
            'value' => 'required|exists:users,id'
        ],[
            'value.required' => 'User ID is required',
            'value.exists' => 'User ID is invalid',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors(),
            ], 400);
        }

        $order = Order::findOrFail($orderId);
        $order->user_id = $validator->validate()['value'];
        $order->save();

        $user = User::find($validator->validate()['value']);
        $user->notify(new NewNotification(
            NewNotification::TRANSFERORDER,
            $order,
            'تم تحويل الطلبية إليك '
        ));

        return response()->json([
            'success' => true,
            'message' => 'Order transferred successfully',
        ]);
    }
}
