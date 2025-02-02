<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class CommUser extends Model
{
    protected $table = 'comm_user';

    protected $fillable = [
        'commission_id',
        'user_id',
    ];

    public function commission()
    {
        return $this->belongsTo(Commission::class, 'commission_id', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
