<?php

class Halls extends Controller{
    // private $user;
    private $hallModel;

    public function __construct()
    {
        // $this->user = 'admin';
        $this->hallModel = $this->model('HallModel');
    }

    public function getAllHalls(){
        $rows = $this->hallModel->getHalls();
        echo json_encode($rows);
    }

    public function getHall($key){
        $row = $this->hallModel->getHallById($key);
        echo json_encode($row);
    }

    public function getHallsByNumber($key){
        $rows = $this->hallModel->getHallsByNumber($key);
        echo json_encode($rows);
    }

    public function findHall($key){
        $row = $this->hallModel->findHallByKey($key);
        echo json_encode($row);
    }

    public function getAvailableHalls(){
        $rows = $this->hallModel->getAvailableHalls();
        echo json_encode($rows);
    }
    

    public function getEmptySeats($id){
        $row = $this->hallModel->getEmptySeats($id);
        echo json_encode($row);
    }
    
    public function getTakenSeats($id){
        $row = $this->hallModel->getTakenSeats($id);
        echo json_encode($row);
    }
    

}