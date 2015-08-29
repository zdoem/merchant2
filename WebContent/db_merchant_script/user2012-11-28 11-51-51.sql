USE db_merchant;

CREATE TABLE `user` (
  `usr_id` varchar(10) character set latin1 NOT NULL,
  `usr_prefix` varchar(10) collate utf8_unicode_ci default NULL,
  `usr_fname` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_lname` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_tel` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_mobile` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_email` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_address` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_login` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_password` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_activate` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_citizen_id` varchar(40) collate utf8_unicode_ci default NULL,
  `usr_date` datetime default NULL,
  PRIMARY KEY  (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


