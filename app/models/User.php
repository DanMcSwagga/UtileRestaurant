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

    public function checkPassword() {
        $email = $_GET['email'];
        $hash = $_GET['hash'];

        if ($u = \R::findOne('user', 'email = ? AND password = ?', [$email, $hash])) {
            $this->load($u);
            return true;
        } else {
            $this->errors['invalid'][] = 'Invalid <b>URL</b> for password reset';
        }
        return false;
    }

    public function updatePassword() {
        if ($bean = \R::findOne('user', 'login = ?', [$this->attributes['login']])) {
            $newpass = $_POST['password-new'];
            $bean->password = password_hash($newpass, PASSWORD_DEFAULT);

            $this->attributes['password'] = $bean->password;

            \R::store($bean);
            return true;
        }
        $this->errors['invalid'][] = 'Invalid data for password reset';
        return false;
    }

    public function fillIdRole() {
        if ($u = \R::findOne('user', "login = ?", [$this->attributes['login']])) {
            $this->attributes['id'] = $u['id'];
            $this->attributes['role'] = $u['role'];
            return true;
        }
        return false;
    }

    public function sendmail() {
        $email = !empty(trim($_POST['email-fg'])) ? trim($_POST['email-fg']) : null;
        if ($email) {
            $user = \R::findOne('user', 'email = ?', [$email]);
            if ($user) {
                $this->load($user);
                $_SESSION['message'] = "<p>Check your email <span>{$email}</span>"
                    . " for a confirmation link to complete your password reset</p>";

                $to      = $user->email;
                $subject = 'Password Reset Link - Utile Restaurant';
                $message_body = 'Hello ' . $user->name . ',
You have requested password reset!
Please click this link to reset your password:
http://localhost/user/check?email=' . $user->email . '&hash=' . $user->password;

                return @mail($to, $subject, $message_body);
            } else {
                $this->errors['non-matching'][] = 'User with this <b>email</b> doesn\'t exist';
            }
        } else {
            $this->errors['invalid'][] = 'This <b>email</b> is invalid';
        }
        return false;
    }

    public static function checkAuth(){
        return isset($_SESSION['user']);
    }

    public static function isAdmin(){
        return (isset($_SESSION['user']) && $_SESSION['user']['role'] == 'admin');
    }

}