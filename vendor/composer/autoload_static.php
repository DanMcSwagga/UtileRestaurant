<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit474dd3530f8a9dcb52515fd2cdeb1660
{
    public static $files = array (
        '2c102faa651ef8ea5874edb585946bce' => __DIR__ . '/..' . '/swiftmailer/swiftmailer/lib/swift_required.php',
    );

    public static $prefixLengthsPsr4 = array (
        'u' => 
        array (
            'utile\\' => 6,
        ),
        'a' => 
        array (
            'app\\' => 4,
        ),
        'V' => 
        array (
            'Valitron\\' => 9,
        ),
        'R' => 
        array (
            'RedBeanPHP\\' => 11,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'utile\\' => 
        array (
            0 => __DIR__ . '/..' . '/utile/core',
        ),
        'app\\' => 
        array (
            0 => __DIR__ . '/../..' . '/app',
        ),
        'Valitron\\' => 
        array (
            0 => __DIR__ . '/..' . '/vlucas/valitron/src/Valitron',
        ),
        'RedBeanPHP\\' => 
        array (
            0 => __DIR__ . '/..' . '/gabordemooij/redbean/RedBeanPHP',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit474dd3530f8a9dcb52515fd2cdeb1660::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit474dd3530f8a9dcb52515fd2cdeb1660::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
