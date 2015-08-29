USE db_merchant;

CREATE TABLE `user2` (
  `usr_id` varchar(12) collate utf8_unicode_ci NOT NULL,
  `usr_prefix` varchar(10) collate utf8_unicode_ci default NULL,
  `usr_fname` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_lname` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_tel` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_mobile` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_email` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_address` varchar(255) collate utf8_unicode_ci default NULL,
  `usr_login` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_password` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_activate` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_citizen_id` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_date` datetime NOT NULL,
  PRIMARY KEY  (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='InnoDB free: 11264 kB';


insert into `user2`(`usr_id`,`usr_prefix`,`usr_fname`,`usr_lname`,`usr_tel`,`usr_mobile`,`usr_email`,`usr_address`,`usr_login`,`usr_password`,`usr_activate`,`usr_citizen_id`,`usr_date`) values ('25550510001',null,'aa','aa','123','456','ddd@ddd.com','dddd','root','root','D','0123456789','2012-05-10 11:11:04');
insert into `user2`(`usr_id`,`usr_prefix`,`usr_fname`,`usr_lname`,`usr_tel`,`usr_mobile`,`usr_email`,`usr_address`,`usr_login`,`usr_password`,`usr_activate`,`usr_citizen_id`,`usr_date`) values ('25550510002',null,'aaa','aaa','aaa','aa','aa','aaa','daaa','aaaa','P','123455','2012-05-10 14:43:45');
insert into `user2`(`usr_id`,`usr_prefix`,`usr_fname`,`usr_lname`,`usr_tel`,`usr_mobile`,`usr_email`,`usr_address`,`usr_login`,`usr_password`,`usr_activate`,`usr_citizen_id`,`usr_date`) values ('25550510003',null,'bbb','bbb','bbb','bbb','bbbbb@bbb.ccc','bbbbb','bbb','bbb','P','123456','2012-05-10 14:44:46');
insert into `user2`(`usr_id`,`usr_prefix`,`usr_fname`,`usr_lname`,`usr_tel`,`usr_mobile`,`usr_email`,`usr_address`,`usr_login`,`usr_password`,`usr_activate`,`usr_citizen_id`,`usr_date`) values ('25550510004',null,'ccc','ccc','cccc','ccc','ccc@ccc.com','ccccccc','ccc','cccc','P','123456','2012-05-10 15:30:52');
insert into `user2`(`usr_id`,`usr_prefix`,`usr_fname`,`usr_lname`,`usr_tel`,`usr_mobile`,`usr_email`,`usr_address`,`usr_login`,`usr_password`,`usr_activate`,`usr_citizen_id`,`usr_date`) values ('25550510005',null,'eee','eeee','0255555555','+6684123456','eeeee@eee.com','ddddd','eee','eee','P','xcccccccccc','2012-05-11 11:08:02');
insert into `user2`(`usr_id`,`usr_prefix`,`usr_fname`,`usr_lname`,`usr_tel`,`usr_mobile`,`usr_email`,`usr_address`,`usr_login`,`usr_password`,`usr_activate`,`usr_citizen_id`,`usr_date`) values ('25550510006',null,'ffff','fff','123456','123456','ddfsdf@ddd.com','sdfsdf','fff','fff','D','123456','2012-05-10 15:31:35');
insert into `user2`(`usr_id`,`usr_prefix`,`usr_fname`,`usr_lname`,`usr_tel`,`usr_mobile`,`usr_email`,`usr_address`,`usr_login`,`usr_password`,`usr_activate`,`usr_citizen_id`,`usr_date`) values ('25550510007',null,'ssxxx','ssxx','02456789','+6684701456','dddd@dddd.com','ssxxx','ssssxxx','ssssxxxx','D','99999999','2012-05-11 11:07:11');
insert into `user2`(`usr_id`,`usr_prefix`,`usr_fname`,`usr_lname`,`usr_tel`,`usr_mobile`,`usr_email`,`usr_address`,`usr_login`,`usr_password`,`usr_activate`,`usr_citizen_id`,`usr_date`) values ('25550511001',null,'d','dddddddddddddddd','d','dd','d','ddd','ddddd','dd','P','dd','2012-05-11 13:35:25');
insert into `user2`(`usr_id`,`usr_prefix`,`usr_fname`,`usr_lname`,`usr_tel`,`usr_mobile`,`usr_email`,`usr_address`,`usr_login`,`usr_password`,`usr_activate`,`usr_citizen_id`,`usr_date`) values ('25550511002',null,'erwer','rrwer','werwer','werwe','rwerwe','werwer','werwer','werwer','P','wer','2012-05-11 13:35:43');
insert into `user2`(`usr_id`,`usr_prefix`,`usr_fname`,`usr_lname`,`usr_tel`,`usr_mobile`,`usr_email`,`usr_address`,`usr_login`,`usr_password`,`usr_activate`,`usr_citizen_id`,`usr_date`) values ('25550511003',null,'dddxx1111111','11111111111','xxxx111','xxx111','xxx11','xx111','xxx111','xxx1111111111','P','xxxx111','2012-05-11 13:40:00');
