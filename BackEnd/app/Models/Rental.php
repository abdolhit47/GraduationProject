<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rental extends Model
{//الايجار
    use HasFactory;

    protected $fillable = [
        'name',
        'type',
        'location',
        'amount',
    ];
}
