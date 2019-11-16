<?php

// Define site address
if(dirname($_SERVER['PHP_SELF']) == DIRECTORY_SEPARATOR)
	$SysPath = '/';
else
	$SysPath = dirname($_SERVER['PHP_SELF']).'/';
if(isset($_SERVER['HTTPS']))
	$protocol = ($_SERVER['HTTPS'] && $_SERVER['HTTPS'] != "off") ? "https" : "http";
else
	$protocol = 'http';
define('URL', $protocol . "://" . $_SERVER['HTTP_HOST'].$SysPath);
define('DIR', $SysPath);


if($_SERVER['HTTP_HOST'] == 'localhost')
    define('BRANCH', 'TEST');
else
    define('BRANCH', 'MASTER');

define('SITE', 'fufala.com');
define('SMTP', false);
define('ROOT', dirname(__FILE__) . '/');
define('LIBS', 'libs/');
define('THEME', URL . 'templates/');
define('UPLOAD', URL . 'upload/');
define('UPLOAD_PATH', ROOT . 'upload/');
define('TMP', URL . 'tmp/');
define('NO_PHOTO', THEME . 'images/no_photo.png');
define('CACHE', 'cache/');
define('LANGS', json_encode(['ka' => ['id' => 1, 'title' => 'georgian'], 'en' => ['id' => 2, 'title' => 'english'], 'ru' => ['id' => 3, 'title' => 'russian']]));
define('LANGS_DIR', 'langs/');
define('DEFAULT_LANG', 'ka');
define('IMG_TYPES', serialize(['image/png', 'image/jpg', 'image/jpeg', 'image/gif']));
define('IMG_TYPE', '.jpg');
define('FB_APP_ID', -1);
define('EMAIL', 'info@fufala.com');

// SMS service options
define('SMS_KEY', 'a5ef05535c0442dc97c0f91170c789f3');
define('SMS_SENDER_NAME', 'FUFALA');
define('SMS_SEND_URL', 'http://smsoffice.ge/api/send.aspx?');
define('SMS_MESSAGE', 'Gilocavt! Tqveni shekveta warmatrbit gaigzavna. Shekvetis nomeri #{OrderId}, Tanxa: {Amount} lari. Miwodebis savaraudo tarigi: {Date}. Gmadlobt, rom gvendobit.');



// PipeDrive options
define('API_KEY', '619c64ccb3eb4e645837dbbe867412962aa428f8');
define('STAGE_ID', 22); // "ვორონკის ეტაპის იდ"
define('USER_IDS', json_encode([
    2135652,
    2352777,
    2135648,
])); // ოპერატორების იდ

// File cache
define('FILE_CACHE_DIR', DIR . 'cache/');
define('FILE_CACHE_LIFE_TIME', 3600);

// Twig
define('TWIG_CACHE', false);
define('TWIG_CACHE_PATH', 'cache/twig/');
define('TWIG_TPL', ROOT . 'templates/');
define('ADMIN_TWIG_TPL', ROOT . 'admin/templates/');

// files
define('ver', '?v=0.170');

// Cookie
define('COOKIE_SITE_TIME', 30); //in days
define('COOKIE_SITE_DOMAIN', ''); //ex: localhost

// database
define('DB_HOST', 'localhost');
define('DB_NAME', 'cars');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_DEBUG', false);

// Admin Configs
define('ADMIN_LIBS', '../libs/');
define('ADMIN_LANGS', json_encode(['ka' => ['id' => 1, 'title' => 'georgian'], 'en' => ['id' => 2, 'title' => 'english'], 'ru' => ['id' => 3, 'title' => 'russian']]));
define('ADMIN_LANGS_DIR', URL . 'langs/');
define('ADMIN_DEFAULT_LANG', 'ka');
define('SITE_URL', str_replace('admin/', '', URL));
define('CONTENT_PER_PAGE', 50);

define('SLIDER_WIDTH_L', 1600);
define('SLIDER_HEIGHT_L', 470);
define('SLIDER_WIDTH_S', 100);
define('SLIDER_HEIGHT_S', 100);

define('NEWS_WIDTH_L', 1140);
define('NEWS_HEIGHT_L', 300);
define('NEWS_WIDTH_M', 1140);
define('NEWS_HEIGHT_M', 600);
define('NEWS_WIDTH_S', 282);
define('NEWS_HEIGHT_S', 258);

define('MENU_COVER_WIDTH_L', 1900);
define('MENU_COVER_HEIGHT_L', 300);

define('PARTNER_WIDTH_L', 138);
define('PARTNER_HEIGHT_L', 85);

define('CATEGORY_WIDTH_L', 204);
define('CATEGORY_HEIGHT_L', 187);

define('PRODUCT_WIDTH_L', 1000);
define('PRODUCT_HEIGHT_L', 750);
define('PRODUCT_WIDTH_M', 555);
define('PRODUCT_HEIGHT_M', 420);
define('PRODUCT_WIDTH_S', 213);
define('PRODUCT_HEIGHT_S', 215);