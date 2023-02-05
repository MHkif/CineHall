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

    public function heardersHttp(){
        
    }

    public function reserveSeat($data)
    {
        $isAlraedyTaken = $this->checkSeat($data['hall_id'], $data['seat']);
        $hall_id = $data['hall_id'];
        if (!$isAlraedyTaken) {

            // $sql2 = 'UPDATE halls SET seats = seats+1 WHERE id = ' . $data['hall_id'];

            $sql = 'INSERT INTO `reservations`(`user_ref`, `hall_id`, `seat_number`)
             VALUES (:user_ref, :hall_id, :seat_number)';

            $this->db->prepareQuery($sql);
            $this->db->bind(':user_ref', $data['user_ref']);
            $this->db->bind(':hall_id', $data['hall_id']);
            $this->db->bind(':seat_number', $data['seat']);

            if ($this->db->execute()) {
                // $this->db->prepareQuery($sql2);
                // if ($this->db->execute()) {
                //     return true;
                // } else {
                //     return false;
                // }
                $isUpdated = $this->updateHallSeats('seats-1', $hall_id);
                if ($isUpdated) {
                    return 'The Reservation has been Made successfully';
                } else {
                    return false;
                }
            } else {
                return false;
                // echo 'FALSE';
            }
        } else {
            echo "This Seat of number " . $data['seat'] . " in This hall Has been Already Taken .";
        }
    }


    public function checkSeat($hall_id, $seat)
    {
        $sql = 'SELECT * FROM ' . $this->tableName . ' WHERE hall_id = :hall_id AND seat_number = :seat';
        $this->db->prepareQuery($sql);
        $this->db->bind(':hall_id', $hall_id);
        $this->db->bind(':seat', $seat);

        $row = $this->db->singleRow();

        if ($this->db->rowCount() > 0) {
            return true;
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

    public function getAllUserReservations()
    {
        $sql = 'SELECT * FROM ' . $this->tableName . ' WHERE user_ref = :user_ref';
        $this->db->prepareQuery($sql);
        $this->db->bind(':user_ref', $_SESSION['client_ref']);
        $rows = $this->db->allRows();

        if ($this->db->rowCount() > 0) {
            return $rows;
        } else {
            return "There is No Reservations Made By : " . $_SESSION['client_name'];
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
    public function cancelReservation($res_id)
    {
        $sql = 'SELECT * FROM reservations WHERE hall_id IN (SELECT hall_id FROM movies WHERE DATEDIFF(date , CURDATE()) > 1) AND id = :id';
        $this->db->prepareQuery($sql);
        $this->db->bind(':id', $res_id);
        if ($this->db->execute()) {
            $reservation = $this->db->singleRow();

            if ($this->db->rowCount() === 0) {
                return "There is No Rservation Under This ID  : $res_id To Cancel .";
            } else {
                // $this->db->prepareQuery('DELETE FROM reservations WHERE id = :res_id');
                // $this->db->bind(":res_id", $id);
                // $this->db->execute();
                $hall_id = $reservation->hall_id;
                // return $hall_id;
                $isDeleted = $this->deletReservation($res_id);
                if ($isDeleted) {
                    $isUpdated = $this->updateHallSeats('seats-1', $hall_id);
                    if ($isUpdated) {
                        return 'The Reservation has been deleted successfully';
                    } else {
                        return "The Hall's Seats had not been Updated due to Unkown Error";
                    }
                } else {
                    return 'The Reservation has not deleted due to Unknown Error';
                }
            }
        } else {
            return 'The Reservation has not deleted According to unknown Error during the Execution';
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
        $sql = "UPDATE halls SET seats = $state WHERE id = $hall_id";
        $this->db->prepareQuery($sql);
        $this->db->bind(":id", $hall_id);
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
