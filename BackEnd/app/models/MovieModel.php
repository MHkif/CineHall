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
        $sql = 'SELECT `id`, `rank`, `hall_id`, `title`, `thumbnail`, `rating`, `year`, `image`, `description`, `trailer`, `genre`, `director`, `writers`, `imdbid`, `date` FROM ' . $this->tableName;
        $this->db->prepareQuery($sql);
        $rows = $this->db->allRows();
        return $rows;
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
}
