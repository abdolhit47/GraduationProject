<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EmloyeeSalary extends Model
{
    protected $table = 'employee_salaries';
    protected $fillable = [
        'employee_id',
//        'deduction',//خصمات
//        'bonus',//مكافأة
        'final_salary',//الراتب النهائي
//        'payment_date',//تاريخ الدفع
        'notes',//ملاحظات
    ];
    public function employee()
    {
        return $this->belongsTo(User::class, 'employee_id','id');
    }
}
