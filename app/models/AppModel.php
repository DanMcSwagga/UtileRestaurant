<?php

namespace app\models;

use utile\base\Model;

class AppModel extends Model {

    public static function createAlias($table, $field, $str, $id) {
        $str = self::str2url($str);
        $res = \R::findOne($table, "$field = ?", [$str]);
        if ($res) {
            $str = "{$str}-{$id}";
            $res = \R::count($table, "$field = ?", [$str]);
            if ($res) {
                $str = self::createAlias($table, $field, $str, $id);
            }
        }
        return $str;
    }

    public static function str2url($str) {
        // в нижний регистр
        $str = strtolower($str);
        // заменям все ненужное нам на "-"
        $str = preg_replace('~[^-a-z0-9_]+~u', '-', $str);
        // удаляем начальные и конечные '-'
        $str = trim($str, "-");
        return $str;
    }

}