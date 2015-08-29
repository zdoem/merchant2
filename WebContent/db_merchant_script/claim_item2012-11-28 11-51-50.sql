CREATE TABLE `claim_item` (
  `unit` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `tdate` datetime DEFAULT NULL,
  `c_invoice` varchar(10)  COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` varchar(10)  COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `claim_claim_item` (`c_invoice`),
  KEY `product_claim_item` (`product_id`),
  CONSTRAINT `claim_claim_item` FOREIGN KEY (`c_invoice`) REFERENCES `claim` (`c_invoice`),
  CONSTRAINT `product_claim_item` FOREIGN KEY (`product_id`) REFERENCES `product2` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;