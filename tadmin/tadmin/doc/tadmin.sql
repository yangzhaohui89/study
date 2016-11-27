/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : tadmin

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-01-11 17:33:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(40) DEFAULT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `update_time` varchar(40) DEFAULT NULL,
  `update_user` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `nickname` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `tel` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('3', '2015-10-28 17:33:13', 'admin', '2016-01-09 15:05:22', 'admin', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, '18928735441', 'lovefeel2005@163.com', '1', 'admin');
-- ----------------------------
-- Table structure for `t_area`
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `short_name` varchar(50) NOT NULL COMMENT '简称',
  `longitude` float NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` float NOT NULL DEFAULT '0' COMMENT '纬度',
  `level` int(1) NOT NULL COMMENT '等级(1省/直辖市,2地级市,3区县,4镇/街道)',
  `sort` int(3) NOT NULL DEFAULT '1' COMMENT '排序',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态(0禁用/1启用)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_area
-- ----------------------------

-- ----------------------------
-- Table structure for `t_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `update_user` varchar(40) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `classname` varchar(100) DEFAULT NULL,
  `method` varchar(40) DEFAULT NULL,
  `params` varchar(1024) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `execute_time` bigint(20) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `sessionid` varchar(256) DEFAULT NULL,
  `agent` varchar(1024) DEFAULT NULL,
  `remark` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3400 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` varchar(32) NOT NULL,
  `create_time` varchar(40) DEFAULT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `update_time` varchar(40) DEFAULT NULL,
  `update_user` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  `pid` varchar(32) DEFAULT '',
  `url` varchar(255) DEFAULT NULL,
  `path` varchar(320) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `key` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('119c00d4571e92aa2f911886f7d4872d', '2016-01-08 09:26:10', 'admin', '2016-01-08 16:09:00', 'admin', '系统日志', '1', '4', '1', '43ec359e9d90b5b3b45fc08e57e0a940', 'log/index', '43ec359e9d90b5b3b45fc08e57e0a940,119c00d4571e92aa2f911886f7d4872d', 'Hui-iconfont Hui-iconfont-log', 'system:log', '系统日志');
INSERT INTO `t_menu` VALUES ('148b9332ebf596d0782cfc234d284865', '2016-01-08 09:25:46', 'admin', '2016-01-08 16:08:53', 'admin', '菜单管理', '1', '3', '1', '43ec359e9d90b5b3b45fc08e57e0a940', 'menu/index', '43ec359e9d90b5b3b45fc08e57e0a940,148b9332ebf596d0782cfc234d284865', 'Hui-iconfont Hui-iconfont-list', 'system:menu', '菜单管理');
INSERT INTO `t_menu` VALUES ('43ec359e9d90b5b3b45fc08e57e0a940', '2016-01-08 09:21:51', 'admin', '2016-01-08 09:21:51', 'admin', '系统管理', '1', '10', '1', '', '', '43ec359e9d90b5b3b45fc08e57e0a940', 'Hui-iconfont Hui-iconfont-manage', 'system', '系统管理');
INSERT INTO `t_menu` VALUES ('7c4b41401b6df2835138e0ede7d8b9f4', '2016-01-08 09:27:46', 'admin', '2016-01-08 16:10:16', 'admin', '分类列表', '1', '2', '1', '926d328e4ebcfa00879551d26a56b5ac', '', '926d328e4ebcfa00879551d26a56b5ac,7c4b41401b6df2835138e0ede7d8b9f4', 'Hui-iconfont Hui-iconfont-fenlei', 'c:categories', '分类列表');
INSERT INTO `t_menu` VALUES ('926d328e4ebcfa00879551d26a56b5ac', '2016-01-08 09:27:21', 'admin', '2016-01-08 09:32:53', 'admin', '商品管理', '1', '1', '1', '', '', '926d328e4ebcfa00879551d26a56b5ac', 'Hui-iconfont Hui-iconfont-goods', '', '商品管理');
INSERT INTO `t_menu` VALUES ('bf78a43fdeeebdd1602b75fd8b6bdc41', '2016-01-08 09:25:16', 'admin', '2016-01-09 14:34:30', 'admin', '角色管理', '1', '2', '1', '43ec359e9d90b5b3b45fc08e57e0a940', 'role/index', '43ec359e9d90b5b3b45fc08e57e0a940,bf78a43fdeeebdd1602b75fd8b6bdc41', 'Hui-iconfont Hui-iconfont-user-group', 'system:role', '角色管理');
INSERT INTO `t_menu` VALUES ('c2d48f19b4fe994a715410dea9cdd74a', '2016-01-08 09:27:35', 'admin', '2016-01-11 16:44:18', 'admin', '商品列表', '1', '1', '1', '926d328e4ebcfa00879551d26a56b5ac', '', '926d328e4ebcfa00879551d26a56b5ac,c2d48f19b4fe994a715410dea9cdd74a', 'Hui-iconfont Hui-iconfont-goods', 'c:commodity', '商品列表');
INSERT INTO `t_menu` VALUES ('c7d0a83aeff9b0fc22a4cee5cea4e17e', '2016-01-08 09:26:35', 'admin', '2016-01-08 16:09:06', 'admin', '数据库监控', '1', '5', '1', '43ec359e9d90b5b3b45fc08e57e0a940', 'druid/index.html', '43ec359e9d90b5b3b45fc08e57e0a940,c7d0a83aeff9b0fc22a4cee5cea4e17e', 'Hui-iconfont Hui-iconfont-jifen', 'system:druid', '数据库监控');
INSERT INTO `t_menu` VALUES ('ee423725a62a451fdc9b9e360d54177c', '2016-01-08 09:22:49', 'admin', '2016-01-09 14:34:43', 'admin', '管理员列表', '1', '1', '1', '43ec359e9d90b5b3b45fc08e57e0a940', 'admin/index', '43ec359e9d90b5b3b45fc08e57e0a940,ee423725a62a451fdc9b9e360d54177c', 'Hui-iconfont Hui-iconfont-root', 'system:admin', '管理员列表');

-- ----------------------------
-- Table structure for `t_resource`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(40) DEFAULT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `update_time` varchar(40) DEFAULT NULL,
  `update_user` varchar(40) DEFAULT NULL,
  `key` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `menu_id` varchar(40) DEFAULT NULL,
  `sort` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES ('49', '2016-01-08 15:04:32', 'admin', '2016-01-08 15:04:32', 'admin', 'system:admin:edit', '编辑', 'ee423725a62a451fdc9b9e360d54177c', '3');
INSERT INTO `t_resource` VALUES ('48', '2016-01-08 15:04:32', 'admin', '2016-01-08 15:04:32', 'admin', 'system:admin:add', '增加', 'ee423725a62a451fdc9b9e360d54177c', '2');
INSERT INTO `t_resource` VALUES ('47', '2016-01-08 15:04:32', 'admin', '2016-01-08 15:04:32', 'admin', 'system:admin:view', '查看', 'ee423725a62a451fdc9b9e360d54177c', '1');
INSERT INTO `t_resource` VALUES ('77', '2016-01-08 16:09:47', 'admin', '2016-01-08 16:09:47', 'admin', 'c:commodity:add', '增加', 'c2d48f19b4fe994a715410dea9cdd74a', '2');
INSERT INTO `t_resource` VALUES ('75', '2016-01-08 16:09:06', 'admin', '2016-01-08 16:09:06', 'admin', 'system:druid:view', '查看', 'c7d0a83aeff9b0fc22a4cee5cea4e17e', '1');
INSERT INTO `t_resource` VALUES ('76', '2016-01-08 16:09:47', 'admin', '2016-01-08 16:09:47', 'admin', 'c:commodity:view', '查看', 'c2d48f19b4fe994a715410dea9cdd74a', '1');
INSERT INTO `t_resource` VALUES ('53', '2016-01-08 15:06:30', 'admin', '2016-01-08 15:06:30', 'admin', 'system:admin:del', '删除', 'ee423725a62a451fdc9b9e360d54177c', '4');
INSERT INTO `t_resource` VALUES ('78', '2016-01-08 16:09:47', 'admin', '2016-01-08 16:09:47', 'admin', 'c:commodity:edit', '编辑', 'c2d48f19b4fe994a715410dea9cdd74a', '3');
INSERT INTO `t_resource` VALUES ('74', '2016-01-08 16:09:00', 'admin', '2016-01-08 16:09:00', 'admin', 'system:log:del', '删除', '119c00d4571e92aa2f911886f7d4872d', '4');
INSERT INTO `t_resource` VALUES ('73', '2016-01-08 16:09:00', 'admin', '2016-01-08 16:09:00', 'admin', 'system:log:view', '查看', '119c00d4571e92aa2f911886f7d4872d', '1');
INSERT INTO `t_resource` VALUES ('71', '2016-01-08 16:08:53', 'admin', '2016-01-08 16:08:53', 'admin', 'system:menu:edit', '编辑', '148b9332ebf596d0782cfc234d284865', '3');
INSERT INTO `t_resource` VALUES ('70', '2016-01-08 16:08:53', 'admin', '2016-01-08 16:08:53', 'admin', 'system:menu:add', '增加', '148b9332ebf596d0782cfc234d284865', '2');
INSERT INTO `t_resource` VALUES ('69', '2016-01-08 16:08:53', 'admin', '2016-01-08 16:08:53', 'admin', 'system:menu:view', '查看', '148b9332ebf596d0782cfc234d284865', '1');
INSERT INTO `t_resource` VALUES ('65', '2016-01-08 16:08:24', 'admin', '2016-01-08 16:08:24', 'admin', 'system:role:view', '查看', 'bf78a43fdeeebdd1602b75fd8b6bdc41', '1');
INSERT INTO `t_resource` VALUES ('66', '2016-01-08 16:08:24', 'admin', '2016-01-08 16:08:24', 'admin', 'system:role:add', '增加', 'bf78a43fdeeebdd1602b75fd8b6bdc41', '2');
INSERT INTO `t_resource` VALUES ('67', '2016-01-08 16:08:25', 'admin', '2016-01-08 16:08:25', 'admin', 'system:role:edit', '编辑', 'bf78a43fdeeebdd1602b75fd8b6bdc41', '3');
INSERT INTO `t_resource` VALUES ('68', '2016-01-08 16:08:25', 'admin', '2016-01-08 16:08:25', 'admin', 'system:role:del', '删除', 'bf78a43fdeeebdd1602b75fd8b6bdc41', '4');
INSERT INTO `t_resource` VALUES ('72', '2016-01-08 16:08:53', 'admin', '2016-01-08 16:08:53', 'admin', 'system:menu:del', '删除', '148b9332ebf596d0782cfc234d284865', '4');
INSERT INTO `t_resource` VALUES ('79', '2016-01-08 16:09:47', 'admin', '2016-01-08 16:09:47', 'admin', 'c:commodity:del', '删除', 'c2d48f19b4fe994a715410dea9cdd74a', '4');
INSERT INTO `t_resource` VALUES ('80', '2016-01-08 16:10:16', 'admin', '2016-01-08 16:10:16', 'admin', 'c:categories:view', '查看', '7c4b41401b6df2835138e0ede7d8b9f4', '1');
INSERT INTO `t_resource` VALUES ('81', '2016-01-08 16:10:16', 'admin', '2016-01-08 16:10:16', 'admin', 'c:categories:add', '增加', '7c4b41401b6df2835138e0ede7d8b9f4', '2');
INSERT INTO `t_resource` VALUES ('82', '2016-01-08 16:10:16', 'admin', '2016-01-08 16:10:16', 'admin', 'c:categories:edit', '编辑', '7c4b41401b6df2835138e0ede7d8b9f4', '3');
INSERT INTO `t_resource` VALUES ('83', '2016-01-08 16:10:16', 'admin', '2016-01-08 16:10:16', 'admin', 'c:categories:del', '删除', '7c4b41401b6df2835138e0ede7d8b9f4', '4');
INSERT INTO `t_resource` VALUES ('84', '2016-01-09 14:34:31', 'admin', '2016-01-09 14:34:31', 'admin', 'system:role:status', '更新状态', 'bf78a43fdeeebdd1602b75fd8b6bdc41', '5');
INSERT INTO `t_resource` VALUES ('85', '2016-01-09 14:34:43', 'admin', '2016-01-09 14:34:43', 'admin', 'system:admin:status', '更新状态', 'ee423725a62a451fdc9b9e360d54177c', '5');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(40) DEFAULT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `update_time` varchar(40) DEFAULT NULL,
  `update_user` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', null, null, '2016-01-08 17:21:59', 'admin', '系统管理员', '1', '系统管理员');
INSERT INTO `t_role` VALUES ('34', '2016-01-09 11:14:00', 'admin', '2016-01-09 15:16:53', 'admin', '只读会员', '1', '');

-- ----------------------------
-- Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(40) DEFAULT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `update_time` varchar(40) DEFAULT NULL,
  `update_user` varchar(40) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('35', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '49');
INSERT INTO `t_role_permission` VALUES ('36', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '48');
INSERT INTO `t_role_permission` VALUES ('37', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '47');
INSERT INTO `t_role_permission` VALUES ('38', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '53');
INSERT INTO `t_role_permission` VALUES ('39', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '65');
INSERT INTO `t_role_permission` VALUES ('40', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '66');
INSERT INTO `t_role_permission` VALUES ('41', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '67');
INSERT INTO `t_role_permission` VALUES ('42', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '68');
INSERT INTO `t_role_permission` VALUES ('43', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '71');
INSERT INTO `t_role_permission` VALUES ('44', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '70');
INSERT INTO `t_role_permission` VALUES ('45', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '69');
INSERT INTO `t_role_permission` VALUES ('46', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '72');
INSERT INTO `t_role_permission` VALUES ('47', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '74');
INSERT INTO `t_role_permission` VALUES ('48', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '73');
INSERT INTO `t_role_permission` VALUES ('49', '2016-01-08 17:21:59', 'admin', '2016-01-08 17:21:59', 'admin', '1', '75');
INSERT INTO `t_role_permission` VALUES ('52', '2016-01-09 11:14:00', 'admin', '2016-01-09 11:14:00', 'admin', '34', '47');
INSERT INTO `t_role_permission` VALUES ('53', '2016-01-09 11:14:00', 'admin', '2016-01-09 11:14:00', 'admin', '34', '65');
INSERT INTO `t_role_permission` VALUES ('54', '2016-01-09 11:14:00', 'admin', '2016-01-09 11:14:00', 'admin', '34', '69');
INSERT INTO `t_role_permission` VALUES ('55', '2016-01-09 11:14:00', 'admin', '2016-01-09 11:14:00', 'admin', '34', '73');
INSERT INTO `t_role_permission` VALUES ('56', '2016-01-09 11:14:00', 'admin', '2016-01-09 11:14:00', 'admin', '34', '75');

-- ----------------------------
-- Table structure for `t_upload`
-- ----------------------------
DROP TABLE IF EXISTS `t_upload`;
CREATE TABLE `t_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `update_user` varchar(40) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `refid` int(11) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_upload
-- ----------------------------
-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(40) DEFAULT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `update_time` varchar(40) DEFAULT NULL,
  `update_user` varchar(40) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('41', '2016-01-09 15:16:23', 'admin', '2016-01-09 15:16:23', 'admin', '28', '34');
