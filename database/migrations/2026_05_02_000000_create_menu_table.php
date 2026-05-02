<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('menu', function (Blueprint $table) {
            $table->bigIncrements('mid');
            $table->unsignedTinyInteger('mtid')->index(); // 1=food, 2=drinks
            $table->string('name');
            $table->unsignedInteger('price');
            $table->string('image')->nullable();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('menu');
    }
};

