<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class IntegrantesGrupo extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('tbl_integrantes', function (Blueprint $table) {
            $table->increments('id');
            $table->string('vch_nombre');
            $table->integer('int_usuario');
            $table->integer('int_grupo');
            $table->integer('int_voto');
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
        Schema::drop('tbl_integrantes');
    }
}
