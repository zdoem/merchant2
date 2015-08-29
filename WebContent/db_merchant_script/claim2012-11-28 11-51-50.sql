USE db_merchant;

CREATE TABLE `claim` (
  `c_invoice` varchar(10)  collate utf8_unicode_ci  NOT NULL,
  `c_date` datetime default NULL,
  `total_price` float default NULL,
  `total_unit` int(11) default NULL,
  `supp_id` int(5) default NULL,
  `usr_id` varchar(10)  collate utf8_unicode_ci  NULL,
  PRIMARY KEY  (`c_invoice`),
  KEY `supplier_claim` (`supp_id`),
  KEY `user_claim` (`usr_id`),
  CONSTRAINT `supplier_claim` FOREIGN KEY (`supp_id`) REFERENCES `supplier` (`supp_id`),
  CONSTRAINT `user_claim` FOREIGN KEY (`usr_id`) REFERENCES `user` (`usr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


