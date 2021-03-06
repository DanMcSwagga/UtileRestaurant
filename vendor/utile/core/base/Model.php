<?php

namespace utile\base;

use utile\DB;
use Valitron\Validator;

abstract class Model {

    public $attributes = [];
    public $errors = [];
    public $rules = [];

    public function __construct() {
        DB::instance();
    }

    public function load($data) {
        foreach ($this->attributes as $name => $value) {
            if (isset($data[$name])) {
                $this->attributes[$name] = $data[$name];
            }
        }
    }

    public function save($table) {
        $bean = \R::dispense($table);
        foreach ($this->attributes as $name => $value) {
            $bean->$name = $value;
        }
        return \R::store($bean);
    }

    public function update($table, $id){
        $bean = \R::load($table, $id);
        foreach($this->attributes as $name => $value){
            $bean->$name = $value;
        }
        return \R::store($bean);
    }

    public function validate($data) {
        $v = new Validator($data);
        $v->rules($this->rules);
        if ($v->validate()) {
            return true;
        }
        $this->errors = $v->errors();
        return false;
    }

    public function getErrors() {
        $errors  = '<ul>';
        foreach ($this->errors as $error) {
            foreach ($error as $item) {
                $errors .= "<li>{$item}</li>";
            }
        }
        $errors .= '</ul>';
        $_SESSION['error'] = $errors;
    }

    public function __get($name) {
        if (!empty($this->attributes)) {
            return array_key_exists($name, $this->attributes) ? $this->attributes[$name] : null;
        } else {
            return null;
        }
    }

    public function __set($name, $value) {
        $this->attributes[$name] = $value;
    }

}