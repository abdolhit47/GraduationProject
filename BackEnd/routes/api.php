<?php

use App\Http\Controllers\CommissionsManagementController;
use App\Http\Controllers\ExpenseManagementController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\OrderManagementController;
use App\Http\Controllers\RentalsManagementController;
use App\Http\Controllers\ReportsController;
use App\Http\Controllers\TaskManagementController;
use App\Http\Controllers\UserManagementController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware(['auth:api'])->group( function () {

    Route::put('/changePassword', [UserManagementController::class, 'changePassword']);


    Route::get('/users', [UserManagementController::class, 'index']);
    Route::post('/user', [UserManagementController::class, 'store']);
    Route::get('/user/{id}', [UserManagementController::class, 'getUser']);
    Route::get('/userSalary/{id}', [UserManagementController::class, 'userSalary']);
    Route::patch('/user', [UserManagementController::class, 'editUser']);
    Route::put('/user/{id}', [UserManagementController::class, 'editUser']);
    Route::delete('/user/{id}', [UserManagementController::class, 'deleteUser']);
    Route::get('/customers', [UserManagementController::class, 'customers']);
    Route::get('/selectuser', [UserManagementController::class, 'selectuser']);
    Route::get('/info', [UserManagementController::class, 'info']);

    Route::get('/tasks', [TaskManagementController::class, 'index']);
    Route::post('/add-task', [TaskManagementController::class, 'addTask']);
    Route::PUT('/update-task-status/{taskId}', [TaskManagementController::class, 'updateTaskStatus']);
    Route::get('/completeTask', [TaskManagementController::class, 'completeTask']);
    Route::get('/notCompleteTask', [TaskManagementController::class, 'notCompleteTask']);
    Route::post('/delete-task', [TaskManagementController::class, 'deleteTask']);

    Route::get('/orders',[OrderManagementController::class,'index']);//عرض طلبات في select
    Route::get('/orders/{id}',[OrderManagementController::class,'indexID']);//جلب بيانات طلبيات في واجهة تحويل طلبة
    Route::get('/viewCommission', [OrderManagementController::class, 'commissionOrders']);//عرض شحنات في واجهة إضافة طلب جديد
    Route::post('/addOrder', [OrderManagementController::class, 'addOrder']);//اضافة طلب جديد
    Route::get('/viewOrders', [OrderManagementController::class, 'viewOrders']);//->middleware('permission:1,2');//عرض طلبات
    Route::get('/OrdersTR', [OrderManagementController::class, 'viewOrderTR']);//عرض طلبات تركيا
    Route::get('/OrdersUEA', [OrderManagementController::class, 'viewOrderUEA']);//عرض طلبات الإمارات
    Route::get('/OrdersCH', [OrderManagementController::class, 'viewOrderCH']);//عرض طلبات الصين
    Route::get('/ordertype/{type}', [OrderManagementController::class, 'viewbytype']);//عرض طلبات بنوع
    Route::get('/order/{id}', [OrderManagementController::class, 'getOrder']);//جلب بيانات طلبية في واجهة تعديل طلبية
    Route::put('/editOrder/{orderId}', [OrderManagementController::class, 'editOrder']);//تعديل طلب
    Route::delete('/deleteOrder/{orderId}', [OrderManagementController::class, 'deleteOrder']);//حذف طلب
    Route::put('/transferOrder/{orderId}', [OrderManagementController::class, 'transferOrder']);
    Route::get('/ordercus',[OrderManagementController::class,'viewOrderCustom']);
    Route::get('/viewCommissions', [CommissionsManagementController::class, 'viewCommissions']);
    Route::patch('/editCommission/{commissionId}', [CommissionsManagementController::class, 'editCommission']);

    Route::get('/viewRentals', [RentalsManagementController::class, 'viewRentals']);
    Route::post('/addRental', [RentalsManagementController::class, 'addRental']);
    Route::patch('/editRental/{rentalId}', [RentalsManagementController::class, 'editRental']);
    Route::delete('/deleteRental/{rentalId}', [RentalsManagementController::class, 'deleteRental']);

    Route::get('/expenses', [ExpenseManagementController::class, 'viewExpenses']);//عرض المصاريف
    Route::post('/addExpense', [ExpenseManagementController::class, 'addExpense']);//اضافة مصروف
    Route::patch('/editExpense/{expenseId}', [ExpenseManagementController::class, 'editExpense']);//تعديل مصاريف

    Route::post('/salary', [ExpenseManagementController::class, 'addsalary']);//تعديل راتب

    Route::get('/home/{year}', [ReportsController::class, 'index']);
    Route::get('/reports/{year}', [ReportsController::class, 'generateRevenueReport']);//تقارير الايرادات
    Route::get('/expenses/{year}/', [ReportsController::class, 'viewExpenses']);//تقارير المصاريف
    Route::get('/Earnings/{year?}/{month?}', [ReportsController::class, 'Earnings']);//تقارير الأرباح
    Route::get('/notifications', [NotificationController::class, 'index']);
});
