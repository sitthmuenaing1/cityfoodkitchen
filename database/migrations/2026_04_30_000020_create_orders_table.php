<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id('orderid');
            $table->unsignedBigInteger('mid')->nullable();
            $table->integer('quantity')->default(1);
            $table->timestamp('ordertime')->nullable();
            $table->unsignedBigInteger('id')->nullable();
            $table->string('payment')->nullable();
            $table->string('billingaddress')->nullable();
            $table->string('phonenumber')->nullable();
            $table->unsignedBigInteger('ordernumber')->nullable();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
