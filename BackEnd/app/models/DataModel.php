<?php

class DataModel
{

    private $db;

    public function __construct()
    {
        $this->db = new Database;
    }

    // public function getData($table)
    // {
    //     $sql = "SELECT * FROM " . $table;
    //     $this->db->prepareQuery($sql);

    //     $results = $this->db->allRows();

    //     return $results;
    // }

    // public function getDataByJoin()
    // {
    //     $sql = "SELECT medicine.name , medicine.price , category.name as 'category_name' , medicine.contenance , medicine.image , medicine.created_date , medicine.expired_date FROM `medicine` inner join category ON medicine.category = category.id and medicine.expired_date < now()";
    //     $this->db->prepareQuery($sql);

    //     $results = $this->db->allRows();

    //     return $results;
    // }


    // public function getDataWhere($table, $where)
    // {
    //     $sql = "SELECT * FROM " . $table . " " . $where;
    //     $this->db->prepareQuery($sql);

    //     $results = $this->db->allRows();

    //     return $results;
    // }
}
