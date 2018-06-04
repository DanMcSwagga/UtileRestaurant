<?php

namespace app\controllers\admin;

use app\models\admin\Currency;

class CurrencyController {

    public function indexAction(){
        $currencies = \R::findAll('currency');
        $this->setMeta('Restaurant\'s currencies');
        $this->set(compact('currencies'));
    }

    public function deleteAction(){
        $id = $this->getRequestID();
        $currency = \R::load('currency', $id);
        \R::trash($currency);
        $_SESSION['success'] = "Changes have been saved";
        redirect();
    }

    public function editAction(){
        if(!empty($_POST)){
            $id = $this->getRequestID(false);
            $currency = new Currency();
            $data = $_POST;
            $currency->load($data);
            $currency->attributes['base'] = $currency->attributes['base'] ? '1' : '0';
            if(!$currency->validate($data)){
                $currency->getErrors();
                redirect();
            }
            if($currency->update('currency', $id)){
                $_SESSION['success'] = "Changes have been saved";
                redirect();
            }
        }

        $id = $this->getRequestID();
        $currency = \R::load('currency', $id);
        $this->setMeta("Currency Editing {$currency->title}");
        $this->set(compact('currency'));
    }

    public function addAction(){
        if(!empty($_POST)){
            $currency = new Currency();
            $data = $_POST;
            $currency->load($data);
            $currency->attributes['base'] = $currency->attributes['base'] ? '1' : '0';
            if(!$currency->validate($data)){
                $currency->getErrors();
                redirect();
            }
            if($currency->save('currency')){
                $_SESSION['success'] = 'Currency has been added';
                redirect();
            }
        }
        $this->setMeta('New Currency');
    }

}