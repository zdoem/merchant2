USE db_merchant;

CREATE TABLE `customers` (
  `cus_id` char(12) character set latin1 NOT NULL,
  `cus_prefix` varchar(10) collate utf8_unicode_ci default NULL,
  `cus_fname` varchar(40) collate utf8_unicode_ci default NULL,
  `cus_lname` varchar(40) collate utf8_unicode_ci default NULL,
  `cus_tel` varchar(40) collate utf8_unicode_ci default NULL,
  `cus_mobile` varchar(40) collate utf8_unicode_ci default NULL,
  `cus_email` varchar(40) collate utf8_unicode_ci default NULL,
  `cus_address` varchar(255) collate utf8_unicode_ci default NULL,
  `cus_flag` varchar(1) collate utf8_unicode_ci default NULL,
  `cus_start_date` datetime default NULL,
  `cus_comment` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550508001',null,'faaaaaaa','laaaaaaaaa','02xxxxxxxx','+66xxxxxxxxxx',null,'aaaaaaaa','0',null,'123dddddddddd');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550508002',null,'aa','ddd','02xxxxx','+66xxxxx','ddd@ddd.com','dddd','0','2012-05-08 17:42:51','ddfsdf');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550509001',null,'bbbbbbb','ccccccc','0588888888','0+66xxxxxx','ddddd@ddd.com','ddddddddddddddxxxxxxxxxxxx
ddddddddddddxxx','0','2012-05-09 13:29:39','ddddddddxxcvdfsdv');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550509002',null,'ddd','ddddddd','222222222','333333333','dddd@ddd.com','d333333333333','0','2012-05-09 13:30:41','sssssssssss');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550509003',null,'00','00','00','00','dddd@ddd.com','00','0','2012-05-09 13:31:03','00');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550509004',null,'ssdf','sdfsdf','dfsdf','sdfsdfsdf','sdfsdf','fsd','0','2012-05-09 13:31:17','sdfsdf');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550509005',null,'ttttttttt','tttttttttttttttt','02666666666','084ttttttttttttt','dddd@ddd.com','ddd','0','2012-05-09 13:31:42','xxx');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550509006',null,'wwww','wwww','0255555555','084555555','dddd@dd.com','sdfsdf','0','2012-05-09 13:31:59','sdfsdf');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550509007',null,'aaaaaa','aaaaaaaaaa','00000000000000','111111111111','dddd@ddd.com','aaaaaaaaaaaaaaa','0','2012-05-09 13:32:24','bbbbbbbbbbbbbbbbb');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550509008',null,'ffff000','fff000','f0522000','55555555000','ffff@dfddd.com00','asdf00','0','2012-05-09 13:32:46','asdfsdf000');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550509010',null,'sdfsdf','sdfsdf','sdfsdf','sdfsdf','sdfsdfdsf@dddfsdfsdf','sdfsdf','0','2012-05-09 13:33:22','sdfsdf');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550509012',null,'sdfsdf','xxx','dfsdf','xxx','sdfsdf','xxx','0','2012-05-09 13:33:47','dfsdfsdf');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550509013',null,'sdfsdf','sdfsdf','sdfsdf','sdfsdf','sdfsdf','sdfsdf','0','2012-05-09 13:34:00','sdfsdf');
insert into `customers`(`cus_id`,`cus_prefix`,`cus_fname`,`cus_lname`,`cus_tel`,`cus_mobile`,`cus_email`,`cus_address`,`cus_flag`,`cus_start_date`,`cus_comment`) values ('25550510001',null,'ddd','dd','ddd','dd','dd','ddd','0','2012-05-10 14:34:44',null);
