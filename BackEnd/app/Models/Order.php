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

    // علاقة المعاملات المالية للطلب
    public function moneyTransactions()
    {
        return $this->hasMany(MoneyTransaction::class);
    }

    /**
     * Get the items for the order.
     */
    // علاقة الإشعارات
    public function notifications()
    {
        return $this->morphMany(Notification::class, 'notifiable');
    }

    // نطاق تصفية حسب الحالة
    public function scopeByStatus($query, $status)
    {
        return $query->where('status', $status);
    }

    // نطاق تصفية حسب النطاق الزمني
    public function scopeByDateRange($query, $startDate, $endDate)
    {
        return $query->whereBetween('created_at', [$startDate, $endDate]);
    }

    // نطاق تصفية حسب طريقة الدفع
    public function scopeByPaymentMethod($query, $method)
    {
        return $query->where('payment_method', $method);
    }

    // نطاق تصفية حسب طريقة الشحن
    public function scopeByShippingMethod($query, $method)
    {
        return $query->where('shipping_method', $method);
    }

    // الحصول على المبلغ الإجمالي المنسق
    public function getFormattedTotalAttribute()
    {
        return number_format($this->total, 2);
    }

    // الحصول على صنف شارة الحالة
    public function getStatusBadgeClassAttribute()
    {
        return [
            'pending' => 'badge-warning',
            'processing' => 'badge-info',
            'shipped' => 'badge-primary',
            'delivered' => 'badge-success',
            'cancelled' => 'badge-danger',
        ][$this->status] ?? 'badge-secondary';
    }
}
