<?php

use App\Http\Controllers\Api\CustomerController;
use App\Http\Controllers\Api\DeliveryController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// API routes specific for the Flutter mobile application
Route::group(['prefix' => 'mobile'], function () {

    // Customer APIs
    Route::group(['prefix' => 'customer'], function () {
        Route::post('/login', [CustomerController::class, 'login']);
        Route::post('/register', [CustomerController::class, 'register']);
        Route::get('/profile', [CustomerController::class, 'profile'])->middleware('auth:api');
        Route::put('/update-profile', [CustomerController::class, 'updateProfile'])->middleware('auth:api');
        Route::get('/notifications', [CustomerController::class, 'notifications'])->middleware('auth:api');
    });

    // Delivery Person APIs
    Route::group(['prefix' => 'delivery'], function () {
        Route::post('/login', [DeliveryController::class, 'login']);
        Route::get('/orders', [DeliveryController::class, 'getOrders'])->middleware('auth:api');
        Route::post('/accept-order/{id}', [DeliveryController::class, 'acceptOrder'])->middleware('auth:api');
        Route::post('/complete-order/{id}', [DeliveryController::class, 'completeOrder'])->middleware('auth:api');
        Route::get('/earnings', [DeliveryController::class, 'earnings'])->middleware('auth:api');
    });

});
