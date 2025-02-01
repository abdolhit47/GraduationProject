<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'first_name' => 'MD',
            'father_name' => 'Ali',
            'last_name' => 'Esayeh',
            'username' => 'MD_Esayeh',
            'email' => 'mohamed@example.com',
            'password' => Hash::make('password123'),
            'phone' => '0123456789',
            'role' => 'general_manager',
            'is_active' => true,
        ]);
    }
}
