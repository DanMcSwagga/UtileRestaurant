<?php

namespace app\models\admin;

use app\models\AppModel;

class Product extends AppModel{

    public $attributes = [
        'title' => '',
        'category_id' => '',
        'keywords' => '',
        'description' => '',
        'price' => '',
        'content' => '',
        'full_content' => '',
        'ingredients' => '',
        'status' => '',
        'special' => '',
        'alias' => '',
    ];

    public $rules = [
        'required' => [
            ['title'],
            ['category_id'],
            ['price'],
        ],
        'integer' => [
            ['category_id'],
        ],
    ];

//    public function getImg(){
//        if(!empty($_SESSION['single'])){
//            $this->attributes['img'] = $_SESSION['single'];
//            unset($_SESSION['single']);
//        }
//    }

}