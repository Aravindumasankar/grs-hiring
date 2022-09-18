#
# TABLE STRUCTURE FOR: admin_groups
#

DROP TABLE IF EXISTS `admin_groups`;

CREATE TABLE `admin_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('1', 'webmaster', 'Webmaster');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('2', 'hiring', 'Hiring Manager');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('3', 'manager', 'Manager');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('4', 'staff', 'Technical Staff');


#
# TABLE STRUCTURE FOR: admin_login_attempts
#

DROP TABLE IF EXISTS `admin_login_attempts`;

CREATE TABLE `admin_login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: admin_users
#

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('1', '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, NULL, NULL, NULL, NULL, NULL, '1451900190', '1663480838', '1', 'Recruitment Admin', NULL);
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('2', '127.0.0.1', 'swati.priyadarshini@hpe.com', '$2y$08$tsk5rBprKh4/80qB/2UyheJhnxrkXkMJq7UiVaA/otis/Jx6Rnj5G', NULL, 'swati.priyadarshini@hpe.com', NULL, NULL, NULL, NULL, '1451900228', '1662555351', '1', 'Swati', 'Priyadarshini');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('3', '127.0.0.1', 'anand.chettri@hpe.com', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, 'anand.chettri@hpe.com', NULL, NULL, NULL, NULL, '1451900430', '1465489585', '1', 'Anand', 'Chetri');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('5', '::1', 'aravind-umasankar@hpe.com', '$2y$08$P5SERts3mQh/951bnjfxQ.usJd7hyczy//PSsZ8CbMN/bbudT.61q', NULL, 'aravind-umasankar@hpe.com', NULL, NULL, NULL, NULL, '1662392779', NULL, '1', 'Aravind', 'Umasankar');


#
# TABLE STRUCTURE FOR: admin_users_groups
#

DROP TABLE IF EXISTS `admin_users_groups`;

CREATE TABLE `admin_users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('1', '1', '1');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('2', '2', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('3', '3', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('4', '4', '4');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('5', '5', '4');


#
# TABLE STRUCTURE FOR: api_access
#

DROP TABLE IF EXISTS `api_access`;

CREATE TABLE `api_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: api_keys
#

DROP TABLE IF EXISTS `api_keys`;

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES ('1', '0', 'anonymous', '1', '1', '0', NULL, '1463388382');


#
# TABLE STRUCTURE FOR: api_limits
#

DROP TABLE IF EXISTS `api_limits`;

CREATE TABLE `api_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: api_logs
#

DROP TABLE IF EXISTS `api_logs`;

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: cover_photos
#

DROP TABLE IF EXISTS `cover_photos`;

CREATE TABLE `cover_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos` int(11) NOT NULL DEFAULT '0',
  `image_url` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','hidden') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `cover_photos` (`id`, `pos`, `image_url`, `status`) VALUES ('1', '2', '45296-2.jpg', 'active');
INSERT INTO `cover_photos` (`id`, `pos`, `image_url`, `status`) VALUES ('2', '1', '2934f-1.jpg', 'active');
INSERT INTO `cover_photos` (`id`, `pos`, `image_url`, `status`) VALUES ('3', '3', '3717d-3.jpg', 'active');


#
# TABLE STRUCTURE FOR: groups
#

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `groups` (`id`, `name`, `description`) VALUES ('1', 'members', 'General User');


#
# TABLE STRUCTURE FOR: job_business_units
#

DROP TABLE IF EXISTS `job_business_units`;

CREATE TABLE `job_business_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BU` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `job_business_units` (`id`, `BU`) VALUES ('1', 'MFA');
INSERT INTO `job_business_units` (`id`, `BU`) VALUES ('2', 'ET');
INSERT INTO `job_business_units` (`id`, `BU`) VALUES ('3', 'Core');
INSERT INTO `job_business_units` (`id`, `BU`) VALUES ('4', 'GPST');
INSERT INTO `job_business_units` (`id`, `BU`) VALUES ('5', 'OS');
INSERT INTO `job_business_units` (`id`, `BU`) VALUES ('6', 'UIDAI');


#
# TABLE STRUCTURE FOR: job_candidates
#

DROP TABLE IF EXISTS `job_candidates`;

CREATE TABLE `job_candidates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_posts_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `resume` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `job_candidates` (`id`, `job_posts_id`, `name`, `resume`) VALUES ('1', '2', 'Debashree Sarkar', '698e3-sarkar_resume.docx');


#
# TABLE STRUCTURE FOR: job_categories
#

DROP TABLE IF EXISTS `job_categories`;

CREATE TABLE `job_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `job_categories` (`id`, `title`) VALUES ('1', 'HYBRID CLOUD CONSULTING');
INSERT INTO `job_categories` (`id`, `title`) VALUES ('2', 'HYBRID CLOUD ENGINEERING');
INSERT INTO `job_categories` (`id`, `title`) VALUES ('3', 'GREENLAKE PLATFORM');
INSERT INTO `job_categories` (`id`, `title`) VALUES ('4', 'AI & DATA SCIENCE');


#
# TABLE STRUCTURE FOR: job_deal_projects
#

DROP TABLE IF EXISTS `job_deal_projects`;

CREATE TABLE `job_deal_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('1', 'Telefonica');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('2', 'Multiple FLP');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('3', 'DATA MAP');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('4', 'DATA office');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('5', 'KSO');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('6', 'CTP - Morgan Stanley');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('7', 'Tesco');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('8', 'WW CNC Containers');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('9', 'ORGI');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('10', 'Transformation');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('11', 'AG Insurance');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('12', 'HCFG');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('13', 'GSE');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('14', 'Apps Packaging _ Morgan Stanley');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('15', 'Delta');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('16', 'GPST');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('17', 'Pointnext CAE');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('18', 'Werder Bremen');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('19', 'BCI');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('20', 'Globe Tel');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('21', 'Globe Tel, Disney, West Jet');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('22', 'Barclay/A&O');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('23', 'USCC');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('24', 'Backfill');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('25', 'Investment');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('26', 'Vodafone Qatar');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('27', 'Solution 360');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('28', 'CRIS');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('29', 'Customer Engagement Portal');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('30', 'Danfoss/Biogen/Nokia/BICS');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('31', 'Vodafone Ziggo');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('32', 'Global Solution Hub A&PS');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('33', 'THD');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('34', 'Smart IRD');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('35', 'GFIT');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('36', 'Solution Hub');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('37', 'ACESO');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('38', 'Evil Genius');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('39', 'J&J');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('40', 'UOB');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('41', 'Vodafone Italy');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('42', 'TechAdmy Platform (one of the enabler platform for GRS Skill transformation Program)');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('43', 'Centene');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('44', 'Japan - CC - Solution Hub');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('45', 'NSE/ICICI/Airbus/FCL/REI');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('46', 'HCFG / GMS');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('47', 'GLWAS');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('48', 'AbnBev');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('49', 'Danfoss');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('50', 'AXA');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('51', 'Internal');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('52', 'Dataspace');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('53', 'Trinity');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('54', 'BMW');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('55', 'Carestreem - App Modernisation');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('56', 'Woolworth');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('57', 'LIC');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('58', 'IOCL');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('59', 'RMA/Development/A&O');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('60', 'Barclay\'s');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('61', 'GreenLake Platform support');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('62', 'Transgourmet');
INSERT INTO `job_deal_projects` (`id`, `project`) VALUES ('63', 'UIDAI');


#
# TABLE STRUCTURE FOR: job_hiring_managers
#

DROP TABLE IF EXISTS `job_hiring_managers`;

CREATE TABLE `job_hiring_managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('1', 'Kuna, Naga vanaja', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('2', 'K., Carey Theophilus', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('3', 'Biswas, Arpan', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('4', 'Chettri, Anand', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('5', 'Jha, Sweta', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('6', 'Kanakarajan, Divakar', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('7', 'Mallikarjunaiah, Channappa', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('8', 'A, Yuvaraja', 'yuvaraja.a@hpe.com');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('9', 'Bangi, Eswara Prasad', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('10', 'Mookaiah, Balasubramanian', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('11', 'Chearie, Arun V.', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('12', 'KN, Ramesh', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('13', 'Tandon, Amit ', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('14', 'R, Sudhir', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('15', 'D\'Souza, Brian Terence', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('16', 'Srivastava, Vibhu', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('17', 'Anand, Ashish', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('18', 'Singh, Vibhu Vaibhava', '');
INSERT INTO `job_hiring_managers` (`id`, `manager`, `email`) VALUES ('19', 'N, Anil NV', '');


#
# TABLE STRUCTURE FOR: job_locations
#

DROP TABLE IF EXISTS `job_locations`;

CREATE TABLE `job_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `job_locations` (`id`, `location`) VALUES ('1', 'Bangalore');
INSERT INTO `job_locations` (`id`, `location`) VALUES ('2', 'Pune');
INSERT INTO `job_locations` (`id`, `location`) VALUES ('3', 'Delhi');
INSERT INTO `job_locations` (`id`, `location`) VALUES ('4', 'Europe');
INSERT INTO `job_locations` (`id`, `location`) VALUES ('5', 'North America');
INSERT INTO `job_locations` (`id`, `location`) VALUES ('6', 'Pan India');
INSERT INTO `job_locations` (`id`, `location`) VALUES ('7', 'Mumbai');
INSERT INTO `job_locations` (`id`, `location`) VALUES ('8', 'HDC');


#
# TABLE STRUCTURE FOR: job_posts
#

DROP TABLE IF EXISTS `job_posts`;

CREATE TABLE `job_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `badge_request_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rcms_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `requisition` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `hiring_manager` int(11) NOT NULL,
  `practice_manager` int(11) NOT NULL,
  `business_unit` int(11) NOT NULL,
  `project` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `practice` int(11) NOT NULL,
  `sub_practice` int(11) NOT NULL,
  `content_brief` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `request_dates` date NOT NULL,
  `publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('1', '', '', '', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Closed', '2021-05-03', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('2', '', '1090265.0', 'SEUR_210707_4762', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Active', '2021-05-03', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('3', '', '1116744.0', 'SEUR_210707_4762', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Active', '2021-05-03', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('4', '', '1096174.0', 'SEUR_210707_4762', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Closed', '2021-05-03', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('5', '', '', 'SEUR_210707_4762', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Active', '2021-05-03', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('6', '', '', 'SEUR_210707_4762', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Active', '2021-05-03', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('7', '', '', '', '', '2', '2', '2', '2', '', '2', '18', '', '', 'Closed', '2021-12-20', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('8', '', '1119656.0', 'WWA_220413_5484', '', '2', '2', '2', '3', '', '2', '18', '', '', 'Active', '2021-12-20', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('9', '', '', '', '', '2', '2', '2', '2', '', '2', '19', '', '', 'Closed', '2021-12-20', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('10', '', '', '', '', '2', '2', '2', '2', '', '2', '19', '', '', 'Closed', '2021-12-20', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('11', '', '', 'WWA_210115_4232', '', '2', '2', '2', '0', '', '2', '19', '', '', 'Active', '2021-12-20', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('12', '', '', '', '', '3', '3', '2', '5', '', '3', '20', '', '', 'Closed', '2022-01-14', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('13', '', '', '', '', '3', '3', '2', '5', '', '3', '20', '', '', 'Closed', '2022-01-14', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('14', '', '', '', '', '3', '3', '2', '5', '', '3', '20', '', '', 'Closed', '2022-01-14', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('15', '', '1113254.0', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-02-01', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('16', '', '', 'NOAM_191212_3622', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('17', '', '', 'NOAM_191212_3623', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('18', '', '', 'NOAM_191212_3624', '', '4', '4', '2', '6', '', '4', '21', '', '', 'On-Hold', '2022-08-23', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('19', '', '1106993.0', 'UKIMESA_211012_4996', '', '4', '2', '2', '7', '', '0', '0', '', '', 'Closed', '2022-02-07', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('20', '', '1126166.0', 'UKIMESA_211012_4996', '', '4', '2', '2', '7', '', '0', '0', '', '', 'Active', '2022-02-07', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('21', '', '1111183.0', 'UKIMESA_211012_4996', '', '4', '2', '2', '7', '', '0', '0', '', '', 'Active', '2022-02-07', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('22', '', '1119612.0', 'UKIMESA_211012_4996', '', '4', '2', '2', '7', '', '0', '0', '', '', 'Active', '2022-09-09', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('23', '', '1111184.0', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Closed', '2022-02-18', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('24', '', '1111186.0', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('25', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('26', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('27', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('28', '', '1119603.0', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('29', '', '1113255.0', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('30', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('31', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:25');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('32', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('33', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('34', '', '1116754.0', 'WWA_220720_5789', '', '4', '5', '2', '8', '', '5', '2', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('35', '', '', 'WWA_220720_5789', '', '4', '5', '2', '8', '', '5', '2', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('36', '', '1119613.0', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-02-18', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('37', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Closed', '2022-02-18', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('38', '', '1119823.0', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-03-03', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('39', '', '', 'WWA_220720_5789', '', '6', '6', '2', '10', '', '0', '0', '', '', 'On-Hold', '2022-03-03', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('40', '', '', 'NWE_220225_5334 ', '', '1', '1', '1', '11', '', '1', '17', '', '', 'Closed', '2022-03-07', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('41', '', '1119615.0', 'NWE_220225_5334 ', '', '1', '1', '1', '11', '', '1', '17', '', '', 'Active', '2022-03-07', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('42', '', '1119691.0', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-03-16', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('43', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('44', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('45', '', '', 'DACH_220218_5302', '', '4', '4', '2', '12', '', '4', '21', '', '', 'On-Hold', '2022-04-21', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('46', '', '', 'IND_201110_4128', '', '4', '2', '2', '13', '', '2', '19', '', '', 'On-Hold', '2022-04-28', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('47', '', '', 'IND_201110_4128', '', '4', '4', '2', '13', '', '4', '4', '', '', 'On-Hold', '2022-04-28', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('48', '', '', '', '', '7', '7', '3', '14', '', '6', '5', '', '', 'Closed', '2022-04-30', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('49', '', '', '', '', '7', '7', '3', '14', '', '6', '5', '', '', 'Closed', '2022-04-30', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('50', '', '', 'WWA_211119_5099', '', '3', '3', '2', '15', '', '3', '20', '', '', 'Closed', '2022-05-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('51', '', '', 'WWA_220801_5823', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-05-10', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('52', '', '', 'WWA_220801_5823', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-05-10', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('53', '', '', 'WWA_220801_5823', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-05-10', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('54', '', '', 'WWA_220801_5823', '', '3', '3', '2', '17', '', '3', '20', '', '', 'Active', '2022-05-16', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('55', '', '', 'WWA_220801_5823', '', '3', '3', '2', '17', '', '3', '20', '', '', 'Active', '2022-05-16', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('56', '', '', 'WWA_220801_5823', '', '3', '3', '2', '17', '', '3', '20', '', '', 'Active', '2022-05-16', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('57', '', '', 'WWA_220801_5823', '', '3', '3', '2', '17', '', '3', '20', '', '', 'Active', '2022-05-16', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('58', '', '', 'WWA_220801_5823', '', '3', '3', '2', '17', '', '3', '20', '', '', 'Active', '2022-05-16', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('59', '', '1119601.0', ' \nDACH_220218_5302', '', '2', '2', '2', '18', '', '2', '3', '', '', 'Active', '2022-05-20', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('60', '', '', '', '', '8', '4', '2', '19', '', '4', '7', '', '', 'Closed', '2022-05-24', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('61', '', '', '', '', '8', '4', '2', '19', '', '4', '7', '', '', 'Closed', '2022-05-24', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('62', '', '', 'LATAM_220223_5331', '', '8', '4', '2', '19', '', '4', '7', '', '', 'Active', '2022-05-24', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('63', '', '', 'WWA_220905_5909', '', '3', '3', '2', '5', '', '3', '20', '', '', 'On-Hold', '2022-05-25', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('64', '', '1113261.0', 'APAC_211117_5086', '', '9', '5', '3', '20', '', '5', '2', '', '', 'Active', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('65', '', '', 'APAC_211117_5086', '', '9', '5', '3', '21', '', '5', '2', '', '', 'Closed', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('66', '', '1113256.0', 'NOAM_220802_5826', '', '9', '5', '3', '21', '', '5', '2', '', '', 'Active', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('67', '', '', 'NOAM_220802_5826', '', '9', '5', '3', '21', '', '5', '2', '', '', 'Active', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('68', '', '', 'WWA_220801_5823', '', '10', '5', '3', '22', '', '5', '2', '', '', 'Active', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('69', '', '1106992.0', 'WWA_220801_5823', '', '10', '5', '3', '22', '', '5', '2', '', '', 'Active', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('70', '', '1119581.0', 'NOAM_211028_5036', '', '9', '5', '3', '23', '', '5', '2', '', '', 'On-Hold', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('71', '', '', 'NOAM_211028_5036', '', '9', '5', '3', '23', '', '5', '2', '', '', 'On-Hold', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('72', '', '', 'NOAM_211028_5036', '', '9', '5', '3', '23', '', '5', '2', '', '', 'On-Hold', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('73', '', '', 'WWA_220801_5823', '', '4', '4', '2', '2', '', '4', '4', '', '', 'Closed', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('74', '', '', 'WWA_220801_5823', '', '4', '4', '2', '13', '', '4', '4', '', '', 'Closed', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('75', '', '', 'WWA_220801_5823', '', '4', '4', '2', '13', '', '4', '4', '', '', 'Closed', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('76', '', '1119618.0', 'WWA_220801_5823', '', '4', '4', '2', '13', '', '4', '4', '', '', 'On-Hold', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('77', '', '', 'WWA_220801_5823', '', '4', '4', '2', '13', '', '4', '4', '', '', 'Active', '2022-06-02', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('78', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Active', '2022-06-14', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('79', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Active', '2022-06-14', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('80', '', '', '', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Closed', '2022-06-14', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('81', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-06-14', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('82', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-06-14', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('83', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-06-14', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('84', '', '1096183.0', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-06-15', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('85', '', '1126143.0', '', '', '11', '2', '2', '25', '', '2', '19', '', '', 'Active', '2022-06-20', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('86', '', '', '', '', '11', '2', '2', '25', '', '2', '19', '', '', 'Active', '2022-06-20', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('87', '', '', '\nSEUR_210420_4542', '', '12', '7', '3', '26', '', '6', '8', '', '', 'Active', '2022-06-21', '2022-09-18 12:51:26');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('88', '', '', 'WWA_211118_5091', '', '3', '3', '2', '27', '', '3', '20', '', '', 'Active', '2022-06-22', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('89', '', '', 'IND_220718_5771', '', '8', '4', '2', '28', '', '4', '7', '', '', 'Closed', '2022-06-29', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('90', '', '', 'APAC_220317_5411', '', '3', '3', '2', '27', '', '3', '20', '', '', 'Active', '2022-07-06', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('91', '', '', 'WWA_211119_5099', '', '3', '3', '2', '15', '', '3', '20', '', '', 'Active', '2022-07-06', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('92', '', '', 'WWA_211210_5154', '', '3', '3', '2', '29', '', '3', '20', '', '', 'Active', '2022-07-06', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('93', '', '', 'WWA_220801_5823', '', '12', '7', '3', '30', '', '6', '9', '', '', 'Active', '2022-07-11', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('94', '', '', 'NWE_211025_5031', '', '10', '5', '3', '31', '', '5', '2', '', '', 'Active', '2022-07-11', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('95', '', '', 'WWA_211118_5091', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Active', '2022-07-11', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('96', '', '', 'WWA_211118_5091', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Closed', '2022-07-11', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('97', '', '', 'WWA_211118_5091', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Active', '2022-07-11', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('98', '', '', 'WWA_211118_5091', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Active', '2022-07-11', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('99', '', '', 'NOAM_210823_4869', '', '12', '7', '3', '33', '', '6', '9', '', '', 'Active', '2022-07-12', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('100', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('101', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('102', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('103', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('104', '', '', '', '', '8', '4', '2', '34', '', '4', '7', '', '', 'Closed', '2022-07-13', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('105', '', '', 'WWA_220817_5886', '', '8', '4', '2', '34', '', '4', '7', '', '', 'Active', '2022-07-13', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('106', '', '1116776.0', 'WWA_211119_5099', '', '3', '3', '2', '15', '', '4', '7', '', '', 'Active', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('107', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Closed', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('108', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Closed', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('109', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('110', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('111', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('112', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('113', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('114', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('115', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('116', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('117', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('118', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('119', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Closed', '2022-07-15', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('120', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Closed', '2022-07-15', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('121', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Active', '2022-07-15', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('122', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Closed', '2022-07-15', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('123', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Active', '2022-07-15', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('124', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Active', '2022-07-15', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('125', '', '1126147.0', 'APAC_220317_5411', '', '6', '6', '2', '32', '', '3', '13', '', '', 'Active', '2022-07-20', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('126', '', '', 'APAC_220317_5411', '', '6', '6', '2', '32', '', '3', '13', '', '', 'On-Hold', '2022-07-20', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('127', '', '', 'APAC_220317_5411', '', '6', '6', '2', '32', '', '3', '13', '', '', 'On-Hold', '2022-07-20', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('128', '', '', 'APAC_220317_5411', '', '6', '6', '2', '32', '', '3', '13', '', '', 'On-Hold', '2022-07-20', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('129', '', '', 'APAC_220317_5411', '', '6', '6', '2', '32', '', '3', '13', '', '', 'On-Hold', '2022-07-20', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('130', '', '', 'NOAM_220516_5588', '', '11', '2', '2', '37', '', '2', '18', '', '', 'Closed', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('131', 'High', '', 'NOAM_220516_5588', '', '11', '2', '2', '37', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('132', 'High', '', 'NOAM_220516_5588', '', '11', '2', '2', '37', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('133', 'High', '', 'WWA_220801_5823', '', '11', '2', '2', '38', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('134', 'High', '', 'WWA_220801_5823', '', '11', '2', '2', '38', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('135', 'High', '', 'WWA_220801_5823', '', '11', '2', '2', '38', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('136', 'High', '', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('137', 'High', '', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('138', 'High', '1119616.0', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '19', '', '', 'Active', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('139', 'High', '', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '19', '', '', 'Active', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('140', 'High', '', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '19', '', '', 'Active', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('141', 'High', '', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '19', '', '', 'Active', '2022-07-21', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('142', 'High', '1096212.0', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-07-25', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('143', '', '', 'APAC_220317_5411', '', '3', '3', '2', '27', '', '3', '20', '', '', 'Active', '2022-07-26', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('144', '', '', 'APAC_220317_5411', '', '3', '3', '2', '27', '', '3', '20', '', '', 'Active', '2022-07-26', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('145', '', '1113262.0', 'APAC_210620_4725', '', '4', '4', '2', '40', '', '4', '4', '', '', 'Active', '2022-07-28', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('146', '', '', 'APAC_210620_4725', '', '4', '4', '2', '40', '', '4', '4', '', '', 'Active', '2022-07-28', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('147', '', '', '', '', '7', '7', '3', '14', '', '6', '5', '', '', 'Closed', '2022-07-29', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('148', '', '', 'UKIMESA_211214_5165', '', '7', '7', '3', '14', '', '6', '5', '', '', 'Active', '2022-07-29', '2022-09-18 12:51:27');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('149', 'High', '', ' \nDACH_220218_5302', '', '2', '2', '2', '18', '', '2', '3', '', '', 'Closed', '2022-08-02', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('150', '', '', 'SEUR_210420_4542', '', '12', '7', '3', '41', '', '6', '9', '', '', 'Active', '2022-08-04', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('151', '', '', '', '', '15', '8', '5', '42', '', '8', '14', '', '', 'Active', '2022-08-05', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('152', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-08-05', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('153', '', '', '', '', '16', '0', '3', '43', '', '0', '0', '', '', 'On-Hold', '2022-08-09', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('154', 'High', '', 'JPN_191113_3578', '', '17', '3', '3', '44', '', '3', '15', '', '', 'Active', '2022-08-09', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('155', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('156', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('157', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('158', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('159', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('160', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('161', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('162', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('163', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('164', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('165', 'High', '', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-08-16', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('166', 'High', '1119606.0', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-08-16', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('167', '', '', 'WWA_211119_5099', '', '3', '3', '2', '15', '', '4', '7', '', '', 'Active', '2022-08-17', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('168', '', '', 'DACH_191212_3622', '', '2', '2', '2', '46', '', '2', '3', '', '', 'Closed', '2022-08-17', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('169', 'High', '', ' \nDACH_220218_5302', '', '2', '2', '2', '18', '', '2', '3', '', '', 'Closed', '2022-08-17', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('170', 'High', '', ' \nDACH_220218_5302', '', '2', '2', '2', '18', '', '2', '3', '', '', 'Active', '2022-08-17', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('171', '', '', 'WWA_220203_5245', '', '8', '4', '2', '47', '', '4', '7', '', '', 'Active', '2022-08-18', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('172', '', '', 'NWE_220725_5815', '', '8', '4', '2', '48', '', '4', '7', '', '', 'Closed', '2022-08-18', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('173', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Active', '2022-08-24', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('174', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Active', '2022-08-24', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('175', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Active', '2022-08-24', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('176', '', '', '', '', '12', '7', '3', '30', '', '6', '9', '', '', 'Active', '2022-08-24', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('177', '', '', '', '', '12', '7', '3', '30', '', '6', '9', '', '', 'Active', '2022-08-24', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('178', '', '', '', '', '4', '4', '2', '50', '', '4', '21', '', '', 'Active', '2022-08-24', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('179', '', '', '', '', '4', '4', '2', '50', '', '4', '21', '', '', 'Active', '2022-08-24', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('180', '', '', '', '', '4', '4', '2', '50', '', '4', '21', '', '', 'Active', '2022-08-24', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('181', '', '1119599.0', '', '', '4', '4', '2', '50', '', '4', '21', '', '', 'Active', '2022-08-24', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('182', '', '', '', '', '18', '9', '5', '51', '', '0', '0', '', '', 'Closed', '2022-08-25', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('183', 'High', '', '', '', '2', '2', '2', '52', '', '2', '18', '', '', 'Active', '2022-08-26', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('184', 'High', '', '', '', '2', '2', '2', '18', '', '2', '3', '', '', 'Active', '2022-08-26', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('185', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Closed', '2022-08-30', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('186', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Closed', '2022-08-30', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('187', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('188', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('189', '', '', '', '', '8', '4', '2', '54', '', '4', '7', '', '', 'Closed', '2022-08-30', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('190', '', '', '', '', '8', '4', '2', '54', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('191', '', '', '', '', '8', '4', '2', '54', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('192', '', '', '', '', '8', '4', '2', '54', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('193', '', '', '', '', '8', '4', '2', '55', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('194', '', '', '', '', '8', '4', '2', '56', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('195', '', '', '', '', '8', '4', '2', '57', '', '4', '7', '', '', 'Active', '2022-09-09', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('196', '', '', '', '', '8', '4', '2', '48', '', '4', '7', '', '', 'Active', '2022-09-01', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('197', '', '', '', '', '8', '4', '2', '58', '', '4', '7', '', '', 'Active', '2022-09-01', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('198', '', '', '', '', '8', '4', '2', '58', '', '4', '7', '', '', 'Active', '2022-09-01', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('199', 'High', '', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-09-01', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('200', 'High', '', 'IND_200131_3680', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-09-01', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('201', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Active', '2022-09-02', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('202', '', '1128614.0', '', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Closed', '2022-09-02', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('203', '', '', '', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Closed', '2022-09-02', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('204', '', '', 'UKIMESA_220516_5590', '', '10', '5', '2', '59', '', '5', '2', '', '', 'Active', '2022-09-02', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('205', '', '', '', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Active', '2022-09-05', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('206', '', '', '', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Active', '2022-09-05', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('207', '', '', 'UKIMESA_210611_4692', '', '10', '5', '2', '60', '', '5', '2', '', '', 'Active', '2022-09-05', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('208', '', '', 'UKIMESA_210611_4692', '', '10', '5', '2', '60', '', '5', '2', '', '', 'Active', '2022-09-05', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('209', '', '', 'UKIMESA_210611_4692', '', '10', '5', '2', '60', '', '5', '2', '', '', 'Active', '2022-09-05', '2022-09-18 12:51:28');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('210', '', '', 'UKIMESA_210611_4692', '', '10', '5', '2', '60', '', '5', '2', '', '', 'Active', '2022-09-05', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('211', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('212', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('213', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('214', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('215', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('216', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('217', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('218', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('219', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('220', '', '', 'WWA_220720_5789', '', '4', '5', '2', '8', '', '5', '2', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('221', '', '', 'WWA_220720_5789', '', '4', '5', '2', '8', '', '5', '2', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('222', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('223', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('224', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('225', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('226', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('227', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('228', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('229', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('230', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('231', '', '', '', '', '19', '4', '2', '0', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('232', '', '', 'NWE_220907_5915', '', '8', '4', '2', '62', '', '4', '16', '', '', 'Active', '2022-09-08', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('233', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2021-04-19', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('234', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2021-10-05', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('235', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2022-08-05', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('236', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2022-07-22', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('237', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2022-06-15', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('238', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2021-11-30', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('239', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2022-09-03', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('240', '', '', '', '', '8', '4', '2', '48', '', '4', '7', '', '', 'Active', '2022-09-12', '2022-09-18 12:51:29');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('241', '', '', '', '', '0', '0', '0', '0', '', '0', '0', '', '', '', '0000-00-00', '2022-09-18 12:51:29');


#
# TABLE STRUCTURE FOR: job_posts_candidates
#

DROP TABLE IF EXISTS `job_posts_candidates`;

CREATE TABLE `job_posts_candidates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `job_posts_candidates` (`id`, `post_id`, `candidate_id`) VALUES ('1', '2', '1');


#
# TABLE STRUCTURE FOR: job_posts_locations
#

DROP TABLE IF EXISTS `job_posts_locations`;

CREATE TABLE `job_posts_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('7', '2', '1');


#
# TABLE STRUCTURE FOR: job_posts_skills
#

DROP TABLE IF EXISTS `job_posts_skills`;

CREATE TABLE `job_posts_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `job_posts_skills` (`id`, `post_id`, `role_id`) VALUES ('1', '2', '1');


#
# TABLE STRUCTURE FOR: job_posts_sources
#

DROP TABLE IF EXISTS `job_posts_sources`;

CREATE TABLE `job_posts_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `job_posts_sources` (`id`, `post_id`, `source_id`) VALUES ('2', '2', '1');


#
# TABLE STRUCTURE FOR: job_practice_managers
#

DROP TABLE IF EXISTS `job_practice_managers`;

CREATE TABLE `job_practice_managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `job_practice_managers` (`id`, `manager`, `email`) VALUES ('1', 'Anton Ignacio', '');
INSERT INTO `job_practice_managers` (`id`, `manager`, `email`) VALUES ('2', 'Chearie, Arun V.', '');
INSERT INTO `job_practice_managers` (`id`, `manager`, `email`) VALUES ('3', 'Tandon, Amit ', '');
INSERT INTO `job_practice_managers` (`id`, `manager`, `email`) VALUES ('4', 'Chettri, Anand', '');
INSERT INTO `job_practice_managers` (`id`, `manager`, `email`) VALUES ('5', 'Bangi, Eswara Prasad', '');
INSERT INTO `job_practice_managers` (`id`, `manager`, `email`) VALUES ('6', 'Kanakarajan, Divakar', '');
INSERT INTO `job_practice_managers` (`id`, `manager`, `email`) VALUES ('7', 'Vinod Mukundan', '');
INSERT INTO `job_practice_managers` (`id`, `manager`, `email`) VALUES ('8', 'Joe Jacob', '');
INSERT INTO `job_practice_managers` (`id`, `manager`, `email`) VALUES ('9', 'Singh, Vibhu Vaibhava', '');


#
# TABLE STRUCTURE FOR: job_practices
#

DROP TABLE IF EXISTS `job_practices`;

CREATE TABLE `job_practices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `practice` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `job_practices` (`id`, `practice`) VALUES ('1', 'MFA');
INSERT INTO `job_practices` (`id`, `practice`) VALUES ('2', 'Data, AI & IOT Practice');
INSERT INTO `job_practices` (`id`, `practice`) VALUES ('3', 'Solution Hub, EA, Project Management');
INSERT INTO `job_practices` (`id`, `practice`) VALUES ('4', 'Hybrid Cloud Engineering');
INSERT INTO `job_practices` (`id`, `practice`) VALUES ('5', 'Hybrid Cloud Consuting');
INSERT INTO `job_practices` (`id`, `practice`) VALUES ('6', 'Networking, Workplace Services and  DCTS');
INSERT INTO `job_practices` (`id`, `practice`) VALUES ('7', 'GPST');
INSERT INTO `job_practices` (`id`, `practice`) VALUES ('8', 'Education Services');


#
# TABLE STRUCTURE FOR: job_primary_skills
#

DROP TABLE IF EXISTS `job_primary_skills`;

CREATE TABLE `job_primary_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primary_skill` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: job_role_skills
#

DROP TABLE IF EXISTS `job_role_skills`;

CREATE TABLE `job_role_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('1', 'MFA Specialist');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('2', 'Data Scientist');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('3', 'Data Engineer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('4', 'Knowledge Management PM');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('5', 'Azure Devops Engineer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('6', 'Hadoop Admin');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('7', 'CNC Group OpenStack (RHEV / KVM )');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('8', 'CNC Group OpenShift (OpenShift / Docker )');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('9', 'CNC Group Private Cloud (Tanzu/Vmware)');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('10', 'CNC Group Private Cloud (Azure/GCP)');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('11', 'Front end');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('12', 'Cloud Automation Engineer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('13', 'MFA Expert');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('14', 'Mobile Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('15', 'Azure Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('16', 'Azure AKS Devops');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('17', 'Data Analytics');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('18', 'Performance & Monitoring');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('19', 'MSI Application Packaging');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('20', 'Full Stack Developer Dot Net Core');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('21', 'API Developer Support');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('22', 'Full Stack Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('23', 'Java J2EE Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('24', 'NSXT');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('25', 'Vmware Architect');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('26', 'Vmware VCF Architect');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('27', 'Vmware Migration Architect');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('28', 'Migration Consultant');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('29', 'Platform Engineering');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('30', 'Platform Engineering/ Infrastructure Automation');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('31', 'Migration Expert');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('32', 'Java J2EE Full Stack Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('33', 'Backend Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('34', 'Senior Solutions Architect Big Data');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('35', 'Lead Security Architect');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('36', 'Java Developers (Delhi)');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('37', 'Data Centre Network Consultant');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('38', 'Vmware');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('39', 'Solution Architect -EXP');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('40', 'Network Technology Consultant');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('41', 'AWS Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('42', 'AWS Cloud Engineer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('43', 'Full Stack Developer Dot Net MVC');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('44', 'Data Engineer _Backfill');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('45', 'Workday Solutions');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('46', 'SRE- Golang');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('47', 'SRE- Cloud Native Infrastructure Experience');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('48', 'Site Reliability Engineering (SRE)');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('49', 'Techno PM_INT');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('50', 'Techno PM_EXP');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('51', 'Enterprise Architects');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('52', 'Oracle DBA');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('53', 'Knowledge Management Analyst');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('54', 'Chef Resident Engineer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('55', 'IOS Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('56', 'Network Consultant(Routing & Switching)');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('57', 'OpenEdx Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('58', 'Dot Net Coder');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('59', 'AS400 / AIX Capability');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('60', 'Solution Architect - ENT');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('61', 'Android Developer/ DBA/ Backend/ Data Analyst');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('62', 'Android Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('63', 'Android Developer (Mobile App)');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('64', 'Dot Net Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('65', 'Pro*C Migration Expert');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('66', 'Workday Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('67', 'IT Analyst');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('68', 'Cloud Ops Engineer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('69', 'Cloud Ops Lead Engineer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('70', 'Dot Net Developer - Python/Selenium');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('71', 'Full Stack Application Developer');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('72', 'Java J2EE Developer - Fullstack - App Mod');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('73', 'UI UX');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('74', 'Migration Consultant Java');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('75', 'Java J2EE Developer + PostgressSQL');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('76', 'Data Analyst');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('77', 'Testing Consultant');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('78', 'Migration Manager');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('79', 'MLOps');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('80', 'DBA & Migration');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('81', 'EMS Admin L2');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('82', 'Automation - SLA monitoring');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('83', 'Automation - Backup and Restore');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('84', 'Automation - Patch Management');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('85', 'Automation - Log Integration');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('86', 'Cloud Administrators');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('87', 'CoE - Cloud');
INSERT INTO `job_role_skills` (`id`, `role`) VALUES ('88', 'Tuxedo Migration Expert');


#
# TABLE STRUCTURE FOR: job_sources
#

DROP TABLE IF EXISTS `job_sources`;

CREATE TABLE `job_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `job_sources` (`id`, `source`) VALUES ('1', 'Badge');
INSERT INTO `job_sources` (`id`, `source`) VALUES ('2', 'CWF');


#
# TABLE STRUCTURE FOR: job_status
#

DROP TABLE IF EXISTS `job_status`;

CREATE TABLE `job_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `job_status` (`id`, `current_status`) VALUES ('1', 'Closed');
INSERT INTO `job_status` (`id`, `current_status`) VALUES ('2', 'Active');
INSERT INTO `job_status` (`id`, `current_status`) VALUES ('3', 'On-Hold');


#
# TABLE STRUCTURE FOR: job_sub_practices
#

DROP TABLE IF EXISTS `job_sub_practices`;

CREATE TABLE `job_sub_practices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_practice` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('1', 'CAS + MLOps');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('2', 'Cloud Infrastructure- Core (VMware, Microsoft OS,  Hyper-V,  Azure, AWS, GCP)');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('3', 'Application Development');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('4', 'HIT IaC + DevOps');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('5', 'Application Packaging');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('6', 'GPST');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('7', 'Application Modernization');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('8', 'Security');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('9', 'Networking');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('10', 'Solution Hub - A&PS');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('11', 'Project Management');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('12', 'ITIL/Change Management');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('13', 'EA');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('14', 'Education Services');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('15', 'Solution Hub - OS');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('16', 'Databases');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('17', 'MFA');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('18', 'Data Science (AI, ML)');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('19', 'Data Engineering');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('20', 'Delta, Solution 360 and Internal Apps & Analytics');
INSERT INTO `job_sub_practices` (`id`, `sub_practice`) VALUES ('21', 'Hybrid Cloud - Integration & Automation');


#
# TABLE STRUCTURE FOR: job_tags
#

DROP TABLE IF EXISTS `job_tags`;

CREATE TABLE `job_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `job_tags` (`id`, `title`) VALUES ('1', 'JAVA');
INSERT INTO `job_tags` (`id`, `title`) VALUES ('2', 'REACT');
INSERT INTO `job_tags` (`id`, `title`) VALUES ('3', 'MYSQL');


#
# TABLE STRUCTURE FOR: login_attempts
#

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `about` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `about`) VALUES ('1', '127.0.0.1', 'member', '$2y$08$kkqUE2hrqAJtg.pPnAhvL.1iE7LIujK5LZ61arONLpaBBWh/ek61G', NULL, 'member@member.com', NULL, NULL, NULL, NULL, '1451903855', '1451905011', '1', 'Member', 'One', NULL, NULL, NULL);


#
# TABLE STRUCTURE FOR: users_groups
#

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('1', '1', '1');


