<?php

abstract class UserModel
{



    abstract public  function tableName(): string;
    // Regsiter user
    abstract public function register($data);

    // Login User
    abstract public function login($email);

    // abstract public function token_auth();

    // Find user by email
    // abstract public function findUserByEmail($email);

    // Find user by email
    abstract public function findUserByRef($ref);

    // // Get User by ID
    // abstract public function getUserById($id);
}
