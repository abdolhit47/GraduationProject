<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Task extends Model
{
    use HasFactory;

    protected $table = 'tasks';
    protected $primaryKey = 'id';
    protected $fillable = [
        'task_name',
        'task_details',
        'start_date',
        'end_date',
        'duration_in_days',
        'task_status',
        'employee_id',
    ];

    // علاقة الموظف المسند إليه المهمة
    public function employee()
    {
        return $this->belongsTo(User::class, 'employee_id');
    }
}
