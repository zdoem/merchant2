USE db_merchant;

CREATE TABLE `ioder` (
  `o_invoice` varchar(14) collate utf8_unicode_ci NOT NULL,
  `o_date` date default NULL,
  `total_price` float default NULL,
  `total_unit` int(11) default NULL,
  `icus_id` varchar(12) collate utf8_unicode_ci default NULL,
  `iusr_id` varchar(12) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`o_invoice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25551115001','2012-11-15 00:00:00',16000,2,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550910001','2012-09-10 00:00:00',550,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550622002','2012-06-22 00:00:00',1200,6,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550622001','2012-06-22 00:00:00',175000,64,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550607006','2012-06-07 00:00:00',500,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550607005','2012-06-07 00:00:00',500,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550607004','2012-06-07 00:00:00',3500,7,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550607003','2012-06-07 00:00:00',2800.5,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550607002','2012-06-07 00:00:00',500,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550607001','2012-06-07 00:00:00',500,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550606003','2012-06-06 00:00:00',15000,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550606002','2012-06-06 00:00:00',15000,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550606001','2012-06-06 00:00:00',300,11,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605012','2012-06-05 00:00:00',7500,5,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605011','2012-06-05 00:00:00',1500,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605010','2012-06-05 00:00:00',1500,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605009','2012-06-05 00:00:00',1500,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605008','2012-06-05 00:00:00',1500,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605007','2012-06-05 00:00:00',1500,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605006','2012-06-05 00:00:00',5601,2,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605005','2012-06-05 00:00:00',4000,5,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605004','2012-06-05 00:00:00',2800.5,1,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605003','2012-06-05 00:00:00',4000,5,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605002','2012-06-05 00:00:00',1200000,13,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550605001','2012-06-05 00:00:00',1500,2,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550601005','2012-06-01 00:00:00',750000,10,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550601004','2012-06-01 00:00:00',300,4,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550601003','2012-06-01 00:00:00',16000,6,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550601002','2012-06-01 00:00:00',2000,11,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550529063','2012-05-29 00:00:00',1000,2,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550530001','2012-05-30 00:00:00',10500,5,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550530002','2012-05-30 00:00:00',10500,5,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550530003','2012-05-30 00:00:00',98000.5,3,'99999999999','11111111111');
insert into `ioder`(`o_invoice`,`o_date`,`total_price`,`total_unit`,`icus_id`,`iusr_id`) values ('25550601001','2012-06-01 00:00:00',1000,17,'99999999999','11111111111');
