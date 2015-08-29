USE db_merchant;

CREATE TABLE `supplier` (
  `supp_id` int(5) NOT NULL auto_increment,
  `supp_company_name` varchar(255) collate utf8_unicode_ci default NULL,
  `supp_contact_name` varchar(255) collate utf8_unicode_ci default NULL,
  `supp_email` varchar(255) collate utf8_unicode_ci default NULL,
  `supp_tel` varchar(40) collate utf8_unicode_ci default NULL,
  `supp_mobile` varchar(40) collate utf8_unicode_ci default NULL,
  `supp_address` varchar(255) collate utf8_unicode_ci default NULL,
  `supp_desc` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`supp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


insert into `supplier`(`supp_id`,`supp_company_name`,`supp_contact_name`,`supp_email`,`supp_tel`,`supp_mobile`,`supp_address`,`supp_desc`) values (1,'USA computer','aaa  aaaaaa','ddd@ddd.com','0299999999','+66855555','dddd','xxxxxx');
insert into `supplier`(`supp_id`,`supp_company_name`,`supp_contact_name`,`supp_email`,`supp_tel`,`supp_mobile`,`supp_address`,`supp_desc`) values (2,'LH Bank22','bbbbb22','lh@lh.com22','029999222','+6682222','xxxxx222','rrrrrrrrrr2222');
insert into `supplier`(`supp_id`,`supp_company_name`,`supp_contact_name`,`supp_email`,`supp_tel`,`supp_mobile`,`supp_address`,`supp_desc`) values (3,'WWWW','WWW EEEE','EEEe@ddd.com','029999999','+66999999999999','sdddddd','ss');
insert into `supplier`(`supp_id`,`supp_company_name`,`supp_contact_name`,`supp_email`,`supp_tel`,`supp_mobile`,`supp_address`,`supp_desc`) values (4,'dfsdfsd','sdfsdfsd','fsdfsdf','sdfsdf','sdfsdf','sdfsdf','fsdfsdf');
insert into `supplier`(`supp_id`,`supp_company_name`,`supp_contact_name`,`supp_email`,`supp_tel`,`supp_mobile`,`supp_address`,`supp_desc`) values (5,'xxxxx','xxxxxxxx111111111111','xxxxx@xxxx.com','0288888888','+6699999999999','test xxx','test xxxx');
insert into `supplier`(`supp_id`,`supp_company_name`,`supp_contact_name`,`supp_email`,`supp_tel`,`supp_mobile`,`supp_address`,`supp_desc`) values (6,'5454','54654','4554654','6','6546','654','546546');
insert into `supplier`(`supp_id`,`supp_company_name`,`supp_contact_name`,`supp_email`,`supp_tel`,`supp_mobile`,`supp_address`,`supp_desc`) values (8,'asdfsdf','sdf','fsdaf','sdfsdf','dfasdfsda','sdfdsf','asdfsdf');
