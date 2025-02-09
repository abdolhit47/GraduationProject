<?php

use App\Http\Controllers\UserManagementController;
use App\Http\Controllers\TaskManagementController;
use App\Http\Controllers\OrderManagementController;
use App\Http\Controllers\CommissionsManagementController;
use App\Http\Controllers\RentalsManagementController;
use App\Http\Controllers\ExpenseManagementController;
use App\Http\Controllers\ReportsController;
use App\Http\Controllers\NotificationController;
use Illuminate\Support\Facades\Route;

// API routes specific for the Flutter mobile application
Route::group(['prefix' => 'mobile'], function () {

    // Customer APIs
    Route::group(['prefix' => 'customer'], function () {
        Route::post('/login', [UserManagementController::class, 'login']);
        Route::post('/register', [UserManagementController::class, 'register']);
        Route::get('/profile', [UserManagementController::class, 'getUser'])->middleware('auth:api');
        Route::put('/update-profile', [UserManagementController::class, 'editUser'])->middleware('auth:api');
        Route::get('/notifications', [NotificationController::class, 'index'])->middleware('auth:api');
    });

    // Delivery Person APIs
    Route::group(['prefix' => 'delivery'], function () {
        Route::post('/login', [UserManagementController::class, 'login']);
        Route::get('/orders', [OrderManagementController::class, 'index'])->middleware('auth:api');
        Route::post('/accept-order/{id}', [OrderManagementController::class, 'acceptOrder'])->middleware('auth:api');
        Route::post('/complete-order/{id}', [OrderManagementController::class, 'completeOrder'])->middleware('auth:api');
        Route::get('/earnings', [CommissionsManagementController::class, 'viewCommissions'])->middleware('auth:api');
    });

    // Task Management
    Route::group(['prefix' => 'tasks'], function () {
        Route::get('/', [TaskManagementController::class, 'index'])->middleware('auth:api');
        Route::post('/add', [TaskManagementController::class, 'addTask'])->middleware('auth:api');
        Route::put('/update-status/{taskId}', [TaskManagementController::class, 'updateTaskStatus'])->middleware('auth:api');
        Route::delete('/delete/{taskId}', [TaskManagementController::class, 'deleteTask'])->middleware('auth:api');
    });

    // Expenses
    Route::group(['prefix' => 'expenses'], function () {
        Route::get('/', [ExpenseManagementController::class, 'viewExpenses'])->middleware('auth:api');
        Route::post('/add', [ExpenseManagementController::class, 'addExpense'])->middleware('auth:api');
        Route::patch('/edit/{expenseId}', [ExpenseManagementController::class, 'editExpense'])->middleware('auth:api');
    });

    // Reports
    Route::group(['prefix' => 'reports'], function () {
        Route::get('/{year}', [ReportsController::class, 'generateRevenueReport'])->middleware('auth:api');
        Route::get('/earnings/{year?}/{month?}', [ReportsController::class, 'Earnings'])->middleware('auth:api');
    });

});
