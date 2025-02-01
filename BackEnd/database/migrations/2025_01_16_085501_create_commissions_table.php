<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommissionsTable extends Migration
{
    public function up()
    {//البلد (شحنه)
        Schema::create('commissions', function (Blueprint $table) {
            $table->id();
            
            // تحديد البلد
            $table->enum('country', ['china', 'turkey', 'uae']);
            // قيمة العمولة
            $table->decimal('commission', 10, 2);           
            // تعديل قيمة الكيلو
            $table->decimal('price_per_kg', 10, 2); 

            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('commissions');
    }
}
