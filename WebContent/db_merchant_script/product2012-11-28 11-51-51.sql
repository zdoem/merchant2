USE db_merchant;

CREATE TABLE `product` (
  `product_id` varchar(12) collate utf8_unicode_ci NOT NULL,
  `product_name` varchar(255) collate utf8_unicode_ci default NULL,
  `type_product_id` int(11) NOT NULL,
  `brand_product_id` int(3) NOT NULL,
  `price_cost` float default NULL,
  `price_sale` float default NULL,
  `product_item` int(7) default NULL,
  `product_date_start` date default NULL,
  `product_date_expire` date default NULL,
  `product_desc` varchar(255) collate utf8_unicode_ci default NULL,
  `delete_flag` varchar(1) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`product_id`),
  KEY `type_product_product` (`type_product_id`),
  KEY `brand_product_product` (`brand_product_id`),
  CONSTRAINT `brand_product_product` FOREIGN KEY (`brand_product_id`) REFERENCES `brand_product` (`brand_product_id`),
  CONSTRAINT `type_product_product` FOREIGN KEY (`type_product_id`) REFERENCES `type_product` (`type_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550511001','NIVEAxx01',8,16,300,400,11,'2555-05-11 00:00:00','2555-06-10 00:00:00','xxxx001',null);
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550511002','Panasonic TEL11',3,3,500,550,17,'2555-05-11 00:00:00','2555-06-11 00:00:00','yyyy',null);
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515001','RED CUP1',8,16,100,150,10,'2012-05-15 00:00:00','2012-05-16 00:00:00','ddddd',null);
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515002','HP NOTEBOOK PRO1',12,2,1000,15000,10,'2012-05-30 00:00:00','2012-05-31 00:00:00','dsfsdfsdf',null);
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515003','TEL PANASONIC1',8,3,1000,150000,25,'2012-05-10 00:00:00','2012-05-18 00:00:00','12sdfsdfsdf',null);
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515004','HTC smartphone#1',2,6,100,500,100,'2012-05-17 00:00:00','2012-05-23 00:00:00','dddddd',null);
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515005','NOTE BOOK Fujitsu1',2,2,600,8000,115,'2012-05-17 00:00:00','2012-05-31 00:00:00','sdfsdfasdf',null);
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515006','PANCIEL',13,3,222,300,22,'2012-05-18 00:00:00','2012-05-10 00:00:00','dfsdfsdf',null);
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515007','HP NOTEBOOK PRO2',12,15,50000,52000,60,'2555-05-11 00:00:00','2555-06-11 00:00:00','test','D');
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515008','KEYBOAD HP1',8,2,500,800,10,'2012-05-09 00:00:00','2012-05-18 00:00:00','fdgfsdfsdf',null);
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515009','CASE HP1',8,3,700,1500,40,'2012-05-10 00:00:00','2012-05-10 00:00:00','dsfsdfsdf',null);
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515010','MONITOR  HP1',8,2,2500,3500,100,'2012-05-29 00:00:00','2012-05-29 00:00:00','xxxxxxxxxxxxxxx','');
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515011','Magic RED',12,2,4554,5454,4554,'2012-05-11 00:00:00','2012-05-10 00:00:00','45454554',null);
insert into `product`(`product_id`,`product_name`,`type_product_id`,`brand_product_id`,`price_cost`,`price_sale`,`product_item`,`product_date_start`,`product_date_expire`,`product_desc`,`delete_flag`) values ('25550515012','CASIO EDIFICE',8,3,2000,2800.5,11,'2012-05-24 00:00:00','2012-05-30 00:00:00','00000000000000000000',null);
