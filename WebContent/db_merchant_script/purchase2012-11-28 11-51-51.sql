USE db_merchant;

CREATE TABLE `purchase` (
  `p_invoice` varchar(12) collate utf8_unicode_ci NOT NULL default '',
  `p_date` date default NULL,
  `total_unit` int(11) default NULL,
  `total_price` float default NULL,
  `supp_id` varchar(12) collate utf8_unicode_ci default NULL,
  `usr_id` varchar(12) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`p_invoice`),
  KEY `supplier_purchase` (`supp_id`),
  KEY `user_purchase` (`usr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


insert into `purchase`(`p_invoice`,`p_date`,`total_unit`,`total_price`,`supp_id`,`usr_id`) values ('25550622001','2012-06-22 00:00:00',175000,130,'99999999999','11111111111');
insert into `purchase`(`p_invoice`,`p_date`,`total_unit`,`total_price`,`supp_id`,`usr_id`) values ('25550622002','2012-06-22 00:00:00',550,1,'99999999999','11111111111');
insert into `purchase`(`p_invoice`,`p_date`,`total_unit`,`total_price`,`supp_id`,`usr_id`) values ('25550622003','2012-06-22 00:00:00',1600,4,'99999999999','11111111111');
insert into `purchase`(`p_invoice`,`p_date`,`total_unit`,`total_price`,`supp_id`,`usr_id`) values ('25550622004','2012-06-22 00:00:00',1500000,15,'99999999999','11111111111');
insert into `purchase`(`p_invoice`,`p_date`,`total_unit`,`total_price`,`supp_id`,`usr_id`) values ('25550910001','2012-09-10 00:00:00',400000,50,'99999999999','11111111111');
insert into `purchase`(`p_invoice`,`p_date`,`total_unit`,`total_price`,`supp_id`,`usr_id`) values ('25551115001','2012-11-15 00:00:00',120000,15,'99999999999','11111111111');
