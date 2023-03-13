<?php

class MovieModel
{
    private $db;
    private $tableName;

    public function __construct()
    {
        $this->db = new Database;
        $this->tableName = 'movies';
    }


    public function add($data)
    {


        $sql =
            'INSERT INTO `movies`( `rank`, `hall_id`, `title`, `thumbnail`, `rating`, `year`, `image`, `description`, `trailer`, `genre`, `director`, `writers`, `imdbid`)
             VALUES (:rank , :hall_id, :title, :thumbnail, :rating, :year, :image, :description, :trailer, :genre, :director, :writers, :imdbid)';
        $this->db->prepareQuery($sql);
        $this->db->bind(':rank', $data->rank);
        $this->db->bind(':title', $data->title);
        $this->db->bind(':hall_id', 1);
        $this->db->bind(':thumbnail', $data->thumbnail);
        $this->db->bind(':rating', $data->rating);
        $this->db->bind(':year', $data->year);
        $this->db->bind(':image', $data->image);
        $this->db->bind(':description', $data->description);
        $this->db->bind(':trailer', $data->trailer);
        $this->db->bind(':genre', $data->genre[0]);
        $this->db->bind(':director', $data->director[0]);
        $this->db->bind(':writers', $data->writers[0]);
        $this->db->bind(':imdbid', $data->imdbid);

        if ($this->db->execute()) {
            // return true;
            echo 'TRUE';
        } else {
            // return false;
            echo 'FALSE';
        }
    }

    public function getData($table)
    {
        $sql = "SELECT * FROM " . $table;
        $this->db->prepareQuery($sql);

        $results = $this->db->allRows();

        return $results;
    }


    public function getMovies()
    {
        // die(var_dump(strtotime($date) != false));
        $sql = 'SELECT * FROM ' . $this->tableName . ' WHERE date(movies.date) >= now()';

        $this->db->prepareQuery($sql);
        $rows = $this->db->allRows();
        return $rows;
    }

    public function filterMovies($date)
    {
        // die(var_dump($date));
        $d = $date;
        // $sqlDate = "SELECT * FROM `movies` WHERE MONTH(movies.date) = MONTH(:id)  AND YEAR(movies.date) = YEAR(NOW()) AND DATE(movies.date) >= NOW()";
        $sqlDate = "SELECT sh.*, m.* FROM shown_movies sh INNER JOIN movies m ON m.id = sh.movie_id WHERE date(sh.date) = date(:d) AND date(:d) >= date(now()) AND sh.seats < 50
        ";

        $this->db->prepareQuery($sqlDate);
        $this->db->bind(':d', $date);
        $rows = $this->db->allRows();

        if ($this->db->rowCount() > 0) {
            return $rows;
        } else {
            return false;
        }
    }




    public function getMovieById($id)
    {
        $sql = 'SELECT `id`, `rank`, `hall_id`, `title`, `thumbnail`, `rating`, `year`, `image`, `description`, `trailer`, `genre`, `director`, `writers`, `imdbid`, `date` FROM '
            . $this->tableName . ' WHERE id = :id';
        $this->db->prepareQuery($sql);
        $this->db->bind(':id', $id);

        $row = $this->db->singleRow();

        // Check row
        if ($this->db->rowCount() > 0) {
            return $row;
        } else {
            return "There is No Movie have that id  : $id";
        }
    }



    public function getMovieByCategory($genre)
    {
        $sql = 'SELECT `id`, `rank`, `hall_id`, `title`, `thumbnail`, `rating`, `year`, `image`, `description`, `trailer`, `genre`, `director`, `writers`, `imdbid`, `date` FROM '
            . $this->tableName . ' WHERE genre = :genre';
        $this->db->prepareQuery($sql);
        $this->db->bind(':genre', $genre);

        $rows = $this->db->allRows();

        if ($this->db->rowCount() > 0) {
            return $rows;
        } else {
            return "There is No Movies in This Category  : $genre";
        }
    }


    public function findMovie($value, $key = "title")
    {
        $query = "WHERE $key LIKE '%$value%'";
        $sql = 'SELECT `id`, `rank`, `hall_id`, `title`, `thumbnail`, `rating`, `year`, `image`, `description`, `trailer`, `genre`, `director`, `writers`, `imdbid`, `date` FROM '
            . $this->tableName . ' ' . $query;
        $this->db->prepareQuery($sql);
        $this->db->bind(':' . $key, $value);

        $rows = $this->db->allRows();

        if ($this->db->rowCount() > 0) {
            return $rows;
        } else {
            return "There is No Movies Under The $key Of  : $value";
        }
    }

    public function getReservedSeats($data)
    {
        $sql = 'SELECT seat_number as "reserved_seat" FROM reservations WHERE movie_id = :movie_id AND hall_id = :hall_id AND show_date = :show_date';
        $this->db->prepareQuery($sql);
        $this->db->bind(':movie_id', $data["movie_id"]);
        $this->db->bind(':hall_id', $data["hall_id"]);
        $this->db->bind(':show_date', $data["show_date"]);
        $rows =  $this->db->columns();
        if ($this->db->rowCount() > 0 && $this->db->rowCount() < 50) {
            return $rows;
        } else if ($this->db->rowCount() == 50) {
            return 'Full';
        } else {
            return false;
        }
    }



    // public function getTakenSeats($id)
    // {
    //     $query = " WHERE id = :id";
    //     $sql = 'SELECT * FROM '
    //         . $this->tableName . ' ' . $query;
    //     $this->db->prepareQuery($sql);
    //     $this->db->bind(':id', $id);
    //     $rows = $this->db->singleRow();

    //     if ($rows->seats < 50) {
    //         return true;
    //     } else {
    //         return "There is No Available Seats";
    //     }
    // }
}
