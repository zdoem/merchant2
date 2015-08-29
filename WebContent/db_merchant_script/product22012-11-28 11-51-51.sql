USE db_merchant;

CREATE TABLE `product2` (
  `product_id` varchar(10) character set latin1 NOT NULL,
  `product_name` varchar(255) collate utf8_unicode_ci default NULL,
  `type_product_id` int(11) NOT NULL,
  `brand_product_id` int(3) NOT NULL,
  `price_cost` float default NULL,
  `price_sale` float default NULL,
  `product_item` int(7) default NULL,
  `product_date_start` date default NULL,
  `product_date_expire` date default NULL,
  `product_desc` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`product_id`),
  KEY `type_product_product` (`type_product_id`),
  KEY `brand_product_product` (`brand_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


