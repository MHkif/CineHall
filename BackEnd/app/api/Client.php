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

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            // Init data
            $data = [
                'ref' => $ref,
                'username' => trim($_POST['username']),
                'email' => trim($_POST['email']),
                'password' => trim($_POST['password']),
                'confirm_password' => trim($_POST['confirm_password']),
                'avatar' => $_FILES['avatar']['name'],
                'username_err' => '',
                'email_err' => '',
                'password_err' => '',
                'confirm_password_err' => '',
                'avatar_err' => ''
            ];

            // print_r($data);
            // exit;

            

            // Validate Email
            if (empty($data['email'])) {
                $data['email_err'] = 'Please enter email';
            } else {
                // Check email
                if ($this->clientModel->findUserByEmail($data['email'])) {
                    $data['email_err'] = 'Email is already taken';
                }
            }


            // Validate Name
            if (empty($data['username'])) {
                $data['username_err'] = 'Please enter your Username';
            }

            // Validate Password
            if (empty($data['password'])) {
                $data['password_err'] = 'Pleae enter Password';
            } elseif (strlen($data['password']) < 6) {
                $data['password_err'] = 'Password must be at least 6 characters';
            }

            // Validate Confirm Password
            if (empty($data['confirm_password'])) {
                $data['confirm_password_err'] = 'Please Confirm Password';
            } else {
                if ($data['password'] != $data['confirm_password']) {
                    $data['confirm_password_err'] = 'Passwords do not match';
                }
            }

            // Make sure errors are empty
            if (empty($data['email_err']) && empty($data['username_err']) && empty($data['password_err']) && empty($data['confirm_password_err']) && empty($data['avatar_err'])) {
                // Validated

                // Hash Password
                $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);

                $SignUpUser =  $this->clientModel->register($data);

                // Register User
                if ($SignUpUser) {
                    //   flash('register_success', 'You are registered and can log in');
                    move_uploaded_file($_FILES['avatar']['tmp_name'], './uploads/client/' . $data['avatar']);

                    redirect('pages');
                    // die('User Sign in');
                } else {
                    die('Something went wrong, Not Registred');
                }
            } else {
                // Load view with errors
                die('Error : Some Fields Are Empty ');
                // $this->view('pages', $data);
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
