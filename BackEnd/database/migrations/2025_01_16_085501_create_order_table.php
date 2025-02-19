<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('customer_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('user_id')->nullable()->constrained('users')->onDelete('set null');
            $table->foreignId('delivery_agent_id')->nullable()->constrained('users')->onDelete('set null');
            $table->string('order_number')->unique();
            $table->foreignId('commission_id')->constrained('commissions')->onDelete('cascade');
            $table->string('product_name');
            $table->enum('product_type', ['electronics', 'clothes', 'home_supplies', 'cosmetics', 'toys', 'sports', 'other']);
            $table->decimal('weight', 10, 2);
            $table->decimal('shipping_cost', 10, 2)->default(0);
            $table->text('shipping_address');//عنوان الشحن إلى الزبون
            $table->enum('status', ['pending', 'purchased', 'shipping', 'delivering', 'delivered','completed', 'cancelled'])->default('pending');
            $table->integer('expected_delivery_time')->nullable();//days
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
