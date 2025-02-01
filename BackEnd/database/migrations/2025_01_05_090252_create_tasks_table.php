<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTasksTable extends Migration
{
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();

            // بيانات المهمة
            $table->string('task_name'); // اسم المهمة
            $table->text('task_details'); // تفاصيل المهمة
            $table->date('start_date'); // تاريخ بدء المهمة
            $table->date('end_date')->nullable(); // تاريخ انتهاء المهمة
            $table->integer('duration_in_days'); // مدة المهمة بالأيام
            $table->enum('task_status', ['pending','not_completed', 'completed'])->default('pending'); // حالة المهمة: قيد التنفيذ أو منجزة

            // ربط المهمة بالموظف المسؤول
            $table->foreignId('employee_id')->constrained('users')->onDelete('cascade');

            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('tasks');
    }
}
