<?php

class ReservationModel
{
    private $db;
    private $tableName;

    public function __construct()
    {
        $this->db = new Database;
        $this->tableName = 'reservations';
    }


    public function add($data)
    {


        $sql =
            'INSERT INTO `reservation`( `rank`, `hall_id`, `title`, `thumbnail`, `rating`, `year`, `image`, `description`, `trailer`, `genre`, `director`, `writers`, `imdbid`)
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


    public function getHalls()
    {
        $sql = 'SELECT `id`, `name`, `hall_number`, `seats` FROM ' . $this->tableName;
        $this->db->prepareQuery($sql);
        $rows = $this->db->allRows();

        if ($this->db->rowCount() > 0) {
            return $rows;
        } else {
            return "There is No Halls";
        }
    }

    public function getHallById($id)
    {
        $sql = 'SELECT `id`, `name`, `hall_number`, `seats` FROM '
            . $this->tableName . ' WHERE id = :id';
        $this->db->prepareQuery($sql);
        $this->db->bind(':id', $id);

        $row = $this->db->singleRow();

        if ($this->db->rowCount() > 0) {
            return $row;
        } else {
            return "There is No Hall have that id  : $id";
        }
    }

    public function getHallsByNumber($number)
    {
        $sql = 'SELECT `id`, `name`, `hall_number`, `seats` FROM '
            . $this->tableName . ' WHERE hall_number = :number';
        $this->db->prepareQuery($sql);
        $this->db->bind(':number', $number);

        $rows = $this->db->allRows();

        if ($this->db->rowCount() > 0) {
            return $rows;
        } else {
            return "There is No Hall Have That Number  : $number";
        }
    }


    public function findHallByKey($value, $key = "name")
    {
        $query = "WHERE $key LIKE '%$value%'";
        $sql = 'SELECT `id`, `name`, `hall_number`, `seats` FROM '
            . $this->tableName . ' ' . $query;
        $this->db->prepareQuery($sql);
        $this->db->bind(':' . $key, $value);

        $rows = $this->db->allRows();

        if ($this->db->rowCount() > 0) {
            return $rows;
        } else {
            return "There is No Halls Under The $key Of  : $value";
        }
    }

    public function getAvailableHalls()
    {
        $query = " WHERE seats < 50";
        $sql = 'SELECT `id`, `name`, `hall_number`, `seats` FROM '
            . $this->tableName . ' ' . $query;
        $this->db->prepareQuery($sql);

        $rows = $this->db->allRows();

        if ($this->db->rowCount() > 0) {
            return $rows;
        } else {
            return "There is No Available Halls";
        }
    }

    public function getEmptySeats($id)
    {
        $query = " WHERE id = :id AND seats < 50";
        $sql = 'SELECT `seats` FROM '
            . $this->tableName . ' ' . $query;
        $this->db->prepareQuery($sql);
        $this->db->bind(':id', $id);

        $row = $this->db->singleRow();

        $seats = 50 - $row->seats;


        if ($this->db->rowCount() > 0) {
            return $seats;
        } else {
            return "There is No Empty Seats in This Hall";
        }
    }

    public function getTakenSeats($id)
    {
        $query = " WHERE id = :id AND seats < 50";
        $sql = 'SELECT `seats` FROM '
            . $this->tableName . ' ' . $query;
        $this->db->prepareQuery($sql);
        $this->db->bind(':id', $id);

        $row = $this->db->singleRow();

        $seats = $row->seats;


        if ($this->db->rowCount() > 0) {
            return $seats;
        } else {
            return "There is No Reserved Seats in This Hall";
        }
    }
}
