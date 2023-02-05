<?php

class Halls extends Controller
{
    // private $user;
    private $hallModel;

    public function __construct()
    {

        $this->hallModel = $this->model('HallModel');
    }

    public function getAllHalls()
    {
        $this->headerHttp('GET');
        $rows = $this->hallModel->getHalls();
        echo json_encode($rows);
    }

    public function getHall($key)
    {
        $this->headerHttp();
        $row = $this->hallModel->getHallById($key);
        echo json_encode($row);
    }

    public function getHallsByNumber($key)
    {
        $this->headerHttp();
        $rows = $this->hallModel->getHallsByNumber($key);
        echo json_encode($rows);
    }

    public function findHall($key)
    {
        $this->headerHttp();
        $row = $this->hallModel->findHallByKey($key);
        echo json_encode($row);
    }

    public function getAvailableHalls()
    {
        $this->headerHttp('GET');
        $rows = $this->hallModel->getAvailableHalls();
        echo json_encode($rows);
    }


    public function getEmptySeats($id)
    {
        $this->headerHttp();
        $row = $this->hallModel->getEmptySeats($id);
        echo json_encode($row);
    }

    public function getTakenSeats($id)
    {
        $this->headerHttp();
        $row = $this->hallModel->getTakenSeats($id);
        echo json_encode($row);
    }
}
