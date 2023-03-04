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


    public function register()
    {
        $this->headerHttp();
        $ref = $this->clientModel->token_auth();
        // Check for POST
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $_POST = filter_input_array(INPUT_POST, 513);

            $data = [

                'ref' => $ref,
                'username' => $_POST['username'],
                'email' => $_POST['email'],
                'password' => $_POST['password'],
                'confirm_password' => $_POST['confirm_password'],
                // 'avatar' => $_FILES['avatar']['name'],
            ];


            if ($this->clientModel->register($data)) {
                // move_uploaded_file($_FILES['avatar']['tmp_name'], './uploads/client/' . $data['avatar']);

                if ($this->clientModel->login($data['user_ref'])) {
                    echo json_encode([
                        'Success' => "Registered With Success",
                        'Ref' => 'Here is your ref to login with : `' . $this->clientModel->login($data['user_ref'])->ref . '`'
                    ]);
                }
            } else {
                echo json_encode(['Error' => "Registered Failled"]);
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
                'password' => trim($_POST['password']),
                'ref_err' => '',
                'password_err' => '',
            ];
            // print_r($data);
            // exit;


            // Validate Email
            if (empty($data['ref'])) {
                $data['ref_err'] = 'Please enter Ref Id';
            }

            // Validate Password
            if (empty($data['password'])) {
                $data['password_err'] = 'Please enter Password';
            }

            // Check for user/email
            if ($this->clientModel->findUserByRef($data['ref'])) {
                // die('User Found');
                // Here we have a user but we need to check his password

            } else {
                // User not found
                $data['ref_err'] = 'User Not Found';
                die('User Not Found Redirecting to pages');
                // here you have to passe data Not Found
                // redirect('pages');
            }

            // Make sure errors are empty
            if (empty($data['ref_err']) && empty($data['password_err'])) {
                // Validated
                // Check and set logged in user
                $loggedInUser = $this->clientModel->login($data['ref'], $data['password']);

                if ($loggedInUser) {
                    // Create Session
                    $this->createUserSession($loggedInUser);
                    redirect('pages');
                } else {
                    $data['password_err'] = 'Password incorrect';
                    die('Password incorrect');
                    // here you have to passe data Password incorrect
                    redirect('pages');
                }
            } else {
                // Load view with errors
                // $this->view('admin/login', $data);
                die('Fields are empty');
                redirect('pages');
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
