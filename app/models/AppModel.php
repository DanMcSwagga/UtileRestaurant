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

}