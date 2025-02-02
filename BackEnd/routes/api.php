<?php

use App\Http\Controllers\CommissionsManagementController;
use App\Http\Controllers\ExpenseManagementController;
use App\Http\Controllers\OrderManagementController;
use App\Http\Controllers\RentalsManagementController;
use App\Http\Controllers\ReportsController;
use App\Http\Controllers\TaskManagementController;
use App\Http\Controllers\UserManagementController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware(['auth:api'])->group( function () {
    Route::get('/users', [UserManagementController::class, 'index']);
    Route::post('/user', [UserManagementController::class, 'store']);
    Route::get('/user/{id}', [UserManagementController::class, 'getUser']);
    Route::patch('/user/{id}', [UserManagementController::class, 'editUser']);
    Route::delete('/user/{id}', [UserManagementController::class, 'deleteUser']);

    Route::get('/tasks', [TaskManagementController::class, 'index']);
    Route::post('/add-task', [TaskManagementController::class, 'addTask']);
    Route::PUT('/update-task-status/{taskId}', [TaskManagementController::class, 'updateTaskStatus']);
    Route::get('/completeTask', [TaskManagementController::class, 'completeTask']);
    Route::get('/notCompleteTask', [TaskManagementController::class, 'notCompleteTask']);
    Route::post('/delete-task', [TaskManagementController::class, 'deleteTask']);

    Route::get('/viewCommission', [OrderManagementController::class, 'commissionOrders']);//عرض شحنات في واجهة إضافة طلب جديد
    Route::post('/addOrder', [OrderManagementController::class, 'addOrder']);//اضافة طلب جديد
    Route::get('/viewOrders', [OrderManagementController::class, 'viewOrders']);//عرض طلبات
    Route::get('/OrdersTR', [OrderManagementController::class, 'viewOrderTR']);//عرض طلبات تركيا
    Route::get('/OrdersUEA', [OrderManagementController::class, 'viewOrderUEA']);//عرض طلبات الإمارات
    Route::get('/OrdersCH', [OrderManagementController::class, 'viewOrderCH']);//عرض طلبات الصين
    Route::put('/editOrder/{orderId}', [OrderManagementController::class, 'editOrder']);//تعديل طلب
    Route::delete('/deleteOrder/{orderId}', [OrderManagementController::class, 'deleteOrder']);//حذف طلب
    Route::put('/transferOrder/{orderId}', [OrderManagementController::class, 'transferOrder']);

    Route::get('/viewCommissions', [CommissionsManagementController::class, 'viewCommissions']);
    Route::patch('/editCommission/{commissionId}', [CommissionsManagementController::class, 'editCommission']);

    Route::get('/viewRentals', [RentalsManagementController::class, 'viewRentals']);
    Route::post('/addRental', [RentalsManagementController::class, 'addRental']);
    Route::patch('/editRental/{rentalId}', [RentalsManagementController::class, 'editRental']);
    Route::delete('/deleteRental/{rentalId}', [RentalsManagementController::class, 'deleteRental']);

    Route::get('/expenses', [ExpenseManagementController::class, 'viewExpenses']);//عرض المصاريف
    Route::post('/addExpense', [ExpenseManagementController::class, 'addExpense']);//اضافة مصروف
    Route::patch('/editExpense/{expenseId}', [ExpenseManagementController::class, 'editExpense']);//تعديل مصاريف

    Route::post('/salary', [ExpenseManagementController::class, 'addsalary']);//إضافة راتب

    Route::get('/home', [ReportsController::class, 'index']);
    Route::get('reports/{year}', [ReportsController::class, 'generateRevenueReport']);
    Route::get('/reports/expenses', [ReportsController::class, 'viewExpenses']);
});//Route::get('/tasks', [TaskManagementController::class, 'index']);
