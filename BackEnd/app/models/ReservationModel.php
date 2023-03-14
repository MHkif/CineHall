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


    public function reserveSeat($data)
    {
        $isAlraedyTaken = $this->checkSeat($data['hall_id'], $data['movie_id'], $data['show_date'], $data['seat']);
        // $hall_id = $data['hall_id'];
        if (!$isAlraedyTaken) {
            $sql = 'INSERT INTO `reservations`(`user_ref`, `movie_id`, `seat_number`, `hall_id`, `show_date`)
             VALUES (:user_ref, :movie_id, :seat_number, :hall_id, :show)';

            $this->db->prepareQuery($sql);
            $this->db->bind(':user_ref', $data['user_ref']);
            $this->db->bind(':hall_id', $data['hall_id']);
            $this->db->bind(':movie_id', $data['movie_id']);
            $this->db->bind(':seat_number', $data['seat']);
            $this->db->bind(':show', $data['show_date']);


            if ($this->db->execute()) {
                $isUpdated = $this->updateMovieSeats('seats+1', $data['hall_id'], $data['show_date']);
                if ($isUpdated) {
                    return true;
                } else {
                    return false;
                }
            } else {
                echo 'The Reservation has deos not Made successfully';;
            }
        } else {
            echo "This Seat of number " . $data['seat'] . " in This hall Has been Already Taken .";
        }
    }


    public function checkSeat($hall_id, $movie_id, $show_date,  $seat)
    {
        $sql = 'SELECT * FROM ' . $this->tableName . ' WHERE hall_id = :hall_id AND movie_id = :movie AND show_date = :show_date AND seat_number = :seat';
        $this->db->prepareQuery($sql);
        $this->db->bind(':hall_id', $hall_id);
        $this->db->bind(':seat', $seat);
        $this->db->bind(':show_date', $show_date);
        $this->db->bind(':movie', $movie_id);

        $row = $this->db->singleRow();

        if ($this->db->rowCount() > 0) {
            return true;
        } else {
            return false;
        }
    }

    // public function getReservedSeats($movie_id)
    // {
    //     $sql = 'SELECT COUNT(*) as "rows_number", r.id as "res_id", r.show_date as "show_date",  r.user_ref as "user_ref", r.hall_id as "hall_id", m.id as "id_of_movie" FROM reservations r INNER JOIN movies m ON m.id = r.movie_id WHERE m.id = :movie_id  AND m.date = r.show_date AND m.hall_id = r.hall_id';
    //     $this->db->prepareQuery($sql);
    //     $this->db->bind(':movie_id', $movie_id);
    //     $rows = $this->db->singleRow();
    //     if ($rows->rows_number < 50) {
    //         return true;
    //     } else {
    //         return false;
    //     }
    // }


    public function countReservedSeats($data)
    {



        $sql = 'SELECT * FROM reservations  WHERE movie_id = :movie_id AND hall_id = :hall_id AND show_date = :show_date';
        $this->db->prepareQuery($sql);
        $this->db->bind(':movie_id', $data["movie_id"]);
        $this->db->bind(':hall_id', $data["hall_id"]);
        $this->db->bind(':show_date', $data["show_date"]);
        $rows = $this->db->allRows();
        // return $this->db->rowCount();
        if ($this->db->rowCount() < 50) {
            return true;
            // return $rows;
        } else {
            return false;
        }
    }


    public function getReservations()
    {
        $sql = 'SELECT * FROM ' . $this->tableName;
        $this->db->prepareQuery($sql);
        $rows = $this->db->allRows();

        if ($this->db->rowCount() > 0) {
            return $rows;
        } else {
            return "There is No Reservations";
        }
    }

    public function getAllUserReservations($user_ref)
    {
        $sql = 'SELECT r.*, r.id as "res_id", m.id as "id_of_movie", m.*, h.id as "id_of_hall" , h.name as "hall_name" FROM reservations r INNER JOIN movies m ON m.id = r.movie_id INNER JOIN halls h ON r.hall_id = h.id WHERE user_ref = :user_ref AND date(r.show_date) >= date(now())';
        $this->db->prepareQuery($sql);
        $this->db->bind(':user_ref', $user_ref);
        $rows = $this->db->allRows();

        if ($this->db->rowCount() > 0) {
            return $rows;
        } else {
            return false;
        }
    }




    public function getReservationById($id)
    {
        $sql = 'SELECT * FROM ' . $this->tableName . ' WHERE id = :id';
        $this->db->prepareQuery($sql);
        $this->db->bind(':id', $id);

        $row = $this->db->singleRow();

        if ($this->db->rowCount() > 0) {
            return $row;
        } else {
            return "There is No Reservation  Have That Id : $id";
        }
    }




    public function findReservationByKey($value, $key = "seat_number")
    {
        $query = "WHERE $key LIKE '%$value%'";
        $sql = 'SELECT * FROM '
            . $this->tableName . ' ' . $query;
        $this->db->prepareQuery($sql);
        $this->db->bind(':' . $key, $value);

        $rows = $this->db->allRows();

        if ($this->db->rowCount() > 0) {
            return $rows;
        } else {
            return "There is No Rservation Under The $key Of  : $value";
        }
    }

    public function getHallById($id)
    {
        $sql = 'SELECT `id`, `name`, `hall_number`, `seats` FROM halls WHERE id = :id';
        $this->db->prepareQuery($sql);
        $this->db->bind(':id', $id);

        $row = $this->db->singleRow();

        if ($this->db->rowCount() > 0) {
            return $row;
        } else {
            false;
        }
    }
    public function checkShow_date($hall_id, $movie_id)
    {
        // die(print_r([$hall_id, $movie_id]));
        $sql = 'SELECT * FROM shown_movies WHERE  (DATEDIFF(shown_movies.date , CURDATE()) > 1) AND hall_id = :hall_id  AND movie_id = :movie';
        $this->db->prepareQuery($sql);
        $this->db->bind(':hall_id', $hall_id);
        $this->db->bind(':movie', $movie_id);
        $movie = $this->db->singleRow();
        // $date1 = date_create($movie->date);
        // $date2= date_create(date("Y-m-d"));
        // $diff=date_diff($date2, $date1);
        // $date = $diff->format("%R%a");
        if ($this->db->rowCount() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function cancelReservation($data)
    {
        // die(print_r($data));
        // $sql = 'SELECT * FROM reservations WHERE movie_id IN (SELECT movie_id FROM shown_movies WHERE DATEDIFF(date , CURDATE()) > 1) AND id = :id AND user_ref = :ref';
        $sql = 'SELECT * FROM reservations WHERE id = :id AND user_ref = :ref';
        $isOutOfDate = $this->checkShow_date($data['hall_id'], $data['movie_id']);
        // die(var_dump($isOutOfDate));
        if ($isOutOfDate) {
            $this->db->prepareQuery($sql);
            $this->db->bind(':id', $data['res_id']);
            $this->db->bind(':ref', $data['user_ref']);
            if ($this->db->execute()) {
                $reservation = $this->db->singleRow();

                $hall_id = $reservation->hall_id;
                $show_date = $reservation->show_date;

                if ($this->db->rowCount() === 0) {
                    return "empty";
                } else {
                    // $this->db->prepareQuery('DELETE FROM reservations WHERE id = :res_id');
                    // $this->db->bind(":res_id", $id);
                    // $this->db->execute();
                    // return $hall_id;
                    $isDeleted = $this->deletReservation($data['res_id']);
                    // $date1 = date_create("2013-03-15");

                    if ($isDeleted) {
                        $isUpdated = $this->updateMovieSeats('seats-1', $hall_id, $show_date);
                        if ($isUpdated) {
                            return 'The Reservation has been deleted successfully';
                        } else {
                            return false;
                        }
                    } else {
                        return false;
                    }
                }
            } else {
                return 'The Reservation has not deleted According to unknown Error during the Execution';
            }
        } else {
            return "OutOfDate";
        }
    }

    public function deletReservation($res_id)
    {
        $this->db->prepareQuery('DELETE FROM reservations WHERE id = :res_id');
        $this->db->bind(":res_id", $res_id);
        if ($this->db->execute()) {
            return true;
        } else {
            return false;
        }
    }

    public function updateHallSeats($state, $hall_id)
    {
        $sql = "UPDATE halls SET seats =" . $state . " WHERE id = :id";
        $this->db->prepareQuery($sql);
        $this->db->bind(":id", $hall_id);
        if ($this->db->execute()) {
            return true;
        } else {
            return false;
        }
    }

    public function updateMovieSeats($state, $hall_id, $date)
    {
        $sql = "UPDATE shown_movies SET seats =" . $state . " WHERE hall_id = :hall_id AND date = :date";
        $this->db->prepareQuery($sql);
        $this->db->bind(":hall_id", $hall_id);
        $this->db->bind(":date", $date);
        if ($this->db->execute()) {
            return true;
        } else {
            return false;
        }
    }



    // public function cancelReservaion($res_id)
    // {
    //     $this->db->query('SELECT * FROM reservations WHERE hall_id IN (SELECT hall_id FROM films WHERE DATEDIFF(date , CURDATE()) > 1) AND id = :res_id');
    //     $this->db->bind(":res_id", $res_id);
    //     $this->db->execute();
    //     if ($this->db->rowCount() === 0) {
    //         return false;
    //     } else {
    //         $this->db->query('DELETE FROM reservations WHERE id = :res_id');
    //         $this->db->bind(":res_id", $res_id);
    //         $this->db->execute();
    //         return true;
    //     }
    // }
}
