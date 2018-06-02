<?php

namespace app\controllers;

use app\models\Cart;

class CartController extends AppController {

    public function addAction() {
        $id = !empty($_GET['id']) ? (int)$_GET['id'] : null;
        $qty = !empty($_GET['qty']) ? (int)$_GET['qty'] : null;
        if ($id) {
            $product = \R::findOne('product', 'id = ?', [$id]);
            if (!$product) {
                return false;
            }
        }

        $cart = new Cart();
        $cart->addToCart($product, $qty);
        if ($this->isAjax()) {
            $this->loadView('cart_modal');
        }
        redirect();
    }

    public function showAction() {
        $this->loadView('cart_modal');
    }

    public function deleteAction() {
        $id = !empty($_GET['id']) ? $_GET['id'] : null;
        if (isset($_SESSION['cart'][$id])) {
            $cart = new Cart();
            $cart->deleteItem($id);
        }
        if ($this->isAjax()) {
            $this->loadView('cart_modal');
        }
        redirect();
    }

    public function clearAction() {
        unset($_SESSION['cart']);
        unset($_SESSION['cart.qty']);
        unset($_SESSION['cart.sum']);
        unset($_SESSION['cart.currency']);
        $this->loadView('cart_modal');
    }

}