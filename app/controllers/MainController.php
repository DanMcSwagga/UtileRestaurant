<?php

namespace app\controllers;

use utile\App;
use utile\Cache;

class MainController extends AppController {

    public function indexAction() {
        $this->setMeta(App::$app->getProperty('restaurant_name'), 'Description...', 'Keywords...');

        $specials = \R::find('product', "special = '1' AND status = '1' LIMIT 6");
        $products = \R::find('product', "status = '1'");
        $categories = \R::find('category');
        $this->set(compact('specials', 'products', 'categories'));
    }

}