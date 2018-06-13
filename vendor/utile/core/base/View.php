<?php

namespace utile\base;

class View {

    public $route;
    public $controller;
    public $model;
    public $view;
    public $prefix;
    public $layout;
    public $data = [];
    public $meta = [];

    public function __construct($route, $layout = '', $view = '', $meta) {
        $this->route = $route;
        $this->controller = $route['controller'];
        $this->view = $view;
        $this->model = $route['controller'];
        $this->prefix = $route['prefix'];
        $this->meta = $meta;

        if ($layout === false) {
            $this->layout = false;
        } else {
            $this->layout = $layout ? : LAYOUT;
        }
    }

    public function render($data) {
        if (is_array($data)) {
            extract($data);
        }

        $viewFile = APP . "/views/{$this->prefix}{$this->controller}/{$this->view}.php";
        if (is_file($viewFile)) {
            $cacheFile = CACHE . '/view_template_cache.php';
            parse_template($viewFile, $cacheFile);

            ob_start();
            require_once $cacheFile;
            $content = ob_get_clean();
        } else {
            throw new \Exception("View {$viewFile} not found", 500);
        }

        if (false !== $this->layout) {
            $layoutFile = APP . "/views/layouts/{$this->layout}.php";

            if (is_file($layoutFile)) {
                $cacheFile = CACHE . '/layout_template_cache.php';
                parse_template($layoutFile, $cacheFile);

                require_once $cacheFile;
            } else {
                throw new \Exception("Layout {$this->layout} not found", 500);
            }
        }
    }

    public function getMeta() {
        $output  = '<title>' . $this->meta['title'] .'</title>' . PHP_EOL;
        $output .= "<meta name=\"description\" content=\"{$this->meta['desc']}\">" . PHP_EOL;
        $output .= "<meta name=\"keywords\" content=\"{$this->meta['keywords']}\">" . PHP_EOL;
        return $output;
    }

}