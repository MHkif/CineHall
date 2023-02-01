<?php

class Reservations extends Controller
{
    // private $user;
    private $reservModel;

    public function __construct()
    {
        // $this->user = 'admin';
        $this->reservModel = $this->model('ReservationModel');
    }

    public function getAllReservations()
    {
        $rows = $this->reservModel->getReservations();
        echo json_encode($rows);
    }
    public function getAllUserReservations($ref)
    {
        $rows = $this->reservModel->getAllUserReservations($ref);
        echo json_encode($rows);
    }


    public function getUserReservation()
    {
        $row = $this->reservModel->getUserReservation();
        echo json_encode($row);
    }


    public function findReservation($value)
    {
        $rows = $this->reservModel->findReservation($value);
        echo json_encode($rows);
    }
}
