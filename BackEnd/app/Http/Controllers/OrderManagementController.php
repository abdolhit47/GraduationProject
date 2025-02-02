<?php

namespace App\Http\Controllers;

use App\Models\Commission;
use App\Models\CommUser;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;


class OrderManagementController extends Controller {

    public function commissionOrders() {//عرض شحنات في واجهة إضافة طلب جديد
        $orders = CommUser::with('commission')->where('user_id',auth()->user()->id)->get();
        $orders = $orders->pluck('commission');
        return response()->json($orders->select('id','country'),200);
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
            'expected_delivery_date' => ['required', 'integer'],//تاريخ التسليم المتوقع
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
            'expected_delivery_date.required' => 'Expected delivery date is required',
            'expected_delivery_date.integer' => 'Expected delivery date must be an integer',
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
        //send email to customer
        //send notification to customer
        return response()->json([
            'Message' => 'Order added successfully',
            'success' => true,

        ], 201);
    }

    public function viewOrders() {
//        if(auth()->user()->role == 'general_manager'){
            $orders = Order::with('customer','commission')->get();
//        }else{
//            $orders = Order::with('customer','commission')->where('user_id',auth()->user()->id)->get();
//        }
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
        return response()->json($orders,200);
    }

    public function viewOrderTR(){

    }

    public function viewOrderUEA(){

    }

    public function viewOrderCH(){

    }
    public function editOrder(Request $request, $orderId) {
        $order = Order::findOrFail($orderId);

        $validator = Validator::make($request->all(), [
            'name' => 'nullable','string','max:255',
            'type' => ['nullable', Rule::in(['apartment', 'office', 'building', 'warehouse', 'storage', 'other'])],//نوع المنتج
            'location' => 'nullable','string','max:255',
            'amount' => 'nullable','numeric','min:0',
        ], [
            'name.string' => 'Name must be a string.',
            'type.in' => 'Type must be a string.',
            'location.string' => 'Location must be a string.',
            'amount.numeric' => 'Amount must be a number.',
            'amount.min' => 'Amount must be greater than 0.',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors(),
            ], 400);
        }
        // Handle status change
        if ($request->filled('status') && $request->status !== $order->status) {
            $order->status_history = array_merge($order->status_history ?? [], [[
                'from' => $order->status,
                'to' => $request->status,
                'changed_by' => $request->user()->id,
                'changed_at' => now(),
                'reason' => $request->input('status_change_reason')
            ]]);
        }

        // Update basic order information
        $order->update($request->except('items'));

        // Update items if provided
        if ($request->has('items')) {
            // Delete existing items
            $order->items()->delete();

            // Add new items
            foreach ($request->items as $item) {
                $order->items()->create($item);
            }

            // Recalculate totals
            $subtotal = collect($request->items)->sum(function($item) {
                return $item['quantity'] * $item['price'];
            });

            $taxAmount = $subtotal * ($order->tax_rate / 100);
            $total = $subtotal + $taxAmount;

            $order->update([
                'subtotal' => $subtotal,
                'tax_amount' => $taxAmount,
                'total' => $total
            ]);
        }

        return response()->json([
            'success' => true,
            'order' => $order
        ]);
    }

    public function deleteOrder(Request $request, $orderId) {
        $order = Order::findOrFail($orderId);

        // Prevent deleting delivered orders
        if ($order->status === 'delivered') {
            return response()->json([
                'success' => false,
                'message' => 'Cannot delete delivered orders.'
            ], 403);
        }

        // Delete order items first
        $order->items()->delete();

        $order->delete();
        return response()->json([
            'success' => true,
            'message' => 'Order deleted successfully'
        ]);
    }

    public function transferOrder(Request $request, $orderId) {
        $request->validate([
            'new_user_id' => 'required|exists:users,id'
        ]);

        $order = Order::findOrFail($orderId);
        $order->user_id = $request->new_user_id;
        $order->save();

        return response()->json([
            'success' => true,
            'message' => 'Order transferred successfully',
        ]);
    }
}
