<?php

namespace utile;

class Registry {

    use TSingletone;

    public static $properties = [];

    public function setProperty($key, $value) {
        self::$properties[$key] = $value;
    }

    public function getProperty($key) {
        if (isset(self::$properties[$key])) {
            return self::$properties[$key];
        }
        return null;
    }

    public function getProperties() {
        return self::$properties;
    }

}