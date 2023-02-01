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
        $rows = $this->movieModel->getMovies();
        echo json_encode($rows);
    }

    public function getMovie($id)
    {
        $row = $this->movieModel->getMovieById($id);
        echo json_encode($row);
    }

    public function getMoviesByCategory($genre)
    {
        $rows = $this->movieModel->getMovieByCategory($genre);
        echo json_encode($rows);
    }

    public function findMovie($value)
    {
        $rows = $this->movieModel->findMovie($value);
        echo json_encode($rows);
    }
}
