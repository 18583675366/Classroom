/*
Navicat MySQL Data Transfer

Source Server         : dg
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : classroom

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-03-31 16:10:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cl_classroom`
-- ----------------------------
DROP TABLE IF EXISTS `cl_classroom`;
CREATE TABLE `cl_classroom` (
  `cr_id` int(11) NOT NULL AUTO_INCREMENT,
  `cr_dec` int(11) DEFAULT NULL,
  `cr_seat` int(11) DEFAULT NULL,
  `cr_type` int(11) DEFAULT NULL,
  `cr_state` varchar(0) DEFAULT NULL,
  `cr_usertime` date DEFAULT NULL,
  `cr_userteach` varchar(255) DEFAULT NULL,
  `cr_activecontent` varchar(255) DEFAULT NULL,
  `cr_location` varchar(255) DEFAULT NULL,
  `cr_timestart` varchar(255) DEFAULT NULL,
  `cr_timeend` varchar(255) DEFAULT NULL,
  `u_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cl_classroom
-- ----------------------------
INSERT INTO `cl_classroom` VALUES ('9', '1', '2', '1', null, '2016-03-26', '0', '909-0', '02', '1', '2', '4');
INSERT INTO `cl_classroom` VALUES ('10', '1', '2', '1', null, '2016-03-27', '0', '909-0', '02', '1', '2', '4');
INSERT INTO `cl_classroom` VALUES ('11', '1', '2', '1', null, '2016-03-27', '0', '909-0', '02', '1', '2', '4');
INSERT INTO `cl_classroom` VALUES ('12', '1', '2', '1', null, '2016-03-27', '0', '909-0', '02', '1', '2', '4');
INSERT INTO `cl_classroom` VALUES ('13', '2', '1', '1', null, '2016-03-27', '0', '13212', '02', '3', '6', '4');
INSERT INTO `cl_classroom` VALUES ('14', '2', '1', '1', null, '2016-03-27', '0', '1312', '01', '2', '2', '4');
INSERT INTO `cl_classroom` VALUES ('15', '2', '1', '1', null, '2016-03-27', '0', 'weqwe', '01', '2', '3', '4');
INSERT INTO `cl_classroom` VALUES ('16', '2', '1', '1', null, '2016-03-27', '0', 'werwe', '02', '1', '2', '4');
INSERT INTO `cl_classroom` VALUES ('17', '5', '1', '1', null, '2016-03-28', '0', 'swfsdf', '03', '2', '4', '4');
INSERT INTO `cl_classroom` VALUES ('18', '1', '1', '1', null, '2016-03-28', '0', '099', '02', '2', '3', '4');
INSERT INTO `cl_classroom` VALUES ('19', '10', '1', '1', null, '2016-03-30', '0', '21', '02', '3', '6', '4');
INSERT INTO `cl_classroom` VALUES ('20', '10', '1', '1', null, '2016-03-30', '0', '21', '02', '3', '6', '4');
INSERT INTO `cl_classroom` VALUES ('21', '10', '1', '1', null, '2016-03-30', '0', '21', '02', '3', '6', '4');
INSERT INTO `cl_classroom` VALUES ('22', '9', '1', '1', null, '2016-03-30', '0', '789', '02', '3', '4', '4');
INSERT INTO `cl_classroom` VALUES ('23', '9', '1', '1', null, '2016-03-30', '0', '789', '02', '3', '4', '4');
INSERT INTO `cl_classroom` VALUES ('24', '9', '1', '1', null, '2016-03-30', '0', '789', '02', '3', '4', '4');
INSERT INTO `cl_classroom` VALUES ('25', '9', '1', '1', null, '2016-03-30', '0', '90', '02', '9', '13', '4');
INSERT INTO `cl_classroom` VALUES ('26', '9', '1', '1', null, '2016-03-30', '0', '90', '03', '9', '13', '4');
INSERT INTO `cl_classroom` VALUES ('27', '9', '1', '1', null, '2016-03-30', '0', '90', '02', '9', '13', '4');
INSERT INTO `cl_classroom` VALUES ('28', '9', '1', '1', null, '2016-03-30', '0', '9090', '03', '3', '4', '4');
INSERT INTO `cl_classroom` VALUES ('29', '11', '1', '1', null, '2016-03-30', '0', '34', '03', '2', '1', '4');
INSERT INTO `cl_classroom` VALUES ('30', '10', '1', '1', null, '2016-03-30', '0', '12', '01', '3', '5', '4');
INSERT INTO `cl_classroom` VALUES ('31', null, null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `cl_classroom` VALUES ('32', '8', '1', '1', null, '2016-03-30', '0', '90890', '02', '2', '5', '4');
INSERT INTO `cl_classroom` VALUES ('33', '11', '1', '1', null, '2016-03-30', '0', '090', '', '2', '2', '4');
INSERT INTO `cl_classroom` VALUES ('34', '8', '1', '1', null, '2016-03-30', '0', 'ioip', '01', '11', '13', '4');
INSERT INTO `cl_classroom` VALUES ('35', '8', '1', '1', null, '2016-03-30', '0', 'ioip', '01', '11', '13', '4');
INSERT INTO `cl_classroom` VALUES ('36', '11', '1', '1', null, '2016-03-30', '0', '090', '', '2', '2', '4');

-- ----------------------------
-- Table structure for `cl_msg`
-- ----------------------------
DROP TABLE IF EXISTS `cl_msg`;
CREATE TABLE `cl_msg` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_content` varchar(200) DEFAULT NULL,
  `m_time` varchar(200) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `cr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cl_msg
-- ----------------------------
INSERT INTO `cl_msg` VALUES ('3', '773421284@qq.com提交申请null', '2016-3-30 10:24:36', '4', '1');
INSERT INTO `cl_msg` VALUES ('4', '773421284@qq.com提交申请33', '2016-3-30 10:34:31', '4', '1');
INSERT INTO `cl_msg` VALUES ('5', '773421284@qq.com提交申请34', '2016-3-30 10:35:55', '4', '1');
INSERT INTO `cl_msg` VALUES ('6', '773421284@qq.com提交申请35', '2016-3-30 10:36:55', '4', '35');
INSERT INTO `cl_msg` VALUES ('7', '773421284@qq.com提交申请36', '2016-3-30 10:41:45', '4', '36');

-- ----------------------------
-- Table structure for `cl_user`
-- ----------------------------
DROP TABLE IF EXISTS `cl_user`;
CREATE TABLE `cl_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_account` varchar(200) DEFAULT NULL,
  `u_password` varchar(200) DEFAULT NULL,
  `u_identif` int(200) DEFAULT NULL,
  `u_username` varchar(200) DEFAULT NULL,
  `u_active` int(200) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cl_user
-- ----------------------------
INSERT INTO `cl_user` VALUES ('4', '773421284@qq.com', '1212', '0', '8f9d4347-f596-4dbb-a36a-4e10c62a8bdd', '0');
