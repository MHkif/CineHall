<?php

class Reservations extends Controller
{
    // private $user;
    private $reservModel;
    private $clientModel;
    private $movieModel;

    public function __construct()
    {
        // $this->user = 'admin';
        $this->reservModel = $this->model('ReservationModel');
        $this->clientModel = $this->model('ClientUser');
        $this->movieModel = $this->model('MovieModel');
    }

    public function addReservation()
    {
        $this->headerHttp();
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $data = [
                'user_ref' => $_POST['user_ref'],
                'hall_id' => trim($_POST['hall_id']),
                'seat' => trim($_POST['seat']),
                'show_date' => trim($_POST['show_date']),
                'movie_id' => trim($_POST['movie_id']),

            ];

            $checkSeats = $this->reservModel->countReservedSeats($data);
            if ($checkSeats) {
                $makeReserve =  $this->reservModel->reserveSeat($data);
                if ($makeReserve === true) {
                    // echo 'The Reservation has been made successfully';
                    echo json_encode([
                        'Success' => "The Reservation has been made successfully"
                    ]);
                } else {
                    echo json_encode([
                        'Error' => $makeReserve
                    ]);
                }
            } else {
                echo json_encode([
                    'Full' => 'No Available Reservations ,  This Hall is Full For This Movie '
                ]);
            }
        }
    }

    public function getAllReservations()
    {
        $this->headerHttp('GET');
        $rows = $this->reservModel->getReservations();
        echo json_encode($rows);
    }

    public function getUserReservations($user_ref)
    {
        $user =  $this->clientModel->findUserByRef($user_ref);
        $this->headerHttp('GET');
        $rows = $this->reservModel->getAllUserReservations($user_ref, $user->username);
        if ($rows) {
            echo json_encode(['Success' => $rows]);
        } else {
            echo json_encode(['Error' => "There is No Reservations Made By " . $user->username]);
        }
    }


    public function getReservation($id)
    {
        $this->headerHttp();
        $row = $this->reservModel->getReservationById($id);
        echo json_encode($row);
    }


    public function countReservedSeats()
    {
        $this->headerHttp("GET");

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $data = [
                'movie_id' => $_POST['movie_id'],
                'hall_id' => $_POST['hall_id'],
                'show_date' =>  $_POST['show_date'],
            ];
            $response = $this->reservModel->countReservedSeats($data);
            // if ($response === "empty") {
            //     echo json_encode(['Error' => "There is No Reservation Under This ID  : " . $data['res_id'] . " Taken by :" . $data['user_ref'] . "  To Cancel ."]);
            // } else if ($response != false) {

            //     echo json_encode(['Success' => $response]);
            // } else {
            //     echo json_encode(['Error' => 'The Reservation has not deleted due to Unknown Error']);
            // }
        }


        echo json_encode($response);
    }


    public function findReservation($value)
    {
        $this->headerHttp();
        $rows = $this->reservModel->findReservationByKey($value);
        echo json_encode($rows);
    }

    public function cancelReservation()
    {
        $this->headerHttp('DELETE');

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $data = [
                'user_ref' => $_POST['user_ref'],
                'res_id' => $_POST['res_id'],
                'movie_id' => $_POST['movie_id'],
                'hall_id' => $_POST['hall_id'],
            ];
            $response = $this->reservModel->cancelReservation($data);
            if ($response === "OutOfDate") {
                echo json_encode(['Error' => "It is Too Late To Cancel Your Reservation ."]);
            }
            if ($response === "empty") {
                echo json_encode(['Error' => "There is No Reservation Under This ID  : " . $data['res_id'] . " Taken by :" . $data['user_ref'] . "  To Cancel ."]);
            } else if ($response != false) {

                echo json_encode(['Success' => $response]);
            } else {
                echo json_encode(['Error' => 'The Reservation has not deleted due to Unknown Error']);
            }
        }
    }
}
