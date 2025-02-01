<?php

use App\Http\Controllers\TaskManagementController;
use App\Http\Controllers\UserManagementController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::post('/login', [UserManagementController::class, 'login']);
//Route::post('/logout', [UserManagementController::class, 'logout']);
Route::post('/register', [UserManagementController::class, 'register']);

