<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\User;
use App\Models\Order;
use App\Models\Notification;

class MoneyTransaction extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'delivery_agent_id',
        'order_id',
        'amount',
        'type',
        'received_at',
        'delivered_at',
        'notes',
        'payment_method',
        'transaction_number',
        'status'
    ];

    protected $casts = [
        'amount' => 'decimal:2',
        'received_at' => 'datetime',
        'delivered_at' => 'datetime'
    ];

    // علاقة مندوب التوصيل
    public function deliveryAgent()
    {
        return $this->belongsTo(User::class, 'delivery_agent_id');
    }

    // علاقة الطلب
    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    // علاقة الإشعارات
    public function notifications()
    {
        return $this->morphMany(Notification::class, 'notifiable');
    }

    // نطاق تصفية حسب النوع
    public function scopeByType($query, $type)
    {
        return $query->where('type', $type);
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

    // الحصول على المبلغ المنسق
    public function getFormattedAmountAttribute()
    {
        return number_format($this->amount, 2);
    }

    // الحصول على صنف شارة الحالة
    public function getStatusBadgeClassAttribute()
    {
        return [
            'pending' => 'badge-warning',
            'completed' => 'badge-success',
            'failed' => 'badge-danger',
            'refunded' => 'badge-info'
        ][$this->status] ?? 'badge-secondary';
    }

    // الحصول على صنف شارة النوع
    public function getTypeBadgeClassAttribute()
    {
        return [
            'payment' => 'badge-success',
            'refund' => 'badge-warning',
            'commission' => 'badge-info',
            'withdrawal' => 'badge-danger'
        ][$this->type] ?? 'badge-secondary';
    }
}
