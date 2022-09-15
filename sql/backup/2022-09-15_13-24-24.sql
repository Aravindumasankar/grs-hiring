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

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('1', '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, NULL, NULL, NULL, NULL, NULL, '1451900190', '1663235972', '1', 'Recruitment Admin', NULL);
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
# TABLE STRUCTURE FOR: job_bu
#

DROP TABLE IF EXISTS `job_bu`;

CREATE TABLE `job_bu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BU` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `job_bu` (`id`, `BU`) VALUES ('1', 'MFA');
INSERT INTO `job_bu` (`id`, `BU`) VALUES ('2', 'ET');
INSERT INTO `job_bu` (`id`, `BU`) VALUES ('3', 'Core');
INSERT INTO `job_bu` (`id`, `BU`) VALUES ('4', 'GPST');
INSERT INTO `job_bu` (`id`, `BU`) VALUES ('5', 'OS');
INSERT INTO `job_bu` (`id`, `BU`) VALUES ('6', 'UIDAI');


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
# TABLE STRUCTURE FOR: job_deal_project
#

DROP TABLE IF EXISTS `job_deal_project`;

CREATE TABLE `job_deal_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('1', 'Telefonica');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('2', 'Multiple FLP');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('3', 'DATA MAP');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('4', 'DATA office');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('5', 'KSO');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('6', 'CTP - Morgan Stanley');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('7', 'Tesco');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('8', 'WW CNC Containers');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('9', 'ORGI');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('10', 'Transformation');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('11', 'AG Insurance');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('12', 'HCFG');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('13', 'GSE');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('14', 'Apps Packaging _ Morgan Stanley');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('15', 'Delta');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('16', 'GPST');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('17', 'Pointnext CAE');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('18', 'Werder Bremen');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('19', 'BCI');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('20', 'Globe Tel');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('21', 'Globe Tel, Disney, West Jet');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('22', 'Barclay/A&O');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('23', 'USCC');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('24', 'Backfill');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('25', 'Investment');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('26', 'Vodafone Qatar');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('27', 'Solution 360');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('28', 'CRIS');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('29', 'Customer Engagement Portal');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('30', 'Danfoss/Biogen/Nokia/BICS');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('31', 'Vodafone Ziggo');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('32', 'Global Solution Hub A&PS');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('33', 'THD');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('34', 'Smart IRD');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('35', 'GFIT');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('36', 'Solution Hub');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('37', 'ACESO');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('38', 'Evil Genius');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('39', 'J&J');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('40', 'UOB');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('41', 'Vodafone Italy');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('42', 'TechAdmy Platform (one of the enabler platform for GRS Skill transformation Program)');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('43', 'Centene');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('44', 'Japan - CC - Solution Hub');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('45', 'NSE/ICICI/Airbus/FCL/REI');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('46', 'HCFG / GMS');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('47', 'GLWAS');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('48', 'AbnBev');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('49', 'Danfoss');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('50', 'AXA');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('51', 'Internal');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('52', 'Dataspace');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('53', 'Trinity');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('54', 'BMW');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('55', 'Carestreem - App Modernisation');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('56', 'Woolworth');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('57', 'LIC');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('58', 'IOCL');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('59', 'RMA/Development/A&O');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('60', 'Barclay\'s');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('61', 'GreenLake Platform support');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('62', 'Transgourmet');
INSERT INTO `job_deal_project` (`id`, `project`) VALUES ('63', 'UIDAI');


#
# TABLE STRUCTURE FOR: job_location
#

DROP TABLE IF EXISTS `job_location`;

CREATE TABLE `job_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `job_location` (`id`, `location`) VALUES ('1', 'Bangalore');
INSERT INTO `job_location` (`id`, `location`) VALUES ('2', 'Pune');
INSERT INTO `job_location` (`id`, `location`) VALUES ('3', 'Delhi');
INSERT INTO `job_location` (`id`, `location`) VALUES ('4', 'Europe');
INSERT INTO `job_location` (`id`, `location`) VALUES ('5', 'North America');
INSERT INTO `job_location` (`id`, `location`) VALUES ('6', 'Pan India');
INSERT INTO `job_location` (`id`, `location`) VALUES ('7', 'Mumbai');
INSERT INTO `job_location` (`id`, `location`) VALUES ('8', 'HDC');


#
# TABLE STRUCTURE FOR: job_posts
#

DROP TABLE IF EXISTS `job_posts`;

CREATE TABLE `job_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT '1',
  `hiring_manager` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `business-unit` int(11) NOT NULL,
  `project` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `skill` int(11) NOT NULL,
  `practice` int(11) NOT NULL,
  `sub-practice` int(11) NOT NULL,
  `content_brief` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: job_posts_location
#

DROP TABLE IF EXISTS `job_posts_location`;

CREATE TABLE `job_posts_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: job_posts_skills
#

DROP TABLE IF EXISTS `job_posts_skills`;

CREATE TABLE `job_posts_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: job_practice
#

DROP TABLE IF EXISTS `job_practice`;

CREATE TABLE `job_practice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `practice` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `job_practice` (`id`, `practice`) VALUES ('1', 'MFA');
INSERT INTO `job_practice` (`id`, `practice`) VALUES ('2', 'Data, AI & IOT Practice');
INSERT INTO `job_practice` (`id`, `practice`) VALUES ('3', 'Solution Hub, EA, Project Management');
INSERT INTO `job_practice` (`id`, `practice`) VALUES ('4', 'Hybrid Cloud Engineering');
INSERT INTO `job_practice` (`id`, `practice`) VALUES ('5', 'Hybrid Cloud Consuting');
INSERT INTO `job_practice` (`id`, `practice`) VALUES ('6', 'Networking');
INSERT INTO `job_practice` (`id`, `practice`) VALUES ('7', 'Workplace Services and  DCTS');
INSERT INTO `job_practice` (`id`, `practice`) VALUES ('8', 'GPST');
INSERT INTO `job_practice` (`id`, `practice`) VALUES ('9', 'Education Services');


#
# TABLE STRUCTURE FOR: job_primary_skill
#

DROP TABLE IF EXISTS `job_primary_skill`;

CREATE TABLE `job_primary_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primary_skill` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: job_role_skill
#

DROP TABLE IF EXISTS `job_role_skill`;

CREATE TABLE `job_role_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('1', 'MFA Specialist');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('2', 'Data Scientist');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('3', 'Data Engineer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('4', 'Knowledge Management PM');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('5', 'Azure Devops Engineer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('6', 'Hadoop Admin');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('7', 'CNC Group OpenStack (RHEV / KVM )');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('8', 'CNC Group OpenShift (OpenShift / Docker )');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('9', 'CNC Group Private Cloud (Tanzu/Vmware)');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('10', 'CNC Group Private Cloud (Azure/GCP)');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('11', 'Front end');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('12', 'Cloud Automation Engineer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('13', 'MFA Expert');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('14', 'Mobile Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('15', 'Azure Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('16', 'Azure AKS Devops');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('17', 'Data Analytics');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('18', 'Performance & Monitoring');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('19', 'MSI Application Packaging');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('20', 'Full Stack Developer Dot Net Core');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('21', 'API Developer Support');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('22', 'Full Stack Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('23', 'Java J2EE Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('24', 'NSXT');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('25', 'Vmware Architect');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('26', 'Vmware VCF Architect');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('27', 'Vmware Migration Architect');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('28', 'Migration Consultant');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('29', 'Platform Engineering');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('30', 'Platform Engineering/ Infrastructure Automation');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('31', 'Migration Expert');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('32', 'Java J2EE Full Stack Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('33', 'Backend Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('34', 'Senior Solutions Architect Big Data');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('35', 'Lead Security Architect');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('36', 'Java Developers (Delhi)');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('37', 'Data Centre Network Consultant');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('38', 'Vmware');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('39', 'Solution Architect -EXP');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('40', 'Network Technology Consultant');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('41', 'AWS Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('42', 'AWS Cloud Engineer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('43', 'Full Stack Developer Dot Net MVC');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('44', 'Data Engineer _Backfill');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('45', 'Workday Solutions');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('46', 'SRE- Golang');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('47', 'SRE- Cloud Native Infrastructure Experience');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('48', 'Site Reliability Engineering (SRE)');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('49', 'Techno PM_INT');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('50', 'Techno PM_EXP');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('51', 'Enterprise Architects');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('52', 'Oracle DBA');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('53', 'Knowledge Management Analyst');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('54', 'Chef Resident Engineer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('55', 'IOS Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('56', 'Network Consultant(Routing & Switching)');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('57', 'OpenEdx Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('58', 'Dot Net Coder');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('59', 'AS400 / AIX Capability');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('60', 'Solution Architect - ENT');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('61', 'Android Developer/ DBA/ Backend/ Data Analyst');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('62', 'Android Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('63', 'Android Developer (Mobile App)');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('64', 'Dot Net Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('65', 'Pro*C Migration Expert');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('66', 'Workday Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('67', 'IT Analyst');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('68', 'Cloud Ops Engineer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('69', 'Cloud Ops Lead Engineer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('70', 'Dot Net Developer - Python/Selenium');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('71', 'Full Stack Application Developer');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('72', 'Java J2EE Developer - Fullstack - App Mod');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('73', 'UI UX');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('74', 'Migration Consultant Java');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('75', 'Java J2EE Developer + PostgressSQL');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('76', 'Data Analyst');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('77', 'Testing Consultant');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('78', 'Migration Manager');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('79', 'MLOps');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('80', 'DBA & Migration');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('81', 'EMS Admin L2');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('82', 'Automation - SLA monitoring');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('83', 'Automation - Backup and Restore');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('84', 'Automation - Patch Management');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('85', 'Automation - Log Integration');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('86', 'Cloud Administrators');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('87', 'CoE - Cloud');
INSERT INTO `job_role_skill` (`id`, `role`) VALUES ('88', 'Tuxedo Migration Expert');


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
# TABLE STRUCTURE FOR: job_sub_practice
#

DROP TABLE IF EXISTS `job_sub_practice`;

CREATE TABLE `job_sub_practice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_practice` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('1', 'CAS + MLOps');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('2', 'Cloud Infrastructure- Core (VMware, Microsoft OS,  Hyper-V,  Azure, AWS, GCP)');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('3', 'Application Development');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('4', 'HIT IaC + DevOps');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('5', 'Application Packaging');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('6', 'GPST');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('7', 'Application Modernization');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('8', 'Security');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('9', 'Networking');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('10', 'Solution Hub - A&PS');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('11', 'Project Management');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('12', 'ITIL/Change Management');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('13', 'EA');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('14', 'Education Services');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('15', 'Solution Hub - OS');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('16', 'Databases');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('17', 'MFA');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('18', 'Data Science (AI, ML)');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('19', 'Data Engineering');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('20', 'Delta, Solution 360 and Internal Apps & Analytics');
INSERT INTO `job_sub_practice` (`id`, `sub_practice`) VALUES ('21', 'Hybrid Cloud - Integration & Automation');


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


