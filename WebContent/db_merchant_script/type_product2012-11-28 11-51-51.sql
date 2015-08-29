USE db_merchant;

CREATE TABLE `type_product` (
  `type_product_id` int(3) NOT NULL auto_increment,
  `type_product_name` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`type_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


insert into `type_product`(`type_product_id`,`type_product_name`) values (1,'office type');
insert into `type_product`(`type_product_id`,`type_product_name`) values (2,'Electronic');
insert into `type_product`(`type_product_id`,`type_product_name`) values (3,'Utility type product');
insert into `type_product`(`type_product_id`,`type_product_name`) values (4,'ทดสอบ');
insert into `type_product`(`type_product_id`,`type_product_name`) values (5,'ทดสอบอีกครั้ง');
insert into `type_product`(`type_product_id`,`type_product_name`) values (6,'ทดสอบ33');
insert into `type_product`(`type_product_id`,`type_product_name`) values (7,'ทด xxx');
insert into `type_product`(`type_product_id`,`type_product_name`) values (8,'123456');
insert into `type_product`(`type_product_id`,`type_product_name`) values (10,'88888888');
insert into `type_product`(`type_product_id`,`type_product_name`) values (12,'22222223333');
insert into `type_product`(`type_product_id`,`type_product_name`) values (13,'66666666xxxxx');
