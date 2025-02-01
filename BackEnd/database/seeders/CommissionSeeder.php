<?php

namespace Database\Seeders;

use App\Models\Commission;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CommissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Commission::insert([
          'country' => 'china',
          'commission' => '5',
          'price_per_kg' => '25',
        ],[
          'country' => 'turkey',
          'commission' => '3',
          'price_per_kg' => '60',
        ],[
          'country' => 'uae',
          'commission' => '7',
          'price_per_kg' => '12',
        ],
        );
    }
}
