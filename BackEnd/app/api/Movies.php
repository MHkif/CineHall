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
}
