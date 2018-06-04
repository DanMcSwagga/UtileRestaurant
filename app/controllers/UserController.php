<?php

namespace app\controllers;

use app\models\User;
use utile\App;

class UserController extends AppController{

    public function signupAction() {
        if (!empty($_POST)) {
            if (!empty($_POST['g-recaptcha-response'])) {
                $user = new User();
                $data = $_POST;
                $user->load($data);

                $url_data = $this->getCaptchaData();
                $result = json_decode($this->passCaptchaUrl($url_data));

                // captcha completed
                if ($result->success) {
                    if (!$user->validate($data) || !$user->checkUnique()) {
                        $user->getErrors();
                    } else {
                        $user->attributes['password'] = password_hash($user->attributes['password'], PASSWORD_DEFAULT);
                        if ($user->save('user')) {
                            // automatically sign in the user
                            $user->fillIdRole();

                            foreach ($user->attributes as $key => $value) {
                                $_SESSION['user'][$key] = $value;
                            }
                            $_SESSION['success'] = 'Registration successful';
                            redirect('/');
                        } else {
                            $_SESSION['error'] = 'Registration error';
                        }
                    }
                }
                $_SESSION['error'] = 'Stop it, naughty bot';
                redirect();
            }
            $_SESSION['error'] = 'Please, complete the captcha';
            redirect();
        }
        $this->setMeta('Registration - Utile');
    }

    protected function getCaptchaData() {
        $captcha_response = $_POST['g-recaptcha-response'];
        $captcha_remote_ip = $_SERVER['REMOTE_ADDR'];
        $url_data  = App::$app->getProperty('captcha_url') . '?secret=' . App::$app->getProperty('captcha_secret');
        $url_data .= '&response=' . $captcha_response . '&remoteip=' . $captcha_remote_ip;
        return $url_data;
    }

    protected function passCaptchaUrl($url_data) {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url_data);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $curl_res = curl_exec($curl);
        curl_close($curl);
        return $curl_res;
    }

    public function loginAction() {
        if (!empty($_POST)) {
            $user = new User();
            if ($user->login()) {
                $_SESSION['success'] = 'Authorization successful';
                redirect('/');
            } else {
                $_SESSION['error'] = 'Login/password are incorrect';
            }
        }
        $this->setMeta('Authorization - Utile');
    }

    public function logoutAction() {
        if (isset($_SESSION['user'])) {
            unset($_SESSION['user']);
        }
        redirect();
    }

    public function forgotAction() {
        $this->setMeta('Forgot Password - Utile');
        if (!empty($_POST)) {
            $user = new User();
            if ($user->sendmail()) {
                $_SESSION['success'] = "A link to " .  $user->attributes['email'] . ' was sent';
            } else {
                $user->getErrors();
            }
        }
    }

    public function checkAction() {
        $user = new User();
        $user->checkPassword();
        foreach ($user as $key => $value) {
            $_SESSION['user'][$key] = $value;
        }
        $this->loadView('reset');
    }

    public function resetAction() {
        $this->setMeta('Reset - Utile');
        if (!empty($_POST)) {
            $user = new User();
            foreach ($_SESSION['user']['attributes'] as $key => $value) {
                $user->attributes[$key] = $value;
            }

            if ($user->updatePassword()) {
                unset($_SESSION['user']); // no more 'user' field

                // automatically sign in the user
                $user->fillIdRole();

                foreach ($user->attributes as $key => $value) {
                    $_SESSION['user'][$key] = $value;
                }
                $_SESSION['success'] = 'Password successfully updated';
                redirect('/');
            } else {
                $user->getErrors();
            }
        } else {
            $_SESSION['error'] = 'Verification failed, try again';
            redirect('/user/signup');
        }
    }

}