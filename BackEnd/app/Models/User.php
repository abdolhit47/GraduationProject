<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\DatabaseNotification;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes;

    protected $fillable = [
        'first_name',
        'father_name',
        'last_name',
        'username',
        'email',
        'phone',
        'password',
        'role',
        'profile_image',
        'birth_date',
        'gender',
        'is_active',
        'last_login_at',
        'google_id',
        'salary',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
        'notification_preferences' => 'array',
        'privacy_settings' => 'array',
        'login_history' => 'array',
        'address' => 'array'
    ];

    public function commission(){
        return $this->belongsTo(Commission::class, 'commission_id');
    }
    public function commusers()
    {
        return $this->hasMany(CommUser::class, 'user_id','id');
    }
    // علاقة الطلبات الخاصة بالعميل
    public function customerOrders()
    {
        return $this->hasMany(Order::class, 'customer_id');
    }

    // علاقة الطلبات التي تم إنشاؤها بواسطة الموظف
    public function createdOrders()
    {
        return $this->hasMany(Order::class, 'user_id');
    }

    // علاقة الطلبات الخاصة بمندوب التوصيل
    public function deliveryOrders()
    {
        return $this->hasMany(Order::class, 'delivery_agent_id');
    }

    // علاقة المهام المسندة للموظف
    public function assignedTasks()
    {
        return $this->hasMany(Task::class, 'employee_id');
    }

    // علاقة المعاملات المالية لمندوب التوصيل
    public function moneyTransactions()
    {
        return $this->hasMany(MoneyTransaction::class, 'delivery_agent_id');
    }

    public function notifications()
    {
        return $this->morphMany(DatabaseNotification::class, 'notifiable');
    }


    public function getFullNameAttribute()
    {
        return $this->first_name . ' ' . $this->father_name . ' ' . $this->last_name;
    }

    public function emloyeesalary(){
        return $this->hasMany(EmloyeeSalary::class, 'employee_id','id');
    }
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }
    public function getJWTCustomClaims()
    {
        return [];
    }
}
