<?php

class Client extends Controller
{


    private $user;
    private $clientModel;
    public function __construct()
    {
        $this->clientModel = $this->model("ClientUser");
        $this->user = 'client';
    }


    public function findUserByRef($ref)
    {

        if ($row = $this->clientModel->findUserByRef($ref)) {
            return $row;
        } else {
            echo json_encode(['Error' => "Your Ref is invalid"]);
        }
    }

    public function register()
    {
        $this->headerHttp();
        $ref = $this->clientModel->token_auth();
        // Check for POST
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $data = [

                'ref' => $ref,
                'username' => $_POST['username'],
                'email' => $_POST['email'],
            ];


            if ($this->clientModel->register($data)) {
                // move_uploaded_file($_FILES['avatar']['tmp_name'], './uploads/client/' . $data['avatar']);

                // if ($this->clientModel->login($data['ref'])) {
                    echo json_encode([
                        'Success' => "Your Account Has been Created Successfully",
                        'Ref' => $this->clientModel->login($data['ref'])->ref
                    ]);
                // }
            } else {
                echo json_encode(['Error' => "Your Registration has been Failled"]);
            }
        }
    }





    public function login()
    {
        $this->headerHttp();



        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $data = [
                'ref' => trim($_POST['ref']),
            ];


            if ($this->clientModel->login($data['ref'])) {
                echo json_encode([
                    'Success' => "Login With Success",
                ]);
            } else {
                echo json_encode(['Error' => "Login Failled, Your Ref is invalid"]);
            }
        }
    }




    public function createUserSession($model)
    {
        $_SESSION[$this->user . '_ref'] = $model->ref;
        $_SESSION[$this->user . '_email'] = $model->email;
        $_SESSION[$this->user . '_name'] = $model->username;
    }
    public function logout()
    {

        // $checkUser = $this->userModel->checkUser($loggedInUser->id);

        unset($_SESSION[$this->user . '_ref']);
        unset($_SESSION[$this->user . '_email']);
        unset($_SESSION[$this->user . '_name']);


        session_destroy();
    }
}
