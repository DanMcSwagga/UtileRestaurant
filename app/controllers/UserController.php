<?php

namespace app\controllers;

use app\models\User;

class UserController extends AppController{
    
    public function signupAction() {
        if (!empty($_POST)) {
            $user = new User();
            $data = $_POST;
            $user->load($data);
            if (!$user->validate($data) || !$user->checkUnique()) {
                $user->getErrors();
            } else {
                // TODO automatically sign in the user
                $user->attributes['password'] = password_hash($user->attributes['password'], PASSWORD_DEFAULT);
                if ($user->save('user')) {
                    $_SESSION['success'] = 'Registration successful';
                } else {
                    $_SESSION['error'] = 'Registration error';
                }
            }
            redirect();
        }
        $this->setMeta('Registration');
    }

    public function loginAction() {
        if (!empty($_POST)) {
            $user = new User();
            if ($user->login()) {
                $_SESSION['success'] = 'Authorization successful';
            } else {
                $_SESSION['error'] = 'Login/password are incorrect';
            }
        }

    }

    public function logoutAction() {
        if (isset($_SESSION['user'])) {
            unset($_SESSION['user']);
        }
        redirect();
    }

    public function forgotAction() {
        // TODO remind your the password via mailing the message
    }
    
}