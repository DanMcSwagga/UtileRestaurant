<?php

function debug($arr, $die = false) {
    echo '<pre>';
    echo var_dump($arr, true);
    echo '</pre>';
    if ($die) die;
}

function redirect($http = false) {
    if ($http) {
        $redirect = $http;
    } else {
        $redirect = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : PATH;
    }
    header("Location: {$redirect}");
    exit;
}

function h($str) {
    return htmlspecialchars($str, ENT_QUOTES);
}