/*
Navicat MySQL Data Transfer

Source Server         : mysq-local
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : shiro_test

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-11-19 09:35:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sec_permission
-- ----------------------------
DROP TABLE IF EXISTS `sec_permission`;
CREATE TABLE `sec_permission` (
  `permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sec_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sec_role
-- ----------------------------
DROP TABLE IF EXISTS `sec_role`;
CREATE TABLE `sec_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sec_role
-- ----------------------------

-- ----------------------------
-- Table structure for sec_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sec_role_permission`;
CREATE TABLE `sec_role_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_id` (`permission_id`),
  KEY `role_id1` (`role_id`),
  CONSTRAINT `permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sec_permission` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_id1` FOREIGN KEY (`role_id`) REFERENCES `sec_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sec_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sec_user
-- ----------------------------
DROP TABLE IF EXISTS `sec_user`;
CREATE TABLE `sec_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sec_user
-- ----------------------------

-- ----------------------------
-- Table structure for sec_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sec_user_role`;
CREATE TABLE `sec_user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `sec_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `sec_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sec_user_role
-- ----------------------------
