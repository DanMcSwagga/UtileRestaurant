<?php

namespace app\controllers;

use app\models\User;

class UserController extends AppController{
    
    public function signupAction() {
        if (!empty($_POST)) {
            $user = new User();
            $data = $_POST;
            $user->load($data);
            if (!$user->validate($data)) {
                echo 'Nope';
                debug($user->errors);
            } else {
                echo 'Aight';
            }
            die;
        }
        $this->setMeta('Registration');
    }

    public function loginAction() {
        
    }

    public function logoutAction() {
        
    }
    
}