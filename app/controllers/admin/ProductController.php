<?php

namespace app\controllers\admin;

use app\models\admin\Product;
use app\models\AppModel;
use utile\App;
use utile\libs\Pagination;

class ProductController extends AppController {

    public function indexAction() {
        $page = isset($_GET['page']) ? (int) $_GET['page'] : 1;
        $perpage = 10;
        $count = \R::count('product');
        $pagination = new Pagination($page, $perpage, $count);
        $start = $pagination->getStart();
        $products = \R::getAll("SELECT product.*, category.title AS cat FROM product JOIN category ON category.id = product.category_id ORDER BY product.title LIMIT $start, $perpage");
        $this->setMeta('List of Orders');
        $this->set(compact('products', 'pagination', 'count'));
    }

    public function editAction(){
        if(!empty($_POST)){
            $id = $this->getRequestID(false);
            $product = new Product();
            $data = $_POST;
            $product->load($data);
            $product->attributes['status'] = $product->attributes['status'] ? 1 : 0;
            $product->attributes['special'] = $product->attributes['special'] ? 1 : 0;
//            $product->getImg();
            if(!$product->validate($data)){
                $product->getErrors();
                redirect();
            }
            if($product->update('product', $id)){
                $product = \R::load('product', $id);
                $product->alias = $alias;
                \R::store($product);
                $_SESSION['success'] = 'Changes have been saved';
                redirect();
            }
        }

        $id = $this->getRequestID();
        $product = \R::load('product', $id);
        App::$app->setProperty('parent_id', $product->category_id);
        $this->setMeta("Product Editing {$product->title}");
        $this->set(compact('product'));
    }

    public function addAction(){
        if(!empty($_POST)){
            $product = new Product();
            $data = $_POST;
            $product->load($data);
            $product->attributes['status'] = $product->attributes['status'] ? 1 : 0;
            $product->attributes['special'] = $product->attributes['special'] ? 1 : 0;
//            $product->getImg();

            if(!$product->validate($data)){
                $product->getErrors();
                $_SESSION['form_data'] = $data;
                redirect();
            }

            if($id = $product->save('product')){
                $alias = AppModel::createAlias('product', 'alias', $data['title'], $id);
                $p = \R::load('product', $id);
                $p->alias = $alias;
                \R::store($p);
                $_SESSION['success'] = 'Product has been added';
            }
            redirect();
        }

        $this->setMeta('New Product');
    }

    public function deleteAction() {
        $product_id = $this->getRequestID();
        $product = \R::load('product', $product_id);
        \R::trash($product);
        $_SESSION['success'] = 'Product has been deleted';
        redirect(ADMIN . '/product');
    }

}