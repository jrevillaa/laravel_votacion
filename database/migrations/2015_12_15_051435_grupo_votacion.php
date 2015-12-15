<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class GrupoVotacion extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('tbl_votacion', function (Blueprint $table) {
            $table->increments('id');
            $table->string('vch_nombre');
            $table->integer('int_estado');
            $table->integer('int_admin');
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
        //
        Schema::drop('tbl_votacion');
    }
}
