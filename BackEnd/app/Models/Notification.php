<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Notification extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'id',
        'type',
        'notifiable_type',
        'notifiable_id',
        'data',
        'read_at',
        'created_at',
        'updated_at'
    ];

    protected $casts = [
        'data' => 'array',
        'read_at' => 'datetime'
    ];

    // العلاقة متعددة الأشكال مع الكيان القابل للإشعار
    public function notifiable()
    {
        return $this->morphTo();
    }

    // نطاق الإشعارات غير المقروءة
    public function scopeUnread($query)
    {
        return $query->whereNull('read_at');
    }

    // نطاق الإشعارات المقروءة
    public function scopeRead($query)
    {
        return $query->whereNotNull('read_at');
    }

    // نطاق تصفية حسب النوع
    public function scopeOfType($query, $type)
    {
        return $query->where('type', $type);
    }

    // نطاق تصفية حسب النطاق الزمني
    public function scopeByDateRange($query, $startDate, $endDate)
    {
        return $query->whereBetween('created_at', [$startDate, $endDate]);
    }

    // تحديد الإشعار كمقروء
    public function markAsRead()
    {
        if (is_null($this->read_at)) {
            $this->update(['read_at' => now()]);
        }
    }

    // تحديد الإشعار كغير مقروء
    public function markAsUnread()
    {
        if (!is_null($this->read_at)) {
            $this->update(['read_at' => null]);
        }
    }

    // الحصول على صنف أيقونة الإشعار حسب النوع
    public function getIconClassAttribute()
    {
        return [
            'order_created' => 'fas fa-shopping-cart',
            'order_updated' => 'fas fa-edit',
            'order_delivered' => 'fas fa-truck',
            'task_assigned' => 'fas fa-tasks',
            'task_completed' => 'fas fa-check-circle',
            'payment_received' => 'fas fa-money-bill',
            'system' => 'fas fa-cog'
        ][$this->type] ?? 'fas fa-bell';
    }

    // الحصول على صنف لون الإشعار حسب النوع
    public function getColorClassAttribute()
    {
        return [
            'order_created' => 'primary',
            'order_updated' => 'info',
            'order_delivered' => 'success',
            'task_assigned' => 'warning',
            'task_completed' => 'success',
            'payment_received' => 'success',
            'system' => 'secondary'
        ][$this->type] ?? 'primary';
    }
}
