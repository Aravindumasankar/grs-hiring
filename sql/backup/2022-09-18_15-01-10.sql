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

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('1', '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, NULL, NULL, NULL, NULL, NULL, '1451900190', '1663503597', '1', 'Recruitment Admin', NULL);
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

INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('1', '', '', '', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Closed', '2021-05-03', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('2', '', '1090265.0', 'SEUR_210707_4762', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Active', '2021-05-03', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('3', '', '1116744.0', 'SEUR_210707_4762', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Active', '2021-05-03', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('4', '', '1096174.0', 'SEUR_210707_4762', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Closed', '2021-05-03', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('5', '', '', 'SEUR_210707_4762', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Active', '2021-05-03', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('6', '', '', 'SEUR_210707_4762', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Active', '2021-05-03', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('7', '', '', '', '', '2', '2', '2', '2', '', '2', '18', '', '', 'Closed', '2021-12-20', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('8', '', '1119656.0', 'WWA_220413_5484', '', '2', '2', '2', '3', '', '2', '18', '', '', 'Active', '2021-12-20', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('9', '', '', '', '', '2', '2', '2', '2', '', '2', '19', '', '', 'Closed', '2021-12-20', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('10', '', '', '', '', '2', '2', '2', '2', '', '2', '19', '', '', 'Closed', '2021-12-20', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('11', '', '', 'WWA_210115_4232', '', '2', '2', '2', '0', '', '2', '19', '', '', 'Active', '2021-12-20', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('12', '', '', '', '', '3', '3', '2', '5', '', '3', '20', '', '', 'Closed', '2022-01-14', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('13', '', '', '', '', '3', '3', '2', '5', '', '3', '20', '', '', 'Closed', '2022-01-14', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('14', '', '', '', '', '3', '3', '2', '5', '', '3', '20', '', '', 'Closed', '2022-01-14', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('15', '', '1113254.0', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-02-01', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('16', '', '', 'NOAM_191212_3622', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('17', '', '', 'NOAM_191212_3623', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('18', '', '', 'NOAM_191212_3624', '', '4', '4', '2', '6', '', '4', '21', '', '', 'On-Hold', '2022-08-23', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('19', '', '1106993.0', 'UKIMESA_211012_4996', '', '4', '2', '2', '7', '', '0', '0', '', '', 'Closed', '2022-02-07', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('20', '', '1126166.0', 'UKIMESA_211012_4996', '', '4', '2', '2', '7', '', '0', '0', '', '', 'Active', '2022-02-07', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('21', '', '1111183.0', 'UKIMESA_211012_4996', '', '4', '2', '2', '7', '', '0', '0', '', '', 'Active', '2022-02-07', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('22', '', '1119612.0', 'UKIMESA_211012_4996', '', '4', '2', '2', '7', '', '0', '0', '', '', 'Active', '2022-09-09', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('23', '', '1111184.0', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Closed', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('24', '', '1111186.0', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('25', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('26', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('27', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('28', '', '1119603.0', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('29', '', '1113255.0', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('30', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('31', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('32', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('33', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('34', '', '1116754.0', 'WWA_220720_5789', '', '4', '5', '2', '8', '', '5', '2', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('35', '', '', 'WWA_220720_5789', '', '4', '5', '2', '8', '', '5', '2', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('36', '', '1119613.0', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('37', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Closed', '2022-02-18', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('38', '', '1119823.0', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-03-03', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('39', '', '', 'WWA_220720_5789', '', '6', '6', '2', '10', '', '0', '0', '', '', 'On-Hold', '2022-03-03', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('40', '', '', 'NWE_220225_5334 ', '', '1', '1', '1', '11', '', '1', '17', '', '', 'Closed', '2022-03-07', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('41', '', '1119615.0', 'NWE_220225_5334 ', '', '1', '1', '1', '11', '', '1', '17', '', '', 'Active', '2022-03-07', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('42', '', '1119691.0', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-03-16', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('43', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('44', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('45', '', '', 'DACH_220218_5302', '', '4', '4', '2', '12', '', '4', '21', '', '', 'On-Hold', '2022-04-21', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('46', '', '', 'IND_201110_4128', '', '4', '2', '2', '13', '', '2', '19', '', '', 'On-Hold', '2022-04-28', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('47', '', '', 'IND_201110_4128', '', '4', '4', '2', '13', '', '4', '4', '', '', 'On-Hold', '2022-04-28', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('48', '', '', '', '', '7', '7', '3', '14', '', '6', '5', '', '', 'Closed', '2022-04-30', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('49', '', '', '', '', '7', '7', '3', '14', '', '6', '5', '', '', 'Closed', '2022-04-30', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('50', '', '', 'WWA_211119_5099', '', '3', '3', '2', '15', '', '3', '20', '', '', 'Closed', '2022-05-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('51', '', '', 'WWA_220801_5823', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-05-10', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('52', '', '', 'WWA_220801_5823', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-05-10', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('53', '', '', 'WWA_220801_5823', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-05-10', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('54', '', '', 'WWA_220801_5823', '', '3', '3', '2', '17', '', '3', '20', '', '', 'Active', '2022-05-16', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('55', '', '', 'WWA_220801_5823', '', '3', '3', '2', '17', '', '3', '20', '', '', 'Active', '2022-05-16', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('56', '', '', 'WWA_220801_5823', '', '3', '3', '2', '17', '', '3', '20', '', '', 'Active', '2022-05-16', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('57', '', '', 'WWA_220801_5823', '', '3', '3', '2', '17', '', '3', '20', '', '', 'Active', '2022-05-16', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('58', '', '', 'WWA_220801_5823', '', '3', '3', '2', '17', '', '3', '20', '', '', 'Active', '2022-05-16', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('59', '', '1119601.0', ' \nDACH_220218_5302', '', '2', '2', '2', '18', '', '2', '3', '', '', 'Active', '2022-05-20', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('60', '', '', '', '', '8', '4', '2', '19', '', '4', '7', '', '', 'Closed', '2022-05-24', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('61', '', '', '', '', '8', '4', '2', '19', '', '4', '7', '', '', 'Closed', '2022-05-24', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('62', '', '', 'LATAM_220223_5331', '', '8', '4', '2', '19', '', '4', '7', '', '', 'Active', '2022-05-24', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('63', '', '', 'WWA_220905_5909', '', '3', '3', '2', '5', '', '3', '20', '', '', 'On-Hold', '2022-05-25', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('64', '', '1113261.0', 'APAC_211117_5086', '', '9', '5', '3', '20', '', '5', '2', '', '', 'Active', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('65', '', '', 'APAC_211117_5086', '', '9', '5', '3', '21', '', '5', '2', '', '', 'Closed', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('66', '', '1113256.0', 'NOAM_220802_5826', '', '9', '5', '3', '21', '', '5', '2', '', '', 'Active', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('67', '', '', 'NOAM_220802_5826', '', '9', '5', '3', '21', '', '5', '2', '', '', 'Active', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('68', '', '', 'WWA_220801_5823', '', '10', '5', '3', '22', '', '5', '2', '', '', 'Active', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('69', '', '1106992.0', 'WWA_220801_5823', '', '10', '5', '3', '22', '', '5', '2', '', '', 'Active', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('70', '', '1119581.0', 'NOAM_211028_5036', '', '9', '5', '3', '23', '', '5', '2', '', '', 'On-Hold', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('71', '', '', 'NOAM_211028_5036', '', '9', '5', '3', '23', '', '5', '2', '', '', 'On-Hold', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('72', '', '', 'NOAM_211028_5036', '', '9', '5', '3', '23', '', '5', '2', '', '', 'On-Hold', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('73', '', '', 'WWA_220801_5823', '', '4', '4', '2', '2', '', '4', '4', '', '', 'Closed', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('74', '', '', 'WWA_220801_5823', '', '4', '4', '2', '13', '', '4', '4', '', '', 'Closed', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('75', '', '', 'WWA_220801_5823', '', '4', '4', '2', '13', '', '4', '4', '', '', 'Closed', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('76', '', '1119618.0', 'WWA_220801_5823', '', '4', '4', '2', '13', '', '4', '4', '', '', 'On-Hold', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('77', '', '', 'WWA_220801_5823', '', '4', '4', '2', '13', '', '4', '4', '', '', 'Active', '2022-06-02', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('78', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Active', '2022-06-14', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('79', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Active', '2022-06-14', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('80', '', '', '', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Closed', '2022-06-14', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('81', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-06-14', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('82', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-06-14', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('83', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-06-14', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('84', '', '1096183.0', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-06-15', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('85', '', '1126143.0', '', '', '11', '2', '2', '25', '', '2', '19', '', '', 'Active', '2022-06-20', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('86', '', '', '', '', '11', '2', '2', '25', '', '2', '19', '', '', 'Active', '2022-06-20', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('87', '', '', '\nSEUR_210420_4542', '', '12', '7', '3', '26', '', '6', '8', '', '', 'Active', '2022-06-21', '2022-09-18 18:29:52');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('88', '', '', 'WWA_211118_5091', '', '3', '3', '2', '27', '', '3', '20', '', '', 'Active', '2022-06-22', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('89', '', '', 'IND_220718_5771', '', '8', '4', '2', '28', '', '4', '7', '', '', 'Closed', '2022-06-29', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('90', '', '', 'APAC_220317_5411', '', '3', '3', '2', '27', '', '3', '20', '', '', 'Active', '2022-07-06', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('91', '', '', 'WWA_211119_5099', '', '3', '3', '2', '15', '', '3', '20', '', '', 'Active', '2022-07-06', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('92', '', '', 'WWA_211210_5154', '', '3', '3', '2', '29', '', '3', '20', '', '', 'Active', '2022-07-06', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('93', '', '', 'WWA_220801_5823', '', '12', '7', '3', '30', '', '6', '9', '', '', 'Active', '2022-07-11', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('94', '', '', 'NWE_211025_5031', '', '10', '5', '3', '31', '', '5', '2', '', '', 'Active', '2022-07-11', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('95', '', '', 'WWA_211118_5091', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Active', '2022-07-11', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('96', '', '', 'WWA_211118_5091', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Closed', '2022-07-11', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('97', '', '', 'WWA_211118_5091', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Active', '2022-07-11', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('98', '', '', 'WWA_211118_5091', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Active', '2022-07-11', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('99', '', '', 'NOAM_210823_4869', '', '12', '7', '3', '33', '', '6', '9', '', '', 'Active', '2022-07-12', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('100', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('101', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('102', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('103', '', '', 'NOAM_191212_3621', '', '4', '4', '2', '6', '', '4', '21', '', '', 'Active', '2022-08-23', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('104', '', '', '', '', '8', '4', '2', '34', '', '4', '7', '', '', 'Closed', '2022-07-13', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('105', '', '', 'WWA_220817_5886', '', '8', '4', '2', '34', '', '4', '7', '', '', 'Active', '2022-07-13', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('106', '', '1116776.0', 'WWA_211119_5099', '', '3', '3', '2', '15', '', '4', '7', '', '', 'Active', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('107', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Closed', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('108', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Closed', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('109', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('110', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('111', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('112', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('113', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('114', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('115', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('116', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('117', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('118', '', '', '', '', '6', '6', '4', '16', '', '7', '6', '', '', 'Active', '2022-07-14', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('119', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Closed', '2022-07-15', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('120', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Closed', '2022-07-15', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('121', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Active', '2022-07-15', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('122', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Closed', '2022-07-15', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('123', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Active', '2022-07-15', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('124', '', '', '', '', '14', '6', '3', '25', '', '3', '0', '', '', 'Active', '2022-07-15', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('125', '', '1126147.0', 'APAC_220317_5411', '', '6', '6', '2', '32', '', '3', '13', '', '', 'Active', '2022-07-20', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('126', '', '', 'APAC_220317_5411', '', '6', '6', '2', '32', '', '3', '13', '', '', 'On-Hold', '2022-07-20', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('127', '', '', 'APAC_220317_5411', '', '6', '6', '2', '32', '', '3', '13', '', '', 'On-Hold', '2022-07-20', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('128', '', '', 'APAC_220317_5411', '', '6', '6', '2', '32', '', '3', '13', '', '', 'On-Hold', '2022-07-20', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('129', '', '', 'APAC_220317_5411', '', '6', '6', '2', '32', '', '3', '13', '', '', 'On-Hold', '2022-07-20', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('130', '', '', 'NOAM_220516_5588', '', '11', '2', '2', '37', '', '2', '18', '', '', 'Closed', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('131', 'High', '', 'NOAM_220516_5588', '', '11', '2', '2', '37', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('132', 'High', '', 'NOAM_220516_5588', '', '11', '2', '2', '37', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('133', 'High', '', 'WWA_220801_5823', '', '11', '2', '2', '38', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('134', 'High', '', 'WWA_220801_5823', '', '11', '2', '2', '38', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('135', 'High', '', 'WWA_220801_5823', '', '11', '2', '2', '38', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('136', 'High', '', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('137', 'High', '', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '18', '', '', 'Active', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('138', 'High', '1119616.0', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '19', '', '', 'Active', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('139', 'High', '', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '19', '', '', 'Active', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('140', 'High', '', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '19', '', '', 'Active', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('141', 'High', '', 'NOAM_220516_5589', '', '11', '2', '2', '39', '', '2', '19', '', '', 'Active', '2022-07-21', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('142', 'High', '1096212.0', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-07-25', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('143', '', '', 'APAC_220317_5411', '', '3', '3', '2', '27', '', '3', '20', '', '', 'Active', '2022-07-26', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('144', '', '', 'APAC_220317_5411', '', '3', '3', '2', '27', '', '3', '20', '', '', 'Active', '2022-07-26', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('145', '', '1113262.0', 'APAC_210620_4725', '', '4', '4', '2', '40', '', '4', '4', '', '', 'Active', '2022-07-28', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('146', '', '', 'APAC_210620_4725', '', '4', '4', '2', '40', '', '4', '4', '', '', 'Active', '2022-07-28', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('147', '', '', '', '', '7', '7', '3', '14', '', '6', '5', '', '', 'Closed', '2022-07-29', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('148', '', '', 'UKIMESA_211214_5165', '', '7', '7', '3', '14', '', '6', '5', '', '', 'Active', '2022-07-29', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('149', 'High', '', ' \nDACH_220218_5302', '', '2', '2', '2', '18', '', '2', '3', '', '', 'Closed', '2022-08-02', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('150', '', '', 'SEUR_210420_4542', '', '12', '7', '3', '41', '', '6', '9', '', '', 'Active', '2022-08-04', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('151', '', '', '', '', '15', '8', '5', '42', '', '8', '14', '', '', 'Active', '2022-08-05', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('152', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-08-05', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('153', '', '', '', '', '16', '0', '3', '43', '', '0', '0', '', '', 'On-Hold', '2022-08-09', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('154', 'High', '', 'JPN_191113_3578', '', '17', '3', '3', '44', '', '3', '15', '', '', 'Active', '2022-08-09', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('155', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('156', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('157', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('158', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('159', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('160', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('161', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('162', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('163', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('164', '', '', 'WWA_220801_5823', '', '4', '4', '2', '45', '', '4', '4', '', '', 'Active', '2022-08-12', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('165', 'High', '', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-08-16', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('166', 'High', '1119606.0', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-08-16', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('167', '', '', 'WWA_211119_5099', '', '3', '3', '2', '15', '', '4', '7', '', '', 'Active', '2022-08-17', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('168', '', '', 'DACH_191212_3622', '', '2', '2', '2', '46', '', '2', '3', '', '', 'Closed', '2022-08-17', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('169', 'High', '', ' \nDACH_220218_5302', '', '2', '2', '2', '18', '', '2', '3', '', '', 'Closed', '2022-08-17', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('170', 'High', '', ' \nDACH_220218_5302', '', '2', '2', '2', '18', '', '2', '3', '', '', 'Active', '2022-08-17', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('171', '', '', 'WWA_220203_5245', '', '8', '4', '2', '47', '', '4', '7', '', '', 'Active', '2022-08-18', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('172', '', '', 'NWE_220725_5815', '', '8', '4', '2', '48', '', '4', '7', '', '', 'Closed', '2022-08-18', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('173', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Active', '2022-08-24', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('174', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Active', '2022-08-24', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('175', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Active', '2022-08-24', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('176', '', '', '', '', '12', '7', '3', '30', '', '6', '9', '', '', 'Active', '2022-08-24', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('177', '', '', '', '', '12', '7', '3', '30', '', '6', '9', '', '', 'Active', '2022-08-24', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('178', '', '', '', '', '4', '4', '2', '50', '', '4', '21', '', '', 'Active', '2022-08-24', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('179', '', '', '', '', '4', '4', '2', '50', '', '4', '21', '', '', 'Active', '2022-08-24', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('180', '', '', '', '', '4', '4', '2', '50', '', '4', '21', '', '', 'Active', '2022-08-24', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('181', '', '1119599.0', '', '', '4', '4', '2', '50', '', '4', '21', '', '', 'Active', '2022-08-24', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('182', '', '', '', '', '18', '9', '5', '51', '', '0', '0', '', '', 'Closed', '2022-08-25', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('183', 'High', '', '', '', '2', '2', '2', '52', '', '2', '18', '', '', 'Active', '2022-08-26', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('184', 'High', '', '', '', '2', '2', '2', '18', '', '2', '3', '', '', 'Active', '2022-08-26', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('185', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Closed', '2022-08-30', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('186', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Closed', '2022-08-30', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('187', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 18:29:53');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('188', '', '', '', '', '8', '4', '2', '0', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('189', '', '', '', '', '8', '4', '2', '54', '', '4', '7', '', '', 'Closed', '2022-08-30', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('190', '', '', '', '', '8', '4', '2', '54', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('191', '', '', '', '', '8', '4', '2', '54', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('192', '', '', '', '', '8', '4', '2', '54', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('193', '', '', '', '', '8', '4', '2', '55', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('194', '', '', '', '', '8', '4', '2', '56', '', '4', '7', '', '', 'Active', '2022-08-30', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('195', '', '', '', '', '8', '4', '2', '57', '', '4', '7', '', '', 'Active', '2022-09-09', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('196', '', '', '', '', '8', '4', '2', '48', '', '4', '7', '', '', 'Active', '2022-09-01', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('197', '', '', '', '', '8', '4', '2', '58', '', '4', '7', '', '', 'Active', '2022-09-01', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('198', '', '', '', '', '8', '4', '2', '58', '', '4', '7', '', '', 'Active', '2022-09-01', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('199', 'High', '', 'IND_200131_3679', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-09-01', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('200', 'High', '', 'IND_200131_3680', '', '5', '2', '2', '9', '', '2', '3', '', '', 'Active', '2022-09-01', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('201', '', '', 'WWA_220717_5769', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Active', '2022-09-02', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('202', '', '1128614.0', '', '', '1', '1', '1', '1', '', '1', '17', '', '', 'Closed', '2022-09-02', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('203', '', '', '', '', '8', '4', '2', '35', '', '4', '7', '', '', 'Closed', '2022-09-02', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('204', '', '', 'UKIMESA_220516_5590', '', '10', '5', '2', '59', '', '5', '2', '', '', 'Active', '2022-09-02', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('205', '', '', '', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Active', '2022-09-05', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('206', '', '', '', '', '13', '3', '3', '32', '', '3', '10', '', '', 'Active', '2022-09-05', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('207', '', '', 'UKIMESA_210611_4692', '', '10', '5', '2', '60', '', '5', '2', '', '', 'Active', '2022-09-05', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('208', '', '', 'UKIMESA_210611_4692', '', '10', '5', '2', '60', '', '5', '2', '', '', 'Active', '2022-09-05', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('209', '', '', 'UKIMESA_210611_4692', '', '10', '5', '2', '60', '', '5', '2', '', '', 'Active', '2022-09-05', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('210', '', '', 'UKIMESA_210611_4692', '', '10', '5', '2', '60', '', '5', '2', '', '', 'Active', '2022-09-05', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('211', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('212', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('213', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('214', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('215', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('216', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('217', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('218', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('219', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('220', '', '', 'WWA_220720_5789', '', '4', '5', '2', '8', '', '5', '2', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('221', '', '', 'WWA_220720_5789', '', '4', '5', '2', '8', '', '5', '2', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('222', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('223', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('224', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('225', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('226', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('227', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('228', '', '', 'WWA_220720_5789', '', '4', '4', '2', '8', '', '4', '21', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('229', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('230', '', '', 'WWA_220720_5789', '', '8', '4', '2', '8', '', '4', '7', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('231', '', '', '', '', '19', '4', '2', '0', '', '4', '1', '', '', 'Active', '2022-09-07', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('232', '', '', 'NWE_220907_5915', '', '8', '4', '2', '62', '', '4', '16', '', '', 'Active', '2022-09-08', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('233', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2021-04-19', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('234', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2021-10-05', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('235', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2022-08-05', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('236', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2022-07-22', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('237', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2022-06-15', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('238', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2021-11-30', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('239', '', '', '', '', '4', '4', '6', '63', '', '4', '21', '', '', 'Active', '2022-09-03', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('240', '', '', '', '', '8', '4', '2', '48', '', '4', '7', '', '', 'Active', '2022-09-12', '2022-09-18 18:29:54');
INSERT INTO `job_posts` (`id`, `priority`, `badge_request_id`, `rcms_id`, `requisition`, `hiring_manager`, `practice_manager`, `business_unit`, `project`, `title`, `practice`, `sub_practice`, `content_brief`, `content`, `status`, `request_dates`, `publish_time`) VALUES ('241', '', '', '', '', '0', '0', '0', '0', '', '0', '0', '', '', ' ', '0000-00-00', '2022-09-18 18:29:54');


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
) ENGINE=InnoDB AUTO_INCREMENT=1901 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('2', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('3', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('4', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('5', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('6', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('7', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('8', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('9', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('10', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('11', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('12', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('13', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('14', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('15', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('16', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('17', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('18', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('19', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('20', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('21', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('22', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('23', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('24', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('25', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('26', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('27', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('28', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('29', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('30', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('31', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('32', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('33', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('34', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('35', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('36', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('37', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('38', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('39', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('40', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('41', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('42', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('43', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('44', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('45', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('46', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('47', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('48', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('49', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('50', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('51', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('52', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('53', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('54', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('55', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('56', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('57', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('58', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('59', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('60', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('61', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('62', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('63', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('64', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('65', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('66', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('67', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('68', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('69', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('70', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('71', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('72', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('73', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('74', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('75', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('76', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('77', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('78', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('79', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('80', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('81', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('82', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('83', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('84', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('85', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('86', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('87', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('88', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('89', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('90', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('91', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('92', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('93', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('94', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('95', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('96', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('97', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('98', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('99', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('100', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('101', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('102', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('103', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('104', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('105', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('106', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('107', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('108', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('109', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('110', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('111', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('112', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('113', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('114', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('115', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('116', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('117', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('118', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('119', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('120', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('121', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('122', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('123', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('124', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('125', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('126', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('127', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('128', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('129', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('130', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('131', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('132', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('133', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('134', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('135', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('136', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('137', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('138', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('139', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('140', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('141', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('142', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('143', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('144', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('145', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('146', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('147', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('148', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('149', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('150', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('151', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('152', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('153', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('154', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('155', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('156', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('157', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('158', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('159', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('160', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('161', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('162', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('163', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('164', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('165', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('166', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('167', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('168', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('169', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('170', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('171', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('172', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('173', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('174', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('175', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('176', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('177', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('178', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('179', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('180', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('181', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('182', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('183', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('184', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('185', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('186', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('187', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('188', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('189', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('190', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('191', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('192', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('193', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('194', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('195', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('196', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('197', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('198', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('199', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('200', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('201', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('202', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('203', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('204', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('205', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('206', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('207', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('208', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('209', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('210', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('211', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('212', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('213', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('214', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('215', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('216', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('217', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('218', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('219', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('220', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('221', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('222', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('223', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('224', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('225', '1', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('226', '2', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('227', '3', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('228', '4', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('229', '5', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('230', '6', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('231', '7', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('232', '8', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('233', '9', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('234', '10', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('235', '11', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('236', '12', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('237', '13', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('238', '14', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('239', '15', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('240', '16', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('241', '17', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('242', '18', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('243', '19', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('244', '20', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('245', '21', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('246', '22', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('247', '23', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('248', '24', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('249', '25', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('250', '26', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('251', '27', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('252', '28', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('253', '29', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('254', '30', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('255', '31', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('256', '32', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('257', '33', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('258', '34', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('259', '35', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('260', '36', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('261', '37', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('262', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('263', '39', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('264', '40', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('265', '41', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('266', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('267', '43', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('268', '44', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('269', '45', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('270', '46', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('271', '47', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('272', '48', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('273', '49', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('274', '50', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('275', '51', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('276', '52', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('277', '53', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('278', '54', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('279', '55', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('280', '56', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('281', '57', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('282', '58', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('283', '59', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('284', '60', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('285', '61', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('286', '62', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('287', '63', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('288', '64', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('289', '65', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('290', '66', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('291', '67', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('292', '68', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('293', '69', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('294', '70', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('295', '71', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('296', '72', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('297', '73', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('298', '74', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('299', '75', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('300', '76', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('301', '77', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('302', '78', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('303', '79', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('304', '80', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('305', '81', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('306', '82', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('307', '83', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('308', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('309', '85', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('310', '86', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('311', '87', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('312', '88', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('313', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('314', '90', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('315', '91', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('316', '92', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('317', '93', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('318', '94', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('319', '95', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('320', '96', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('321', '97', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('322', '98', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('323', '99', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('324', '100', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('325', '101', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('326', '102', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('327', '103', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('328', '104', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('329', '105', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('330', '106', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('331', '107', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('332', '108', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('333', '109', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('334', '110', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('335', '111', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('336', '112', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('337', '113', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('338', '114', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('339', '115', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('340', '116', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('341', '117', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('342', '118', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('343', '119', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('344', '120', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('345', '121', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('346', '122', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('347', '123', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('348', '124', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('349', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('350', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('351', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('352', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('353', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('354', '130', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('355', '131', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('356', '132', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('357', '133', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('358', '134', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('359', '135', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('360', '136', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('361', '137', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('362', '138', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('363', '139', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('364', '140', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('365', '141', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('366', '142', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('367', '142', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('368', '143', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('369', '144', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('370', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('371', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('372', '147', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('373', '148', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('374', '149', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('375', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('376', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('377', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('378', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('379', '154', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('380', '155', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('381', '156', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('382', '157', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('383', '158', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('384', '159', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('385', '160', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('386', '161', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('387', '162', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('388', '163', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('389', '164', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('390', '165', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('391', '165', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('392', '166', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('393', '166', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('394', '167', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('395', '168', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('396', '169', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('397', '170', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('398', '171', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('399', '172', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('400', '173', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('401', '174', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('402', '175', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('403', '176', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('404', '177', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('405', '178', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('406', '179', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('407', '180', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('408', '181', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('409', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('410', '183', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('411', '184', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('412', '185', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('413', '186', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('414', '187', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('415', '188', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('416', '189', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('417', '190', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('418', '191', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('419', '192', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('420', '193', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('421', '194', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('422', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('423', '196', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('424', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('425', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('426', '199', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('427', '199', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('428', '200', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('429', '200', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('430', '201', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('431', '202', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('432', '203', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('433', '204', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('434', '205', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('435', '206', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('436', '207', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('437', '208', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('438', '209', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('439', '210', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('440', '211', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('441', '212', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('442', '213', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('443', '214', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('444', '215', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('445', '216', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('446', '217', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('447', '218', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('448', '219', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('449', '220', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('450', '221', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('451', '222', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('452', '223', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('453', '224', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('454', '225', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('455', '226', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('456', '227', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('457', '228', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('458', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('459', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('460', '231', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('461', '232', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('462', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('463', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('464', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('465', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('466', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('467', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('468', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('469', '240', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('471', '1', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('472', '2', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('473', '3', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('474', '4', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('475', '5', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('476', '6', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('477', '7', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('478', '8', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('479', '9', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('480', '10', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('481', '11', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('482', '12', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('483', '13', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('484', '14', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('485', '15', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('486', '16', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('487', '17', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('488', '18', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('489', '19', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('490', '20', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('491', '21', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('492', '22', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('493', '23', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('494', '24', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('495', '25', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('496', '26', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('497', '27', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('498', '28', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('499', '29', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('500', '30', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('501', '31', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('502', '32', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('503', '33', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('504', '34', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('505', '35', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('506', '36', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('507', '37', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('508', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('509', '39', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('510', '40', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('511', '41', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('512', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('513', '43', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('514', '44', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('515', '45', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('516', '46', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('517', '47', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('518', '48', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('519', '49', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('520', '50', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('521', '51', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('522', '52', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('523', '53', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('524', '54', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('525', '55', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('526', '56', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('527', '57', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('528', '58', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('529', '59', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('530', '60', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('531', '61', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('532', '62', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('533', '63', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('534', '64', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('535', '65', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('536', '66', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('537', '67', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('538', '68', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('539', '69', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('540', '70', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('541', '71', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('542', '72', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('543', '73', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('544', '74', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('545', '75', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('546', '76', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('547', '77', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('548', '78', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('549', '79', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('550', '80', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('551', '81', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('552', '82', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('553', '83', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('554', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('555', '85', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('556', '86', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('557', '87', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('558', '88', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('559', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('560', '90', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('561', '91', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('562', '92', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('563', '93', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('564', '94', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('565', '95', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('566', '96', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('567', '97', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('568', '98', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('569', '99', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('570', '100', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('571', '101', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('572', '102', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('573', '103', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('574', '104', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('575', '105', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('576', '106', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('577', '107', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('578', '108', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('579', '109', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('580', '110', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('581', '111', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('582', '112', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('583', '113', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('584', '114', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('585', '115', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('586', '116', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('587', '117', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('588', '118', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('589', '119', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('590', '120', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('591', '121', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('592', '122', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('593', '123', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('594', '124', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('595', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('596', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('597', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('598', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('599', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('600', '130', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('601', '131', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('602', '132', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('603', '133', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('604', '134', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('605', '135', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('606', '136', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('607', '137', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('608', '138', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('609', '139', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('610', '140', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('611', '141', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('612', '142', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('613', '142', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('614', '143', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('615', '144', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('616', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('617', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('618', '147', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('619', '148', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('620', '149', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('621', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('622', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('623', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('624', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('625', '154', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('626', '155', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('627', '156', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('628', '157', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('629', '158', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('630', '159', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('631', '160', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('632', '161', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('633', '162', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('634', '163', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('635', '164', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('636', '165', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('637', '165', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('638', '166', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('639', '166', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('640', '167', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('641', '168', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('642', '169', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('643', '170', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('644', '171', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('645', '172', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('646', '173', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('647', '174', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('648', '175', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('649', '176', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('650', '177', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('651', '178', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('652', '179', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('653', '180', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('654', '181', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('655', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('656', '183', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('657', '184', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('658', '185', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('659', '186', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('660', '187', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('661', '188', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('662', '189', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('663', '190', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('664', '191', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('665', '192', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('666', '193', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('667', '194', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('668', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('669', '196', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('670', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('671', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('672', '199', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('673', '199', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('674', '200', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('675', '200', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('676', '201', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('677', '202', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('678', '203', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('679', '204', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('680', '205', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('681', '206', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('682', '207', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('683', '208', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('684', '209', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('685', '210', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('686', '211', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('687', '212', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('688', '213', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('689', '214', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('690', '215', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('691', '216', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('692', '217', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('693', '218', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('694', '219', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('695', '220', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('696', '221', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('697', '222', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('698', '223', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('699', '224', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('700', '225', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('701', '226', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('702', '227', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('703', '228', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('704', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('705', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('706', '231', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('707', '232', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('708', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('709', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('710', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('711', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('712', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('713', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('714', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('715', '240', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('716', '1', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('717', '2', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('718', '3', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('719', '4', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('720', '5', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('721', '6', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('722', '7', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('723', '8', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('724', '9', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('725', '10', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('726', '11', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('727', '12', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('728', '13', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('729', '14', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('730', '15', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('731', '16', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('732', '17', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('733', '18', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('734', '19', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('735', '20', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('736', '21', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('737', '22', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('738', '23', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('739', '24', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('740', '25', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('741', '26', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('742', '27', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('743', '28', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('744', '29', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('745', '30', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('746', '31', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('747', '32', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('748', '33', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('749', '34', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('750', '35', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('751', '36', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('752', '37', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('753', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('754', '39', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('755', '40', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('756', '41', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('757', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('758', '43', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('759', '44', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('760', '45', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('761', '46', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('762', '47', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('763', '48', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('764', '49', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('765', '50', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('766', '51', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('767', '52', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('768', '53', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('769', '54', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('770', '55', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('771', '56', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('772', '57', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('773', '58', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('774', '59', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('775', '60', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('776', '61', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('777', '62', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('778', '63', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('779', '64', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('780', '65', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('781', '66', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('782', '67', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('783', '68', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('784', '69', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('785', '70', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('786', '71', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('787', '72', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('788', '73', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('789', '74', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('790', '75', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('791', '76', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('792', '77', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('793', '78', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('794', '79', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('795', '80', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('796', '81', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('797', '82', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('798', '83', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('799', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('800', '85', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('801', '86', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('802', '87', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('803', '88', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('804', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('805', '90', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('806', '91', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('807', '92', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('808', '93', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('809', '94', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('810', '95', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('811', '96', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('812', '97', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('813', '98', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('814', '99', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('815', '100', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('816', '101', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('817', '102', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('818', '103', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('819', '104', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('820', '105', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('821', '106', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('822', '107', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('823', '108', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('824', '109', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('825', '110', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('826', '111', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('827', '112', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('828', '113', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('829', '114', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('830', '115', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('831', '116', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('832', '117', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('833', '118', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('834', '119', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('835', '120', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('836', '121', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('837', '122', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('838', '123', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('839', '124', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('840', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('841', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('842', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('843', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('844', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('845', '130', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('846', '131', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('847', '132', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('848', '133', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('849', '134', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('850', '135', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('851', '136', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('852', '137', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('853', '138', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('854', '139', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('855', '140', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('856', '141', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('857', '142', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('858', '142', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('859', '143', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('860', '144', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('861', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('862', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('863', '147', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('864', '148', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('865', '149', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('866', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('867', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('868', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('869', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('870', '154', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('871', '155', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('872', '156', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('873', '157', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('874', '158', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('875', '159', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('876', '160', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('877', '161', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('878', '162', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('879', '163', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('880', '164', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('881', '165', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('882', '165', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('883', '166', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('884', '166', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('885', '167', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('886', '168', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('887', '169', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('888', '170', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('889', '171', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('890', '172', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('891', '173', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('892', '174', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('893', '175', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('894', '176', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('895', '177', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('896', '178', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('897', '179', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('898', '180', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('899', '181', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('900', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('901', '183', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('902', '184', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('903', '185', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('904', '186', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('905', '187', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('906', '188', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('907', '189', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('908', '190', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('909', '191', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('910', '192', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('911', '193', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('912', '194', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('913', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('914', '196', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('915', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('916', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('917', '199', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('918', '199', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('919', '200', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('920', '200', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('921', '201', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('922', '202', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('923', '203', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('924', '204', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('925', '205', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('926', '206', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('927', '207', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('928', '208', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('929', '209', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('930', '210', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('931', '211', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('932', '212', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('933', '213', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('934', '214', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('935', '215', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('936', '216', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('937', '217', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('938', '218', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('939', '219', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('940', '220', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('941', '221', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('942', '222', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('943', '223', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('944', '224', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('945', '225', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('946', '226', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('947', '227', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('948', '228', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('949', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('950', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('951', '231', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('952', '232', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('953', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('954', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('955', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('956', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('957', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('958', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('959', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('960', '240', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('961', '1', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('962', '2', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('963', '3', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('964', '4', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('965', '5', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('966', '6', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('967', '7', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('968', '8', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('969', '9', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('970', '10', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('971', '11', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('972', '12', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('973', '13', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('974', '14', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('975', '15', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('976', '16', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('977', '17', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('978', '18', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('979', '19', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('980', '20', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('981', '21', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('982', '22', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('983', '23', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('984', '24', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('985', '25', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('986', '26', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('987', '27', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('988', '28', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('989', '29', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('990', '30', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('991', '31', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('992', '32', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('993', '33', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('994', '34', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('995', '35', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('996', '36', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('997', '37', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('998', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('999', '39', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1000', '40', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1001', '41', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1002', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1003', '43', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1004', '44', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1005', '45', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1006', '46', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1007', '47', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1008', '48', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1009', '49', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1010', '50', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1011', '51', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1012', '52', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1013', '53', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1014', '54', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1015', '55', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1016', '56', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1017', '57', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1018', '58', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1019', '59', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1020', '60', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1021', '61', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1022', '62', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1023', '63', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1024', '64', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1025', '65', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1026', '66', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1027', '67', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1028', '68', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1029', '69', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1030', '70', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1031', '71', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1032', '72', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1033', '73', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1034', '74', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1035', '75', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1036', '76', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1037', '77', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1038', '78', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1039', '79', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1040', '80', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1041', '81', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1042', '82', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1043', '83', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1044', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1045', '85', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1046', '86', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1047', '87', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1048', '88', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1049', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1050', '90', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1051', '91', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1052', '92', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1053', '93', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1054', '94', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1055', '95', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1056', '96', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1057', '97', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1058', '98', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1059', '99', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1060', '100', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1061', '101', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1062', '102', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1063', '103', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1064', '104', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1065', '105', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1066', '106', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1067', '107', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1068', '108', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1069', '109', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1070', '110', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1071', '111', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1072', '112', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1073', '113', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1074', '114', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1075', '115', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1076', '116', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1077', '117', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1078', '118', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1079', '119', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1080', '120', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1081', '121', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1082', '122', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1083', '123', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1084', '124', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1085', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1086', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1087', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1088', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1089', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1090', '130', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1091', '131', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1092', '132', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1093', '133', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1094', '134', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1095', '135', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1096', '136', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1097', '137', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1098', '138', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1099', '139', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1100', '140', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1101', '141', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1102', '142', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1103', '142', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1104', '143', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1105', '144', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1106', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1107', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1108', '147', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1109', '148', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1110', '149', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1111', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1112', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1113', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1114', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1115', '154', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1116', '155', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1117', '156', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1118', '157', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1119', '158', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1120', '159', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1121', '160', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1122', '161', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1123', '162', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1124', '163', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1125', '164', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1126', '165', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1127', '165', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1128', '166', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1129', '166', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1130', '167', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1131', '168', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1132', '169', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1133', '170', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1134', '171', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1135', '172', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1136', '173', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1137', '174', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1138', '175', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1139', '176', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1140', '177', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1141', '178', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1142', '179', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1143', '180', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1144', '181', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1145', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1146', '183', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1147', '184', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1148', '185', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1149', '186', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1150', '187', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1151', '188', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1152', '189', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1153', '190', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1154', '191', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1155', '192', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1156', '193', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1157', '194', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1158', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1159', '196', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1160', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1161', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1162', '199', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1163', '199', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1164', '200', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1165', '200', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1166', '201', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1167', '202', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1168', '203', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1169', '204', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1170', '205', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1171', '206', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1172', '207', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1173', '208', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1174', '209', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1175', '210', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1176', '211', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1177', '212', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1178', '213', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1179', '214', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1180', '215', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1181', '216', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1182', '217', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1183', '218', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1184', '219', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1185', '220', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1186', '221', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1187', '222', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1188', '223', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1189', '224', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1190', '225', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1191', '226', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1192', '227', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1193', '228', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1194', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1195', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1196', '231', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1197', '232', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1198', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1199', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1200', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1201', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1202', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1203', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1204', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1205', '240', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1206', '1', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1207', '2', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1208', '3', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1209', '4', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1210', '5', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1211', '6', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1212', '7', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1213', '8', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1214', '9', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1215', '10', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1216', '11', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1217', '12', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1218', '13', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1219', '14', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1220', '15', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1221', '16', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1222', '17', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1223', '18', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1224', '19', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1225', '20', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1226', '21', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1227', '22', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1228', '23', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1229', '24', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1230', '25', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1231', '26', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1232', '27', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1233', '28', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1234', '29', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1235', '30', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1236', '31', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1237', '32', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1238', '33', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1239', '34', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1240', '35', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1241', '36', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1242', '37', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1243', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1244', '39', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1245', '40', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1246', '41', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1247', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1248', '43', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1249', '44', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1250', '45', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1251', '46', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1252', '47', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1253', '48', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1254', '49', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1255', '50', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1256', '51', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1257', '52', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1258', '53', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1259', '54', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1260', '55', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1261', '56', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1262', '57', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1263', '58', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1264', '59', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1265', '60', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1266', '61', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1267', '62', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1268', '63', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1269', '64', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1270', '65', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1271', '66', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1272', '67', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1273', '68', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1274', '69', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1275', '70', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1276', '71', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1277', '72', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1278', '73', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1279', '74', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1280', '75', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1281', '76', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1282', '77', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1283', '78', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1284', '79', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1285', '80', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1286', '81', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1287', '82', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1288', '83', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1289', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1290', '85', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1291', '86', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1292', '87', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1293', '88', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1294', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1295', '90', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1296', '91', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1297', '92', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1298', '93', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1299', '94', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1300', '95', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1301', '96', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1302', '97', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1303', '98', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1304', '99', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1305', '100', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1306', '101', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1307', '102', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1308', '103', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1309', '104', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1310', '105', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1311', '106', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1312', '107', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1313', '108', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1314', '109', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1315', '110', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1316', '111', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1317', '112', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1318', '113', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1319', '114', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1320', '115', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1321', '116', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1322', '117', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1323', '118', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1324', '119', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1325', '120', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1326', '121', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1327', '122', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1328', '123', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1329', '124', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1330', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1331', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1332', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1333', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1334', '129', '5');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1335', '130', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1336', '131', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1337', '132', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1338', '133', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1339', '134', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1340', '135', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1341', '136', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1342', '137', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1343', '138', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1344', '139', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1345', '140', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1346', '141', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1347', '142', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1348', '142', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1349', '143', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1350', '144', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1351', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1352', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1353', '147', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1354', '148', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1355', '149', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1356', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1357', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1358', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1359', '153', '6');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1360', '154', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1361', '155', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1362', '156', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1363', '157', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1364', '158', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1365', '159', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1366', '160', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1367', '161', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1368', '162', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1369', '163', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1370', '164', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1371', '165', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1372', '165', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1373', '166', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1374', '166', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1375', '167', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1376', '168', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1377', '169', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1378', '170', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1379', '171', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1380', '172', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1381', '173', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1382', '174', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1383', '175', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1384', '176', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1385', '177', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1386', '178', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1387', '179', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1388', '180', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1389', '181', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1390', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1391', '183', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1392', '184', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1393', '185', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1394', '186', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1395', '187', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1396', '188', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1397', '189', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1398', '190', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1399', '191', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1400', '192', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1401', '193', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1402', '194', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1403', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1404', '196', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1405', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1406', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1407', '199', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1408', '199', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1409', '200', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1410', '200', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1411', '201', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1412', '202', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1413', '203', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1414', '204', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1415', '205', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1416', '206', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1417', '207', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1418', '208', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1419', '209', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1420', '210', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1421', '211', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1422', '212', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1423', '213', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1424', '214', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1425', '215', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1426', '216', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1427', '217', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1428', '218', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1429', '219', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1430', '220', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1431', '221', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1432', '222', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1433', '223', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1434', '224', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1435', '225', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1436', '226', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1437', '227', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1438', '228', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1439', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1440', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1441', '231', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1442', '232', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1443', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1444', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1445', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1446', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1447', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1448', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1449', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1450', '240', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1451', '1', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1452', '1', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1453', '2', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1454', '2', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1455', '3', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1456', '3', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1457', '4', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1458', '4', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1459', '5', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1460', '5', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1461', '6', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1462', '6', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1463', '7', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1464', '7', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1465', '8', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1466', '8', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1467', '9', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1468', '9', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1469', '10', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1470', '10', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1471', '11', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1472', '11', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1473', '12', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1474', '12', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1475', '13', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1476', '13', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1477', '14', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1478', '14', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1479', '15', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1480', '15', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1481', '16', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1482', '16', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1483', '17', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1484', '17', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1485', '18', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1486', '18', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1487', '19', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1488', '19', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1489', '20', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1490', '20', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1491', '21', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1492', '21', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1493', '22', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1494', '22', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1495', '23', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1496', '23', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1497', '24', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1498', '24', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1499', '25', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1500', '25', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1501', '26', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1502', '26', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1503', '27', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1504', '27', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1505', '28', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1506', '28', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1507', '29', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1508', '29', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1509', '30', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1510', '30', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1511', '31', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1512', '31', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1513', '32', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1514', '32', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1515', '33', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1516', '33', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1517', '34', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1518', '34', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1519', '35', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1520', '35', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1521', '36', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1522', '36', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1523', '37', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1524', '37', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1525', '38', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1526', '39', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1527', '39', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1528', '40', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1529', '40', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1530', '41', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1531', '41', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1532', '42', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1533', '43', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1534', '43', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1535', '44', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1536', '44', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1537', '45', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1538', '45', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1539', '46', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1540', '46', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1541', '47', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1542', '47', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1543', '48', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1544', '48', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1545', '49', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1546', '49', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1547', '50', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1548', '50', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1549', '51', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1550', '51', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1551', '52', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1552', '52', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1553', '53', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1554', '53', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1555', '54', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1556', '54', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1557', '55', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1558', '55', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1559', '56', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1560', '56', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1561', '57', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1562', '57', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1563', '58', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1564', '58', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1565', '59', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1566', '59', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1567', '60', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1568', '60', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1569', '61', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1570', '61', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1571', '62', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1572', '62', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1573', '63', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1574', '63', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1575', '64', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1576', '64', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1577', '65', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1578', '65', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1579', '66', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1580', '66', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1581', '67', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1582', '67', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1583', '68', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1584', '68', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1585', '69', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1586', '69', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1587', '70', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1588', '70', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1589', '71', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1590', '71', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1591', '72', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1592', '72', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1593', '73', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1594', '73', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1595', '74', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1596', '74', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1597', '75', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1598', '75', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1599', '76', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1600', '76', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1601', '77', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1602', '77', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1603', '78', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1604', '78', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1605', '79', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1606', '79', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1607', '80', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1608', '80', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1609', '81', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1610', '81', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1611', '82', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1612', '82', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1613', '83', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1614', '83', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1615', '84', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1616', '85', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1617', '85', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1618', '86', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1619', '86', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1620', '87', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1621', '87', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1622', '88', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1623', '88', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1624', '89', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1625', '90', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1626', '90', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1627', '91', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1628', '91', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1629', '92', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1630', '92', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1631', '93', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1632', '93', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1633', '94', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1634', '94', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1635', '95', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1636', '95', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1637', '96', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1638', '96', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1639', '97', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1640', '97', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1641', '98', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1642', '98', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1643', '99', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1644', '99', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1645', '100', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1646', '100', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1647', '101', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1648', '101', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1649', '102', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1650', '102', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1651', '103', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1652', '103', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1653', '104', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1654', '104', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1655', '105', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1656', '105', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1657', '106', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1658', '106', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1659', '107', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1660', '107', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1661', '108', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1662', '108', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1663', '109', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1664', '109', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1665', '110', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1666', '110', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1667', '111', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1668', '111', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1669', '112', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1670', '112', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1671', '113', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1672', '113', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1673', '114', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1674', '114', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1675', '115', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1676', '115', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1677', '116', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1678', '116', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1679', '117', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1680', '117', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1681', '118', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1682', '118', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1683', '119', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1684', '119', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1685', '120', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1686', '120', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1687', '121', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1688', '121', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1689', '122', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1690', '122', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1691', '123', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1692', '123', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1693', '124', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1694', '124', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1695', '125', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1696', '126', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1697', '127', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1698', '128', '4');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1699', '130', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1700', '130', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1701', '131', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1702', '131', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1703', '132', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1704', '132', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1705', '133', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1706', '133', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1707', '134', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1708', '134', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1709', '135', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1710', '135', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1711', '136', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1712', '136', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1713', '137', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1714', '137', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1715', '138', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1716', '138', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1717', '139', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1718', '139', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1719', '140', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1720', '140', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1721', '141', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1722', '141', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1723', '142', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1724', '142', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1725', '143', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1726', '143', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1727', '144', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1728', '144', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1729', '145', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1730', '146', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1731', '147', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1732', '147', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1733', '148', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1734', '148', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1735', '149', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1736', '149', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1737', '150', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1738', '151', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1739', '152', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1740', '154', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1741', '154', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1742', '155', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1743', '155', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1744', '156', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1745', '156', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1746', '157', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1747', '157', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1748', '158', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1749', '158', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1750', '159', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1751', '159', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1752', '160', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1753', '160', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1754', '161', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1755', '161', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1756', '162', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1757', '162', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1758', '163', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1759', '163', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1760', '164', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1761', '164', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1762', '165', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1763', '165', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1764', '166', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1765', '166', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1766', '167', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1767', '167', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1768', '168', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1769', '168', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1770', '169', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1771', '169', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1772', '170', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1773', '170', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1774', '171', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1775', '171', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1776', '172', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1777', '172', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1778', '173', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1779', '173', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1780', '174', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1781', '174', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1782', '175', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1783', '175', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1784', '176', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1785', '176', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1786', '177', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1787', '177', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1788', '178', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1789', '178', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1790', '179', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1791', '179', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1792', '180', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1793', '180', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1794', '181', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1795', '181', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1796', '182', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1797', '183', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1798', '183', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1799', '184', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1800', '184', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1801', '185', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1802', '185', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1803', '186', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1804', '186', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1805', '187', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1806', '187', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1807', '188', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1808', '188', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1809', '189', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1810', '189', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1811', '190', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1812', '190', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1813', '191', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1814', '191', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1815', '192', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1816', '192', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1817', '193', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1818', '193', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1819', '194', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1820', '194', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1821', '195', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1822', '196', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1823', '196', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1824', '197', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1825', '198', '7');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1826', '199', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1827', '199', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1828', '200', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1829', '200', '3');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1830', '201', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1831', '201', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1832', '202', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1833', '202', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1834', '203', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1835', '203', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1836', '204', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1837', '204', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1838', '205', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1839', '205', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1840', '206', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1841', '206', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1842', '207', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1843', '207', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1844', '208', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1845', '208', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1846', '209', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1847', '209', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1848', '210', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1849', '210', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1850', '211', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1851', '211', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1852', '212', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1853', '212', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1854', '213', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1855', '213', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1856', '214', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1857', '214', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1858', '215', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1859', '215', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1860', '216', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1861', '216', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1862', '217', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1863', '217', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1864', '218', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1865', '218', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1866', '219', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1867', '219', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1868', '220', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1869', '220', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1870', '221', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1871', '221', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1872', '222', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1873', '222', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1874', '223', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1875', '223', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1876', '224', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1877', '224', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1878', '225', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1879', '225', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1880', '226', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1881', '226', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1882', '227', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1883', '227', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1884', '228', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1885', '228', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1886', '229', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1887', '230', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1888', '231', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1889', '231', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1890', '232', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1891', '232', '2');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1892', '233', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1893', '234', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1894', '235', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1895', '236', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1896', '237', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1897', '238', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1898', '239', '8');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1899', '240', '1');
INSERT INTO `job_posts_locations` (`id`, `post_id`, `location_id`) VALUES ('1900', '240', '2');


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


