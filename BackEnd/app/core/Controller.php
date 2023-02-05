<?php

abstract class Controller
{
    // abstract public function modelAbstract($model);
    public function model($model)
    {

        require_once "../app/models/$model.php";
        return new $model();
    }

    public function headerHttp($param = 'POST'){
        header('Access-Control-Allow-Origin: *');
        header('Content-Type: application/json');
        header("Access-Control-Allow-Methods: $param");
    }

  
}
