<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Commission extends Model
{
    use HasFactory;
    protected $fillable = [
        'country',
        'commission',
        'price_per_kg'
    ];

    public function users()
    {
        return $this->hasMany(User::class);
    }
    public function orders()
    {
        return $this->hasMany(Order::class);
    }
    public function commusers()
    {
        return $this->hasMany(CommUser::class, 'commission_id', 'id');
    }
    public function scopeByCountry($query, $country)
    {
        return $query->where('country', $country);
    }
    public function scopeByPriceRange($query, $min, $max)
    {
        return $query->whereBetween('price_per_kg', [$min, $max]);
    }
    public function getFormattedPriceAttribute()
    {
        return number_format($this->price_per_kg, 2) . ' ' . config('app.currency', 'USD');
    }
    public function getFormattedCommissionAttribute()
    {
        return number_format($this->commission, 2) . '%';
    }
    public function calculateCommission($weight)
    {
        return $weight * $this->price_per_kg * ($this->commission / 100);
    }
}
