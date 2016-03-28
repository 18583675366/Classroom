/*
Navicat MySQL Data Transfer

Source Server         : dg
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : classroom

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-03-28 17:19:17
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cl_classroom
-- ----------------------------
INSERT INTO `cl_classroom` VALUES ('9', '1', '2', '1', null, '2016-03-26', '0', '909-0', '02', '1', '2', '4');
INSERT INTO `cl_classroom` VALUES ('10', '1', '2', '1', null, '2016-03-27', '0', '909-0', '02', '1', '2', '4');
INSERT INTO `cl_classroom` VALUES ('11', '1', '2', '1', null, '2016-03-27', '0', '909-0', '02', '1', '2', '4');
INSERT INTO `cl_classroom` VALUES ('12', '1', '2', '1', null, '2016-03-27', '0', '909-0', '02', '1', '2', '4');
INSERT INTO `cl_classroom` VALUES ('13', '2', '1', '1', null, '2016-03-27', '0', '13212', '02', '3', '6', '4');
INSERT INTO `cl_classroom` VALUES ('14', '2', '1', '1', null, '2016-03-27', '0', '', '01', '2', '2', '4');
INSERT INTO `cl_classroom` VALUES ('15', '2', '1', '1', null, '2016-03-27', '0', 'weqwe', '01', '2', '3', '4');
INSERT INTO `cl_classroom` VALUES ('16', '2', '1', '1', null, '2016-03-27', '0', 'werwe', '', '1', '2', '4');
INSERT INTO `cl_classroom` VALUES ('17', '5', '1', '1', null, '2016-03-28', '0', 'swfsdf', '', '2', '4', '4');
INSERT INTO `cl_classroom` VALUES ('18', '1', '1', '1', null, '2016-03-28', '0', '099', '02', '2', '3', '4');

-- ----------------------------
-- Table structure for `cl_msg`
-- ----------------------------
DROP TABLE IF EXISTS `cl_msg`;
CREATE TABLE `cl_msg` (
  `m_id` int(11) NOT NULL,
  `m_conteng` varchar(20) DEFAULT NULL,
  `m_time` date DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cl_msg
-- ----------------------------

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
