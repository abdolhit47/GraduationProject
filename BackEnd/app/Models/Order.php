<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'customer_id',
        'user_id',
        'delivery_agent_id',
        'order_number',
        'commission_id',
        'product_name',
        'product_type',
        'weight',
        'shipping_cost',
        'shipping_address',
        'status',
        'expected_delivery_time',

    ];
    // علاقة العميل
    public function customer()
    {
        return $this->belongsTo(User::class, 'customer_id');
    }

    // علاقة الموظف الذي أنشأ الطلب
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // علاقة مندوب التوصيل
    public function deliveryAgent()
    {
        return $this->belongsTo(User::class, 'delivery_agent_id');
    }

    // علاقة العمولة
    public function commission()
    {
        return $this->belongsTo(Commission::class);
    }


}
