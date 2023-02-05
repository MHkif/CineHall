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

    public function addReservation()
    {
        $this->headerHttp();
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $data = [
                'user_ref' =>  $_SESSION['client_ref'],
                'hall_id' => trim($_POST['hall_id']),
                'seat' => trim($_POST['seat']),
            ];

            $makeReserve =  $this->reservModel->reserveSeat($data);
            if ($makeReserve == true) {
                echo 'The Reservation has been made successfully';
            } else {
                echo $makeReserve;
            }
        }
    }

    public function getAllReservations()
    {
        $this->headerHttp('GET');
        $rows = $this->reservModel->getReservations();
        echo json_encode($rows);
    }

    public function getUserReservations()
    {
        $this->headerHttp('GET');
        $rows = $this->reservModel->getAllUserReservations();
        echo json_encode($rows);
    }


    public function getReservation($id)
    {
        $this->headerHttp();
        $row = $this->reservModel->getReservationById($id);
        echo json_encode($row);
    }


    public function findReservation($value)
    {
        $this->headerHttp();
        $rows = $this->reservModel->findReservationByKey($value);
        echo json_encode($rows);
    }

    public function cancelReservation($id)
    {
        $this->headerHttp('DELETE');
        $response = $this->reservModel->cancelReservation($id);
        echo json_encode($response);
    }
}
