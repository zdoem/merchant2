USE db_merchant;

CREATE TABLE `payment` (
  `PAY_INVOID` varchar(12) collate utf8_unicode_ci NOT NULL,
  `PAY_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `PAY_AMOUNT` float default NULL,
  `PAY_FLAG` varchar(1) collate utf8_unicode_ci default NULL,
  `PAY_TYPE` varchar(20) collate utf8_unicode_ci default NULL,
  `BANK_REF` varchar(40) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`PAY_INVOID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25551115001','2012-11-15 18:55:34',17000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550910001','2012-09-10 05:53:03',1000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550622002','2012-06-22 16:09:25',8500,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550622001','2012-06-22 14:35:40',0,'P','A',null);
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550607006','2012-06-07 16:43:45',0,'P','','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550607005','2012-06-07 13:50:44',0,'P','A',null);
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550607004','2012-06-07 11:41:37',100000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550607003','2012-06-07 11:12:09',500,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550607002','2012-06-07 10:11:23',3000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550607001','2012-06-07 10:00:24',200,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550606003','2012-06-06 18:01:25',222,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550606002','2012-06-06 17:47:19',20,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550606001','2012-06-06 17:38:50',50000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605012','2012-06-05 15:10:22',200,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605011','2012-06-05 15:06:09',2,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605010','2012-06-05 15:04:41',50,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605009','2012-06-05 15:02:45',500,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605008','2012-06-05 14:53:52',5000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605007','2012-06-05 14:52:28',500,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605006','2012-06-05 14:49:40',200,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605005','2012-06-05 14:47:45',500,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605004','2012-06-05 14:43:51',500,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605003','2012-06-05 14:35:38',5000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605002','2012-06-05 14:30:44',5000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550605001','2012-06-05 14:26:27',5000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550601005','2012-06-01 19:14:21',80000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550601004','2012-06-01 19:10:58',70000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550601003','2012-06-01 19:05:02',60000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550601002','2012-06-01 18:25:19',8900,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550530002','2012-05-30 16:53:31',0,'P','A',null);
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550530003','2012-05-30 17:25:10',5000,'A','C','');
insert into `payment`(`PAY_INVOID`,`PAY_DATE`,`PAY_AMOUNT`,`PAY_FLAG`,`PAY_TYPE`,`BANK_REF`) values ('25550601001','2012-06-01 17:07:06',20401.5,'A','C','');
