USE db_merchant;

CREATE TABLE `purchase_item` (
  `unit` int(11) default NULL,
  `price` float default NULL,
  `tdate` datetime default NULL,
  `product_id` varchar(12) collate utf8_unicode_ci default NULL,
  `p_invoice` varchar(12) collate utf8_unicode_ci default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


insert into `purchase_item`(`unit`,`price`,`tdate`,`product_id`,`p_invoice`) values (500,50,'2012-06-22 14:45:20','25550515004','25550622001');
insert into `purchase_item`(`unit`,`price`,`tdate`,`product_id`,`p_invoice`) values (52000,30,'2012-06-22 14:45:20','25550515007','25550622001');
insert into `purchase_item`(`unit`,`price`,`tdate`,`product_id`,`p_invoice`) values (3500,50,'2012-06-22 14:45:20','25550515010','25550622001');
insert into `purchase_item`(`unit`,`price`,`tdate`,`product_id`,`p_invoice`) values (550,1,'2012-06-22 14:51:33','25550511002','25550622002');
insert into `purchase_item`(`unit`,`price`,`tdate`,`product_id`,`p_invoice`) values (400,4,'2012-06-22 15:04:51','25550511001','25550622003');
insert into `purchase_item`(`unit`,`price`,`tdate`,`product_id`,`p_invoice`) values (550,2,'2012-06-22 16:39:23','25550511002','25550622004');
insert into `purchase_item`(`unit`,`price`,`tdate`,`product_id`,`p_invoice`) values (400,3,'2012-06-22 16:39:23','25550511001','25550622004');
insert into `purchase_item`(`unit`,`price`,`tdate`,`product_id`,`p_invoice`) values (150000,10,'2012-06-22 16:39:23','25550515003','25550622004');
insert into `purchase_item`(`unit`,`price`,`tdate`,`product_id`,`p_invoice`) values (50,8000,'2012-09-10 05:56:11','25550515005','25550910001');
insert into `purchase_item`(`unit`,`price`,`tdate`,`product_id`,`p_invoice`) values (15,8000,'2012-11-15 19:00:29','25550515005','25551115001');
