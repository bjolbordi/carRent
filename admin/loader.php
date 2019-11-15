<?php

// Load Config
require_once '../config.php';

// Load Core Files
require_once 'core/App.php';
require_once 'core/Controller.php';
require_once 'core/Model.php';
require_once 'core/View.php';

// Load Libs And Twig

spl_autoload_register(function($Class) {

    if(!preg_match('/Twig/', $Class))
    {
        if(file_exists(ADMIN_LIBS . $Class . '.php'))
        {
            require_once ADMIN_LIBS . $Class . '.php';
        }
    }
    else
    {
        if(strpos($Class, 'Twig') !== 0)
        {
            return;
        }

        $File = ADMIN_LIBS . str_replace(array('_', "\0"), array('/', ''), $Class) . '.php';

        if(is_file($File))
        {
            require $File;
        }
    }

});