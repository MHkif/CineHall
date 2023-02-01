<?php

abstract class Controller
{
    // abstract public function modelAbstract($model);
    public function model($model)
    {

        require_once "../app/models/$model.php";
        return new $model();
    }

  
}
