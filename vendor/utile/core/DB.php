<?php

namespace utile;

class DB {

    use TSingletone;

    protected function __construct() {
        $db = require_once CONF . '/db.php';

        class_alias('\RedBeanPHP\R', '\R');
        \R::setup($db['dsn'], $db['user'], $db['pass']);
        if (!\R::testConnection()) {
            throw new \Exception('No connection to DB', 500);
        }
        \R::freeze(true);
        if (DEBUG) {
            \R::debug(true, 1);
        }
    }

}