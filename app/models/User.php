<?php

namespace app\models;

class User extends AppModel {

    public $attributes = [
        'login' => '',
        'password' => '',
        'name' => '',
        'email' => '',
        'address' => '',
    ];

    public $rules = [
        'required' => [
            ['login'],
            ['password'],
            ['name'],
            ['email'],
            ['address'],
        ],
        'email' => [
            ['email'],
        ],
        'lengthMin' => [
            ['password', 6],
        ],
    ];

    public function checkUnique() {
        $user = \R::findOne('user', 'login = ? OR email = ?', [$this->attributes['login'], $this->attributes['email']]);
        if ($user) {
            if ($user->login == $this->attributes['login']) {
                $this->errors['unique'][] = 'This <b>login</b> is already taken';
            }
            if ($user->email == $this->attributes['email']) {
                $this->errors['unique'][] = 'This <b>email</b> is already taken';
            }
            return false;
        }
        return true;
    }

    public function login($isAdmin = false) {
        $login = !empty(trim($_POST['login-sup'])) ? trim($_POST['login-sup']) : null;
        $password = !empty(trim($_POST['password-sup'])) ? trim($_POST['password-sup']) : null;
        if ($login && $password) {
            if ($isAdmin) {
                $user = \R::findOne('user', "login = ? AND role = 'admin'", [$login]);
            } else {
                $user = \R::findOne('user', 'login = ?', [$login]);
            }

            if ($user) {
                if (password_verify($password, $user->password)) {
                    foreach ($user as $key => $value) {
                        if ($key != 'password') {
                            $_SESSION['user'][$key] = $value;
                        }
                    }
                    return true;
                }
            }
        }
        return false;
    }

}