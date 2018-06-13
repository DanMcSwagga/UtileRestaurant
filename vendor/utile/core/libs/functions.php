<?php

use utile\Cache;

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

function parse_template($file, $cache = CACHE . '/template_cache.php') {
    if (file_exists($file)) {
        $file_stream = fopen($file, 'r');
        $cache_stream = fopen($cache, 'w');

        while (!feof($file_stream)) {
            $buffer = fgets($file_stream);
            // variables
            foreach ($data as $key => $value) {
                $buffer = preg_replace('/\{' . $key .  '\}/', $value, $buffer);
            }

            // foreach
            $buffer = preg_replace('/\<\!\-\- foreach \((.*)\) \-\-\>/', '<?php foreach ($1): ?>', $buffer);
            $buffer = preg_replace('/\<\!\-\- endforeach \-\-\>/', '<?php endforeach; ?>', $buffer);

            // for
            $buffer = preg_replace('/\<\!\-\- for \((.*)\) \-\-\>/', '<?php for ($1): ?>', $buffer);
            $buffer = preg_replace('/\<\!\-\- endfor \-\-\>/', '<?php endfor; ?>', $buffer);

            // if / else
            $buffer = preg_replace('/\<\!\-\- if (.*) \-\-\>/', '<?php if ($1): ?>', $buffer);
            $buffer = preg_replace('/\<\!\-\- else \-\-\>/', '<?php else: ?>', $buffer);
            $buffer = preg_replace('/\<\!\-\- endif \-\-\>/', '<?php endif; ?>', $buffer);

            // inline PHP code
            $buffer = preg_replace('/\{\{ (.*) \}\}/', '<?= $1 ?>', $buffer);

            // general PHP code
            if(strpos($buffer, '@@') !== false){
                $buffer  = str_replace("@@", '<?php', $buffer);
                $buffer  = trim($buffer, "\t\n\r");
                $buffer .= ' ?>' . "\n ";
            }

            fwrite($cache_stream, $buffer);
        }
        fclose($cache_stream);
        fclose($file_stream);
    } else {
        exit('<b>Template Error:</b> File Inclusion Error.');
    }
}