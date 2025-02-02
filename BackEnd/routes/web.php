<?php

use App\Http\Controllers\TaskManagementController;
use App\Http\Controllers\UserManagementController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

//Route::post('/logout', [UserManagementController::class, 'logout']);
Route::post('/register', [UserManagementController::class, 'register']);
Route::post('/resend',[UserManagementController::class,'resend']);//resend otp

Route::post('/login', [UserManagementController::class, 'login']);
Route::post('/check',[UserManagementController::class,'check']);//check otp after login

Route::post('/checkemail', [UserManagementController::class, 'checkemail']);//check email
Route::post('/verify', [UserManagementController::class, 'verify']);//verify otp after check email
Route::post('/forgetPassword', [UserManagementController::class, 'forgetPassword']);//forget password (update password without login but after check email and verify otp)


