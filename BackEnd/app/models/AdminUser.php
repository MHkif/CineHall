<?php
class AdminUser extends UserModel
{

    private $db;


    public function __construct()
    {
        $this->db = new Database;
    }

    public function tableName(): string
    {
        return 'admin';
    }
    // Regsiter Admin

    public function register($data)
    {
        $this->db->prepareQuery("INSERT INTO " . $this->tableName()  . " (ref, username, email, password, avatar) VALUES(:ref , :username, :email, :password, :avatar)");
        // Bind values
        $this->db->bind(':ref', $data['ref']);
        $this->db->bind(':username', $data['username']);
        $this->db->bind(':email', $data['email']);
        $this->db->bind(':password', $data['password']);
        $this->db->bind(':avatar', "avatar.jpg");



        // Execute
        if ($this->db->execute()) {

            return true;
        } else {
            return false;
        }
    }

    // Login Admin
    public function login($email, $password)
    {
        $this->db->prepareQuery("SELECT * FROM " . $this->tableName()  . "  WHERE ref = :ref");
        $this->db->bind(':ref', $email);

        $row = $this->db->singleRow();

        $hashed_password = $row->password;
        if (password_verify($password, $hashed_password)) {
            // if($hashed_password == $password){
            return $row;
        } else {
            return false;
        }
    }
    public function token_auth(int $length = 64)
    {
        $length = ($length < 4) ? 4 : $length;
        return bin2hex(random_bytes(($length - ($length % 2)) / 2));
    }

    // Find user by email
    public function findUserByEmail($email)
    {
        $this->db->prepareQuery("SELECT * FROM " . $this->tableName()  . "  WHERE email = :email");
        // Bind value
        $this->db->bind(':email', $email);

        $row = $this->db->singleRow();

        // Check row
        if ($this->db->rowCount() > 0) {
            return true;
        } else {
            return false;
        }
    }

    // Get User by ID
    public function getUserById($id)
    {
        $this->db->prepareQuery("SELECT * FROM " . $this->tableName()  . "  WHERE id = :id");
        // Bind value
        $this->db->bind(':id', $id);

        $row = $this->db->singleRow();

        return $row;
    }


    // Get User by Ref
    public function findUserByRef($ref)
    {
        $this->db->prepareQuery("SELECT * FROM " . $this->tableName()  . "  WHERE ref = :ref");
        
        $this->db->bind(':ref', $ref);

        $row = $this->db->singleRow();

        return $row;
    }
}
