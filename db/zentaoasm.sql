-- DROP TABLE IF EXISTS `zt_action`;
CREATE TABLE IF NOT EXISTS `zt_action` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `objectType` varchar(30) NOT NULL default '',
  `objectID` mediumint(8) unsigned NOT NULL default '0',
  `actor` varchar(30) NOT NULL default '',
  `action` varchar(30) NOT NULL default '',
  `date` datetime NOT NULL,
  `comment` text NOT NULL,
  `extra` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_category`;
CREATE TABLE IF NOT EXISTS `zt_category` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(60) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `product` mediumint(8) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_company`;
CREATE TABLE IF NOT EXISTS `zt_company` (
  `id` mediumint(9) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_config`;
CREATE TABLE IF NOT EXISTS `zt_config` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `owner` char(30) NOT NULL default '',
  `module` varchar(30) NOT NULL,
  `section` char(30) NOT NULL default '',
  `key` char(30) NOT NULL default '',
  `value` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique` (`owner`,`module`,`section`,`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_faq`;
CREATE TABLE IF NOT EXISTS `zt_faq` (
  `id` mediumint(9) NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL,
  `category` mediumint(9) NOT NULL,
  `request` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `addedtime` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_file`;
CREATE TABLE IF NOT EXISTS `zt_file` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `pathname` char(50) NOT NULL,
  `title` char(90) NOT NULL,
  `extension` char(30) NOT NULL,
  `size` mediumint(8) unsigned NOT NULL default '0',
  `objectType` char(30) NOT NULL,
  `objectID` mediumint(9) NOT NULL,
  `addedBy` char(30) NOT NULL default '',
  `addedDate` datetime NOT NULL,
  `downloads` mediumint(8) unsigned NOT NULL default '0',
  `extra` varchar(255) NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_group`;
CREATE TABLE IF NOT EXISTS `zt_group` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` char(30) NOT NULL,
  `desc` char(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_groupPriv`;
CREATE TABLE IF NOT EXISTS `zt_groupPriv` (
  `group` mediumint(8) unsigned NOT NULL default '0',
  `module` char(30) NOT NULL default '',
  `method` char(30) NOT NULL default '',
  UNIQUE KEY `group` (`group`,`module`,`method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_module`;
CREATE TABLE IF NOT EXISTS `zt_module` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `root` mediumint(8) unsigned NOT NULL default '0',
  `name` char(30) NOT NULL default '',
  `parent` mediumint(8) unsigned NOT NULL default '0',
  `path` char(255) NOT NULL default '',
  `grade` tinyint(3) unsigned NOT NULL default '0',
  `order` tinyint(3) unsigned NOT NULL default '0',
  `type` char(30) NOT NULL,
  `owner` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_product`;
CREATE TABLE IF NOT EXISTS `zt_product` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(90) NOT NULL,
  `order` tinyint(3) unsigned NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_request`;
CREATE TABLE IF NOT EXISTS `zt_request` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL,
  `category` mediumint(8) unsigned NOT NULL,
  `customer` mediumint(8) NOT NULL,
  `assignedTo` mediumint(8) NOT NULL,
  `pri` tinyint(3) unsigned default NULL,
  `title` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `addedDate` datetime NOT NULL,
  `viewedDate` datetime NOT NULL,
  `assignedDate` datetime NOT NULL,
  `repliedBy` mediumint(8) NOT NULL,
  `repliedDate` datetime NOT NULL,
  `lastEditedDate` datetime NOT NULL,
  `closedDate` datetime NOT NULL,
  `closedBy` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_serviceTime`;
CREATE TABLE IF NOT EXISTS `zt_serviceTime` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `user` mediumint(8) NOT NULL,
  `product` mediumint(8) NOT NULL,
  `serviceTime` date NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_user`;
CREATE TABLE IF NOT EXISTS `zt_user` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `dept` mediumint(8) unsigned NOT NULL default '0',
  `role` varchar(20) NOT NULL,
  `account` char(30) NOT NULL default '',
  `password` char(32) NOT NULL default '',
  `resetKey` char(64) NOT NULL,
  `resetedTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `realname` char(30) NOT NULL default '',
  `nickname` char(60) NOT NULL default '',
  `avatar` char(30) NOT NULL default '',
  `birthday` date NOT NULL default '0000-00-00',
  `gender` enum('f','m') NOT NULL default 'f',
  `company` varchar(255) NOT NULL,
  `email` char(90) NOT NULL default '',
  `qq` char(20) NOT NULL default '',
  `skype` char(90) NOT NULL default '',
  `yahoo` char(90) NOT NULL default '',
  `gtalk` char(90) NOT NULL default '',
  `wangwang` char(90) NOT NULL default '',
  `mobile` char(11) NOT NULL default '',
  `phone` char(20) NOT NULL default '',
  `address` char(120) NOT NULL default '',
  `zipcode` char(10) NOT NULL default '',
  `join` date NOT NULL default '0000-00-00',
  `visits` mediumint(8) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL default '',
  `last` datetime NOT NULL,
  `zentaoID` mediumint(8) unsigned NOT NULL default '0',
  `forbid` enum('0','1') NOT NULL default '0',
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_userQuery`;
CREATE TABLE IF NOT EXISTS `zt_userQuery` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `company` mediumint(8) unsigned NOT NULL default '0',
  `account` char(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `title` varchar(90) NOT NULL,
  `form` text NOT NULL,
  `sql` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `company` (`company`),
  KEY `account` (`account`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `zt_config` (`id`, `owner`, `module`, `section`, `key`, `value`) VALUES
(1, 'system', 'api', '', 'openSync', '0'),
(2, 'system', 'api', '', 'key', ''),
(3, 'system', 'api', '', 'ip', '');
INSERT INTO `zt_group` (`id`, `name`, `desc`) VALUES
(1, 'admin',    '系统管理员'),
(2, 'manager',  '客服经理'),
(3, 'support',  '技术支持'),
(4, 'servicer', '客服'),
(5, 'customer', '客户');
INSERT INTO `zt_groupPriv` (`group`, `module`, `method`) VALUES
(1, 'api', 'getModel'),
(1, 'category', 'delete'),
(1, 'category', 'manage'),
(1, 'category', 'updateOrder'),
(1, 'company', 'edit'),
(1, 'faq', 'create'),
(1, 'faq', 'delete'),
(1, 'faq', 'edit'),
(1, 'faq', 'manage'),
(1, 'file', 'ajaxUpload'),
(1, 'file', 'delete'),
(1, 'file', 'download'),
(1, 'group', 'browse'),
(1, 'group', 'managePriv'),
(1, 'misc', 'ping'),
(1, 'product', 'manage'),
(1, 'product', 'online'),
(1, 'product', 'stop'),
(1, 'product', 'updateorder'),
(1, 'request', 'assignedTo'),
(1, 'request', 'browse'),
(1, 'request', 'changeStatus'),
(1, 'request', 'close'),
(1, 'request', 'comment'),
(1, 'request', 'editReply'),
(1, 'request', 'reply'),
(1, 'request', 'transfer'),
(1, 'request', 'view'),
(1, 'search', 'buildForm'),
(1, 'search', 'buildQuery'),
(1, 'search', 'deleteQuery'),
(1, 'search', 'saveQuery'),
(1, 'search', 'select'),
(1, 'setting', 'setConfig'),
(1, 'user', 'addProductService'),
(1, 'user', 'ajaxGetUser'),
(1, 'user', 'allow'),
(1, 'user', 'browse'),
(1, 'user', 'check'),
(1, 'user', 'create'),
(1, 'user', 'delete'),
(1, 'user', 'edit'),
(1, 'user', 'extendServiceTIme'),
(1, 'user', 'forbid'),
(1, 'user', 'index'),
(1, 'user', 'manageServiceTime'),
(1, 'user', 'modifyPassword'),
(1, 'user', 'myService'),
(1, 'user', 'profile'),
(1, 'user', 'reset'),
(1, 'user', 'view'),
(2, 'api', 'getModel'),
(2, 'category', 'delete'),
(2, 'category', 'manage'),
(2, 'category', 'updateOrder'),
(2, 'faq', 'create'),
(2, 'faq', 'delete'),
(2, 'faq', 'edit'),
(2, 'faq', 'manage'),
(2, 'file', 'ajaxUpload'),
(2, 'file', 'delete'),
(2, 'file', 'download'),
(2, 'group', 'browse'),
(2, 'misc', 'ping'),
(2, 'product', 'manage'),
(2, 'product', 'online'),
(2, 'product', 'stop'),
(2, 'product', 'updateorder'),
(2, 'request', 'assignedTo'),
(2, 'request', 'browse'),
(2, 'request', 'changeStatus'),
(2, 'request', 'close'),
(2, 'request', 'comment'),
(2, 'request', 'editReply'),
(2, 'request', 'reply'),
(2, 'request', 'transfer'),
(2, 'request', 'view'),
(2, 'search', 'buildForm'),
(2, 'search', 'buildQuery'),
(2, 'search', 'deleteQuery'),
(2, 'search', 'saveQuery'),
(2, 'search', 'select'),
(2, 'user', 'addProductService'),
(2, 'user', 'ajaxGetUser'),
(2, 'user', 'allow'),
(2, 'user', 'browse'),
(2, 'user', 'create'),
(2, 'user', 'delete'),
(2, 'user', 'edit'),
(2, 'user', 'extendServiceTIme'),
(2, 'user', 'forbid'),
(2, 'user', 'index'),
(2, 'user', 'manageServiceTime'),
(2, 'user', 'modifyPassword'),
(2, 'user', 'profile'),
(2, 'user', 'view'),
(3, 'faq', 'create'),
(3, 'faq', 'delete'),
(3, 'faq', 'edit'),
(3, 'faq', 'manage'),
(3, 'file', 'ajaxUpload'),
(3, 'file', 'delete'),
(3, 'file', 'download'),
(3, 'misc', 'ping'),
(3, 'request', 'assignedTo'),
(3, 'request', 'browse'),
(3, 'request', 'changeStatus'),
(3, 'request', 'close'),
(3, 'request', 'editReply'),
(3, 'request', 'reply'),
(3, 'request', 'transfer'),
(3, 'request', 'view'),
(3, 'search', 'buildForm'),
(3, 'search', 'buildQuery'),
(3, 'search', 'deleteQuery'),
(3, 'search', 'saveQuery'),
(3, 'search', 'select'),
(3, 'user', 'addProductService'),
(3, 'user', 'allow'),
(3, 'user', 'browse'),
(3, 'user', 'edit'),
(3, 'user', 'extendServiceTIme'),
(3, 'user', 'manageServiceTime'),
(3, 'user', 'modifyPassword'),
(3, 'user', 'profile'),
(3, 'user', 'view'),
(4, 'faq', 'create'),
(4, 'faq', 'edit'),
(4, 'faq', 'manage'),
(4, 'file', 'ajaxUpload'),
(4, 'file', 'delete'),
(4, 'file', 'download'),
(4, 'misc', 'ping'),
(4, 'request', 'assignedTo'),
(4, 'request', 'browse'),
(4, 'request', 'close'),
(4, 'request', 'editReply'),
(4, 'request', 'reply'),
(4, 'request', 'transfer'),
(4, 'request', 'view'),
(4, 'search', 'buildForm'),
(4, 'search', 'buildQuery'),
(4, 'search', 'deleteQuery'),
(4, 'search', 'saveQuery'),
(4, 'search', 'select'),
(4, 'user', 'ajaxGetUser'),
(4, 'user', 'browse'),
(4, 'user', 'edit'),
(4, 'user', 'index'),
(4, 'user', 'manageServiceTime'),
(4, 'user', 'modifyPassword'),
(4, 'user', 'profile'),
(4, 'user', 'view'),
(5, 'file', 'ajaxUpload'),
(5, 'file', 'delete'),
(5, 'file', 'download'),
(5, 'misc', 'ping'),
(5, 'request', 'browse'),
(5, 'request', 'create'),
(5, 'request', 'doubt'),
(5, 'request', 'edit'),
(5, 'request', 'valuate'),
(5, 'request', 'view'),
(5, 'user', 'check'),
(5, 'user', 'edit'),
(5, 'user', 'index'),
(5, 'user', 'modifyPassword'),
(5, 'user', 'myService'),
(5, 'user', 'profile'),
(5, 'user', 'reset');
