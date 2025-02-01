<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\User;
use App\Models\Notification;

class Expense extends Model
{//مصروفات
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'type',
        'amount',
        'payment_date',
        'notes',
    ];

}
