/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 100406
Source Host           : localhost:3306
Source Database       : cars

Target Server Type    : MYSQL
Target Server Version : 100406
File Encoding         : 65001

Date: 2019-11-16 03:31:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_langs
-- ----------------------------
DROP TABLE IF EXISTS `admin_langs`;
CREATE TABLE `admin_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_var` varchar(255) NOT NULL,
  `lang_ka` text NOT NULL,
  `lang_en` text NOT NULL,
  `lang_ru` text NOT NULL,
  `lang_tr` text NOT NULL,
  `lang_js` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_var` (`lang_var`),
  KEY `lang_js` (`lang_js`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_langs
-- ----------------------------

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ordering` tinyint(3) NOT NULL DEFAULT 1,
  `home` tinyint(1) NOT NULL DEFAULT 0,
  `parent` int(10) NOT NULL DEFAULT 0,
  `alias` varchar(50) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0- system, 1-default',
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `view` varchar(20) DEFAULT NULL,
  `icon` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`ordering`),
  KEY `alias` (`alias`) USING BTREE,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '1', '1', '0', 'main', '1', '1', 'main', 'fa-home');
INSERT INTO `admin_menu` VALUES ('2', '0', '0', '0', 'user', '0', '1', 'user', '');
INSERT INTO `admin_menu` VALUES ('3', '2', '0', '0', 'users', '1', '1', 'users', 'fa-users');
INSERT INTO `admin_menu` VALUES ('4', '0', '0', '0', 'error', '0', '1', 'error', '');
INSERT INTO `admin_menu` VALUES ('5', '3', '0', '0', 'menu', '1', '1', 'menu', 'fa-list-ul');
INSERT INTO `admin_menu` VALUES ('6', '13', '0', '0', 'contact', '1', '1', 'contact', 'fa-map-marker');
INSERT INTO `admin_menu` VALUES ('7', '5', '0', '0', 'slider', '1', '1', 'slider', 'fa-picture-o');
INSERT INTO `admin_menu` VALUES ('8', '14', '0', '0', 'translate', '1', '1', 'translate', 'fa-globe');
INSERT INTO `admin_menu` VALUES ('9', '4', '0', '0', 'pages', '1', '1', 'pages', 'fa-edit');
INSERT INTO `admin_menu` VALUES ('18', '10', '0', '0', 'brand', '1', '1', 'brand', 'fa-star');
INSERT INTO `admin_menu` VALUES ('17', '7', '0', '0', 'productcategory', '1', '1', 'productcategory', 'fa-list');
INSERT INTO `admin_menu` VALUES ('12', '6', '0', '0', 'news', '1', '1', 'news', 'fa-globe');
INSERT INTO `admin_menu` VALUES ('16', '12', '0', '0', 'message', '1', '1', 'message', 'fa-info');
INSERT INTO `admin_menu` VALUES ('14', '8', '0', '0', 'product', '1', '1', 'product', 'fa-shopping-cart');
INSERT INTO `admin_menu` VALUES ('19', '11', '0', '0', 'attribute', '1', '1', 'attribute', 'fa-cubes');
INSERT INTO `admin_menu` VALUES ('20', '9', '0', '0', 'orders', '1', '1', 'orders', 'fa-database');
INSERT INTO `admin_menu` VALUES ('21', '15', '0', '0', 'counters', '1', '1', 'counters', 'fa-line-chart');
INSERT INTO `admin_menu` VALUES ('22', '1', '0', '0', 'partners', '1', '1', 'partners', 'fa-share-alt');

-- ----------------------------
-- Table structure for admin_menu_trans
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu_trans`;
CREATE TABLE `admin_menu_trans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_id` int(2) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `language` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menu_trans
-- ----------------------------
INSERT INTO `admin_menu_trans` VALUES ('1', '1', 'Main page', '1');
INSERT INTO `admin_menu_trans` VALUES ('2', '1', 'Main page', '2');
INSERT INTO `admin_menu_trans` VALUES ('3', '1', 'Main page', '3');
INSERT INTO `admin_menu_trans` VALUES ('4', '3', 'User Manager', '1');
INSERT INTO `admin_menu_trans` VALUES ('5', '3', 'User Manager', '2');
INSERT INTO `admin_menu_trans` VALUES ('6', '3', 'User Manager', '3');
INSERT INTO `admin_menu_trans` VALUES ('7', '5', 'Menu Manager', '1');
INSERT INTO `admin_menu_trans` VALUES ('8', '5', 'Menu Manager', '2');
INSERT INTO `admin_menu_trans` VALUES ('9', '5', 'Menu Manager', '3');
INSERT INTO `admin_menu_trans` VALUES ('10', '6', 'Contact Manager', '1');
INSERT INTO `admin_menu_trans` VALUES ('11', '6', 'Contact Manager', '2');
INSERT INTO `admin_menu_trans` VALUES ('12', '6', 'Contact Manager', '3');
INSERT INTO `admin_menu_trans` VALUES ('29', '7', 'Slider Manager', '2');
INSERT INTO `admin_menu_trans` VALUES ('30', '7', 'Slider Manager', '3');
INSERT INTO `admin_menu_trans` VALUES ('31', '8', 'Translator', '1');
INSERT INTO `admin_menu_trans` VALUES ('32', '8', 'Translator', '2');
INSERT INTO `admin_menu_trans` VALUES ('33', '8', 'Translator', '3');
INSERT INTO `admin_menu_trans` VALUES ('34', '4', 'Error', '1');
INSERT INTO `admin_menu_trans` VALUES ('28', '7', 'Slider Manager', '1');
INSERT INTO `admin_menu_trans` VALUES ('35', '4', 'Error', '2');
INSERT INTO `admin_menu_trans` VALUES ('36', '4', 'Error', '3');
INSERT INTO `admin_menu_trans` VALUES ('37', '2', 'User', '1');
INSERT INTO `admin_menu_trans` VALUES ('38', '2', 'User', '2');
INSERT INTO `admin_menu_trans` VALUES ('39', '2', 'User', '3');
INSERT INTO `admin_menu_trans` VALUES ('40', '9', 'Pages Manager', '1');
INSERT INTO `admin_menu_trans` VALUES ('41', '9', 'Pages Manager', '2');
INSERT INTO `admin_menu_trans` VALUES ('42', '9', 'Pages Manager', '3');
INSERT INTO `admin_menu_trans` VALUES ('66', '17', 'Product Categories', '3');
INSERT INTO `admin_menu_trans` VALUES ('67', '18', 'Brand Manager', '1');
INSERT INTO `admin_menu_trans` VALUES ('64', '17', 'Product Categories', '2');
INSERT INTO `admin_menu_trans` VALUES ('65', '17', 'Product Categories', '1');
INSERT INTO `admin_menu_trans` VALUES ('49', '12', 'News Manager', '1');
INSERT INTO `admin_menu_trans` VALUES ('50', '12', 'News Manager', '2');
INSERT INTO `admin_menu_trans` VALUES ('51', '12', 'News Manager', '3');
INSERT INTO `admin_menu_trans` VALUES ('61', '16', 'Site Message', '1');
INSERT INTO `admin_menu_trans` VALUES ('62', '16', 'Site Message', '2');
INSERT INTO `admin_menu_trans` VALUES ('63', '16', 'Site Message', '3');
INSERT INTO `admin_menu_trans` VALUES ('55', '14', 'Product Manager', '1');
INSERT INTO `admin_menu_trans` VALUES ('56', '14', 'Product Manager', '2');
INSERT INTO `admin_menu_trans` VALUES ('57', '14', 'Product Manager', '3');
INSERT INTO `admin_menu_trans` VALUES ('68', '18', 'Brand Manager', '2');
INSERT INTO `admin_menu_trans` VALUES ('69', '18', 'Brand Manager', '3');
INSERT INTO `admin_menu_trans` VALUES ('70', '19', 'Attribute Manager', '1');
INSERT INTO `admin_menu_trans` VALUES ('71', '19', 'Attribute Manager', '2');
INSERT INTO `admin_menu_trans` VALUES ('72', '19', 'Attribute Manager', '3');
INSERT INTO `admin_menu_trans` VALUES ('73', '20', 'Orders', '1');
INSERT INTO `admin_menu_trans` VALUES ('74', '20', 'Orders', '2');
INSERT INTO `admin_menu_trans` VALUES ('75', '20', 'Orders', '3');
INSERT INTO `admin_menu_trans` VALUES ('76', '21', 'Counters', '1');
INSERT INTO `admin_menu_trans` VALUES ('77', '21', 'Counters', '2');
INSERT INTO `admin_menu_trans` VALUES ('78', '21', 'Counters', '3');
INSERT INTO `admin_menu_trans` VALUES ('79', '22', 'Partners Manager', '1');
INSERT INTO `admin_menu_trans` VALUES ('80', '22', 'Partners Manager', '2');
INSERT INTO `admin_menu_trans` VALUES ('81', '22', 'Partners Manager', '3');

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `ordering` int(3) NOT NULL DEFAULT 1,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `sort_order` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES ('5', 'GOLDEN ROSE', null, '5');
INSERT INTO `brands` VALUES ('6', 'AROMATIKA', null, '1');
INSERT INTO `brands` VALUES ('7', 'NIVEA', null, '7');
INSERT INTO `brands` VALUES ('9', 'BELL', null, '2');
INSERT INTO `brands` VALUES ('13', 'PERFECTA', null, '8');
INSERT INTO `brands` VALUES ('14', 'CELIA', null, '9');
INSERT INTO `brands` VALUES ('15', 'DAX SUN', null, '10');
INSERT INTO `brands` VALUES ('16', 'LUXONE', null, '11');
INSERT INTO `brands` VALUES ('17', 'LANCOME', null, '12');
INSERT INTO `brands` VALUES ('18', 'MAC COSMETICS', null, '13');
INSERT INTO `brands` VALUES ('19', 'ESTEE LAUDER', null, '14');
INSERT INTO `brands` VALUES ('20', 'FLORMAR', null, '13');
INSERT INTO `brands` VALUES ('21', 'FBM ANAGENESSIS', null, '13');
INSERT INTO `brands` VALUES ('22', 'CHANEL', null, '14');
INSERT INTO `brands` VALUES ('23', 'DIOR', null, '15');

-- ----------------------------
-- Table structure for cars
-- ----------------------------
DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cars
-- ----------------------------
INSERT INTO `cars` VALUES ('1', '28.00', '1', '3', '2019-11-15 11:46:51.000000', '1');
INSERT INTO `cars` VALUES ('2', '28.00', '2', '4', '2019-11-15 19:44:16.000000', '1');
INSERT INTO `cars` VALUES ('3', '28.00', '3', '4', '2019-11-15 19:44:32.000000', '1');
INSERT INTO `cars` VALUES ('4', '0.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('5', '34.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('6', '34.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('7', '3.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('8', '3.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('9', '3.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('10', '3.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('11', '3.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('12', '44.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('13', '434.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('14', '34.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('15', '34.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('16', '34.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('17', '44.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('18', '44.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('19', '44.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('20', '44.00', null, null, null, '1');
INSERT INTO `cars` VALUES ('21', '34.00', null, null, null, '1');

-- ----------------------------
-- Table structure for cars_trans
-- ----------------------------
DROP TABLE IF EXISTS `cars_trans`;
CREATE TABLE `cars_trans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) DEFAULT NULL,
  `car_model` varchar(255) DEFAULT NULL,
  `car_title` varchar(255) DEFAULT NULL,
  `car_desc` varchar(255) DEFAULT '',
  `car_class` varchar(255) DEFAULT NULL,
  `car_transmission` varchar(255) DEFAULT NULL,
  `car_bstyle` varchar(255) DEFAULT NULL,
  `lang_id` tinyint(4) DEFAULT NULL,
  `car_mileage` varchar(255) DEFAULT NULL,
  `car_seats` varchar(255) DEFAULT NULL,
  `car_luggage` varchar(255) DEFAULT NULL,
  `car_fuel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cars_trans
-- ----------------------------
INSERT INTO `cars_trans` VALUES ('1', '1', 'Toyota Prius', 'Toyota', 'asdasd', 'Premium', 'Automatic', 'Sedan', '2', '90,000', '4 Adults', '3 Bags', 'Hybrid');
INSERT INTO `cars_trans` VALUES ('2', '2', 'Toyota Prius', 'Toyota', 'asdasd', 'Premium', 'Automatic', 'Sedan', '2', '190,000', '4 Adults', '3 Bags', 'Hybrid');
INSERT INTO `cars_trans` VALUES ('3', '3', 'Toyota Vitz', 'Toyota', 'asdasd', 'Suv', 'Automatic', 'Hatchback', '2', '40,000', '4 Adults', '3 Bags', 'Petrol');
INSERT INTO `cars_trans` VALUES ('4', '18', 'asdas', 'asdasdasd', 'asd', 'ბექა dasdasd', 'sdasdasdოლბოროდი', 'ბექა dasda', '1', '34', '34', '34', '34');
INSERT INTO `cars_trans` VALUES ('5', '18', '', '', '', '', '', '', '2', '0', '0', '0', '');
INSERT INTO `cars_trans` VALUES ('6', '18', '', '', '', '', '', '', '3', '0', '0', '0', '');
INSERT INTO `cars_trans` VALUES ('7', '19', 'asdas', 'asdasdasd', 'asd', 'ბექა dasdasd', 'sdasdasdოლბოროდი', 'ბექა dasda', '1', '34', '34', '34', '34');
INSERT INTO `cars_trans` VALUES ('8', '19', '', '', '', '', '', '', '2', '0', '0', '0', '');
INSERT INTO `cars_trans` VALUES ('9', '19', '', '', '', '', '', '', '3', '0', '0', '0', '');
INSERT INTO `cars_trans` VALUES ('10', '20', 'asdas', 'asdasdasd', 'asd', 'ბექა dasdasd', 'sdasdasdოლბოროდი', 'ბექა dasda', '1', '34', '34', '34', '34');
INSERT INTO `cars_trans` VALUES ('11', '20', '', '', '', '', '', '', '2', '0', '0', '0', '');
INSERT INTO `cars_trans` VALUES ('12', '20', '', '', '', '', '', '', '3', '0', '0', '0', '');
INSERT INTO `cars_trans` VALUES ('13', '21', '234', 'dasdasd', 'asda', '234', '', '234', '1', '34', '34', '34', '34');
INSERT INTO `cars_trans` VALUES ('14', '21', '', '', '', '', '', '', '2', '0', '0', '0', '');
INSERT INTO `cars_trans` VALUES ('15', '21', '', '', '', '', '', '', '3', '0', '0', '0', '');

-- ----------------------------
-- Table structure for car_features
-- ----------------------------
DROP TABLE IF EXISTS `car_features`;
CREATE TABLE `car_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) DEFAULT NULL,
  `airconditions` tinyint(4) DEFAULT 1,
  `music` tinyint(4) DEFAULT 1,
  `water` tinyint(4) DEFAULT 1,
  `audio_input` tinyint(4) DEFAULT 1,
  `climate_control` tinyint(4) DEFAULT 1,
  `child_seats` tinyint(4) DEFAULT 1,
  `aux` tinyint(4) DEFAULT 1,
  `bluetooth` tinyint(4) DEFAULT 1,
  `car_kit` tinyint(4) DEFAULT 1,
  `seat_belts` tinyint(4) DEFAULT 1,
  `onboard_computer` tinyint(4) DEFAULT 1,
  `remote_central_looking` tinyint(4) DEFAULT 1,
  `gps` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_features
-- ----------------------------
INSERT INTO `car_features` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0');
INSERT INTO `car_features` VALUES ('2', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `car_features` VALUES ('3', '3', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0');

-- ----------------------------
-- Table structure for car_photos
-- ----------------------------
DROP TABLE IF EXISTS `car_photos`;
CREATE TABLE `car_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) DEFAULT NULL,
  `photo_name` varchar(255) DEFAULT NULL,
  `ordering` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_photos
-- ----------------------------
INSERT INTO `car_photos` VALUES ('1', '1', 'toyota.jpg', '1');
INSERT INTO `car_photos` VALUES ('2', '2', 'toyotab.jpg', '2');
INSERT INTO `car_photos` VALUES ('3', '3', 'toyotac.jpg', '3');
INSERT INTO `car_photos` VALUES ('4', '21', '7461573860618.jpg', null);

-- ----------------------------
-- Table structure for contact_info
-- ----------------------------
DROP TABLE IF EXISTS `contact_info`;
CREATE TABLE `contact_info` (
  `contact_lang_id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(50) DEFAULT NULL,
  `contact_address` varchar(200) DEFAULT NULL,
  `contact_desc` text DEFAULT NULL,
  `contact_phone1` varchar(25) DEFAULT NULL,
  `contact_phone2` varchar(25) DEFAULT NULL,
  `contact_phone3` varchar(25) DEFAULT NULL,
  `contact_email1` varchar(50) DEFAULT NULL,
  `contact_email2` varchar(50) DEFAULT NULL,
  `contact_site` varchar(25) DEFAULT NULL,
  `contact_facebook` varchar(100) DEFAULT NULL,
  `contact_twitter` varchar(100) DEFAULT NULL,
  `contact_google` varchar(100) DEFAULT NULL,
  `contact_skype` varchar(25) DEFAULT NULL,
  `contact_youtube` varchar(100) DEFAULT NULL,
  `contact_instagram` varchar(100) DEFAULT NULL,
  `contact_behance` varchar(100) DEFAULT NULL,
  `contact_linkedin` varchar(100) DEFAULT NULL,
  `contact_location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`contact_lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact_info
-- ----------------------------
INSERT INTO `contact_info` VALUES ('1', 'fufala.ge', 'თბილისი, ცოტნე დადიანის #7 ქარვასლა', 'თქვენ შეგიძლიათ დაგვიკავშირდეთ დღის განმავლობაში 10:00-დან 19:00-მდე და მიიღოთ პასუხი თქვენთვის სასურველ კითხვაზე. \r\n\r\nასევე შეგიძლიათ შეავსოთ გვერდით მოცემული ფორმა და ჩვენი ოპერატორი უმოკლეს ვადებში დაგიკავშირდებათ.', '+995 555 11 22 33', '', '', 'info@fufala.ge', '', 'www.fufala.ge', 'https://www.facebook.com/fufalabeauty', 'https://www.twitter.com/fufalabeauty/', '#', 'fufalabeauty', 'https://www.youtube.com/fufalabeauty/', 'https://www.instagram.com/fufalabeauty/', '#', '#', '41.719179546347625,44.80242586135864,16');
INSERT INTO `contact_info` VALUES ('2', 'fufala.ge', 'address', 'ლორემ იპსუმ მშვენიერება ბიჭად მაპოვნინე იცი იბრაგუნებდა წერებულა ადევს, წაიქეცი ნასაუფრალთა სახლშიც ლექსიკონში მოწყენილ. მასკარპონე ამბობდნენ მაპოვნინე ჩასვლის, ააღელვებდა ამოხეთქა ზუფანები ამოუღებლივ. აყენებს შეიმჩნიეს დღეის წაიქეცი დაწყებამდის იმელი.', '+995 555 11 22 33', '+995  595 59 97 37', '', 'info@fufala.ge', '', 'www.fufala.ge', 'https://www.facebook.com/fufala.ge', '#', '#', 'skype', '#', '#', '#', '#', '41.719179546347625,44.80242586135864,16');
INSERT INTO `contact_info` VALUES ('3', 'Торнике цихелишвили', 'address', 'ლორემ იპსუმ მშვენიერება ბიჭად მაპოვნინე იცი იბრაგუნებდა წერებულა ადევს, წაიქეცი ნასაუფრალთა სახლშიც ლექსიკონში მოწყენილ. მასკარპონე ამბობდნენ მაპოვნინე ჩასვლის, ააღელვებდა ამოხეთქა ზუფანები ამოუღებლივ. აყენებს შეიმჩნიეს დღეის წაიქეცი დაწყებამდის იმელი.', '+995 555 11 22 33', '+995  595 59 97 37', '', 'info@fufala.ge', '', 'www.fufala.ge', 'https://www.facebook.com/fufala.ge', '#', '#', 'skype', '#', '#', '#', '#', '41.719179546347625,44.80242586135864,16');

-- ----------------------------
-- Table structure for counters
-- ----------------------------
DROP TABLE IF EXISTS `counters`;
CREATE TABLE `counters` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `code` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of counters
-- ----------------------------
INSERT INTO `counters` VALUES ('1', '<script type=\"text/javascript\">\r\n  var _gaq = _gaq || [];\r\n  _gaq.push([\'_setAccount\', \'UA-XXXXX-X\']);\r\n  _gaq.push([\'_trackPageview\']);\r\n\r\n  (function() {\r\n    var ga = document.createElement(\'script\'); ga.type = \'text/javascript\'; ga.async = true;\r\n    ga.src = (\'https:\' == document.location.protocol ? \'https://ssl\' : \'http://www\') + \'.google-analytics.com/ga.js\';\r\n    var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(ga, s);\r\n  })();\r\n</script>');

-- ----------------------------
-- Table structure for cron_logs
-- ----------------------------
DROP TABLE IF EXISTS `cron_logs`;
CREATE TABLE `cron_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cron_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cron_logs
-- ----------------------------

-- ----------------------------
-- Table structure for db_error_log
-- ----------------------------
DROP TABLE IF EXISTS `db_error_log`;
CREATE TABLE `db_error_log` (
  `db_error_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_dt` timestamp NOT NULL DEFAULT current_timestamp(),
  `db_error` varchar(4000) NOT NULL,
  `url` varchar(4000) NOT NULL,
  `debug_data` text DEFAULT NULL,
  `http_referer` text DEFAULT NULL,
  `http_user_agent` text DEFAULT NULL,
  PRIMARY KEY (`db_error_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_error_log
-- ----------------------------
INSERT INTO `db_error_log` VALUES ('1', '2017-04-08 23:29:38', 'DataBase: Unknown column \'type_id\' in \'field list\'. Full query: [INSERT INTO attr_trans SET `title`=\'პომადის ფერი\',`lang_id`=\'1\',`type_id`=\'3\']. Error initiated in /var/www/fufala/admin/models/AttributeModel.php on line 67, thrown', '/admin/ka/attribute/addattribute/', null, 'http://fufala.zixela.com/admin/ka/attribute/addattribute/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('2', '2017-04-14 13:53:55', 'DataBase: Unknown column \'fsf\' in \'where clause\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\n									p.product_id,\n									IF(v.variant_id, v.sale, p.sale) AS sale,\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\n									IF(v.variant_id, v.price, p.price) AS price,\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\n									v.variant_id,\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\n									t.title,\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\n									FROM products p\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\n									LEFT JOIN products_variants v ON v.product_id = p.product_id  AND v.default = 1\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id\n									LEFT JOIN product_to_categories c ON c.product_id = p.product_id\n									LEFT JOIN products_variant_attrs pva ON pva.variant_id = v.variant_id\n									LEFT JOIN brands b ON b.brand_id = p.brand_id\n									WHERE t.lang_id = 1 AND p.status_id = 1 \n									 AND c.category_id IN (fsf)\n									GROUP BY p.product_id ORDER BY  p.views DESC  LIMIT 0, 12]. Error initiated in /var/www/fufala/models/ProductModel.php on line 138, thrown', '/ka/product/?category=fsf', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('3', '2017-04-18 16:42:46', 'DataBase: Integer (?i) placeholder expects numeric value, boolean given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 439, thrown', '/admin/ka/product/edit/353', null, 'http://fufala.zixela.com/admin/ka/product/edit/353', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('4', '2017-04-18 16:42:51', 'DataBase: Integer (?i) placeholder expects numeric value, boolean given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 439, thrown', '/admin/ka/product/edit/353', null, 'http://fufala.zixela.com/admin/ka/product/edit/353', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('5', '2017-04-18 16:42:53', 'DataBase: Integer (?i) placeholder expects numeric value, boolean given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 439, thrown', '/admin/ka/product/edit/353', null, 'http://fufala.zixela.com/admin/ka/product/edit/353', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('6', '2017-04-18 16:42:54', 'DataBase: Integer (?i) placeholder expects numeric value, boolean given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 439, thrown', '/admin/ka/product/edit/353', null, 'http://fufala.zixela.com/admin/ka/product/edit/353', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('7', '2017-04-18 16:42:56', 'DataBase: Integer (?i) placeholder expects numeric value, boolean given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 439, thrown', '/admin/ka/product/edit/353', null, 'http://fufala.zixela.com/admin/ka/product/edit/353', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('8', '2017-04-18 16:47:44', 'DataBase: Integer (?i) placeholder expects numeric value, boolean given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 439, thrown', '/admin/ka/product/edit/353', null, 'http://fufala.zixela.com/admin/ka/product/edit/353', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('9', '2017-04-18 16:47:48', 'DataBase: Integer (?i) placeholder expects numeric value, boolean given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 439, thrown', '/admin/ka/product/edit/353', null, 'http://fufala.zixela.com/admin/ka/product/edit/353', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('10', '2017-04-18 16:47:57', 'DataBase: Integer (?i) placeholder expects numeric value, boolean given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 439, thrown', '/admin/ka/product/edit/353', null, 'http://fufala.zixela.com/admin/ka/product/edit/353', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('11', '2017-04-18 16:52:35', 'DataBase: Integer (?i) placeholder expects numeric value, boolean given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 439, thrown', '/admin/ka/product/edit/353', null, 'http://fufala.zixela.com/admin/ka/product/edit/353', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('12', '2017-04-18 16:54:11', 'DataBase: Integer (?i) placeholder expects numeric value, boolean given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 439, thrown', '/admin/ka/product/edit/353', null, 'http://fufala.zixela.com/admin/ka/product/edit/353', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('13', '2017-04-18 19:14:42', 'DataBase: Integer (?i) placeholder expects numeric value, string given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 236, thrown', '/admin/ka/product/Generate/355', null, 'http://fufala.zixela.com/admin/ka/product/edit/355', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('14', '2017-04-18 19:14:44', 'DataBase: Integer (?i) placeholder expects numeric value, string given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 236, thrown', '/admin/ka/product/Generate/355', null, 'http://fufala.zixela.com/admin/ka/product/edit/355', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('15', '2017-04-18 19:14:44', 'DataBase: Integer (?i) placeholder expects numeric value, string given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 236, thrown', '/admin/ka/product/Generate/355', null, 'http://fufala.zixela.com/admin/ka/product/edit/355', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('16', '2017-04-18 19:14:45', 'DataBase: Integer (?i) placeholder expects numeric value, string given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 236, thrown', '/admin/ka/product/Generate/355', null, 'http://fufala.zixela.com/admin/ka/product/edit/355', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('17', '2017-04-18 19:14:45', 'DataBase: Integer (?i) placeholder expects numeric value, string given. Error initiated in /var/www/fufala/admin/models/ProductModel.php on line 236, thrown', '/admin/ka/product/Generate/355', null, 'http://fufala.zixela.com/admin/ka/product/edit/355', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.1144');
INSERT INTO `db_error_log` VALUES ('18', '2018-09-22 22:25:39', 'DataBase: Unknown column \'s.home\' in \'where clause\'. Full query: [SELECT\r\n                                  s.*,\r\n                                  t.slider_html, t.slider_caption, t.slider_link\r\n                                  FROM slider s\r\n                                  LEFT JOIN slider_trans t ON t.slider_id = s.slider_id\r\n                                  WHERE s.home = 1 AND t.slider_lang = 1\r\n                                  ORDER BY slider_order ASC ]. Error initiated in D:\\xampp\\htdocs\\perfumeshop\\models\\MainModel.php on line 23, thrown', '/perfumeshop/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('19', '2018-09-22 22:27:22', 'DataBase: Unknown column \'c.featured\' in \'field list\'. Full query: [SELECT\r\n                                  c.category_id,\r\n                                  c.featured,\r\n                                  c.image,\r\n                                  t.title,\r\n                                  COUNT(DISTINCT pc.product_id)  as count\r\n                                  FROM product_categories c\r\n                                  LEFT JOIN product_categories_trans t ON t.category_id = c.category_id AND t.lang_id = 1\r\n                                  LEFT JOIN product_to_categories pc ON pc.category_id = c.category_id\r\n                                  LEFT JOIN products p ON p.product_id = pc.product_id \r\n                                  WHERE c.featured = 1 AND p.status_id = 1\r\n                                  GROUP BY c.category_id\r\n                                  ORDER BY `count` DESC]. Error initiated in D:\\xampp\\htdocs\\perfumeshop\\models\\MainModel.php on line 64, thrown', '/perfumeshop/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('20', '2018-09-23 00:50:43', 'DataBase: Unknown column \'brand_id\' in \'field list\'. Full query: [INSERT INTO slider SET slider_image = \'6621537649443.jpg\', brand_id = 6, home = 1, target_blank = 0]. Error initiated in D:\\xampp\\htdocs\\perfumeshop\\admin\\models\\SliderModel.php on line 105, thrown', '/perfumeshop/admin/ka/slider/add/', null, 'http://localhost/perfumeshop/admin/ka/slider/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('21', '2018-09-23 00:52:16', 'DataBase: Unknown column \'home\' in \'field list\'. Full query: [INSERT INTO slider SET slider_image = \'2661537649536.jpg\', brand_id = 6, home = 1, target_blank = 0]. Error initiated in D:\\xampp\\htdocs\\perfumeshop\\admin\\models\\SliderModel.php on line 105, thrown', '/perfumeshop/admin/ka/slider/add/', null, 'http://localhost/perfumeshop/admin/ka/slider/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('22', '2018-09-23 00:52:48', 'DataBase: Unknown column \'target_blank\' in \'field list\'. Full query: [INSERT INTO slider SET slider_image = \'5181537649568.jpg\', brand_id = 6, home = 1, target_blank = 0]. Error initiated in D:\\xampp\\htdocs\\perfumeshop\\admin\\models\\SliderModel.php on line 105, thrown', '/perfumeshop/admin/ka/slider/add/', null, 'http://localhost/perfumeshop/admin/ka/slider/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('23', '2019-11-14 21:14:35', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('24', '2019-11-14 21:14:45', 'DataBase: Table \'cars.attr_values\' doesn\'t exist. Full query: [SELECT\r\n                                    v.attr_value_id,\r\n                                    v.attr_id,\r\n                                    v.color,\r\n                                    v.ordering,\r\n                                    at.title as attr_title,\r\n                                    avt.title,\r\n                                    attrs.type_id\r\n                                    FROM\r\n                                    attr_values v\r\n                                    INNER JOIN attr_values_trans avt ON v.attr_value_id = avt.attr_value_id AND avt.lang_id = 1 \r\n                                    INNER JOIN attrs ON v.attr_id = attrs.attr_id\r\n                                    INNER JOIN attr_trans at ON attrs.attr_id = at.attr_id AND at.lang_id = 1 \r\n                                    ORDER BY attrs.ordering ASC, v.ordering ASC]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 141, thrown', '/carRent/admin/ka/product/edit/8/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('25', '2019-11-14 21:14:57', 'DataBase: Table \'cars.news_to_tags\' doesn\'t exist. Full query: [SELECT\r\n									t.tag_name\r\n									FROM news_to_tags pt\r\n									LEFT JOIN news_tags t ON t.tag_id = pt.tag_id]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\NewsModel.php on line 73, thrown', '/carRent/admin/ka/news/add/', null, 'http://localhost:81/carRent/admin/ka/news', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('26', '2019-11-14 21:15:09', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('27', '2019-11-14 21:23:38', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('28', '2019-11-14 21:25:51', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('29', '2019-11-14 21:26:02', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('30', '2019-11-14 21:26:36', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('31', '2019-11-14 21:27:07', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('32', '2019-11-14 21:27:08', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('33', '2019-11-14 21:27:08', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('34', '2019-11-14 21:27:09', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('35', '2019-11-14 21:27:48', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('36', '2019-11-14 21:28:00', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 395, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('37', '2019-11-14 21:28:59', 'DataBase: Table \'cars.news_to_tags\' doesn\'t exist. Full query: [SELECT\r\n									t.tag_name\r\n									FROM news_to_tags pt\r\n									LEFT JOIN news_tags t ON t.tag_id = pt.tag_id]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\NewsModel.php on line 73, thrown', '/carRent/admin/ka/news/add/', null, 'http://localhost:81/carRent/admin/ka/news', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('38', '2019-11-14 21:29:06', 'DataBase: Table \'cars.news_to_tags\' doesn\'t exist. Full query: [SELECT\r\n									t.tag_name\r\n									FROM news_to_tags pt\r\n									LEFT JOIN news_tags t ON t.tag_id = pt.tag_id]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\NewsModel.php on line 73, thrown', '/carRent/admin/ka/news/add/', null, 'http://localhost:81/carRent/admin/ka/news', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('39', '2019-11-14 21:29:16', 'DataBase: Table \'cars.news_to_tags\' doesn\'t exist. Full query: [SELECT\r\n									t.tag_name\r\n									FROM news_to_tags pt\r\n									LEFT JOIN news_tags t ON t.tag_id = pt.tag_id]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\NewsModel.php on line 73, thrown', '/carRent/admin/ka/news/add/', null, 'http://localhost:81/carRent/admin/ka/news', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('40', '2019-11-14 21:33:56', 'DataBase: Table \'cars.attr_values\' doesn\'t exist. Full query: [SELECT\r\n                                    v.attr_value_id,\r\n                                    v.attr_id,\r\n                                    v.color,\r\n                                    v.ordering,\r\n                                    at.title as attr_title,\r\n                                    avt.title,\r\n                                    attrs.type_id\r\n                                    FROM\r\n                                    attr_values v\r\n                                    INNER JOIN attr_values_trans avt ON v.attr_value_id = avt.attr_value_id AND avt.lang_id = 1 \r\n                                    INNER JOIN attrs ON v.attr_id = attrs.attr_id\r\n                                    INNER JOIN attr_trans at ON attrs.attr_id = at.attr_id AND at.lang_id = 1 \r\n                                    ORDER BY attrs.ordering ASC, v.ordering ASC]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 141, thrown', '/carRent/admin/ka/product/edit/8/', null, 'http://localhost:81/carRent/admin/ka/product', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('41', '2019-11-15 11:44:51', 'DataBase: Unknown column \'p.pipedrive_id\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.product_id,\r\n									p.status_id,\r\n									p.views,\r\n									p.created_date,\r\n									IF(v.variant_id, v.pipedrive_id, p.pipedrive_id) AS pipedrive_id,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									WHERE t.lang_id = 1 AND p.status_id != 0 \r\n									GROUP BY p.product_id\r\n									ORDER BY p.product_id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 36, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('42', '2019-11-15 11:44:56', 'DataBase: Unknown column \'p.pipedrive_id\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.product_id,\r\n									p.status_id,\r\n									p.views,\r\n									p.created_date,\r\n									IF(v.variant_id, v.pipedrive_id, p.pipedrive_id) AS pipedrive_id,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									WHERE t.lang_id = 1 AND p.status_id != 0 \r\n									GROUP BY p.product_id\r\n									ORDER BY p.product_id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 36, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('43', '2019-11-15 11:45:13', 'DataBase: Unknown column \'p.pipedrive_id\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.product_id,\r\n									p.status_id,\r\n									p.views,\r\n									p.created_date,\r\n									IF(v.variant_id, v.pipedrive_id, p.pipedrive_id) AS pipedrive_id,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									WHERE t.lang_id = 1 AND p.status_id != 0 \r\n									GROUP BY p.product_id\r\n									ORDER BY p.product_id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 36, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('44', '2019-11-15 11:45:14', 'DataBase: Unknown column \'p.pipedrive_id\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.product_id,\r\n									p.status_id,\r\n									p.views,\r\n									p.created_date,\r\n									IF(v.variant_id, v.pipedrive_id, p.pipedrive_id) AS pipedrive_id,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									WHERE t.lang_id = 1 AND p.status_id != 0 \r\n									GROUP BY p.product_id\r\n									ORDER BY p.product_id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 36, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('45', '2019-11-15 11:45:15', 'DataBase: Unknown column \'p.pipedrive_id\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.product_id,\r\n									p.status_id,\r\n									p.views,\r\n									p.created_date,\r\n									IF(v.variant_id, v.pipedrive_id, p.pipedrive_id) AS pipedrive_id,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									WHERE t.lang_id = 1 AND p.status_id != 0 \r\n									GROUP BY p.product_id\r\n									ORDER BY p.product_id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 36, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('46', '2019-11-15 11:45:19', 'DataBase: Unknown column \'p.pipedrive_id\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.product_id,\r\n									p.status_id,\r\n									p.views,\r\n									p.created_date,\r\n									IF(v.variant_id, v.pipedrive_id, p.pipedrive_id) AS pipedrive_id,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									WHERE t.lang_id = 1 AND p.status_id != 0 \r\n									GROUP BY p.product_id\r\n									ORDER BY p.product_id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 36, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('47', '2019-11-15 11:54:37', 'DataBase: Unknown column \'p.pipedrive_id\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.product_id,\r\n									p.status_id,\r\n									p.views,\r\n									p.created_date,\r\n									IF(v.variant_id, v.pipedrive_id, p.pipedrive_id) AS pipedrive_id,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									WHERE t.lang_id = 1 AND p.status_id != 0 \r\n									GROUP BY p.product_id\r\n									ORDER BY p.product_id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 36, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('48', '2019-11-15 12:03:09', 'DataBase: Unknown column \'t.title\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('49', '2019-11-15 12:03:15', 'DataBase: Unknown column \'t.title\' in \'field list\'. Full query: [SELECT\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('50', '2019-11-15 12:03:40', 'DataBase: Unknown column \'t.title\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('51', '2019-11-15 12:05:24', 'DataBase: Unknown column \'t.title\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('52', '2019-11-15 12:07:22', 'DataBase: Unknown column \'t.title\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('53', '2019-11-15 12:07:35', 'DataBase: Unknown column \'t.title\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('54', '2019-11-15 12:07:40', 'DataBase: Unknown column \'t.title\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('55', '2019-11-15 12:07:43', 'DataBase: Unknown column \'t.title\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('56', '2019-11-15 12:07:56', 'DataBase: Unknown column \'t.title\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('57', '2019-11-15 12:08:42', 'DataBase: Unknown column \'t.title\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('58', '2019-11-15 12:09:11', 'DataBase: Unknown column \'t.title\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo_name as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('59', '2019-11-15 12:09:26', 'DataBase: Unknown column \'i.photo\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo as image,\r\n									t.title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('60', '2019-11-15 12:13:07', 'DataBase: Unknown column \'i.photo\' in \'field list\'. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n									p.id,\r\n									p.status,\r\n									p.views,\r\n									p.created_at,\r\n									i.photo as image,\r\n									t.car_title,\r\n									t.lang_id\r\n									FROM cars p\r\n									LEFT JOIN cars_trans t ON t.car_id = p.id\r\n									LEFT JOIN car_features v ON v.car_id = p.id\r\n									LEFT JOIN car_photos i ON i.car_id = p.id\r\n									WHERE t.lang_id = 1 AND p.status != 0 \r\n									GROUP BY p.id\r\n									ORDER BY p.id DESC  LIMIT 0, 50]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 35, thrown', '/carRent/admin/ka/product', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('61', '2019-11-15 20:11:16', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('62', '2019-11-15 20:12:17', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('63', '2019-11-15 20:12:17', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('64', '2019-11-15 20:12:23', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('65', '2019-11-15 20:12:39', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('66', '2019-11-15 20:12:55', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('67', '2019-11-15 20:13:06', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('68', '2019-11-15 20:13:25', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('69', '2019-11-15 20:13:34', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('70', '2019-11-15 20:13:42', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('71', '2019-11-15 20:14:22', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('72', '2019-11-15 20:14:25', 'DataBase: Unknown column \'p.quantity\' in \'field list\'. Full query: [SELECT\r\n									p.product_id,\r\n									IF(v.variant_id, v.sale, p.sale) AS sale,\r\n									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,\r\n									IF(v.variant_id, v.price, p.price) AS price,\r\n									IF(v.variant_id, v.quantity, p.quantity) AS quantity,\r\n									v.variant_id,\r\n									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,\r\n									t.title,\r\n									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left\r\n									FROM products p\r\n									LEFT JOIN products_trans t ON t.product_id = p.product_id\r\n									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1\r\n									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1\r\n									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id\r\n									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id \r\n									WHERE t.lang_id = 1 AND p.status_id = 1 \r\n									GROUP BY p.product_id ORDER BY p.views DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 100, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('73', '2019-11-15 20:16:03', 'DataBase: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n      \' at line 3. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n                  p.id,\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('74', '2019-11-15 20:16:19', 'DataBase: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n      \' at line 3. Full query: [SELECT SQL_CALC_FOUND_ROWS\r\n                  p.id,\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('75', '2019-11-15 20:16:33', 'DataBase: Number of args (1) doesn\'t match number of placeholders (0) in [SELECT SQL_CALC_FOUND_ROWS\r\n                  p.id,\r\n                  FROM cars p\r\n                  \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 73, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('76', '2019-11-15 20:16:49', 'DataBase: Number of args (1) doesn\'t match number of placeholders (0) in [SELECT SQL_CALC_FOUND_ROWS\r\n                  p.id,\r\n                  FROM cars p\r\n                 \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 73, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('77', '2019-11-15 20:17:16', 'DataBase: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n      \' at line 3. Full query: [SELECT\r\n                  p.id,\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('78', '2019-11-15 20:17:19', 'DataBase: Unknown column \'8\' in \'order clause\'. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('79', '2019-11-15 20:17:27', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN car_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('80', '2019-11-15 20:18:30', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN car_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('81', '2019-11-15 20:18:51', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN car_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  ]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 68, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('82', '2019-11-15 20:18:55', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN car_trans t ON t.car_id = p.id\r\n                  \r\n                  ]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 68, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('83', '2019-11-15 20:19:26', 'DataBase: Unknown column \'8\' in \'order clause\'. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('84', '2019-11-15 20:19:56', 'DataBase: Number of args (0) doesn\'t match number of placeholders (1) in [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = ?i AND p.status = 1 \r\n                  \r\n                  ]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 68, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('85', '2019-11-15 20:20:49', 'DataBase: Unknown column \'8\' in \'order clause\'. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('86', '2019-11-15 20:21:07', 'DataBase: Number of args (1) doesn\'t match number of placeholders (0) in [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 2 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('87', '2019-11-15 20:21:15', 'DataBase: Unknown column \'8\' in \'order clause\'. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 2 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('88', '2019-11-15 20:22:06', 'DataBase: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'LIMIT  8\' at line 9. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY LIMIT  8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('89', '2019-11-15 20:22:43', 'DataBase: Unknown column \'LIMIT8\' in \'order clause\'. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY  LIMIT8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('90', '2019-11-15 20:22:44', 'DataBase: Unknown column \'LIMIT8\' in \'order clause\'. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY  LIMIT8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('91', '2019-11-15 20:22:47', 'DataBase: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'LIMIT 8\' at line 9. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY  LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('92', '2019-11-15 20:22:53', 'DataBase: Number of args (0) doesn\'t match number of placeholders (1) in [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = ?i AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY  LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('93', '2019-11-15 20:24:11', 'DataBase: Unknown column \'p.product_id\' in \'order clause\'. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY  p.product_id DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('94', '2019-11-15 20:24:27', 'DataBase: Unknown column \'p.product_id\' in \'order clause\'. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY  p.product_id DESC LIMIT 1]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('95', '2019-11-15 20:25:04', 'DataBase: Unknown column \'DESC8\' in \'order clause\'. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.id ORDER BY DESC8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 76, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('96', '2019-11-15 20:25:54', 'DataBase: Unknown column \'p.product_id\' in \'order clause\'. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.product_id ORDER BY p.product_id DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 77, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('97', '2019-11-15 20:26:05', 'DataBase: Unknown column \'p.product_id\' in \'group statement\'. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.product_id ORDER BY p.id DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 77, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('98', '2019-11-15 20:26:22', 'DataBase: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'\' at line 9. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.product_id ORDER BY ]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 77, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('99', '2019-11-15 20:26:26', 'DataBase: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'\' at line 9. Full query: [SELECT\r\n                  p.id\r\n                  FROM cars p\r\n                  LEFT JOIN cars_trans t ON t.car_id = p.id\r\n                  LEFT JOIN car_photos i ON i.car_id = p.id\r\n                  LEFT JOIN car_features v ON v.car_id = p.id\r\n                  WHERE t.lang_id = 1 AND p.status = 1 \r\n                  \r\n                  GROUP BY p.product_id ORDER BY ]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 77, thrown', '/carRent/ka/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('100', '2019-11-16 01:32:49', 'DataBase: Unknown column \'t.lang_id\' in \'where clause\'. Full query: [SELECT\r\n                  i.photo_name\r\n                  FROM cars p\r\n                  \r\n                  RIGHT JOIN car_photos i ON i.car_id = p.id\r\n                  \r\n                  WHERE t.lang_id = 2 AND p.status = 1 \r\n                  ORDER BY p.id DESC LIMIT 8]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\MainModel.php on line 77, thrown', '/carRent/en/', null, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('101', '2019-11-16 01:45:11', 'DataBase: Unknown column \'quantity\' in \'NEW\'. Full query: [UPDATE products SET views=views+1 WHERE product_id = 3]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\ProductModel.php on line 348, thrown', '/carRent/en/product/detail/3', null, 'http://localhost:81/carRent/en/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('102', '2019-11-16 01:49:10', 'DataBase: Unknown column \'quantity\' in \'NEW\'. Full query: [UPDATE products SET views=views+1 WHERE product_id = 3]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\ProductModel.php on line 348, thrown', '/carRent/en/product/detail/3', null, 'http://localhost:81/carRent/en/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('103', '2019-11-16 01:49:32', 'DataBase: Unknown column \'quantity\' in \'NEW\'. Full query: [UPDATE products SET views=views+1 WHERE product_id = 3]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\ProductModel.php on line 348, thrown', '/carRent/en/product/detail/3', null, 'http://localhost:81/carRent/en/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('104', '2019-11-16 01:49:37', 'DataBase: Unknown column \'quantity\' in \'NEW\'. Full query: [UPDATE products SET views=views+1 WHERE product_id = 3]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\ProductModel.php on line 348, thrown', '/carRent/en/product/detail/3', null, 'http://localhost:81/carRent/en/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('105', '2019-11-16 01:50:30', 'DataBase: Unknown column \'quantity\' in \'NEW\'. Full query: [UPDATE products SET views=views+1 WHERE product_id = 3]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\ProductModel.php on line 348, thrown', '/carRent/en/product/detail/3', null, 'http://localhost:81/carRent/en/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('106', '2019-11-16 01:55:29', 'DataBase: Unknown column \'quantity\' in \'NEW\'. Full query: [UPDATE products SET views=views+1 WHERE product_id = 3]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\ProductModel.php on line 341, thrown', '/carRent/en/product/detail/3', null, 'http://localhost:81/carRent/en/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('107', '2019-11-16 01:55:36', 'DataBase: Unknown column \'quantity\' in \'NEW\'. Full query: [UPDATE products SET views=views+1 WHERE product_id = 3]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\ProductModel.php on line 341, thrown', '/carRent/en/product/detail/3', null, 'http://localhost:81/carRent/en/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('108', '2019-11-16 01:55:45', 'DataBase: Unknown column \'quantity\' in \'NEW\'. Full query: [UPDATE products SET views=views+1 WHERE product_id = 3]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\ProductModel.php on line 341, thrown', '/carRent/en/product/detail/3', null, 'http://localhost:81/carRent/en/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('109', '2019-11-16 01:56:21', 'DataBase: Unknown column \'quantity\' in \'NEW\'. Full query: [UPDATE products SET views=views+1 WHERE product_id = 3]. Error initiated in D:\\xampp\\htdocs\\carRent\\models\\ProductModel.php on line 340, thrown', '/carRent/en/product/detail/3', null, 'http://localhost:81/carRent/en/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('110', '2019-11-16 02:55:14', 'DataBase: Table \'cars.pipedrive_added_products\' doesn\'t exist. Full query: [INSERT INTO products SET `brand_id`=\'0\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 260, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('111', '2019-11-16 03:05:35', 'DataBase: Unknown column \'show_title\' in \'field list\'. Full query: [INSERT INTO cars SET `show_title`=\'34\',`status`=\'1\' ]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 194, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('112', '2019-11-16 03:05:46', 'DataBase: Unknown column \'show_title\' in \'field list\'. Full query: [INSERT INTO cars SET `show_title`=\'34\',`status`=\'1\' ]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 194, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('113', '2019-11-16 03:08:53', 'DataBase: Unknown column \'show_title\' in \'field list\'. Full query: [INSERT INTO cars SET `show_title`=\'0\',`status`=\'1\' ]. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 195, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('114', '2019-11-16 03:09:56', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [INSERT INTO car_trans SET `car_title`=\'asd\',`car_model`=\'asdasd\',`car_class`=\'asd\',`car_bstyle`=\'asdsa\',`car_transmission`=\'wfwfwef\',`car_desc`=\'\',`lang_id`=\'1\',`car_id`=\'5\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 202, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('115', '2019-11-16 03:15:31', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [INSERT INTO car_trans SET `car_title`=\'dfsdfsdf\',`car_model`=\'sdfs\',`car_class`=\'asdasd\',`car_bstyle`=\'asdas\',`car_transmission`=\'dasdasd\',`car_desc`=\'asdasdasd\',`lang_id`=\'1\',`car_id`=\'8\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 204, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('116', '2019-11-16 03:15:58', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [INSERT INTO car_trans SET `car_title`=\'dfsdfsdf\',`car_model`=\'sdfs\',`car_class`=\'asdasd\',`car_bstyle`=\'asdas\',`car_transmission`=\'dasdasd\',`car_desc`=\'asdasdasd\',`lang_id`=\'1\',`car_id`=\'10\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 204, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('117', '2019-11-16 03:16:01', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [INSERT INTO car_trans SET `car_title`=\'dfsdfsdf\',`car_model`=\'sdfs\',`car_class`=\'asdasd\',`car_bstyle`=\'asdas\',`car_transmission`=\'dasdasd\',`car_desc`=\'asdasdasd\',`lang_id`=\'1\',`car_id`=\'11\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 204, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('118', '2019-11-16 03:16:35', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [INSERT INTO car_trans SET `car_title`=\'asdasd\',`car_model`=\'asd\',`car_class`=\'aasdas\',`car_bstyle`=\'dasdasd\',`car_transmission`=\'asdasd\',`car_desc`=\'asdasdasd\',`lang_id`=\'1\',`car_id`=\'12\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 204, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('119', '2019-11-16 03:18:07', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [INSERT INTO car_trans SET `car_title`=\'asdasd\',`car_model`=\'asdasd\',`car_class`=\'asdasd\',`car_bstyle`=\'asda\',`car_transmission`=\'sasdasd\',`car_desc`=\'asdasd\',`lang_id`=\'1\',`car_id`=\'13\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 206, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('120', '2019-11-16 03:21:42', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [INSERT INTO car_trans SET `car_title`=\'asdasdasd\',`car_model`=\'asda\',`car_class`=\'sdasdas\',`car_bstyle`=\'dasd\',`car_transmission`=\'asdasd\',`car_desc`=\'asdasdasd\',`lang_id`=\'1\',`car_id`=\'14\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 206, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('121', '2019-11-16 03:21:56', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [INSERT INTO car_trans SET `car_title`=\'asdasdasd\',`car_model`=\'asda\',`car_class`=\'sdasdas\',`car_bstyle`=\'dasd\',`car_transmission`=\'asdasd\',`car_desc`=\'asdasdasd\',`lang_id`=\'1\',`car_id`=\'15\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 206, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('122', '2019-11-16 03:23:30', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [INSERT INTO car_trans SET `car_title`=\'asdasdasd\',`car_model`=\'asda\',`car_class`=\'sdasdas\',`car_bstyle`=\'dasd\',`car_transmission`=\'asdasd\',`car_desc`=\'asdasdasd\',`lang_id`=\'1\',`car_id`=\'16\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 206, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');
INSERT INTO `db_error_log` VALUES ('123', '2019-11-16 03:24:01', 'DataBase: Table \'cars.car_trans\' doesn\'t exist. Full query: [INSERT INTO car_trans SET `car_title`=\'asdasdasd\',`car_model`=\'asdas\',`car_class`=\'ბექა dasdasd\',`car_bstyle`=\'ბექა dasda\',`car_transmission`=\'sdasdasdოლბოროდი\',`car_seats`=\'34\',`car_luggage`=\'34\',`car_mileage`=\'34\',`car_fuel`=\'34\',`car_desc`=\'asd\',`lang_id`=\'1\',`car_id`=\'17\']. Error initiated in D:\\xampp\\htdocs\\carRent\\admin\\models\\ProductModel.php on line 206, thrown', '/carRent/admin/ka/product/add/', null, 'http://localhost:81/carRent/admin/ka/product/add/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36');

-- ----------------------------
-- Table structure for langs
-- ----------------------------
DROP TABLE IF EXISTS `langs`;
CREATE TABLE `langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_var` varchar(255) NOT NULL,
  `lang_ka` text NOT NULL,
  `lang_en` text NOT NULL,
  `lang_ru` text NOT NULL,
  `lang_tr` text NOT NULL,
  `lang_js` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_var` (`lang_var`),
  KEY `lang_js` (`lang_js`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of langs
-- ----------------------------
INSERT INTO `langs` VALUES ('1', 'meta_title', '', '', '', '', '0');
INSERT INTO `langs` VALUES ('2', 'meta_desc', '', '', '', '', '0');
INSERT INTO `langs` VALUES ('3', 'meta_key', '', '', '', '', '0');
INSERT INTO `langs` VALUES ('4', 'name', 'სახელი', 'Name', 'Name', '', '0');
INSERT INTO `langs` VALUES ('5', 'email', 'ელ.ფოსტა', 'Email', 'Email', '', '0');
INSERT INTO `langs` VALUES ('6', 'message', 'წერილი', 'Message', 'Message', '', '0');
INSERT INTO `langs` VALUES ('7', 'send_message', 'წერილის გაგზავნა', 'Send message', 'Send message', '', '0');
INSERT INTO `langs` VALUES ('8', 'about_project', 'პროექტის შესახებ', 'About this project', 'About this project', '', '0');
INSERT INTO `langs` VALUES ('9', 'preview', 'დემონსტრაცია', 'Live Preview', 'Live Preview', '', '0');
INSERT INTO `langs` VALUES ('10', 'message_send_success', 'თქვენი წერილი წარმატებით გაიგზავნა, ჩვენი ოპერატორი მალე დაგირეკავთ.', 'Message has been sent', 'Message has been sent', '', '0');
INSERT INTO `langs` VALUES ('11', 'message_send_error', 'წერილის გაგზავნის დროს დაფიქსირდა შეცდომა, გთხოვთ სცადოთ ახლიდან...', 'The letter was not sent', 'The letter was not sent', '', '0');
INSERT INTO `langs` VALUES ('12', 'all_news', 'ყველა სიახლე', 'All News', 'All News', '', '0');
INSERT INTO `langs` VALUES ('13', 'news', 'სიახლე', 'News', 'News', '', '0');
INSERT INTO `langs` VALUES ('14', 'read_more', 'მეტის ნახვა', 'Read More', 'Read More', '', '0');
INSERT INTO `langs` VALUES ('15', 'contact', 'კონტაქტი', 'Contact', 'Contact', '', '0');
INSERT INTO `langs` VALUES ('16', 'contact_us', 'დაგვიკავშირდით', 'Contact Us', 'Contact Us', '', '0');
INSERT INTO `langs` VALUES ('17', 'contact_info', 'საკონტაქტო ინფორმაცია', 'Contact Info', 'Contact Info', '', '0');
INSERT INTO `langs` VALUES ('18', 'page_not_found', 'თქვენს მიერ მოთხოვნილი გვერდი ვერ მოიძებნა', 'Page Not Found', 'Page Not Found', '', '0');
INSERT INTO `langs` VALUES ('19', 'gallery', 'გალერეა', 'Gallery', 'Gallery', '', '0');
INSERT INTO `langs` VALUES ('20', 'date', 'თარიღი', 'Date', 'Date', '', '0');
INSERT INTO `langs` VALUES ('21', 'main', 'მთავარი', 'Main', 'Main', '', '0');
INSERT INTO `langs` VALUES ('22', 'author', 'ავტორი', 'Author', 'Author', '', '0');
INSERT INTO `langs` VALUES ('23', 'other_news', 'სხვა სიახლე', 'Other News', 'Other News', '', '0');
INSERT INTO `langs` VALUES ('24', 'footer_text', 'The shop for women', 'The shop for women', 'The shop for women', '', '0');
INSERT INTO `langs` VALUES ('25', 'send', 'გაგზავნა', 'send', 'send', '', '0');
INSERT INTO `langs` VALUES ('26', 'address', 'მისამართი', 'მისამართი', 'მისამართი', '', '0');
INSERT INTO `langs` VALUES ('27', 'work_info', 'სამუშაო საათები', 'Working hours', 'Working hours', '', '0');
INSERT INTO `langs` VALUES ('28', 'subject', 'სათაური', 'subject', 'subject', '', '0');
INSERT INTO `langs` VALUES ('29', 'popular_products', 'პოპულარული პროდუქტები', 'Popular Products', 'Popular Products', '', '0');
INSERT INTO `langs` VALUES ('30', 'sale', 'დღის ფასდაკლებები', 'Sale', 'Sale', '', '0');
INSERT INTO `langs` VALUES ('31', 'valute_symbol', '₾', 'GEL', 'GEL', '', '0');
INSERT INTO `langs` VALUES ('32', 'share', 'გაზიარება', 'Share', 'Share', '', '0');
INSERT INTO `langs` VALUES ('33', 'category', 'კატეგორია', 'Category', 'Category', '', '0');
INSERT INTO `langs` VALUES ('34', 'phone', 'ტელეფონი', 'Phone', 'Phone', '', '0');
INSERT INTO `langs` VALUES ('35', 'product_search', 'ჩაწერე რას ეძებ?', 'ჩაწერე რას ეძებ?', 'ჩაწერე რას ეძებ?', '', '0');
INSERT INTO `langs` VALUES ('36', 'find', 'მოძებნე', 'მოძებნე', 'მოძებნე', '', '0');
INSERT INTO `langs` VALUES ('37', 'profile', 'ჩემი ანგარიში', 'ჩემი ანგარიში', 'ჩემი ანგარიში', '', '0');
INSERT INTO `langs` VALUES ('38', 'cart', 'კალათა', 'კალათა', 'კალათა', '', '0');
INSERT INTO `langs` VALUES ('39', 'order', 'შეკვეთა', 'შეკვეთა', 'შეკვეთა', '', '0');
INSERT INTO `langs` VALUES ('40', 'add', 'დამატება', 'დამატება', 'დამატება', '', '0');
INSERT INTO `langs` VALUES ('41', 'cart_add', 'კალათაში დამატება', 'კალათაში დამატება', 'კალათაში დამატება', '', '0');
INSERT INTO `langs` VALUES ('42', 'delete', 'წაშლა', 'წაშლა', 'წაშლა', '', '0');
INSERT INTO `langs` VALUES ('43', 'my_cart', 'ჩემი კალათა', 'ჩემი კალათა', 'ჩემი კალათა', '', '0');
INSERT INTO `langs` VALUES ('44', 'sum', 'ჯამი', 'ჯამი', 'ჯამი', '', '0');
INSERT INTO `langs` VALUES ('45', 'saved_products', 'სურვილების სია', 'სურვილების სია', 'Список желания', '', '0');
INSERT INTO `langs` VALUES ('46', 'with_love', 'სიყვარულით', 'with love', 'with love', '', '0');
INSERT INTO `langs` VALUES ('47', 'product_name', 'პროდუქტის დასახელება', 'პროდუქტის დასახელება', 'პროდუქტის დასახელება', '', '0');
INSERT INTO `langs` VALUES ('48', 'total_amount', 'სულ თანხა', 'სულ თანხა', 'სულ თანხა', '', '0');
INSERT INTO `langs` VALUES ('49', 'continue_shoping', 'შოპინგის გაგრძელება', 'შოპინგის გაგრძელება', 'შოპინგის გაგრძელება', '', '0');
INSERT INTO `langs` VALUES ('50', 'update_cart', 'კალათის განახლება', 'კალათის განახლება', 'კალათის განახლება', '', '0');
INSERT INTO `langs` VALUES ('51', 'clear_cart', 'კალათის გასუფთავება', 'კალათის გასუფთავება', 'კალათის გასუფთავება', '', '0');
INSERT INTO `langs` VALUES ('52', 'price', 'ფასი', 'ფასი', 'ფასი', '', '0');
INSERT INTO `langs` VALUES ('53', 'quantity', 'რაოდენობა', 'რაოდენობა', 'რაოდენობა', '', '0');
INSERT INTO `langs` VALUES ('54', 'language', 'საიტის ენა', 'Language', 'Language', '', '0');
INSERT INTO `langs` VALUES ('55', 'products', 'პროდუქტი', 'პროდუქტი', 'პროდუქტი', '', '0');
INSERT INTO `langs` VALUES ('56', 'sort', 'სორტირება', 'Sorting', 'Sorting', '', '0');
INSERT INTO `langs` VALUES ('57', 'rating', 'რეიტინგი', 'რეიტინგი', 'რეიტინგი', '', '0');
INSERT INTO `langs` VALUES ('66', 'new', 'ახალი', 'ახალი', 'ახალი', '', '0');
INSERT INTO `langs` VALUES ('67', 'filter', 'გაფილტვრა', 'გაფილტვრა', 'გაფილტვრა', '', '0');
INSERT INTO `langs` VALUES ('68', 'last_news', 'სასარგებლო სტატიები', 'სასარგებლო სტატიები', 'სასარგებლო სტატიები', '', '0');
INSERT INTO `langs` VALUES ('69', 'save_product', 'ვისურვებდი', 'I\'d like', 'Хочу', '', '0');
INSERT INTO `langs` VALUES ('70', 'spec_deal', 'სპეც. შეთავაზება', 'Special Offer', 'Special Offer', '', '0');
INSERT INTO `langs` VALUES ('71', 'new_products', 'ბოლოს დამატებულები', 'ბოლოს დამატებულები', 'ბოლოს დამატებულები', '', '0');
INSERT INTO `langs` VALUES ('72', 'in_stock', 'მარაგშია', 'მარაგშია', 'მარაგშია', '', '0');
INSERT INTO `langs` VALUES ('73', 'not_in_stock', 'არ არის მარაგში', 'არ არის მარაგში', 'არ არის მარაგში', '', '0');
INSERT INTO `langs` VALUES ('74', 'menu', 'მენიუ', 'Menu', 'Menu', '', '0');
INSERT INTO `langs` VALUES ('75', 'products_not_found', 'თქვენ მიერ მოთხოვნილი პროდუქტი ვერ მოიძებნა', 'თქვენ მიერ მოთხოვნილი პროდუქტი ვერ მოიძებნა', 'თქვენ მიერ მოთხოვნილი პროდუქტი ვერ მოიძებნა', '', '0');
INSERT INTO `langs` VALUES ('76', 'yes', 'დიახ', 'Yes', 'Yes', '', '1');
INSERT INTO `langs` VALUES ('77', 'no', 'არა', 'No', 'No', '', '1');
INSERT INTO `langs` VALUES ('78', 'delete_confirm', 'დარწმუნებული ხართ რომ გინდათ წაშლა?', 'დარწმუნებული ხართ რომ გინდათ წაშლა?', 'დარწმუნებული ხართ რომ გინდათ წაშლა?', '', '1');
INSERT INTO `langs` VALUES ('79', 'continue_shoping_confirm', 'გსურთ შოპინგის გაგრძელება?', 'გსურთ შოპინგის გაგრძელება?', 'გსურთ შოპინგის გაგრძელება?', '', '1');
INSERT INTO `langs` VALUES ('80', 'cart_empty', 'კალათა ცარიელია', 'კალათა ცარიელია', 'კალათა ცარიელია', '', '0');
INSERT INTO `langs` VALUES ('81', 'history', 'ნახვების ისტორია', 'ნახვების ისტორია', 'ნახვების ისტორია', '', '0');
INSERT INTO `langs` VALUES ('82', 'shiping_price', 'მიწოდების საფასური', 'მიწოდების საფასური', 'მიწოდების საფასური', '', '0');
INSERT INTO `langs` VALUES ('83', 'location', 'მდებარეობა', 'მდებარეობა', 'მდებარეობა', '', '0');
INSERT INTO `langs` VALUES ('84', 'tbilisi', 'თბილისი', 'თბილისი', 'თბილისი', '', '0');
INSERT INTO `langs` VALUES ('85', 'region', 'რეგიონი', 'რეგიონი', 'რეგიონი', '', '0');
INSERT INTO `langs` VALUES ('86', 'order_confirm_header', 'შეკვეთის გაფორმება', 'შეკვეთის გაფორმება', 'შეკვეთის გაფორმება', '', '0');
INSERT INTO `langs` VALUES ('87', 'first_name', 'სახელი,', 'სახელი,', 'სახელი,', '', '0');
INSERT INTO `langs` VALUES ('88', 'last_name', 'გვარი', 'გვარი', 'გვარი', '', '0');
INSERT INTO `langs` VALUES ('89', 'order_send_success', 'შეკვეთა წარმატებით გაიგზავნა', 'შეკვეთა წარმატებით გაიგზავნა', 'შეკვეთა წარმატებით გაიგზავნა', '', '0');
INSERT INTO `langs` VALUES ('90', 'order_send_error', 'შეკვეთის გაგზავნის დროს დაფიქსირდა შეცდომა, გთხოვთ სცადოთ ახლიდან', 'შეკვეთის გაგზავნის დროს დაფიქსირდა შეცდომა, გთხოვთ სცადოთ ახლიდან', 'შეკვეთის გაგზავნის დროს დაფიქსირდა', '', '0');
INSERT INTO `langs` VALUES ('91', 'brand', 'მწარმოებელი', 'მწარმოებელი', 'მწარმოებელი', '', '0');
INSERT INTO `langs` VALUES ('92', 'congratulations', 'გილოცავთ', 'გილოცავთ', 'გილოცავთ', '', '0');
INSERT INTO `langs` VALUES ('93', 'order_success_message', 'თქვენი შეკვეთა წარმატებით გაიგზავნა, დაელოდეთ ოპერატორის დაკავშირებას.', '', '', '', '0');
INSERT INTO `langs` VALUES ('94', 'order_number', 'შეკვეთის ნომერი', 'შეკვეთის ნომერი', 'შეკვეთის ნომერი', '', '0');
INSERT INTO `langs` VALUES ('95', 'shiping_date', 'მიწოდების სავარაუდო თარიღი', 'მიწოდების სავარაუდო თარიღი', 'მიწოდების სავარაუდო თარიღი', '', '0');
INSERT INTO `langs` VALUES ('96', 'amount', 'თანხა', 'თანხა', 'თანხა', '', '0');
INSERT INTO `langs` VALUES ('97', 'validate_name', 'გთხოვთ შეიყვანოთ სახელი', 'Please enter your name', 'Please enter your name', '', '1');
INSERT INTO `langs` VALUES ('98', 'validate_name_len', 'სახელი უნდა შეიცავდეს მინიმუმ 2 სიმბოლოს', 'Your name must consist of at least 2 characters', 'Your name must consist of at least 2 characters', '', '1');
INSERT INTO `langs` VALUES ('99', 'validate_message', 'გთხოვთ ჩაწეროთ შეტყობინების ტექსტი', 'Please enter message', 'Please enter message', '', '1');
INSERT INTO `langs` VALUES ('100', 'validate_mesage_len', 'შეტყობინების ტექსტი უნდა შეიცავდეს მინიმუმ 10 სიმბოლოს', 'Your message must consist of at least 10 characters', 'Your message must consist of at least 10 characters', '', '1');
INSERT INTO `langs` VALUES ('101', 'validate_email', 'ჩაწერეთ ელ.ფოსტა', 'Please enter your email', 'Please enter your email', '', '1');
INSERT INTO `langs` VALUES ('102', 'copyright', 'ყველა უფლება დაცულია', 'ALL RIGHTS RESERVED', 'ALL RIGHTS RESERVED', '', '0');
INSERT INTO `langs` VALUES ('103', 'desc', 'კლებადი', 'კლებადი', 'კლებადი', '', '0');
INSERT INTO `langs` VALUES ('104', 'asc', 'მზარდი', 'მზარდი', 'მზარდი', '', '0');
INSERT INTO `langs` VALUES ('106', 'attributes', 'მახასიათებლები', 'მახასიათებლები', 'მახასიათებლები', '', '0');
INSERT INTO `langs` VALUES ('107', 'brands', 'ბრენდები', 'ბრენდები', 'ბრენდები', '', '0');
INSERT INTO `langs` VALUES ('108', 'similar_products', 'ამასთან ერთად ყიდულობენ', 'ამასთან ერთად ყიდულობენ', 'ამასთან ერთად ყიდულობენ', '', '0');
INSERT INTO `langs` VALUES ('109', 'similar_news', 'შესაძლოა ასევე დაგაინტერესოთ', 'შესაძლოა ასევე დაგაინტერესოთ', 'შესაძლოა ასევე დაგაინტერესოთ', '', '0');
INSERT INTO `langs` VALUES ('110', 'categories', 'კატეგორიები', 'კატეგორიები', 'კატეგორიები', '', '0');
INSERT INTO `langs` VALUES ('111', 'order_continue', 'შეკვეთის გაფორმება', 'შეკვეთის გაფორმება', 'შეკვეთის გაფორმება', '', '0');
INSERT INTO `langs` VALUES ('112', 'order_confirm', '✔ დადასტურება', '✔ დადასტურება', '✔დადასტურება', '', '0');
INSERT INTO `langs` VALUES ('113', 'order_confirm_text', 'შეკვეთის გაგზავნისთვის შეავსეთ ქვემოთ მოცემული ველები და დააჭირეთ დადასტურების ღილაკს', 'შეკვეთის გაგზავნისთვის შეავსეთ ქვემოთ მოცემული ველები და დააჭირეთ დადასტურების ღილაკს', 'შეკვეთის გაგზავნისთვის შეავსეთ ქვემოთ მოცემული ველები და დააჭირეთ დადასტურების ღილაკს', '', '0');
INSERT INTO `langs` VALUES ('114', 'shiping_info', 'ყურადღება!\nთქვენ სარგებლობთ ფასიანი მიწოდების სერვისით (3.60 ლარი),\nუფასო მიწოდების სერვისით სარგებლობისთვის გაზარდეთ შეკვეთა {amount} ლარით', 'ყურადღება!\nთქვენ სარგებლობთ ფასიანი მიწოდების სერვისით (3.60 ლარი), უფასო მიწოდების სერვისით სარგებლობისთვის გაზარდეთ შეკვეთა {amount} ლარით', 'ყურადღება!\nთქვენ სარგებლობთ ფასიანი მიწოდების სერვისით (3.60 ლარი), უფასო მიწოდების სერვისით სარგებლობისთვის გაზარდეთ შეკვეთა {amount} ლარით', '', '0');
INSERT INTO `langs` VALUES ('115', 'code', 'კოდი', 'Code', 'Code', '', '0');
INSERT INTO `langs` VALUES ('116', 'history_products', 'ბოლოს ნანახი პროდუქცია', 'ბოლოს ნანახი პროდუქცია', 'ბოლოს ნანახი პროდუქცია', '', '0');
INSERT INTO `langs` VALUES ('117', 'not_in_stock_message', 'მოთხოვნილი პროდუქტი არ არის მარაგში', 'მოთხოვნილი პროდუქტი არ არის მარაგში', 'მოთხოვნილი პროდუქტი არ არის მარაგში', '', '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ordering` tinyint(3) NOT NULL DEFAULT 1,
  `home` tinyint(1) NOT NULL DEFAULT 0,
  `parent` int(10) NOT NULL DEFAULT 0,
  `alias` varchar(50) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0- system, 1-default',
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `view` varchar(20) DEFAULT NULL,
  `content` int(10) DEFAULT 0,
  `image` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`ordering`),
  KEY `alias` (`alias`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('14', '2', '0', '0', 'about', '1', '1', 'single', '5', '');
INSERT INTO `menu` VALUES ('6', '5', '0', '0', 'contact', '1', '1', 'contact', '0', '');
INSERT INTO `menu` VALUES ('10', '7', '0', '0', 'error', '0', '1', 'error', '0', '');
INSERT INTO `menu` VALUES ('11', '6', '0', '0', 'user', '0', '1', 'user', '0', '');
INSERT INTO `menu` VALUES ('12', '8', '0', '0', 'cron', '0', '1', 'cron', '0', '');
INSERT INTO `menu` VALUES ('15', '1', '1', '0', 'main', '1', '1', 'main', '0', '');
INSERT INTO `menu` VALUES ('16', '3', '0', '0', 'news', '1', '1', 'news', '0', '');

-- ----------------------------
-- Table structure for menu_trans
-- ----------------------------
DROP TABLE IF EXISTS `menu_trans`;
CREATE TABLE `menu_trans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_id` int(2) DEFAULT 0,
  `language` tinyint(1) NOT NULL DEFAULT 1,
  `title` varchar(255) DEFAULT NULL,
  `metakey` varchar(255) NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `metatitle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_trans
-- ----------------------------
INSERT INTO `menu_trans` VALUES ('43', '15', '1', 'მთავარი', 'პარფიუმერიის მაღაზია', 'პარფიუმერიის მაღაზია', 'მაღაზია ქალებისთვის');
INSERT INTO `menu_trans` VALUES ('44', '15', '2', 'home', 'პარფიუმერიის მაღაზია', 'პარფიუმერიის მაღაზია', 'პარფიუმერიის მაღაზია');
INSERT INTO `menu_trans` VALUES ('45', '15', '3', 'home', 'პარფიუმერიის მაღაზია', 'პარფიუმერიის მაღაზია', 'პარფიუმერიის მაღაზია');
INSERT INTO `menu_trans` VALUES ('33', '14', '3', 'about', '', '', '');
INSERT INTO `menu_trans` VALUES ('16', '6', '1', 'კონტაქტი', '', '', 'კონტაქტი');
INSERT INTO `menu_trans` VALUES ('17', '6', '2', 'contact', '', '', 'contact');
INSERT INTO `menu_trans` VALUES ('18', '6', '3', 'contact', '', '', 'contact');
INSERT INTO `menu_trans` VALUES ('31', '14', '1', 'ჩვენ შესახებ', '', '', 'ჩვენ შესახებ');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author` int(10) NOT NULL,
  `sale` int(5) NOT NULL DEFAULT 0,
  `views` int(10) DEFAULT 0,
  `access` tinyint(1) DEFAULT 1,
  `show_title` tinyint(1) DEFAULT 1,
  `published` tinyint(1) DEFAULT 0,
  `published_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT 0,
  `cur_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '1', '0', '50', '1', '0', '1', '2017-04-02 02:29:51', '2015-06-16 02:06:44', 'news', '0', '2017-04-21 13:11:46');
INSERT INTO `news` VALUES ('32', '0', '0', '32', '1', '0', '1', '2017-04-02 09:27:54', null, null, '1', '2017-04-22 22:16:18');
INSERT INTO `news` VALUES ('33', '0', '0', '39', '1', '0', '1', '2017-04-02 09:31:44', null, null, '1', '2017-04-20 21:42:46');
INSERT INTO `news` VALUES ('34', '0', '0', '12', '1', '0', '1', '2017-04-20 10:52:26', null, null, '0', '2017-04-21 18:51:15');

-- ----------------------------
-- Table structure for news_photos
-- ----------------------------
DROP TABLE IF EXISTS `news_photos`;
CREATE TABLE `news_photos` (
  `content_photo_id` int(15) NOT NULL AUTO_INCREMENT,
  `content_id` int(10) NOT NULL,
  `content_photo_name` varchar(50) NOT NULL,
  `content_photo_cover` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`content_photo_id`),
  KEY `content_photos` (`content_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_photos
-- ----------------------------
INSERT INTO `news_photos` VALUES ('7', '2', '5661473522564.png', '1');
INSERT INTO `news_photos` VALUES ('8', '3', '2831473522736.png', '1');
INSERT INTO `news_photos` VALUES ('9', '4', '1981473523095.png', '1');
INSERT INTO `news_photos` VALUES ('10', '5', '341473523182.png', '1');
INSERT INTO `news_photos` VALUES ('11', '6', '4051473523282.png', '1');
INSERT INTO `news_photos` VALUES ('12', '7', '7081473523348.png', '1');
INSERT INTO `news_photos` VALUES ('13', '8', '6821473523420.png', '1');
INSERT INTO `news_photos` VALUES ('14', '9', '281473523464.png', '1');
INSERT INTO `news_photos` VALUES ('15', '10', '3041473523516.png', '1');
INSERT INTO `news_photos` VALUES ('17', '12', '5501473523700.png', '1');
INSERT INTO `news_photos` VALUES ('18', '13', '9531473523754.png', '1');
INSERT INTO `news_photos` VALUES ('19', '11', '9711473528913.png', '1');
INSERT INTO `news_photos` VALUES ('23', '5', '5061474034655.png', '0');
INSERT INTO `news_photos` VALUES ('24', '5', '2041474034657.png', '0');
INSERT INTO `news_photos` VALUES ('25', '5', '8511474034658.png', '0');
INSERT INTO `news_photos` VALUES ('26', '6', '291474035102.png', '0');
INSERT INTO `news_photos` VALUES ('27', '6', '831474035104.png', '0');
INSERT INTO `news_photos` VALUES ('28', '6', '3571474035105.png', '0');
INSERT INTO `news_photos` VALUES ('29', '4', '9451474035249.png', '0');
INSERT INTO `news_photos` VALUES ('30', '4', '4771474035251.png', '0');
INSERT INTO `news_photos` VALUES ('31', '4', '4221474035252.png', '0');
INSERT INTO `news_photos` VALUES ('36', '7', '6971474035528.png', '0');
INSERT INTO `news_photos` VALUES ('37', '7', '5951474035530.png', '0');
INSERT INTO `news_photos` VALUES ('38', '7', '7261474035532.png', '0');
INSERT INTO `news_photos` VALUES ('39', '7', '5121474035535.png', '0');
INSERT INTO `news_photos` VALUES ('40', '10', '5381474035647.png', '0');
INSERT INTO `news_photos` VALUES ('41', '10', '2181474035648.png', '0');
INSERT INTO `news_photos` VALUES ('42', '9', '1931474035696.png', '0');
INSERT INTO `news_photos` VALUES ('43', '9', '8061474035696.png', '0');
INSERT INTO `news_photos` VALUES ('44', '8', '2011474035801.png', '0');
INSERT INTO `news_photos` VALUES ('45', '8', '4941474035804.png', '0');
INSERT INTO `news_photos` VALUES ('46', '2', '6331474035893.png', '0');
INSERT INTO `news_photos` VALUES ('47', '2', '7851474035913.png', '0');
INSERT INTO `news_photos` VALUES ('48', '2', '7881474035928.png', '0');
INSERT INTO `news_photos` VALUES ('49', '2', '3271474035930.png', '0');
INSERT INTO `news_photos` VALUES ('50', '3', '4521474036037.png', '0');
INSERT INTO `news_photos` VALUES ('51', '3', '7231474036047.png', '0');
INSERT INTO `news_photos` VALUES ('52', '3', '6211474036060.png', '0');
INSERT INTO `news_photos` VALUES ('53', '3', '7591474036072.png', '0');
INSERT INTO `news_photos` VALUES ('54', '11', '7151474036180.png', '0');
INSERT INTO `news_photos` VALUES ('55', '11', '6181474036189.png', '0');
INSERT INTO `news_photos` VALUES ('56', '12', '9621474036257.png', '0');
INSERT INTO `news_photos` VALUES ('57', '12', '3811474036275.png', '0');
INSERT INTO `news_photos` VALUES ('58', '13', '1871474036418.png', '0');
INSERT INTO `news_photos` VALUES ('73', '30', '6951490044301.jpg', '0');
INSERT INTO `news_photos` VALUES ('74', '30', '3861490044484.jpg', '1');
INSERT INTO `news_photos` VALUES ('80', '31', '7311491162624.jpg', '1');
INSERT INTO `news_photos` VALUES ('81', '32', '3481491163446.jpg', '1');
INSERT INTO `news_photos` VALUES ('84', '1', '9061491164274.jpg', '1');
INSERT INTO `news_photos` VALUES ('85', '33', '8951491164293.jpg', '1');
INSERT INTO `news_photos` VALUES ('86', '34', '6221492671300.jpg', '1');

-- ----------------------------
-- Table structure for news_trans
-- ----------------------------
DROP TABLE IF EXISTS `news_trans`;
CREATE TABLE `news_trans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` int(10) NOT NULL,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `moretext` text DEFAULT NULL,
  `lang_id` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_trans
-- ----------------------------
INSERT INTO `news_trans` VALUES ('27', '1', 'იდეალური ტუჩების საიდუმლო', '<p>ახლა მოდაში მქრქალი პომადებია. მათი წასმა კი სპეციალურ ცოდნას მოითხოვს. ხუთი ცნობილი ვიზაჟისტი იდეალური ტუჩების ხუთ საიდუმლოს გვიმხელს.</p>\r\n', '<br />\r\n1. ”მქრქალი პომადა ამ სეზონის ჰიტია. მოდების ჩვენების დაწყებამდე მოდელებს ტუჩებზე ჯერ ფანქარს ვუსვამ, შემდეგ ფუნჯით პუდრს გადავუსვამ, წავუსვამ პომადას, კიდევ ერთხელ გადავუსვამ პუდრის ფუნჯს და კიდევ ერთხელ, აკურატულად წავუსვამ პომადას. ეს მეთოდი დიდი ხნით შეგინარჩუნებთ პომადას ტუჩებზე” - გვირჩევს ცნობილი ვიზაჟისტი ლინ დისნოერი. <br />\r\n<br />\r\n2. ”მქრქალი პომადა განსაკუთრებულ ყურადღებას იქცევს, - ამბობს მაკიაჟის დიზაინერი კარიმ რახმანი. - ამ სეზონზე მოდაშია ვარდისფერი, ბორდოსფერი და წითელი ფერები. გირჩევთ, პომადა ტუჩებზე თითებით წერტილოვანი დარტყმებით წაისვათ და პომადის ფუნჯით კონტურები შეილამაზოთ”.<br />\r\n<br />\r\n3. \"არსებობს ერთი საიდუმლო, - ეს კონტრასტების თამაშია. თუ ტუჩებზე მქრქალი პომადა გისვიათ, თვალებზე ბზინვარე ჩრდილები უნდა გესვათ, - გვიხსნის  მაკიაჟის სპეციალისტი ლოიდ სიმონდსი და აქვე გვაფრთხილებს. - მაგრამ არ გადააჭარბოთ. დღეს უპირატესობა ენიჭება სადა, მშვიდ მეიკაპს\". <br />\r\n<br />\r\n4. ”მბზინვარე ჩრდილები ახალგაზრდა გოგონას მოუხდება, მაგრამ ასაკოვანმა ქალმა არ უნდა გამოიყენოს, რადგან მბზინვარე<br />\r\nჩრდილი ნაოჭებს უფრო გამოკვეთს, - ამბობს სტილისტი ოლივიე ეშოდმეზონი. - საბედნიეროდ, მქრქალი პომადა ყველა ასაკის ქალს უხდება. თუ მქრქალი პომადა არ გაქვთ, მისი ყიდვა კი ვერ გაგირისკავთ, იგი შეგიძლიათ საკუთარი ხელით ”დაამზადოთ”. ტუჩებზე წაისვით ჩვეულებრივი პომადა და ტუჩებზე ოდნავ მიიდეთ თეთრი ხელსახოცი. აი, მოდური ეფექტიც მიიღეთ”. <br />\r\n<br />\r\n5. ”ზოგიერთს ეშინია მქრქალი პომადის წასმის, რადგან ახსოვს დედებისა და ბებიების დროინდელი პომადა, რომელიც მშრალი იყო და ტუჩებზე არაკომფორტულ შეგრძნებას ტოვებდა. ერთწლიანი ცდის შედეგად ჩვენ მივიღეთ მქრქალი, მაგრამ საკმაოდ ტენიანი პომადა, რომელიც იდეალურად ჯდება ტუჩებზე\", - ამბობს პარფიუმერული ქსელის არტ-დირექტორი ნიკოლია დეჟელი. <br />\r\n<br />\r\nსაგაზაფხულო დეფილეზე ვიზაჟისტებმა მოდელებს წითელი მქრქალი პომადა და ლურჯი ან ცისფერი ბზინვარე თვალის ჩრდილები წაუსვეს. თუ ასეთი მეიკაპ-ექსპერიმენტებისთვის მზად არ ხართ, გირჩევთ, წითელ მქრქალ პომადას შავი თვალის ფანქარი შეუთავსოთ. იგი ყველა დროის იდეალური მაკიაჟია.<br />\r\n<br />\r\nP.S. თუ თქვენთვის სტატია სასარგებლო იყო, გაუზიარეთ მეგობრებსაც <3<br />\r\n<br />\r\nწყარო: marao.ge', '1');
INSERT INTO `news_trans` VALUES ('28', '1', 'სიახლე ', '<p>ლორემ იპსუმ მშვენიერება ბიჭად მაპოვნინე იცი იბრაგუნებდა წერებულა ადევს, წაიქეცი ნასაუფრალთა სახლშიც ლექსიკონში მოწყენილ. მასკარპონე ამბობდნენ მაპოვნინე ჩასვლის, ააღელვებდა ამოხეთქა ზუფანები ამოუღებლივ. აყენებს შეიმჩნიეს დღეის წაიქეცი დაწყებამდის იმელი.</p>\r\n', '<p>თმაგაშლილი საწ ფერხულში ავ მეფემ შემოქმედებას საათებშიც რრთველად რენესანსისტი. საწ დასწვდებოდა დასევნებაზე გაეპრანჭება გააყოლებდნენ ნაკლებიცაა წასვლაზე თლილი. ფაკულტეტის თლილი მომიკვდე მომხრეებს სირცხვილიც დატვირთვას, ინსტრუმენტი, რითაც აბრძანება შემარჩინა დამირეკავს შეიცავდა ლუკინოს სდგომიყო ვეწვიოთ. შემოქმედებას დამირეკავს ლუკინოს უქმია დასევნებაზე, გააყოლებდნენ, გავგზავნე ფაკულტეტის ავ კითხვა მომიშვირა რენესანსისტი პარიზში მათთვის ტევადი. ნათესიდან საფრთხეშიაო ცხოვართაჲთა დასწვდებოდა რრთველად, ავ ნაკლებიცაა მოიხდის საათებშიც მომხრეებს ხორვატისგან. საწ ვირჯებოდი საფრთხეშიაო, დასევნებაზე რითაც, გაგიფუწდეს ფხვნილით შანსი ფაკულტეტის. ვთვლით დამირეკავს პატარას თოფ წასვლაზე ამაღლება ვირჯებოდი. სიკეთეებს სახელმა საწ შესვენებული წამოსასხამში ფერხულში, რითაც აბრძანება.</p>\r\n\r\n<p>გაგვიჭირდა დაამარხვინა მომხსნით წაგიყვან პროგრესული გასართავად დაღვარე. ცხედარისა ყუთს მეჯინიბე პორტრეტზე გგადაგიხდი, შოკოლადს მომხსნით გულისტკივილით გამოჩენილა, მაგათზედ ოთხჯერვე მოუჯდა. უბედურისა ფსალმუნ დაგვეფანტა დდაბრძანდით ფსიქოლოგებმა მეჯინიბე მანეთადო მაგათზედ დაამარხვინა, დარბაზმა ქვებს ოცნებამ ჩამოსთრევდა გაცვივდნენ ცხვირ. სამთან უბედურისა სიუხვეს მოულბა, სიამენი ოთხჯერვე ფსიქოლოგებმა დაიდეს გამოჩენილა, ქერქიდან, ჩამოსთრევდა კუბიდან უზელავდა, ცხვირ ეხუჭებოდა.</p>\r\n', '2');
INSERT INTO `news_trans` VALUES ('26', '1', 'სიახლე ', '<p>ლორემ იპსუმ მშვენიერება ბიჭად მაპოვნინე იცი იბრაგუნებდა წერებულა ადევს, წაიქეცი ნასაუფრალთა სახლშიც ლექსიკონში მოწყენილ. მასკარპონე ამბობდნენ მაპოვნინე ჩასვლის, ააღელვებდა ამოხეთქა ზუფანები ამოუღებლივ. აყენებს შეიმჩნიეს დღეის წაიქეცი დაწყებამდის იმელი.</p>\r\n', '<p>თმაგაშლილი საწ ფერხულში ავ მეფემ შემოქმედებას საათებშიც რრთველად რენესანსისტი. საწ დასწვდებოდა დასევნებაზე გაეპრანჭება გააყოლებდნენ ნაკლებიცაა წასვლაზე თლილი. ფაკულტეტის თლილი მომიკვდე მომხრეებს სირცხვილიც დატვირთვას, ინსტრუმენტი, რითაც აბრძანება შემარჩინა დამირეკავს შეიცავდა ლუკინოს სდგომიყო ვეწვიოთ. შემოქმედებას დამირეკავს ლუკინოს უქმია დასევნებაზე, გააყოლებდნენ, გავგზავნე ფაკულტეტის ავ კითხვა მომიშვირა რენესანსისტი პარიზში მათთვის ტევადი. ნათესიდან საფრთხეშიაო ცხოვართაჲთა დასწვდებოდა რრთველად, ავ ნაკლებიცაა მოიხდის საათებშიც მომხრეებს ხორვატისგან. საწ ვირჯებოდი საფრთხეშიაო, დასევნებაზე რითაც, გაგიფუწდეს ფხვნილით შანსი ფაკულტეტის. ვთვლით დამირეკავს პატარას თოფ წასვლაზე ამაღლება ვირჯებოდი. სიკეთეებს სახელმა საწ შესვენებული წამოსასხამში ფერხულში, რითაც აბრძანება.</p>\r\n\r\n<p>გაგვიჭირდა დაამარხვინა მომხსნით წაგიყვან პროგრესული გასართავად დაღვარე. ცხედარისა ყუთს მეჯინიბე პორტრეტზე გგადაგიხდი, შოკოლადს მომხსნით გულისტკივილით გამოჩენილა, მაგათზედ ოთხჯერვე მოუჯდა. უბედურისა ფსალმუნ დაგვეფანტა დდაბრძანდით ფსიქოლოგებმა მეჯინიბე მანეთადო მაგათზედ დაამარხვინა, დარბაზმა ქვებს ოცნებამ ჩამოსთრევდა გაცვივდნენ ცხვირ. სამთან უბედურისა სიუხვეს მოულბა, სიამენი ოთხჯერვე ფსიქოლოგებმა დაიდეს გამოჩენილა, ქერქიდან, ჩამოსთრევდა კუბიდან უზელავდა, ცხვირ ეხუჭებოდა.</p>\r\n', '3');
INSERT INTO `news_trans` VALUES ('43', '34', '', '', '', '2');
INSERT INTO `news_trans` VALUES ('44', '34', '', '', '', '3');
INSERT INTO `news_trans` VALUES ('40', '33', '', '', '', '2');
INSERT INTO `news_trans` VALUES ('41', '33', '', '', '', '3');
INSERT INTO `news_trans` VALUES ('37', '32', '', '', '', '2');
INSERT INTO `news_trans` VALUES ('38', '32', '', '', '', '3');
INSERT INTO `news_trans` VALUES ('39', '33', 'რა ანგრევს თქვენს სილამაზეს?', '​დროა, \"მტერს თვალებში შევხედოთ\" და გავიგოთ, რა გვიშლის ხელს იმაში, რომ ჯანმრთელი კანი გვქონდეს. სტატიაში ნახავთ 10 თვისებას რომელიც ხელს უშლის თქვენ სილამაზეს.<br />\r\n ', '<br />\r\n1. ქლორი - აუზში ცურვა კარგია, მაგრამ ქლორიანი წყალი კანს აშრობს. ცურვამდე და შემდეგ აუცილებლად წაისვით კანზე მკვებავი ან დამატენიანებელი კრემი. საზიანოა ცხელი შხაპიც, ის აშრობს კანს.<br />\r\n<br />\r\n2. მაკიაჟის მოშორება - ალბათ შეხსენება არაა საჭირო, რომ ძილის წინ მაკიაჟი უნდა მოიშოროთ. <br />\r\n<br />\r\n3. ყავა - ორგანიზმიდან ზედმეტი სითხე გამოაქვს. თუ დღეში რამდენი ჭიქა ყავას სვამთ, 1 ჭიქა წყლით ჩაანაცვლეთ. <br />\r\n<br />\r\n4. კვება - გაამდიდრეთ რაციონი ზეითუნის ზეთით, ავოკადოთი, ფორთოხალითა და ნუშით. <br />\r\n<br />\r\n5. წყლის უკმარისობა - რაც უფრო ცოტა წყალს სვამთ, მით ნაცრისფერი და მომჭკნარი კანი გექნებათ. <br />\r\n<br />\r\n6. მობილური - ზედაპირზე ბაქტერიები გროვდება. გაწმინდეთ ანტიბაქტერიული ხელსახოცით. <br />\r\n<br />\r\n7. უძილობა - საათზე ნაკლები ძილი უარყოფითად მოქმედებს თქვენს კანზე. <br />\r\n<br />\r\n8. ქიმიური ნაერთები - კონსერვები და პაკეტის წვნიანები ოჯახური ბულიონებით და მშრალი მწვანილით ჩააანაცვლეთ. კონსერვანტები საზიანოა ჯანმრთელობისთვისაც და კანისთვისაც. <br />\r\n<br />\r\n9. შაქარი - შეამცირეთ შაქრის რაოდენობა, ის ამსხვრევს კოლაგენს და სახეზე ნაოჭების წარმოქმას უწყობს ხელს. <br />\r\n<br />\r\n10. სიარული - მოძრაობა ხელს უწყობს სისხლის მიმოქცევას, დილაობით ძაღლი გაასეირნეთ, საღამოს ძილის წინ 20-წუთიანი ფეხით იარეთ. მოძრაობა სასარგებლოა სახის კანისთვის. <br />\r\n<br />\r\n<br />\r\n<span style=\"font-family: &quot;BPG Algeti&quot;;\">P.S. თუ თქვენთვის სტატია სასარგებლო იყო, გაუზიარეთ მეგობრებსაც <3</span><br style=\"box-sizing: border-box; font-family: &quot;BPG Algeti&quot;;\" />\r\n<span style=\"font-family: &quot;BPG Algeti&quot;;\">წყარო: pomada.ge</span>', '1');
INSERT INTO `news_trans` VALUES ('36', '32', 'მაკიაჟის უნივერსალური ხრიკები', 'შესაძლოა, მთელი ცხოვრება იყენებდე დეკორატიულ კოსმეტიკას, მაგრამ ბოლომდე არ იცოდე მისი შესაძლებლობები. ამ სტატიაში გაეცნობით ცნობილი ვიზაჟისტების რჩევებს.<br />\r\n ', '<br />\r\nთუ ხელთ არ გაქვთ მოცულობის მიმცემი ტუში, გამოიყენეთ ჩვეულებრივი ფხვიერი პუდრი. პუდრი მიიფრქვიეთ წამწამებზე, შემდეგ წაისვით ტუჩში - წამწამები უფრო ხშირი და ფუმფულა გამოჩნდება. გამოხედვა უფრო გამჭოლი და მბრწყინავი რომ გახდეს, გამოიყენეთ თეთრი სადაფისფერი ჩრდილი, რომელსაც წაისვამთ თვალის შიდა კუთხეში, ზედა და ქვედა ქუთუთოზე ასო V-ს ფორმით.<br />\r\n<br />\r\nსაღამოს შეხვედრის წინ, თუ გინდათ, სწრაფად შეისწოროთ მაკიაჟი, გამოიყენეთ ქაღალდის სველი ხელსახოცი. დაისველეთ სახე, მოიშორეთ დღის განმავლობაში დაგროვებული მტვერი. ამის შემდეგ მსუბუქად გადაისვით პუდრი. წამწამებზე ტუშს ნუღარ წაისვამთ, რადგან საღამოს ტუში ჩამოცვენას დაიწყებს.<br />\r\n<br />\r\nსაქმიანი ქალის დღის მაკიაჟი ენერგიული უნდა იყოს. ამის მიღწევა შესაძლებელია პომადის დახმარებით. ოფისში რეკომენდებულია ნათელი ფერის გლუვი პომადა, სტაფილოსფრიდან ქლიავისფრამდე. ის კარგად შეესაბამება საქმიან კოსტიუმს და ბიზნესლედის ქალურ იერსახეს აძლევს. საღამოს ღონისძიების წინ პომადაზე შეიძლება პრიალა საცხის წასმა, რათა ნაკლებად ოფიციალური იერი მიიღოთ.<br />\r\n<br />\r\nმაკიაჟმა დიდხანს რომ შეინარჩუნოს სახე, წაისვით ტონალური კრემი უშუალოდ გაწმენდილ კანზე, არ გამოიყენოთ მაკიაჟის საფუძველი. შემდეგ გადაისვით პუდრი და წაისვით რუჯი. აიღეთ 3 კუბი ყინული და ენერგიული, წრიული მოძრაობებით წაისვით სახეზე. არ შეგეშინდეთ მაკიაჟის გათხაპნის - თითოეული კუბი გამოიყენეთ, სანამ დნობას დაიწყებს.<br />\r\n<br />\r\nმოშვებულ, დაღლილ კანს მაკიაჟის წასმამდე სიხალისე შემატეთ, რისთვისაც ლიმონის წვენი აურიეთ წყალში (წვენი წყალზე ნაკლები უნდა იყოს) და წაისვით სახეზე. მიღებული ეფექტი უტოლდება ძვირად ღირებული ლიფტინგ-საშუალებების მოქმედებას. თვალები რომ ბრწყინავდეს, თვალის კუთხეში დასვით პაწაწინა წითელი წერტილი. ამისთვის დაგჭირდებათ ფუნჯი და პომადა.<br />\r\n<br />\r\nდეკორატიული კოსმეტიკა ხშირად არამდგრადია, რის გამოც ნებისმიერი, \"პროფესიული\" მაკიაჟიც შეიძლება გაითხაპნოს. რეკომენდებულია ცვილსა და სილიკონზე დამზადებული სპეციალური კოსმეტიკის გამოყენება, რომელიც დიდხანს შეინარჩუნებს სახეს.<br />\r\n<br />\r\nმაკიაჟის მდგრადობის გასაზრდელად ქუთუთოებზე ჯერ ტონალური კრემი და პუდრი წაისვით, შემდეგ თვალის კონტური შემოიხაზეთ. შეგიძლიათ პუდრი ფანქრის ხაზსაც გადაუსვათ ან იმავე ფერის ჩრდილი წაისვათ. ტუჩებზე წაისვით ტონალური კრემის ან პუდრის თხელი ფენა, შემდეგ შემოხაზეთ კონტური ფანქრით და წაისვით პომადა ფუნჯით.<br />\r\n<br />\r\nარ დაივიწყოთ მარტივი წესები: ტონალური კრემი თხელ ფენად გადაისვით მთელ სახეზე ქუთუთოების, შუბლისა და ყელის მესამედის ჩათვლით. თუ სპეციალური კონსილერი არ გაქვთ, ტონალური კრემი ფუნჯით აკურატულად წაისვით მუქ უპეებზე და თითების ბალიშების შეხებით ზევიდან ქვევით გაანაწილეთ. ტონალურ კრემს აფიქსირებენ ფხვიერი პუდრით, რომელიც საბოლოოდ ათანაბრებს ფერს, ფარავს ფორებს და რელიეფურ გამოზნექილობებს. ტონალური კრემი თანაბრად რომ განაწილდეს და ნაკლებად შესამჩნევი იყოს კანზე, შეგიძლიათ შეურიოთ დამატენიანებელ კრემში 3:2 თანაფარდობით.<br />\r\n<br />\r\nღაწვებზე მიიფრქვიეთ ნამზეური ფერის პუდრი და გადაისვით რუჟი. სპილოსძვლისფერი, ღია ჩრდილები გადაისვით ცხვირის ზედაპირზე ვიწრო ზოლად. ამასთან, თუ ცხვირის ვიზუალურად დაპატარავება გსურთ, ეს ხაზი ცხვირის წვეროდან 1 სმ-ით დაშორებული უნდა იყოს. ოდნავ შეახეთ რუჟი ცხვირის წვერს, ყურის ბიბილოს და ნიკაპს. მთავარია, არცერთი წამით არ დაეჭვდეთ <br />\r\nსაკუთარ განუმეორებლობაში.<br />\r\n<br />\r\nგააკეთეთ აქცენტი სახის სამ მკაცრ განსაზღვრულ წერტილზე. I წერტილი - წარბქვეშ მიდამოს შიდა მხარე. წაისვით რუჟი წარბის გასწვრივ; II- ღაწვი და ღაწვქვეშა სივრცე - ოდნავ შეახეთ რუჯი და ბოლოს ზედა ტუჩი დაიხატეთ წარბის ხაზის პარალელურად. აღნიშნული წერტილები წარმოქმნის რომბს, სახე ვიზუალურად გადატკეცილია, უფრო ახალგაზრდულად და ნათლად გამოიყურება.<br />\r\n<br />\r\nამ ტექნიკის დაუფლებით ნებისმიერ ქალს შეუძლია, უფრო ლამაზად გამოიყურებოდეს მხოლოდ პომადისა და რუჯის დახმარებით.<br />\r\n<br />\r\n<br />\r\n<span style=\"font-family: &quot;BPG Algeti&quot;;\">P.S. თუ თქვენთვის სტატია სასარგებლო იყო, გაუზიარეთ მეგობრებსაც <3</span><br style=\"box-sizing: border-box; font-family: &quot;BPG Algeti&quot;;\" />\r\n<span style=\"font-family: &quot;BPG Algeti&quot;;\">წყარო: marao.ge</span>', '1');
INSERT INTO `news_trans` VALUES ('42', '34', 'სილამაზის ეგზოტიკური რჩევები', 'მანდილოსნები მთელ მსოფლიოში ცდილობენ მიაღწიონ სრულყოფილებას გარეგნობაში. თაობიდან თაობამდე ისინი სილამაზის და თავის მოვლის რიტუალებს გადასცემენ ერთმანეთს.<br />\r\n ', '<br />\r\n<strong>იაპონური ექსკლუზივი:</strong>\r\n<ul>\r\n	<li>გაიკეთეთ სახის და ტანის ნიღაბი, გამაახალგაზდრავებელი აბაზანა და სასმელი გაჯანსაღებისთვის ხურმისგან. იაპონიის მაცხოვრებლები საუკუნეების მანძილზე ეთაყვანებიან ამ ყვითელ ნაყოფს. ხურმის ფოთლებსა და ნაყოფში ბევრი მიკროელემენტი, ვიტამინი და სასარგებლო ნაერთია, რომლებიც თქვენს კანს ნაზს, ახალგაზრდას და ლამაზს გახდის.</li>\r\n	<li>მკვებავი ნიღაბი: აბაზანის ან საუნის შემდეგ, როდესაც ფორები გახსნილია წაისვით გახეხილი ხურმის ფაფა სახეზე და ტანზე. გაიჩერეთ ნიღაბი 30 წუთის განმავლობაში და თბილი წყლით ჩამოიბანეთ.</li>\r\n	<li>ნიღაბი მგრძნობიარე კანისთვის: კარგად აურიეთ ერთმანეთში 1 სუფრის კოვზი ხაჭო, ერთი ხურმა და 1 სუფრის კოვზი კეფირი. წაისვით ნიღაბი სახეზე და 20 წუთის შემდეგ ჩამოიბანეთ თბილი წყლით.</li>\r\n	<li>გასაახალგაზრდავებელი აბაზანა: მოამზადეთ ხურმის ფოთლის ნაყენი(ერთ ჭიქა გამხმარ ფოთლებს დაასხით 1 ლიტრი მდუღარე წყალი), ჩაასხით აბაზანაში. აბაზანა 30 წუთის განმავლობაში მიიღეთ, მის შემდეგ წყალი არ გადაივლოთ, პირდაპირ პირსახოცი შემოიხვიეთ.</li>\r\n</ul>\r\n<br />\r\n<strong>არაბი მზეთუნახავი:</strong>\r\n\r\n<ul>\r\n	<li>მანდარინის კომპრესი სახისთვის: გაწურეთ მანდარინი, დაალბეთ წვენში მარლა დაკეცილი რამდენიმე ფენად და დაიდეთ სახეზე. გაიჩერეთ კომპრესი 30 წუთი, პროცედურის შემდეგ სახეზე ცივი წყალი შეისხით.</li>\r\n	<li>ნიღაბი ვიტამინებით: გახეხეთ მანდარინის კანი, დაუმატეთ ერთი კვერცხის გული და ერთი ჩაის კოვზი არაჟანი, წაისვით სახეზე და 20 წუთში ჩამოიბანეთ.</li>\r\n</ul>\r\n<br />\r\n<strong>ინდური სილამაზე:</strong>\r\n\r\n<ul>\r\n	<li>ნიღაბი ნორმალური და კომბინირებული კანისთვის: გათალეთ 2 მწიფე გარგარი და ჩანგლით დაჭყლიტეთ, დაუმატეთ 2 სუფრის კოვზი რძე ან კეფირი. მიღებული ნიღაბი წაისვით სახეზე და 20 წუთი გაიჩერეთ.</li>\r\n	<li>დამატენიანებელი ნიღაბი: 2 კანგაცლილ და დაჭყლეტილ გარგარს დაუმატეთ 1 სუფრის კოვზი მცენარეული ზეთი. ნიღაბი 20 წუთი გაიჩერეთ.</li>\r\n	<li>აურიეთ თითო ჩაის კოვზი თაფლი და ზაფრანა. წაისვით ნიღაბი სახეზე და 20 წუთში ჩამოიბანეთ.</li>\r\n</ul>\r\n<br />\r\nP.S. თუ სტატია თქვენთვის სასარგებლო იყო, გაუზიარეთ თქვენ მეგობრებსაც.<br />\r\nწყარო: 4lady.ge', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT 0,
  `status_id` int(11) DEFAULT 0 COMMENT '0-mimdinare,1-damushavebuli, 3-dasrulebuli',
  `user_id` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0.00,
  `shiping_amount` decimal(10,2) DEFAULT 0.00,
  `send_date` datetime DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_first_name` varchar(100) DEFAULT NULL,
  `user_last_name` varchar(100) DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `status_id` (`status_id`),
  KEY `insert_date` (`insert_date`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for order_products
-- ----------------------------
DROP TABLE IF EXISTS `order_products`;
CREATE TABLE `order_products` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL DEFAULT 0,
  `quantity` smallint(6) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `quantity` (`quantity`),
  KEY `price` (`price`),
  KEY `insert_date` (`insert_date`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_products
-- ----------------------------

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `access` tinyint(1) DEFAULT 1,
  `show_title` tinyint(1) DEFAULT 1,
  `published` tinyint(1) DEFAULT 0,
  `published_date` datetime DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('5', '1', '0', '1', '2015-11-29 04:07:40', '0000-00-00 00:00:00');
INSERT INTO `pages` VALUES ('36', '1', '1', '1', '2017-03-10 13:44:27', '2017-03-10 13:45:15');

-- ----------------------------
-- Table structure for pages_trans
-- ----------------------------
DROP TABLE IF EXISTS `pages_trans`;
CREATE TABLE `pages_trans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `content` int(10) DEFAULT NULL,
  `lang_id` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pages_trans
-- ----------------------------
INSERT INTO `pages_trans` VALUES ('27', 'ჩვენ შესახებ', '<p><strong>FUFALA </strong>- ეს არის ქართული მულტი ბრენდული <strong>ონლაინ მაღაზია</strong>, სადაც თქვენ შეგიძლიათ უმარტივესად შეარჩიოთ და<strong> სულ რაღაც 2 დაწკაპუნებით</strong> შეიძინოთ ცნობილი ბრენდების კოსმეტიკა და პარფიუმერია. <span style=\"line-height: 20.8px;\">ამიერიდან თქვენ უკვე აღარ დაგჭირდებათ სხვადასხვა მაღაზიებში სიარული სასურველი პროდუქტის შესაძენად, რადგან უკვე ერთ საიტზე შეგიძლიათ შეიძინოთ ყველაფერი, რაც გჭირდებათ სილამაზისთვის.</span><br style=\"line-height: 20.8px;\" />\r\n<br />\r\nმაღაზიის სახელწოდება უკავშირდება &#39;&#39;ნატვრის ხის&#39;&#39; ყველასთვის ცნობილ პერსონაჟს ფუფალას, რომელიც მუდმივად სილამაზეზე ოცნებობდა. იდეა ძალიან მარტივად გაჩნდა, უბრალოდ გვინდოდა მაღაზიისთვის დაგვერქვა \"ქართული\" სახელი (რადგან უცხოური ისედაც ძალიან ბევრია) და სწორედ მაშინ დაიბადა <span style=\"line-height: 20.8px;\"><strong>FUFALA</strong>, ამის შემდეგ დანარჩენი სახელები აღარ განგვიხილავს.</span><br />\r\n<br />\r\nმისია რომელიც გვამოძრავებს ჟღერს შემდეგნაირად, რომ საქართველოში ყველა ქალისთვის მარტივად ხელმისაწვდომი იყოს პროდუქტები სილამაზისთვის. სწორედ ამ მიზეზით შეიქმნა ონლაინ მაღაზია - <strong>FUFALA.GE</strong><br />\r\n<br />\r\n<b>ჩვენთან შეგიძლიათ მიიღოთ:</b></p>\r\n\r\n<ul>\r\n	<li>პროდუქტები და რჩევები სილამაზისთვის</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>მინიმალური შეკვეთა 0.5 ლარიდან</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>შეკვეთის გაფორმება 2 დაწკაპუნებით</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>მიწოდება ნებისმიერ მისამართზე საქართველოში.</li>\r\n</ul>\r\nგისურვებთ სასიამოვნო შოპინგს და გმადლობთ, რომ გვენდობით.', '5', '1');
INSERT INTO `pages_trans` VALUES ('28', 'ჩვენ შესახებ', '<p style=\"line-height: 20.8px;\"><strong>FUFALA </strong>- ეს არის ქართული მულტი ბრენდული <strong>ონლაინ მაღაზია</strong>, სადაც თქვენ შეგიძლიათ უმარტივესად შეარჩიოთ და<strong> სულ რაღაც 2 დაწკაპუნებით</strong> შეიძინოთ ცნობილი ბრენდების კოსმეტიკა და პარფიუმერია. <span style=\"line-height: 20.8px;\">ამიერიდან თქვენ უკვე აღარ დაგჭირდებათ სხვადასხვა მაღაზიებში სიარული სასურველი პროდუქტის შესაძენად, რადგან უკვე ერთ საიტზე შეგიძლიათ შეიძინოთ ყველაფერი, რაც გჭირდებათ სილამაზისთვის.</span><br style=\"line-height: 20.8px;\" />\r\n<br />\r\nმაღაზიის სახელწოდება უკავშირდება &#39;&#39;ნატვრის ხის&#39;&#39; ყველასთვის ცნობილ პერსონაჟს ფუფალას, რომელიც მუდმივად სილამაზეზე ოცნებობდა. იდეა ძალიან მარტივად გაჩნდა, უბრალოდ გვინდოდა მაღაზიისთვის დაგვერქვა \"ქართული\" სახელი (რადგან უცხოური ისედაც ძალიან ბევრია) და სწორედ მაშინ დაიბადა <span style=\"line-height: 20.8px;\"><strong>FUFALA</strong>, ამის შემდეგ დანარჩენი სახელები აღარ განგვიხილავს.</span><br />\r\n<br />\r\nმისია რომელიც გვამოძრავებს ჟღერს შემდეგნაირად, რომ საქართველოში ყველა ქალისთვის მარტივად ხელმისაწვდომი იყოს პროდუქტები სილამაზისთვის. სწორედ ამ მიზეზით შეიქმნა ონლაინ მაღაზია - <strong>FUFALA.GE</strong><br />\r\n<br />\r\n<b>ჩვენთან შეგიძლიათ მიიღოთ:</b></p>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>პროდუქტები და რჩევები სილამაზისთვის</li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>მინიმალური შეკვეთა 0.5 ლარიდან</li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>შეკვეთის გაფორმება 2 დაწკაპუნებით</li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>მიწოდება ნებისმიერ მისამართზე საქართველოში</li>\r\n</ul>\r\n\r\n<p><span style=\"line-height: 20.8px;\">გისურვებთ სასიამოვნო შოპინგს და გმადლობთ, რომ გვენდობით.</span></p>\r\n', '5', '2');
INSERT INTO `pages_trans` VALUES ('29', 'ჩვენ შესახებ', '<p style=\"line-height: 20.8px;\"><strong>FUFALA </strong>- ეს არის ქართული მულტი ბრენდული <strong>ონლაინ მაღაზია</strong>, სადაც თქვენ შეგიძლიათ უმარტივესად შეარჩიოთ და<strong> სულ რაღაც 2 დაწკაპუნებით</strong> შეიძინოთ ცნობილი ბრენდების კოსმეტიკა და პარფიუმერია. <span style=\"line-height: 20.8px;\">ამიერიდან თქვენ უკვე აღარ დაგჭირდებათ სხვადასხვა მაღაზიებში სიარული სასურველი პროდუქტის შესაძენად, რადგან უკვე ერთ საიტზე შეგიძლიათ შეიძინოთ ყველაფერი, რაც გჭირდებათ სილამაზისთვის.</span><br style=\"line-height: 20.8px;\" />\r\n<br />\r\nმაღაზიის სახელწოდება უკავშირდება &#39;&#39;ნატვრის ხის&#39;&#39; ყველასთვის ცნობილ პერსონაჟს ფუფალას, რომელიც მუდმივად სილამაზეზე ოცნებობდა. იდეა ძალიან მარტივად გაჩნდა, უბრალოდ გვინდოდა მაღაზიისთვის დაგვერქვა \"ქართული\" სახელი (რადგან უცხოური ისედაც ძალიან ბევრია) და სწორედ მაშინ დაიბადა <span style=\"line-height: 20.8px;\"><strong>FUFALA</strong>, ამის შემდეგ დანარჩენი სახელები აღარ განგვიხილავს.</span><br />\r\n<br />\r\nმისია რომელიც გვამოძრავებს ჟღერს შემდეგნაირად, რომ საქართველოში ყველა ქალისთვის მარტივად ხელმისაწვდომი იყოს პროდუქტები სილამაზისთვის. სწორედ ამ მიზეზით შეიქმნა ონლაინ მაღაზია - <strong>FUFALA.GE</strong><br />\r\n<br />\r\n<b>ჩვენთან შეგიძლიათ მიიღოთ:</b></p>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>პროდუქტები და რჩევები სილამაზისთვის</li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>მინიმალური შეკვეთა 0.5 ლარიდან</li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>შეკვეთის გაფორმება 2 დაწკაპუნებით</li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>მიწოდება ნებისმიერ მისამართზე საქართველოში</li>\r\n</ul>\r\n\r\n<p><span style=\"line-height: 20.8px;\">გისურვებთ სასიამოვნო შოპინგს და გმადლობთ, რომ გვენდობით.</span></p>\r\n', '5', '3');
INSERT INTO `pages_trans` VALUES ('49', 'მიწოდება', '<p><strong>ძვირფასო მომხმარებელო, </strong><br />\r\nთბილისის მასშტაბით პროდუქციის მიწოდებას ახორციელებენ ჩვენი კომპანიის კურიერები, ხოლო რეგიონებში მიწოდების სერვისს უზრუნველყოფს კომპანია &#39;&#39;ნოვა ფოსტა\". <br />\r\n<br />\r\n<strong>თბილისში</strong> <strong>მიწოდებ</strong><strong>ა </strong>- შეკვეთიდან <strong>24</strong> საათის განმავლობაში (ხშირ შემთხვევაში უფრო მალეც)<br />\r\n<strong>მიწოდების</strong> <strong>საფასური</strong> - <strong>უფასო</strong>  45 ლარის ზევით შენაძენზე. 45 ლარამდე ნებისმიერი რაოდენობის შეკვეთის მიწოდების საფასური შეადგენს 3.60 ლარს.<br />\r\n<br />\r\n<strong>რეგიონებში</strong> <strong>მიწოდება</strong> - შეკვეთიდან <strong>48 </strong>საათის განმავლობაში<br />\r\n<strong>მიწოდების</strong> <strong>საფასური</strong> - რეგიონებში ნებისმიერი რაოდენობის შეკვეთის მიწოდების საფასური შეადგენს 8 ლარს.<br />\r\n<br />\r\n<br />\r\n<strong>შეკვეთის</strong> <strong>მიღების</strong><strong> და გადახდის</strong> <strong>პირობები</strong><strong>:</strong></p>\r\n\r\n<ul>\r\n	<li>ანგარიშსწორება ხდება ნაღდზე კურიერთან, როდესაც მიიღებთ თქვენს მიერ გაფორმებულ შეკვეთას. </li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>თქვენი შეკვეთა გამოგზავნამდე გადის დეტალურ შემოწმებას, ასე რომ ნებისმიერი ვიზუალური დეფექტი პროდუქტზე ფაქტიურად გამორიცხულია.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>მიუხედავად ამისა, შეკვეთის მიღებისას გთხოვთ კარგად შეამოწმოთ მიღებული ამანათი და მხოლოდ ამის შემდეგ მოახდინოთ ანგარიშსწორება კურიერთან.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>ნებისმიერი პრობლემის ან ხარვეზის აღმოჩენის შემთხვევაში, უნდა მოხდეს ჩვენთან დაკავშირება (ამ ნომერზე 551500623) კურიერის გაშვებამდე. </li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>იმ შემთხვევაში, თუ პროდუქციის შეცვლის მოთხოვნით ჩვენთან დაკავშირება მოხდება კურიერის გაშვების შემდეგ, მაშინ შესაცვლელი პროდუქტი მოგაქვთ თავად FUFALA-ს ოფისში. </li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>გთხოვთ გაითვალისწინოთ, რომ თითოეული თქვენს მიერ დაფიქსირებული შეკვეთის მოგროვებასა და მოწოდებაზე იხარჯება ადამიანური და ფინანსური რესურსები, ამიტომ კარგად დაფიქრდით და ისე განათავსეთ შეკვეთა, რომ ნაკლები ადგილი ჰქონდეს შეკვეთის გაუქმების სტატუსს. </li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>ნებისმიერი შეკითხვის შემთხვევაში, გთხოვთ დაგვიკავშირდეთ 551500623, ან მოგვწეროთ ელ.ფოსტაზე: service@fufala.ge</li>\r\n</ul>\r\n\r\n<p><br />\r\nჩვენ ვზრუნავთ თქვენ დროზე და ვაკეთებთ ყველაფერს, რომ შეკვეთილი პროდუქცია მიიღოთ რაც შეიძლება სწრაფად და გარანტირებულად. სასიამოვნო შოპინგს გისურვებთ და გმადლობთ რომ გვენდობით.</p>\r\n', '36', '1');
INSERT INTO `pages_trans` VALUES ('50', 'help', '<p style=\"line-height: 20.8px;\"><strong>ძვირფასო მომხმარებელო, </strong><br />\r\nთბილისის მასშტაბით პროდუქციის მიწოდებას ახორციელებენ ჩვენი კომპანიის კურიერები, ხოლო რეგიონებში მიწოდების სერვისს უზრუნველყოფს კომპანია &#39;&#39;ნოვა ფოსტა\". <br />\r\n<br />\r\n<strong>თბილისში</strong> <strong>მიწოდებ</strong><strong>ა </strong>- შეკვეთიდან <strong>24</strong> საათის განმავლობაში (ხშირ შემთხვევაში უფრო მალეც)<br />\r\n<strong>მიწოდების</strong> <strong>საფასური</strong> - <strong>უფასო</strong>  45 ლარის ზევით შენაძენზე. 45 ლარამდე ნებისმიერი რაოდენობის შეკვეთის მიწოდების საფასური შეადგენს 3.60 ლარს.<br />\r\n<br />\r\n<strong>რეგიონებში</strong> <strong>მიწოდება</strong> - შეკვეთიდან <strong>48 </strong>საათის განმავლობაში<br />\r\n<strong>მიწოდების</strong> <strong>საფასური</strong> - რეგიონებში ნებისმიერი რაოდენობის შეკვეთის მიწოდების საფასური შეადგენს 8 ლარს.<br />\r\n<br />\r\n<br />\r\n<strong>შეკვეთის</strong> <strong>მიღების</strong><strong> და გადახდის</strong> <strong>პირობები</strong><strong>:</strong></p>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>ანგარიშსწორება ხდება ნაღდზე კურიერთან, როდესაც მიიღებთ თქვენს მიერ გაფორმებულ შეკვეთას. </li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>თქვენი შეკვეთა გამოგზავნამდე გადის დეტალურ შემოწმებას, ასე რომ ნებისმიერი ვიზუალური დეფექტი პროდუქტზე ფაქტიურად გამორიცხულია.</li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>მიუხედავად ამისა, შეკვეთის მიღებისას გთხოვთ კარგად შეამოწმოთ მიღებული ამანათი და მხოლოდ ამის შემდეგ მოახდინოთ ანგარიშსწორება კურიერთან.</li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>ნებისმიერი პრობლემის ან ხარვეზის აღმოჩენის შემთხვევაში, უნდა მოხდეს ჩვენთან დაკავშირება (ამ ნომერზე 551500623) კურიერის გაშვებამდე. </li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>იმ შემთხვევაში, თუ პროდუქციის შეცვლის მოთხოვნით ჩვენთან დაკავშირება მოხდება კურიერის გაშვების შემდეგ, მაშინ შესაცვლელი პროდუქტი მოგაქვთ თავად FUFALA-ს ოფისში. </li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>გთხოვთ გაითვალისწინოთ, რომ თითოეული თქვენს მიერ დაფიქსირებული შეკვეთის მოგროვებასა და მოწოდებაზე იხარჯება ადამიანური და ფინანსური რესურსები, ამიტომ კარგად დაფიქრდით და ისე განათავსეთ შეკვეთა, რომ ნაკლები ადგილი ჰქონდეს შეკვეთის გაუქმების სტატუსს. </li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>ნებისმიერი შეკითხვის შემთხვევაში, გთხოვთ დაგვიკავშირდეთ 551500623, ან მოგვწეროთ ელ.ფოსტაზე: service@fufala.ge</li>\r\n</ul>\r\n\r\n<p style=\"line-height: 20.8px;\"><br />\r\nჩვენ ვზრუნავთ თქვენ დროზე და ვაკეთებთ ყველაფერს, რომ შეკვეთილი პროდუქცია მიიღოთ რაც შეიძლება სწრაფად და გარანტირებულად. სასიამოვნო შოპინგს გისურვებთ და გმადლობთ რომ გვენდობით.</p>\r\n', '36', '2');
INSERT INTO `pages_trans` VALUES ('51', 'help', '<p style=\"line-height: 20.8px;\"><strong>ძვირფასო მომხმარებელო, </strong><br />\r\nთბილისის მასშტაბით პროდუქციის მიწოდებას ახორციელებენ ჩვენი კომპანიის კურიერები, ხოლო რეგიონებში მიწოდების სერვისს უზრუნველყოფს კომპანია &#39;&#39;ნოვა ფოსტა\". <br />\r\n<br />\r\n<strong>თბილისში</strong> <strong>მიწოდებ</strong><strong>ა </strong>- შეკვეთიდან <strong>24</strong> საათის განმავლობაში (ხშირ შემთხვევაში უფრო მალეც)<br />\r\n<strong>მიწოდების</strong> <strong>საფასური</strong> - <strong>უფასო</strong>  45 ლარის ზევით შენაძენზე. 45 ლარამდე ნებისმიერი რაოდენობის შეკვეთის მიწოდების საფასური შეადგენს 3.60 ლარს.<br />\r\n<br />\r\n<strong>რეგიონებში</strong> <strong>მიწოდება</strong> - შეკვეთიდან <strong>48 </strong>საათის განმავლობაში<br />\r\n<strong>მიწოდების</strong> <strong>საფასური</strong> - რეგიონებში ნებისმიერი რაოდენობის შეკვეთის მიწოდების საფასური შეადგენს 8 ლარს.<br />\r\n<br />\r\n<br />\r\n<strong>შეკვეთის</strong> <strong>მიღების</strong><strong> და გადახდის</strong> <strong>პირობები</strong><strong>:</strong></p>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>ანგარიშსწორება ხდება ნაღდზე კურიერთან, როდესაც მიიღებთ თქვენს მიერ გაფორმებულ შეკვეთას. </li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>თქვენი შეკვეთა გამოგზავნამდე გადის დეტალურ შემოწმებას, ასე რომ ნებისმიერი ვიზუალური დეფექტი პროდუქტზე ფაქტიურად გამორიცხულია.</li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>მიუხედავად ამისა, შეკვეთის მიღებისას გთხოვთ კარგად შეამოწმოთ მიღებული ამანათი და მხოლოდ ამის შემდეგ მოახდინოთ ანგარიშსწორება კურიერთან.</li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>ნებისმიერი პრობლემის ან ხარვეზის აღმოჩენის შემთხვევაში, უნდა მოხდეს ჩვენთან დაკავშირება (ამ ნომერზე 551500623) კურიერის გაშვებამდე. </li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>იმ შემთხვევაში, თუ პროდუქციის შეცვლის მოთხოვნით ჩვენთან დაკავშირება მოხდება კურიერის გაშვების შემდეგ, მაშინ შესაცვლელი პროდუქტი მოგაქვთ თავად FUFALA-ს ოფისში. </li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>გთხოვთ გაითვალისწინოთ, რომ თითოეული თქვენს მიერ დაფიქსირებული შეკვეთის მოგროვებასა და მოწოდებაზე იხარჯება ადამიანური და ფინანსური რესურსები, ამიტომ კარგად დაფიქრდით და ისე განათავსეთ შეკვეთა, რომ ნაკლები ადგილი ჰქონდეს შეკვეთის გაუქმების სტატუსს. </li>\r\n</ul>\r\n\r\n<ul style=\"line-height: 20.8px;\">\r\n	<li>ნებისმიერი შეკითხვის შემთხვევაში, გთხოვთ დაგვიკავშირდეთ 551500623, ან მოგვწეროთ ელ.ფოსტაზე: service@fufala.ge</li>\r\n</ul>\r\n\r\n<p style=\"line-height: 20.8px;\"><br />\r\nჩვენ ვზრუნავთ თქვენ დროზე და ვაკეთებთ ყველაფერს, რომ შეკვეთილი პროდუქცია მიიღოთ რაც შეიძლება სწრაფად და გარანტირებულად. სასიამოვნო შოპინგს გისურვებთ და გმადლობთ რომ გვენდობით.</p>\r\n', '36', '3');

-- ----------------------------
-- Table structure for partners
-- ----------------------------
DROP TABLE IF EXISTS `partners`;
CREATE TABLE `partners` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `ordering` tinyint(5) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partners
-- ----------------------------
INSERT INTO `partners` VALUES ('8', '7471490186838.png', '#', '2');
INSERT INTO `partners` VALUES ('10', '4731490186888.png', '#', '3');
INSERT INTO `partners` VALUES ('11', '6611490986101.jpg', 'http://fufala.zixela.com/ka/product/?brand=5', '1');
INSERT INTO `partners` VALUES ('12', '6931490986222.jpg', 'http://fufala.zixela.com/ka/product/?brand=9', '1');
INSERT INTO `partners` VALUES ('13', '9731490986614.jpg', 'http://fufala.zixela.com/ka/product/?brand=6', '1');
INSERT INTO `partners` VALUES ('14', '651490986759.jpg', 'http://fufala.zixela.com/ka/product/?brand=8', '1');
INSERT INTO `partners` VALUES ('15', '6251490186824.png', '#', '1');
INSERT INTO `partners` VALUES ('16', '851490986033.png', 'http://fufala.zixela.com/ka/product/?brand=7', '1');
INSERT INTO `partners` VALUES ('20', '1711491851136.jpg', 'http://fufala.zixela.com/ka/product/?brand=14', '1');

-- ----------------------------
-- Table structure for password_reset
-- ----------------------------
DROP TABLE IF EXISTS `password_reset`;
CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8_bin NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of password_reset
-- ----------------------------
INSERT INTO `password_reset` VALUES ('1', '1', 'd6b3d9a406243a2844b7da92cd04c070', '2016-10-02 00:59:13', '1');
INSERT INTO `password_reset` VALUES ('2', '1', '00afc5797f939658f26bb0dccf3c22a3', '2017-03-12 03:15:15', '0');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) DEFAULT 0,
  `views` tinyint(1) unsigned DEFAULT 0,
  `price` decimal(10,2) DEFAULT NULL,
  `sale` tinyint(3) DEFAULT NULL COMMENT 'percent',
  `featured` tinyint(1) DEFAULT 0,
  `code` varchar(25) DEFAULT NULL,
  `sale_end_date` datetime DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  `status_id` tinyint(1) unsigned DEFAULT 1 COMMENT '0 - inactive; 1 - enebled; 2 - disabled',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '6', '3', '156.00', '0', '0', '394830', '2018-09-30 00:13:07', '2018-09-30 00:12:46', '1');
INSERT INTO `products` VALUES ('2', '6', '0', '345.00', '0', '0', '', '2018-09-30 00:17:23', '2018-09-30 00:17:23', '1');
INSERT INTO `products` VALUES ('3', '13', '0', '456.00', '0', '0', '026983', '2018-09-30 00:17:55', '2018-09-30 00:17:54', '1');
INSERT INTO `products` VALUES ('4', '13', '5', '5678.00', '13', '0', '324234', '2018-09-30 00:18:28', '2018-09-30 00:18:27', '1');
INSERT INTO `products` VALUES ('5', '14', '4', '5480.00', '15', '0', '', '2018-09-30 00:55:35', '2018-09-30 00:55:34', '1');
INSERT INTO `products` VALUES ('6', '6', '27', '4500.00', '5', '1', '', '2018-09-30 00:56:11', '2018-09-30 00:56:10', '1');
INSERT INTO `products` VALUES ('7', '9', '22', '158.00', '12', '0', '34245', '2018-09-30 01:05:41', '2018-09-30 01:05:41', '1');
INSERT INTO `products` VALUES ('8', '6', '3', '35.00', '5', '1', '13443', '2019-01-05 01:20:02', '2019-01-05 01:17:06', '1');
INSERT INTO `products` VALUES ('9', '0', '0', null, null, '0', null, null, '2019-11-14 21:14:35', '1');
INSERT INTO `products` VALUES ('10', '0', '0', null, null, '0', null, null, '2019-11-14 21:15:09', '1');
INSERT INTO `products` VALUES ('11', '0', '0', null, null, '0', null, null, '2019-11-14 21:23:38', '1');
INSERT INTO `products` VALUES ('12', '0', '0', null, null, '0', null, null, '2019-11-14 21:25:51', '1');
INSERT INTO `products` VALUES ('13', '0', '0', null, null, '0', null, null, '2019-11-14 21:26:02', '1');
INSERT INTO `products` VALUES ('14', '0', '0', null, null, '0', null, null, '2019-11-14 21:26:36', '1');
INSERT INTO `products` VALUES ('15', '0', '0', null, null, '0', null, null, '2019-11-14 21:27:07', '1');
INSERT INTO `products` VALUES ('16', '0', '0', null, null, '0', null, null, '2019-11-14 21:27:08', '1');
INSERT INTO `products` VALUES ('17', '0', '0', null, null, '0', null, null, '2019-11-14 21:27:08', '1');
INSERT INTO `products` VALUES ('18', '0', '0', null, null, '0', null, null, '2019-11-14 21:27:09', '1');
INSERT INTO `products` VALUES ('19', '0', '0', null, null, '0', null, null, '2019-11-14 21:27:48', '1');
INSERT INTO `products` VALUES ('20', '0', '0', null, null, '0', null, null, '2019-11-14 21:28:00', '1');
INSERT INTO `products` VALUES ('21', '0', '0', null, null, '0', null, null, '2019-11-16 02:55:14', '1');

-- ----------------------------
-- Table structure for products_trans
-- ----------------------------
DROP TABLE IF EXISTS `products_trans`;
CREATE TABLE `products_trans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `lang_id` tinyint(1) DEFAULT NULL,
  `car_class` varchar(255) DEFAULT NULL,
  `car_model` varchar(255) DEFAULT '',
  `car_transmission` varchar(255) DEFAULT NULL,
  `car_bstyle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_trans
-- ----------------------------
INSERT INTO `products_trans` VALUES ('1', '1', 'asdasd', 'asdasdasd', '1', null, null, null, null);
INSERT INTO `products_trans` VALUES ('2', '1', '', '', '2', null, null, null, null);
INSERT INTO `products_trans` VALUES ('3', '1', '', '', '3', null, null, null, null);

-- ----------------------------
-- Table structure for products_variants
-- ----------------------------
DROP TABLE IF EXISTS `products_variants`;
CREATE TABLE `products_variants` (
  `variant_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL,
  `pipedrive_id` int(15) DEFAULT 0,
  `sku` varchar(25) DEFAULT '',
  `code` varchar(25) DEFAULT '',
  `price` decimal(10,2) DEFAULT 0.00,
  `sale` tinyint(3) DEFAULT 0,
  `sale_end_date` datetime DEFAULT NULL,
  `quantity` int(5) unsigned DEFAULT 0,
  `default` tinyint(1) unsigned DEFAULT 0 COMMENT '1- Default variant',
  PRIMARY KEY (`variant_id`),
  UNIQUE KEY `2` (`product_id`,`variant_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `variant_id` (`variant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_variants
-- ----------------------------

-- ----------------------------
-- Table structure for products_variant_attrs
-- ----------------------------
DROP TABLE IF EXISTS `products_variant_attrs`;
CREATE TABLE `products_variant_attrs` (
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `attr_value_id` int(11) DEFAULT NULL,
  KEY `1` (`product_id`) USING BTREE,
  KEY `2` (`product_id`,`variant_id`) USING BTREE,
  KEY `3` (`product_id`,`variant_id`,`attr_value_id`) USING BTREE,
  KEY `4` (`variant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_variant_attrs
-- ----------------------------

-- ----------------------------
-- Table structure for products_variant_photos
-- ----------------------------
DROP TABLE IF EXISTS `products_variant_photos`;
CREATE TABLE `products_variant_photos` (
  `photo_id` int(11) unsigned NOT NULL,
  `variant_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`photo_id`,`variant_id`),
  KEY `2` (`photo_id`,`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_variant_photos
-- ----------------------------

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL DEFAULT 0,
  `ordering` tinyint(2) NOT NULL DEFAULT 1,
  `created_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(50) DEFAULT '',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
INSERT INTO `product_categories` VALUES ('1', '0', '2', '2017-04-20 12:46:07', '6271492677967.jpg');
INSERT INTO `product_categories` VALUES ('2', '0', '3', '2017-04-20 13:15:46', '5141492679746.jpg');
INSERT INTO `product_categories` VALUES ('3', '0', '1', '2017-04-20 11:19:14', '4921492672754.JPG');
INSERT INTO `product_categories` VALUES ('18', '5', '2', '2017-04-05 13:10:29', '1361491383429.png');
INSERT INTO `product_categories` VALUES ('5', '0', '4', '2017-04-20 12:02:03', '8781492675322.jpg');
INSERT INTO `product_categories` VALUES ('6', '1', '4', '2017-04-05 12:50:37', '6661491382237.jpg');
INSERT INTO `product_categories` VALUES ('8', '1', '1', '2017-04-20 13:02:42', '321492678962.jpg');
INSERT INTO `product_categories` VALUES ('9', '3', '2', '2017-04-20 12:17:37', '9091492676257.jpg');
INSERT INTO `product_categories` VALUES ('10', '1', '3', '2017-04-05 12:49:09', '8471491382149.jpg');
INSERT INTO `product_categories` VALUES ('11', '5', '3', '2017-04-05 13:12:05', '4061491383525.jpg');
INSERT INTO `product_categories` VALUES ('12', '5', '1', '2017-04-05 13:09:39', '1321491383379.jpg');
INSERT INTO `product_categories` VALUES ('13', '5', '5', '2017-04-05 13:11:05', '3121491383465.jpg');
INSERT INTO `product_categories` VALUES ('14', '3', '5', '2017-04-20 12:03:51', '1881492675431.jpg');
INSERT INTO `product_categories` VALUES ('15', '3', '4', '2017-04-20 11:42:58', '4871492674178.jpg');
INSERT INTO `product_categories` VALUES ('16', '3', '1', '2017-04-20 12:24:16', '2521492676656.jpg');
INSERT INTO `product_categories` VALUES ('17', '3', '3', '2017-04-20 12:43:00', '8381492677780.jpg');
INSERT INTO `product_categories` VALUES ('19', '5', '4', '2017-04-05 13:13:22', '1011491383602.jpg');
INSERT INTO `product_categories` VALUES ('20', '2', '2', '2017-04-05 12:57:56', '9211491382676.jpg');
INSERT INTO `product_categories` VALUES ('21', '2', '4', '2017-04-05 13:00:15', '6471491382815.jpg');
INSERT INTO `product_categories` VALUES ('22', '2', '3', '2017-04-05 12:59:38', '6721491382778.jpg');
INSERT INTO `product_categories` VALUES ('23', '2', '5', '2017-04-05 12:58:51', '8421491382731.jpg');
INSERT INTO `product_categories` VALUES ('28', '2', '7', '2017-04-05 13:03:30', '9661491383009.png');
INSERT INTO `product_categories` VALUES ('25', '0', '6', '2017-04-05 13:15:04', '8711491383704.jpg');
INSERT INTO `product_categories` VALUES ('26', '25', '1', '2017-04-05 13:18:10', '8911491383890.jpg');
INSERT INTO `product_categories` VALUES ('27', '25', '2', '2017-04-05 13:18:33', '2121491383913.jpg');
INSERT INTO `product_categories` VALUES ('29', '2', '6', '2017-04-05 13:05:07', '5061491383107.jpg');
INSERT INTO `product_categories` VALUES ('31', '3', '7', '2017-04-05 12:35:21', '311491381321.jpg');
INSERT INTO `product_categories` VALUES ('34', '2', '1', '2017-04-20 13:17:58', '3431492679878.jpg');
INSERT INTO `product_categories` VALUES ('35', '3', '6', '2017-04-09 20:40:49', '6121491381456.jpg');
INSERT INTO `product_categories` VALUES ('36', '2', '8', '2017-04-05 13:04:30', '7331491383070.jpg');

-- ----------------------------
-- Table structure for product_categories_trans
-- ----------------------------
DROP TABLE IF EXISTS `product_categories_trans`;
CREATE TABLE `product_categories_trans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `desc` varchar(250) DEFAULT NULL,
  `lang_id` tinyint(2) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`,`lang_id`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_categories_trans
-- ----------------------------
INSERT INTO `product_categories_trans` VALUES ('1', '1', 'სახის მოვლა', '', '1');
INSERT INTO `product_categories_trans` VALUES ('2', '1', 'პარფიუმერია', '', '2');
INSERT INTO `product_categories_trans` VALUES ('3', '1', 'პარფიუმერია', '', '3');
INSERT INTO `product_categories_trans` VALUES ('4', '2', 'სხეულის მოვლა', 'შხაპის გელები, სკრაბები, ტანის კრემები', '1');
INSERT INTO `product_categories_trans` VALUES ('5', '2', 'კანის მოვლა', '', '2');
INSERT INTO `product_categories_trans` VALUES ('6', '2', 'კანის მოვლა', '', '3');
INSERT INTO `product_categories_trans` VALUES ('7', '3', 'Make Up', 'მაკიაჟი', '1');
INSERT INTO `product_categories_trans` VALUES ('8', '3', 'სახის მოვლა', '', '2');
INSERT INTO `product_categories_trans` VALUES ('9', '3', 'სახის მოვლა', '', '3');
INSERT INTO `product_categories_trans` VALUES ('13', '5', 'თმის მოვლა', '', '1');
INSERT INTO `product_categories_trans` VALUES ('14', '5', 'ტანის მოვლა', '', '2');
INSERT INTO `product_categories_trans` VALUES ('15', '5', 'ტანის მოვლა', '', '3');
INSERT INTO `product_categories_trans` VALUES ('16', '6', 'სახის ნიღბები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('17', '6', 'test5', '', '2');
INSERT INTO `product_categories_trans` VALUES ('18', '6', 'test5', '', '3');
INSERT INTO `product_categories_trans` VALUES ('22', '8', 'სახის კრემები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('52', '18', 'თმის ნიღბები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('53', '18', 'თმის ნიღბები', '', '2');
INSERT INTO `product_categories_trans` VALUES ('54', '18', 'თმის ნიღბები', '', '3');
INSERT INTO `product_categories_trans` VALUES ('55', '19', 'ვარცხნილობის საშუალებები ', '', '1');
INSERT INTO `product_categories_trans` VALUES ('56', '19', 'Hair Stylers', '', '2');
INSERT INTO `product_categories_trans` VALUES ('57', '19', 'Hair Stylers', '', '3');
INSERT INTO `product_categories_trans` VALUES ('58', '20', 'საშხაპე გელები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('23', '8', 'test', '', '2');
INSERT INTO `product_categories_trans` VALUES ('24', '8', 'test', '', '3');
INSERT INTO `product_categories_trans` VALUES ('25', '9', 'ტონალური კრემები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('26', '9', 'test2', '', '2');
INSERT INTO `product_categories_trans` VALUES ('27', '9', 'test2', '', '3');
INSERT INTO `product_categories_trans` VALUES ('28', '10', 'გამწმენდი საშუალებები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('29', '10', 'test3', '', '2');
INSERT INTO `product_categories_trans` VALUES ('30', '10', 'test3', '', '3');
INSERT INTO `product_categories_trans` VALUES ('31', '11', 'საღებავები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('32', '11', 'საღებავები', '', '2');
INSERT INTO `product_categories_trans` VALUES ('33', '11', 'საღებავები', '', '3');
INSERT INTO `product_categories_trans` VALUES ('34', '12', 'შამპუნები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('35', '12', 'შამპუნები', '', '2');
INSERT INTO `product_categories_trans` VALUES ('36', '12', 'შამპუნები', '', '3');
INSERT INTO `product_categories_trans` VALUES ('37', '13', 'თმის ზეთები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('38', '13', 'ზეთები', '', '2');
INSERT INTO `product_categories_trans` VALUES ('39', '13', 'ზეთები', '', '3');
INSERT INTO `product_categories_trans` VALUES ('40', '14', 'თვალისთვის', '', '1');
INSERT INTO `product_categories_trans` VALUES ('41', '14', 'თვალი', '', '2');
INSERT INTO `product_categories_trans` VALUES ('42', '14', 'თვალი', '', '3');
INSERT INTO `product_categories_trans` VALUES ('43', '15', 'ტუჩისთვის', '', '1');
INSERT INTO `product_categories_trans` VALUES ('44', '15', 'ტუჩები', '', '2');
INSERT INTO `product_categories_trans` VALUES ('45', '15', 'ტუჩი', '', '3');
INSERT INTO `product_categories_trans` VALUES ('46', '16', 'სახის მაკიაჟი', '', '1');
INSERT INTO `product_categories_trans` VALUES ('47', '16', 'სახე', '', '2');
INSERT INTO `product_categories_trans` VALUES ('48', '16', 'სახე', '', '3');
INSERT INTO `product_categories_trans` VALUES ('49', '17', 'ფრჩხილებისთვის', '', '1');
INSERT INTO `product_categories_trans` VALUES ('50', '17', 'ფრჩხილი', '', '2');
INSERT INTO `product_categories_trans` VALUES ('51', '17', 'ფრჩხილი', '', '3');
INSERT INTO `product_categories_trans` VALUES ('59', '20', 'საშხაპე გელები', '', '2');
INSERT INTO `product_categories_trans` VALUES ('60', '20', 'საშხაპე გელები', '', '3');
INSERT INTO `product_categories_trans` VALUES ('61', '21', 'ტანის კრემები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('62', '21', 'ტანის კრემები', '', '2');
INSERT INTO `product_categories_trans` VALUES ('63', '21', 'ტანის კრემები', '', '3');
INSERT INTO `product_categories_trans` VALUES ('64', '22', 'მზისგან დამცავები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('65', '22', 'მზისგან დამცავი საშუალებები', '', '2');
INSERT INTO `product_categories_trans` VALUES ('66', '22', 'მზისგან დამცავი საშუალებები', '', '3');
INSERT INTO `product_categories_trans` VALUES ('67', '23', 'აბაზანის ქაფები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('68', '23', 'აბაზანის ქაფები', '', '2');
INSERT INTO `product_categories_trans` VALUES ('69', '23', 'აბაზანის ქაფები', '', '3');
INSERT INTO `product_categories_trans` VALUES ('83', '28', 'ბავშვებისთვის', '', '2');
INSERT INTO `product_categories_trans` VALUES ('82', '28', 'ბავშვებისთვის', '', '1');
INSERT INTO `product_categories_trans` VALUES ('73', '25', 'პარფიუმერია', '', '1');
INSERT INTO `product_categories_trans` VALUES ('74', '25', 'პარფიუმერია', '', '2');
INSERT INTO `product_categories_trans` VALUES ('75', '25', 'პარფიუმერია', '', '3');
INSERT INTO `product_categories_trans` VALUES ('76', '26', 'ქალის სუნამოები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('77', '26', 'ქალისთვის', '', '2');
INSERT INTO `product_categories_trans` VALUES ('78', '26', 'ქალისთვის', '', '3');
INSERT INTO `product_categories_trans` VALUES ('79', '27', 'მამაკაცის სუნამოები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('80', '27', 'მამაკაცისთვის', '', '2');
INSERT INTO `product_categories_trans` VALUES ('81', '27', 'მამაკაცისთვის', '', '3');
INSERT INTO `product_categories_trans` VALUES ('84', '28', 'ბავშვებისთვის', '', '3');
INSERT INTO `product_categories_trans` VALUES ('85', '29', 'მამაკაცის კოსმეტიკა', '', '1');
INSERT INTO `product_categories_trans` VALUES ('86', '29', 'მამაკაცებისთვის', '', '2');
INSERT INTO `product_categories_trans` VALUES ('87', '29', 'მამაკაცებისთვის', '', '3');
INSERT INTO `product_categories_trans` VALUES ('91', '31', 'აქსესუარები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('92', '31', 'აქსესუარები', '', '2');
INSERT INTO `product_categories_trans` VALUES ('93', '31', 'აქსესუარები', '', '3');
INSERT INTO `product_categories_trans` VALUES ('102', '34', 'პირადი ჰიგიენა', '', '3');
INSERT INTO `product_categories_trans` VALUES ('101', '34', 'პირადი ჰიგიენა', '', '2');
INSERT INTO `product_categories_trans` VALUES ('100', '34', 'პირადი ჰიგიენა', '', '1');
INSERT INTO `product_categories_trans` VALUES ('103', '35', 'წარბისთვის', '', '1');
INSERT INTO `product_categories_trans` VALUES ('104', '35', 'წარბისთვის', '', '2');
INSERT INTO `product_categories_trans` VALUES ('105', '35', 'წარბისთვის', '', '3');
INSERT INTO `product_categories_trans` VALUES ('106', '36', 'სხეულის ზეთები', '', '1');
INSERT INTO `product_categories_trans` VALUES ('107', '36', 'ტანის ზეთები', '', '2');
INSERT INTO `product_categories_trans` VALUES ('108', '36', 'ტანის ზეთები', '', '3');

-- ----------------------------
-- Table structure for product_photos
-- ----------------------------
DROP TABLE IF EXISTS `product_photos`;
CREATE TABLE `product_photos` (
  `photo_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned NOT NULL,
  `photo_name` varchar(50) NOT NULL,
  `ordering` int(5) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`photo_id`),
  KEY `content_photos` (`content_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_photos
-- ----------------------------
INSERT INTO `product_photos` VALUES ('12', '7', '8901546636458.jpg', '1');
INSERT INTO `product_photos` VALUES ('13', '6', '5651546636503.jpg', '1');
INSERT INTO `product_photos` VALUES ('14', '5', '3671546636527.jpg', '1');
INSERT INTO `product_photos` VALUES ('15', '4', '7421546636546.jpg', '1');
INSERT INTO `product_photos` VALUES ('16', '3', '7251546636588.jpg', '1');
INSERT INTO `product_photos` VALUES ('17', '2', '5481546636601.jpg', '1');
INSERT INTO `product_photos` VALUES ('18', '1', '9111546636621.jpg', '1');
INSERT INTO `product_photos` VALUES ('19', '8', '9621546636776.jpg', '1');
INSERT INTO `product_photos` VALUES ('20', '6', '1881546721203.jpg', '2');

-- ----------------------------
-- Table structure for product_tags
-- ----------------------------
DROP TABLE IF EXISTS `product_tags`;
CREATE TABLE `product_tags` (
  `tag_id` int(10) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(25) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `id` (`tag_id`) USING BTREE,
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_tags
-- ----------------------------
INSERT INTO `product_tags` VALUES ('1', 'sayure');

-- ----------------------------
-- Table structure for product_to_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_to_categories`;
CREATE TABLE `product_to_categories` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `2` (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_to_categories
-- ----------------------------
INSERT INTO `product_to_categories` VALUES ('1', '16');
INSERT INTO `product_to_categories` VALUES ('2', '8');
INSERT INTO `product_to_categories` VALUES ('3', '3');
INSERT INTO `product_to_categories` VALUES ('5', '16');
INSERT INTO `product_to_categories` VALUES ('6', '16');
INSERT INTO `product_to_categories` VALUES ('7', '8');
INSERT INTO `product_to_categories` VALUES ('8', '26');

-- ----------------------------
-- Table structure for product_to_tags
-- ----------------------------
DROP TABLE IF EXISTS `product_to_tags`;
CREATE TABLE `product_to_tags` (
  `tag_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  PRIMARY KEY (`tag_id`,`product_id`),
  KEY `id` (`tag_id`,`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_to_tags
-- ----------------------------
INSERT INTO `product_to_tags` VALUES ('1', '8');

-- ----------------------------
-- Table structure for providers
-- ----------------------------
DROP TABLE IF EXISTS `providers`;
CREATE TABLE `providers` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `status_id` tinyint(1) NOT NULL DEFAULT 0,
  `pay_box` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(100) NOT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `out_min_amount` decimal(10,2) DEFAULT 5.00,
  `out_max_amount` decimal(10,2) DEFAULT 1000.00,
  `provider_key` varchar(50) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `link` text NOT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of providers
-- ----------------------------
INSERT INTO `providers` VALUES ('1', '11', '0', '0', 'BOG', '50.00', '2000.00', '5.00', '1000.00', '', '1', '');
INSERT INTO `providers` VALUES ('2', '0', '0', '0', 'TBC', '50.00', '2000.00', '5.00', '1000.00', '', '5', '');
INSERT INTO `providers` VALUES ('3', '0', '1', '0', 'LIBERTY BANK', '5.00', '1000.00', '5.00', '1000.00', '', '4', '');
INSERT INTO `providers` VALUES ('4', '0', '0', '0', 'Amoney', '50.00', '2000.00', '5.00', '1000.00', '', '6', '');
INSERT INTO `providers` VALUES ('5', '0', '0', '0', 'QIWI', '50.00', '2000.00', '5.00', '1000.00', '', '7', '');
INSERT INTO `providers` VALUES ('6', '0', '1', '1', 'NOVA PAYBOX', '1.00', '200.00', '5.00', '1000.00', '', '0', '');
INSERT INTO `providers` VALUES ('7', '0', '1', '1', 'TBC PAY', '1.00', '200.00', '5.00', '1000.00', '', '0', '');
INSERT INTO `providers` VALUES ('8', '0', '1', '1', 'IPAY', '1.00', '200.00', '5.00', '1000.00', '', '0', '');
INSERT INTO `providers` VALUES ('9', '11', '0', '0', 'BANK REPUBLIC', '10.00', '2000.00', '5.00', '1000.00', '', '2', '');
INSERT INTO `providers` VALUES ('10', '11', '0', '0', 'BTA BANK', '10.00', '2000.00', '5.00', '1000.00', '', '3', '');
INSERT INTO `providers` VALUES ('11', '0', '0', '0', 'GEORGIAN CARD', '0.00', '0.00', '5.00', '1000.00', '', '0', '');
INSERT INTO `providers` VALUES ('12', '0', '1', '0', 'moneyMovers', '1.00', '5000.00', '5.00', '1000.00', 'wyw6acayranli406h4zn1e7z2cvdj7', '0', '');
INSERT INTO `providers` VALUES ('13', '0', '1', '0', 'eMoney', '1.00', '5000.00', '5.00', '1000.00', '', '0', 'http://emoney.ge');
INSERT INTO `providers` VALUES ('14', '0', '1', '0', 'WebMoney', '1.00', '5000.00', '5.00', '1000.00', '', '0', 'https://mm.ge/?lang=geo');
INSERT INTO `providers` VALUES ('15', '0', '1', '0', 'Gadaixade.ge', '1.00', '5000.00', '5.00', '1000.00', '', '0', 'http://gadaixade.ge/MessagePage.aspx?MessageID=1');
INSERT INTO `providers` VALUES ('16', '0', '1', '0', 'Paybox.ge', '1.00', '5000.00', '5.00', '1000.00', '', '0', 'https://www.paybox.ge/User/Services/PVProduct.aspx?id=207');
INSERT INTO `providers` VALUES ('17', '0', '1', '0', 'tbcpay.ge', '1.00', '5000.00', '5.00', '1000.00', '', '0', 'http://tbcpay.ge/Home/InputNumber?Value=vivarobet&StepID=0&KEY=2A5AAEBB88592BC9CE398CE4985CDFE0');

-- ----------------------------
-- Table structure for requests
-- ----------------------------
DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_firstname` varchar(50) DEFAULT NULL,
  `user_lastname` varchar(50) DEFAULT NULL,
  `user_phone` varchar(25) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of requests
-- ----------------------------

-- ----------------------------
-- Table structure for saved_products
-- ----------------------------
DROP TABLE IF EXISTS `saved_products`;
CREATE TABLE `saved_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of saved_products
-- ----------------------------

-- ----------------------------
-- Table structure for site_message
-- ----------------------------
DROP TABLE IF EXISTS `site_message`;
CREATE TABLE `site_message` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `status_id` tinyint(1) DEFAULT 0 COMMENT '0 - disabled; 1 - enabled',
  `offline` tinyint(1) DEFAULT 0 COMMENT '1- exit code',
  `ip_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site_message
-- ----------------------------
INSERT INTO `site_message` VALUES ('1', '0', '0', '');

-- ----------------------------
-- Table structure for site_message_trans
-- ----------------------------
DROP TABLE IF EXISTS `site_message_trans`;
CREATE TABLE `site_message_trans` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `message_id` tinyint(1) NOT NULL,
  `text` text DEFAULT NULL,
  `lang_id` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site_message_trans
-- ----------------------------
INSERT INTO `site_message_trans` VALUES ('4', '1', 'გთხოვთ გაითვალისწინოთ, რომ საიტი მუშაობს სატესტო რეჟიმში - http://fufala.ge/', '1');
INSERT INTO `site_message_trans` VALUES ('5', '1', 'გთხოვთ გაითვალისწინოთ, რომ საიტი მუშაობს სატესტო რეჟიმში - http://fufala.ge/', '2');
INSERT INTO `site_message_trans` VALUES ('6', '1', 'გთხოვთ გაითვალისწინოთ, რომ საიტი მუშაობს სატესტო რეჟიმში - http://fufala.ge/', '3');

-- ----------------------------
-- Table structure for slider
-- ----------------------------
DROP TABLE IF EXISTS `slider`;
CREATE TABLE `slider` (
  `slider_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `slider_image` varchar(100) DEFAULT NULL,
  `slider_order` tinyint(3) DEFAULT 1,
  `brand_id` int(12) DEFAULT NULL,
  `home` tinyint(1) DEFAULT NULL,
  `target_blank` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`slider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slider
-- ----------------------------
INSERT INTO `slider` VALUES ('2', '8721546640272.jpg', '1', '6', '1', '0');
INSERT INTO `slider` VALUES ('3', '7471546640319.jpg', '1', '0', '1', '0');
INSERT INTO `slider` VALUES ('4', '5911546641179.jpg', '1', '0', '1', '0');

-- ----------------------------
-- Table structure for slider_trans
-- ----------------------------
DROP TABLE IF EXISTS `slider_trans`;
CREATE TABLE `slider_trans` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `slider_id` tinyint(5) DEFAULT 1,
  `slider_html` text DEFAULT NULL,
  `slider_caption` text DEFAULT NULL,
  `slider_lang` tinyint(1) DEFAULT NULL,
  `slider_link` varchar(100) DEFAULT NULL,
  `slider_link_blank` tinyint(1) DEFAULT 0 COMMENT 'target',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slider_trans
-- ----------------------------
INSERT INTO `slider_trans` VALUES ('4', '2', 'asdasdasd', 'საუკეთესო აბადოკი', '1', 'index.html', '0');
INSERT INTO `slider_trans` VALUES ('5', '2', '', '', '2', '', '0');
INSERT INTO `slider_trans` VALUES ('6', '2', '', '', '3', '', '0');
INSERT INTO `slider_trans` VALUES ('7', '3', '', 'შობის ანგელოზები', '1', 'საყურე', '0');
INSERT INTO `slider_trans` VALUES ('8', '3', '', '', '2', '', '0');
INSERT INTO `slider_trans` VALUES ('9', '3', '', '', '3', '', '0');
INSERT INTO `slider_trans` VALUES ('10', '4', '', 'საუკეთესო პროდუქცია ნინიტასგან', '1', 'Ninita', '0');
INSERT INTO `slider_trans` VALUES ('11', '4', '', '', '2', '', '0');
INSERT INTO `slider_trans` VALUES ('12', '4', '', '', '3', '', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `phone` bigint(15) DEFAULT NULL,
  `user_group` int(10) DEFAULT 0,
  `avatar` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-inactive; 1-active; 2-banned',
  `role` tinyint(1) DEFAULT 1,
  `skype` varchar(50) DEFAULT NULL,
  `balance` decimal(6,2) DEFAULT 0.00,
  `discount` tinyint(2) DEFAULT 0,
  `referral` int(10) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT 0,
  `lastvisit_date` datetime DEFAULT NULL,
  `lastvisit_ip` varchar(50) NOT NULL DEFAULT '',
  `registred_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_group` (`user_group`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('3', 'beqa', 'Reenzler1234', 'beqa28282@gmail.com', null, null, null, '0', null, '1', '1', null, '0.00', '0', null, '0', null, '', '2018-09-22 22:31:25');
INSERT INTO `users` VALUES ('4', 'tamar', '96d82acde226357c7290ea52b26b8595', 'bjolbordi@gmail.com', null, null, null, '0', null, '1', '2', null, '0.00', '0', null, '0', null, '', '2018-09-22 22:37:51');
INSERT INTO `users` VALUES ('5', 'root', '96d82acde226357c7290ea52b26b8595', 'beqa28282@gmail.com', null, null, null, '0', null, '1', '2', null, '0.00', '0', null, '0', null, '', '2018-09-29 23:29:24');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT '',
  `alias` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('1', 'Super Admin', 'Super Admin');
INSERT INTO `user_roles` VALUES ('2', 'Administrator', 'admin');
INSERT INTO `user_roles` VALUES ('3', 'Normal User', 'user');
DROP TRIGGER IF EXISTS `add`;
DELIMITER ;;
CREATE TRIGGER `add` AFTER INSERT ON `products` FOR EACH ROW BEGIN
    INSERT IGNORE INTO pipedrive_added_products SET product_id = NEW.product_id;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update`;
DELIMITER ;;
CREATE TRIGGER `update` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
IF NEW.quantity != OLD.quantity OR NEW.price != OLD.price OR NEW.sale != OLD.sale OR NEW.code != OLD.code OR NEW.sku != OLD.sku
THEN
    INSERT IGNORE INTO pipedrive_edited_products SET product_id = OLD.product_id;
END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delete`;
DELIMITER ;;
CREATE TRIGGER `delete` BEFORE DELETE ON `products` FOR EACH ROW BEGIN
    INSERT IGNORE INTO pipedrive_deleted_products SET product_id = OLD.product_id;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_title`;
DELIMITER ;;
CREATE TRIGGER `update_title` AFTER UPDATE ON `products_trans` FOR EACH ROW BEGIN
IF NEW.title != OLD.title
THEN
    INSERT IGNORE INTO pipedrive_edited_products SET product_id = OLD.product_id;
END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `add_variant`;
DELIMITER ;;
CREATE TRIGGER `add_variant` AFTER INSERT ON `products_variants` FOR EACH ROW BEGIN
    INSERT IGNORE INTO pipedrive_added_products SET product_id = NEW.product_id, variant_id = NEW.variant_id;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_variant`;
DELIMITER ;;
CREATE TRIGGER `update_variant` BEFORE UPDATE ON `products_variants` FOR EACH ROW BEGIN
IF NEW.quantity != OLD.quantity OR NEW.price != OLD.price OR NEW.sale != OLD.sale OR NEW.code != OLD.code OR NEW.sku != OLD.sku
THEN
    INSERT IGNORE INTO pipedrive_edited_products SET product_id = OLD.product_id, variant_id = OLD.variant_id;
END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_variant`;
DELIMITER ;;
CREATE TRIGGER `delete_variant` BEFORE DELETE ON `products_variants` FOR EACH ROW BEGIN
    INSERT IGNORE INTO pipedrive_deleted_products SET product_id = OLD.product_id, variant_id = OLD.variant_id ;
END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
