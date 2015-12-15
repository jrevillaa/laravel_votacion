<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_usuario', function (Blueprint $table) {
            $table->increments('id');
            $table->string('vch_usuario');
            $table->string('vch_nombres');
            $table->string('vch_apellidos');
            $table->string('vch_email')->unique();
            $table->string('vch_password', 60);
            $table->rememberToken();
            $table->integer('int_tipo');
            $table->string('vch_pais');
            $table->integer('int_sexo');
            $table->string('vch_img');
            $table->timestamps();
        });
    }



    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('tbl_usuario');
    }
}
