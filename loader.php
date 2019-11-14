<?php

// Load Config
require_once 'config.php';

// Load Core Files
require_once 'core/App.php';
require_once 'core/Controller.php';
require_once 'core/Model.php';
require_once 'core/View.php';

// Load Libs And Twig
function __autoload($Class)
{
    if(!preg_match('/Twig/', $Class))
    {
        if(file_exists(LIBS . $Class . '.php'))
        {
            require_once LIBS . $Class . '.php';
        }
    }
    else
    {
        if(strpos($Class, 'Twig') !== 0)
        {
            return;
        }

        $File = LIBS . str_replace(array('_', "\0"), array('/', ''), $Class) . '.php';

        if(is_file($File))
        {
            require $File;
        }
    }

}