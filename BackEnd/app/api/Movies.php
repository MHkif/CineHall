<?php

class Movies extends Controller
{

    private $movieModel;

    public function __construct()
    {
        // $this->user = 'client';
        $this->movieModel = $this->model('MovieModel');
    }

    public function getAllMovies()
    {
        $this->headerHttp('GET');
        $rows = $this->movieModel->getMovies();
        echo json_encode($rows);
    }

    public function getMovie($id)
    {
        $this->headerHttp();
        $row = $this->movieModel->getMovieById($id);
        echo json_encode($row);
    }

    public function filterMovies($date)
    {
        // die(var_dump($date));
        $this->headerHttp("GET");
        $movies = $this->movieModel->filterMovies($date);
        if (!$movies) {
            echo json_encode(["Empty" => "There is No Movie will be displayed at $date"]);
        } else {
            echo json_encode(["Success" => $movies]);
        }
    }

    public function getMoviesByCategory($genre)
    {
        $this->headerHttp();
        $rows = $this->movieModel->getMovieByCategory($genre);
        echo json_encode($rows);
    }

    public function findMovie($value)
    {
        $this->headerHttp();
        $rows = $this->movieModel->findMovie($value);
        echo json_encode($rows);
    }
    public function reservedSeats()
    {
        $this->headerHttp();
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $data = [
                'hall_id' => trim($_POST['hall_id']),
                'show_date' => trim($_POST['show_date']),
                'movie_id' => trim($_POST['movie_id']),

            ];
            $seats = $this->movieModel->getReservedSeats($data);
            if ($seats === "Full") {
                echo json_encode(["Full" => "This Hall is Full For that movie in ". $data['show_date'] ." , Try another date ."]);
            } else  if ($seats) {
                echo json_encode(["Success" => $seats]);
            } else if (!$seats) {
                echo json_encode(["Empty" => "No Reserved Seats " . $data['show_date']]);
            } else {
                echo json_encode($seats);
            }
            // echo json_encode($row);
        }
    }
}
