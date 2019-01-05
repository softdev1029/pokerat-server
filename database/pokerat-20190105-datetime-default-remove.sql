/*
Navicat MySQL Data Transfer

Source Server         : Redhat-MySQL
Source Server Version : 50171
Source Host           : 192.168.14.37:3306
Source Database       : pokerat

Target Server Type    : MYSQL
Target Server Version : 50171
File Encoding         : 65001

Date: 2019-01-05 13:35:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for best_friend_request
-- ----------------------------
DROP TABLE IF EXISTS `best_friend_request`;
CREATE TABLE `best_friend_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_email` varchar(30) NOT NULL,
  `to_email` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of best_friend_request
-- ----------------------------
INSERT INTO `best_friend_request` VALUES ('1', 'raed@s.com', 'salina.x7@gmail.com', 'Guest', '1');
INSERT INTO `best_friend_request` VALUES ('2', 'raed@s.com', 'queenb@pokerat.com', 'Guest', '1');
INSERT INTO `best_friend_request` VALUES ('3', 'vitaliy@gmail.com', 'raed@s.com', 'vitaliy', '1');
INSERT INTO `best_friend_request` VALUES ('4', 'vitaliy@gmail.com', 'genya@gmail.com', 'vitaliy', '0');
INSERT INTO `best_friend_request` VALUES ('5', 'vitaliy@gmail.com', 'raed@s.com', 'vitaliy', '1');
INSERT INTO `best_friend_request` VALUES ('6', 'raed@s.com', 'vitaliy@gmail.com', 'Guest', '1');
INSERT INTO `best_friend_request` VALUES ('7', 'salina.x7@gmail.com', 'raed@s.com', 'RaHaF', '1');
INSERT INTO `best_friend_request` VALUES ('8', 'vitaliy@gmail.com', 'salina.x7@gmail.com', 'vitaliy', '1');
INSERT INTO `best_friend_request` VALUES ('9', 'vitaliy@gmail.com', 'raed@s.com', 'vitaliy', '1');
INSERT INTO `best_friend_request` VALUES ('10', 'raed@s.com', 'gm-1411@hotmail.com', 'Guest', '1');
INSERT INTO `best_friend_request` VALUES ('11', 'raed@s.com', 'vitaliy@gmail.com', 'Guest', '1');
INSERT INTO `best_friend_request` VALUES ('12', 'vitaliy@gmail.com', 'genya@gmail.com', 'vitaliy', '0');
INSERT INTO `best_friend_request` VALUES ('13', 'vitaliy@gmail.com', 'raed@s.com', 'vitaliy', '1');
INSERT INTO `best_friend_request` VALUES ('14', 'raed@s.com', 'salina.x7@gmail.com', 'Guest', '1');
INSERT INTO `best_friend_request` VALUES ('15', 'raed@s.com', 'vitaliy@gmail.com', 'Guest', '1');
INSERT INTO `best_friend_request` VALUES ('16', 'raed@s.com', 'salina.x7@gmail.com', 'Guest', '1');
INSERT INTO `best_friend_request` VALUES ('17', 'salina.x7@gmail.com', 'jojo@hotmail.com', 'RaHaF', '0');
INSERT INTO `best_friend_request` VALUES ('18', 'salina.x7@gmail.com', 'raed@s.com', 'RaHaF', '1');
INSERT INTO `best_friend_request` VALUES ('19', 'raed@s.com', 'queenb@pokerat.com', 'Guest', '1');
INSERT INTO `best_friend_request` VALUES ('20', 'raed@s.com', 'hamadan992@gmail.com', 'Guest', '1');
INSERT INTO `best_friend_request` VALUES ('21', 'queenb@pokerat.com', 'hamadan992@gmail.com', 'ê†°ê€ŽêŸêŸêˆ¤ êŒƒ', '1');
INSERT INTO `best_friend_request` VALUES ('22', 'raed@s.com', 'nano@n.com', 'Raed', '1');
INSERT INTO `best_friend_request` VALUES ('23', 'raed@s.com', '', 'Raed', '0');
INSERT INTO `best_friend_request` VALUES ('24', 'm@eaz.com', 'raed@s.com', 'Gudge', '1');
INSERT INTO `best_friend_request` VALUES ('25', 'raed@s.com', 'm@eaz.com', 'Raed', '0');
INSERT INTO `best_friend_request` VALUES ('26', 'raed@s.com', 'jojo@hotmail.com', 'Raed', '0');
INSERT INTO `best_friend_request` VALUES ('27', 'queenb@pokerat.com', 'raed@s.com', 'ê†°ê€ŽêŸêŸêˆ¤ êŒƒ', '1');
INSERT INTO `best_friend_request` VALUES ('28', 'salina.x7@gmail.com', '', 'RaHaF', '0');
INSERT INTO `best_friend_request` VALUES ('29', 'alamra7@gmail.com', 'gm-1411@hotmail.com', 'Hmood914', '1');
INSERT INTO `best_friend_request` VALUES ('30', 'kw00kw@yahoo.com', 'raed@s.com', 'Ms Love', '1');
INSERT INTO `best_friend_request` VALUES ('31', 'queenb@pokerat.com', 'm@eaz.com', 'ê†°ê€ŽêŸêŸêˆ¤ êŒƒ', '0');
INSERT INTO `best_friend_request` VALUES ('32', 'soso@hotmail.com', 'm@pokerat.com', 'Ãà¸¿ÅÅÅÅ”Ã', '1');
INSERT INTO `best_friend_request` VALUES ('33', 'test1@gmail.com', 'test3@gmail.com', 'test1', '1');
INSERT INTO `best_friend_request` VALUES ('34', 'test1@gmail.com', 'test4@gmail.com', 'test1', '1');
INSERT INTO `best_friend_request` VALUES ('35', 'test3@gmail.com', 'test1@gmail.com', 'test4', '1');
INSERT INTO `best_friend_request` VALUES ('36', 'test3@gmail.com', 'test3@gmail.com', 'test4', '1');
INSERT INTO `best_friend_request` VALUES ('37', 'test4@gmail.com', 'test1@gmail.com', 'test4', '1');
INSERT INTO `best_friend_request` VALUES ('38', 'test4@gmail.com', 'test3@gmail.com', 'test4', '1');

-- ----------------------------
-- Table structure for daily_bonus
-- ----------------------------
DROP TABLE IF EXISTS `daily_bonus`;
CREATE TABLE `daily_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `day` int(11) NOT NULL DEFAULT '1',
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for daily_hand
-- ----------------------------
DROP TABLE IF EXISTS `daily_hand`;
CREATE TABLE `daily_hand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `gain_date` date NOT NULL,
  `gain` bigint(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `friend_email` varchar(50) DEFAULT NULL,
  `chat` int(1) NOT NULL DEFAULT '0',
  `chat_time` bigint(20) NOT NULL DEFAULT '0',
  `best_friend` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES ('11', 'salina.x7@gmail.com', 'vitaliy@gmail.com', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('12', 'vitaliy@gmail.com', 'salina.x7@gmail.com', '1', '1536254874953', '0');
INSERT INTO `friend` VALUES ('37', 'raed@s.com', 'm@eaz.com', '1', '1537321486268', '1');
INSERT INTO `friend` VALUES ('38', 'm@eaz.com', 'raed@s.com', '1', '1536398923059', '0');
INSERT INTO `friend` VALUES ('39', 'm@eaz.com', 'salina.x7@gmail.com', '1', '1536398923059', '0');
INSERT INTO `friend` VALUES ('40', 'salina.x7@gmail.com', 'm@eaz.com', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('41', 'raed@s.com', 'salina.x7@gmail.com', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('42', 'salina.x7@gmail.com', 'raed@s.com', '0', '1536444476808', '0');
INSERT INTO `friend` VALUES ('45', 'vitaliy@gmail.com', 'm@eaz.com', '0', '1536254874953', '0');
INSERT INTO `friend` VALUES ('46', 'm@eaz.com', 'vitaliy@gmail.com', '0', '1536398923059', '0');
INSERT INTO `friend` VALUES ('47', 'E916F39C-A6E3-4721-BA23-2B1072F4C3D9', 'salina.x7@gmail.com', '1', '1534775695264', '0');
INSERT INTO `friend` VALUES ('48', 'salina.x7@gmail.com', 'E916F39C-A6E3-4721-BA23-2B1072F4C3D9', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('59', 'soso@hotmail.com', 'raed@s.com', '0', '1537086327672', '0');
INSERT INTO `friend` VALUES ('60', 'raed@s.com', 'soso@hotmail.com', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('61', 'raed@s.com', 'gm-1411@hotmail.com', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('62', 'gm-1411@hotmail.com', 'raed@s.com', '1', '1536411832147', '0');
INSERT INTO `friend` VALUES ('63', '9EEE0E0F-F436-4A4D-9AA0-ECD41D744AD6', 'raed@s.com', '1', '1531452274240', '0');
INSERT INTO `friend` VALUES ('64', 'raed@s.com', '9EEE0E0F-F436-4A4D-9AA0-ECD41D744AD6', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('65', 'noor@hotmail.com', 'raed@s.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('66', 'raed@s.com', 'noor@hotmail.com', '0', '1537321486268', '0');
INSERT INTO `friend` VALUES ('69', 'gm-1411@hotmail.com', 'salina.x7@gmail.com', '1', '1536411832147', '0');
INSERT INTO `friend` VALUES ('70', 'salina.x7@gmail.com', 'gm-1411@hotmail.com', '1', '1536444476808', '1');
INSERT INTO `friend` VALUES ('71', 'm@eaz.com', 'soso@hotmail.com', '0', '1536398923059', '0');
INSERT INTO `friend` VALUES ('72', 'soso@hotmail.com', 'm@eaz.com', '0', '1537086327672', '0');
INSERT INTO `friend` VALUES ('73', 'm@eaz.com', 'gm-1411@hotmail.com', '0', '1536398923059', '0');
INSERT INTO `friend` VALUES ('74', 'gm-1411@hotmail.com', 'm@eaz.com', '0', '1536411832147', '0');
INSERT INTO `friend` VALUES ('75', 'gm-1411@hotmail.com', 'soso@hotmail.com', '0', '1536411832147', '0');
INSERT INTO `friend` VALUES ('76', 'soso@hotmail.com', 'gm-1411@hotmail.com', '0', '1537086327672', '0');
INSERT INTO `friend` VALUES ('77', 'salina.x7@gmail.com', 'soso@hotmail.com', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('78', 'soso@hotmail.com', 'salina.x7@gmail.com', '1', '1537086327672', '0');
INSERT INTO `friend` VALUES ('81', 'mm@hotmail.com', 'raed@s.com', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('82', 'raed@s.com', 'mm@hotmail.com', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('83', 'jojo@hotmail.com', 'raed@s.com', '0', '1532268070439', '1');
INSERT INTO `friend` VALUES ('84', 'raed@s.com', 'jojo@hotmail.com', '0', '1537321486268', '0');
INSERT INTO `friend` VALUES ('85', 'jojo@hotmail.com', 'm@eaz.com', '0', '1532268070439', '0');
INSERT INTO `friend` VALUES ('86', 'm@eaz.com', 'jojo@hotmail.com', '0', '1536398923059', '0');
INSERT INTO `friend` VALUES ('87', 'jojo@hotmail.com', 'salina.x7@gmail.com', '0', '1532268070439', '0');
INSERT INTO `friend` VALUES ('88', 'salina.x7@gmail.com', 'jojo@hotmail.com', '0', '1536444476808', '0');
INSERT INTO `friend` VALUES ('89', 'genya@gmail.com', 'vitaliy@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('90', 'vitaliy@gmail.com', 'genya@gmail.com', '0', '1536254874953', '0');
INSERT INTO `friend` VALUES ('91', 'm@pokerat.com', 'soso@hotmail.com', '1', '1537090335285', '1');
INSERT INTO `friend` VALUES ('92', 'soso@hotmail.com', 'm@pokerat.com', '1', '1537086327672', '1');
INSERT INTO `friend` VALUES ('93', 'raed@s.com', 'm@pokerat.com', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('94', 'm@pokerat.com', 'raed@s.com', '1', '1537090335285', '0');
INSERT INTO `friend` VALUES ('95', 'm@pokerat.com', 'gm-1411@hotmail.com', '0', '1537090335285', '0');
INSERT INTO `friend` VALUES ('96', 'gm-1411@hotmail.com', 'm@pokerat.com', '0', '1536411832147', '0');
INSERT INTO `friend` VALUES ('97', 'm@pokerat.com', 'salina.x7@gmail.com', '0', '1537090335285', '0');
INSERT INTO `friend` VALUES ('98', 'salina.x7@gmail.com', 'm@pokerat.com', '0', '1536444476808', '0');
INSERT INTO `friend` VALUES ('99', 'raed@s.com', 'nano@pokerar.com', '0', '1537321486268', '0');
INSERT INTO `friend` VALUES ('100', 'nano@pokerar.com', 'raed@s.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('101', 'nano@n.com', 'raed@s.com', '1', '1534910725409', '0');
INSERT INTO `friend` VALUES ('102', 'raed@s.com', 'nano@n.com', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('103', 'nano@n.com', 'soso@hotmail.com', '0', '1534910725409', '0');
INSERT INTO `friend` VALUES ('104', 'soso@hotmail.com', 'nano@n.com', '0', '1537086327672', '0');
INSERT INTO `friend` VALUES ('105', 'nano@n.com', 'salina.x7@gmail.com', '1', '1534910725409', '0');
INSERT INTO `friend` VALUES ('106', 'salina.x7@gmail.com', 'nano@n.com', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('109', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', 'soso@hotmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('110', 'soso@hotmail.com', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', '0', '1537086327672', '0');
INSERT INTO `friend` VALUES ('111', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', 'salina.x7@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('112', 'salina.x7@gmail.com', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', '0', '1536444476808', '0');
INSERT INTO `friend` VALUES ('113', 'raed@s.com', 'fafa1122@gmail.com', '1', '1537321486268', '1');
INSERT INTO `friend` VALUES ('114', 'fafa1122@gmail.com', 'raed@s.com', '0', '1536628435839', '0');
INSERT INTO `friend` VALUES ('115', 'raed@s.com', 'CBC73BED-EACC-49C1-9F88-89630B2986F6', '0', '1537321486268', '0');
INSERT INTO `friend` VALUES ('116', 'CBC73BED-EACC-49C1-9F88-89630B2986F6', 'raed@s.com', '0', '1533324349461', '0');
INSERT INTO `friend` VALUES ('117', 'raed@s.com', '5B955552-64F3-4421-94B8-E8FA2AE24787', '0', '1537321486268', '0');
INSERT INTO `friend` VALUES ('118', '5B955552-64F3-4421-94B8-E8FA2AE24787', 'raed@s.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('119', '9C785950-5A32-4906-866B-4880B4B51B18', 'raed@s.com', '0', '1534247827021', '0');
INSERT INTO `friend` VALUES ('120', 'raed@s.com', '9C785950-5A32-4906-866B-4880B4B51B18', '0', '1537321486268', '0');
INSERT INTO `friend` VALUES ('121', 'raed@s.com', 'rawan@hotmail.com', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('122', 'rawan@hotmail.com', 'raed@s.com', '1', '1534526060729', '0');
INSERT INTO `friend` VALUES ('123', 'raed@s.com', 'hamadan992@gmail.com', '1', '1537321486268', '1');
INSERT INTO `friend` VALUES ('124', 'hamadan992@gmail.com', 'raed@s.com', '0', '1536444476808', '0');
INSERT INTO `friend` VALUES ('125', 'raed@s.com', 'HNA2030@hotmail.com', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('126', 'HNA2030@hotmail.com', 'raed@s.com', '1', '1534910881835', '0');
INSERT INTO `friend` VALUES ('127', 'HNA2030@hotmail.com', 'gm-1411@hotmail.com', '1', '1534910881835', '0');
INSERT INTO `friend` VALUES ('128', 'gm-1411@hotmail.com', 'HNA2030@hotmail.com', '1', '1536411832147', '1');
INSERT INTO `friend` VALUES ('129', 'raed@s.com', 'alamra7@gmail.com', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('130', 'alamra7@gmail.com', 'raed@s.com', '1', '1536274681500', '0');
INSERT INTO `friend` VALUES ('131', 'alamra7@gmail.com', 'gm-1411@hotmail.com', '1', '1536274681500', '0');
INSERT INTO `friend` VALUES ('132', 'gm-1411@hotmail.com', 'alamra7@gmail.com', '1', '1536411832147', '1');
INSERT INTO `friend` VALUES ('133', 'hamadan992@gmail.com', 'gm-1411@hotmail.com', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('134', 'gm-1411@hotmail.com', 'hamadan992@gmail.com', '1', '1536411832147', '0');
INSERT INTO `friend` VALUES ('135', 'hamadan992@gmail.com', 'HNA2030@hotmail.com', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('136', 'HNA2030@hotmail.com', 'hamadan992@gmail.com', '1', '1534910881835', '0');
INSERT INTO `friend` VALUES ('137', 'salina.x7@gmail.com', 'HNA2030@hotmail.com', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('138', 'HNA2030@hotmail.com', 'salina.x7@gmail.com', '1', '1534910881835', '0');
INSERT INTO `friend` VALUES ('139', 'salina.x7@gmail.com', 'hamadan992@gmail.com', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('140', 'hamadan992@gmail.com', 'salina.x7@gmail.com', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('141', 'CBC73BED-EACC-49C1-9F88-89630B2986F6', 'nano@n.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('142', 'nano@n.com', 'CBC73BED-EACC-49C1-9F88-89630B2986F6', '0', '1534910725409', '0');
INSERT INTO `friend` VALUES ('143', 'nano@n.com', 'CBC73BED-EACC-49C1-9F88-89630B2986F6', '0', '1534910725409', '0');
INSERT INTO `friend` VALUES ('144', 'hna2030', 'raed@s.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('145', 'raed@s.com', 'hna2030', '0', '1537321486268', '0');
INSERT INTO `friend` VALUES ('146', 'EC969D9B-FFF1-46FE-8A0A-03B123D4BCA7', 'raed@s.com', '1', '1535127999265', '0');
INSERT INTO `friend` VALUES ('147', 'raed@s.com', 'EC969D9B-FFF1-46FE-8A0A-03B123D4BCA7', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('148', 'raed@s.com', 'bayan@pokerat.com', '0', '1537321486268', '0');
INSERT INTO `friend` VALUES ('149', 'bayan@pokerat.com', 'raed@s.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('150', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', 'vitaliy@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('151', 'vitaliy@gmail.com', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', '0', '1536254874953', '0');
INSERT INTO `friend` VALUES ('152', '50EAFA68-1DB3-435F-A5D4-11A3FF4DA124', 'vitaliy@gmail.com', '1', '1536254874953', '0');
INSERT INTO `friend` VALUES ('153', 'vitaliy@gmail.com', '50EAFA68-1DB3-435F-A5D4-11A3FF4DA124', '1', '1536254874953', '0');
INSERT INTO `friend` VALUES ('154', 'salina.x7@gmail.com', 'alamra7@gmail.com', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('155', 'alamra7@gmail.com', 'salina.x7@gmail.com', '1', '1536274681500', '0');
INSERT INTO `friend` VALUES ('156', 'raed@s.com', 'vitaliy@gmail.com', '0', '1537321486268', '1');
INSERT INTO `friend` VALUES ('157', 'vitaliy@gmail.com', 'raed@s.com', '0', '1536254874953', '0');
INSERT INTO `friend` VALUES ('158', 'raed@s.com', 'aso.26@hotmail.com', '1', '1537321486268', '1');
INSERT INTO `friend` VALUES ('159', 'aso.26@hotmail.com', 'raed@s.com', '1', '1536437096656', '0');
INSERT INTO `friend` VALUES ('160', 'm@pokerat.com', 'fafa1122@gmail.com', '0', '1537090335285', '0');
INSERT INTO `friend` VALUES ('161', 'fafa1122@gmail.com', 'm@pokerat.com', '0', '1536628435839', '0');
INSERT INTO `friend` VALUES ('162', 'salina.x7@gmail.com', 'fafa1122@gmail.com', '0', '1536444476808', '0');
INSERT INTO `friend` VALUES ('163', 'fafa1122@gmail.com', 'salina.x7@gmail.com', '0', '1536628435839', '0');
INSERT INTO `friend` VALUES ('166', 'raed@s.com', 'omhmood27@yahoo.com', '1', '1537321486268', '1');
INSERT INTO `friend` VALUES ('167', 'omhmood27@yahoo.com', 'raed@s.com', '1', '1536236614660', '0');
INSERT INTO `friend` VALUES ('168', 'salina.x7@gmail.com', 'omhmood27@yahoo.com', '0', '1536444476808', '0');
INSERT INTO `friend` VALUES ('169', 'omhmood27@yahoo.com', 'salina.x7@gmail.com', '0', '1536236614660', '0');
INSERT INTO `friend` VALUES ('170', 'queenb@pokerat.com', 'raed@s.com', '0', '1536368657461', '0');
INSERT INTO `friend` VALUES ('171', 'raed@s.com', 'queenb@pokerat.com', '1', '1537321486268', '0');
INSERT INTO `friend` VALUES ('172', 'queenb@pokerat.com', 'hamadan992@gmail.com', '1', '1536368657461', '0');
INSERT INTO `friend` VALUES ('173', 'hamadan992@gmail.com', 'queenb@pokerat.com', '1', '1536444476808', '0');
INSERT INTO `friend` VALUES ('174', '20835F78-01B8-4E33-A592-68794A7BC0ED', 'salina.x7@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('175', 'salina.x7@gmail.com', '20835F78-01B8-4E33-A592-68794A7BC0ED', '0', '1536444476808', '0');
INSERT INTO `friend` VALUES ('176', 'queenb@pokerat.com', 'soso@hotmail.com', '0', '1536368657461', '0');
INSERT INTO `friend` VALUES ('177', 'soso@hotmail.com', 'queenb@pokerat.com', '0', '1537086327672', '0');
INSERT INTO `friend` VALUES ('178', '20835F78-01B8-4E33-A592-68794A7BC0ED', 'm@eaz.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('179', 'm@eaz.com', '20835F78-01B8-4E33-A592-68794A7BC0ED', '0', '1536398923059', '0');
INSERT INTO `friend` VALUES ('180', 'm@eaz.com', 'queenb@pokerat.com', '0', '1536398923059', '1');
INSERT INTO `friend` VALUES ('181', 'queenb@pokerat.com', 'm@eaz.com', '0', '1536368657461', '0');
INSERT INTO `friend` VALUES ('182', 'queenb@pokerat.com', 'nano@n.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('183', 'nano@n.com', 'queenb@pokerat.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('184', 'kw00kw@yahoo.com', 'raed@s.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('185', 'raed@s.com', 'kw00kw@yahoo.com', '0', '1537321486268', '1');
INSERT INTO `friend` VALUES ('186', 'kw00kw@yahoo.com', 'salina.x7@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('187', 'salina.x7@gmail.com', 'kw00kw@yahoo.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('188', 'salina.x7@gmail.com', 'queenb@pokerat.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('189', 'queenb@pokerat.com', 'salina.x7@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('190', 'mm@hotmail.com', 'queenb@pokerat.com', '0', '1537321486268', '0');
INSERT INTO `friend` VALUES ('191', 'queenb@pokerat.com', 'mm@hotmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('210', 'abc@abc.com', 'test2@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('211', 'test2@gmail.com', 'abc@abc.com', '0', '1546588808656', '0');
INSERT INTO `friend` VALUES ('226', 'test5@gmail.com', 'test3@gmail.com', '1', '1546588808656', '0');
INSERT INTO `friend` VALUES ('227', 'test3@gmail.com', 'test5@gmail.com', '1', '1546588635554', '0');
INSERT INTO `friend` VALUES ('230', 'test5@gmail.com', 'test1@gmail.com', '1', '1546588808656', '0');
INSERT INTO `friend` VALUES ('231', 'test1@gmail.com', 'test5@gmail.com', '1', '1546588711070', '0');
INSERT INTO `friend` VALUES ('232', 'test100@gmail.com', 'test4@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('233', 'test4@gmail.com', 'test100@gmail.com', '0', '1546587921300', '0');
INSERT INTO `friend` VALUES ('240', 'test100@gmail.com', 'test2@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('241', 'test2@gmail.com', 'test100@gmail.com', '0', '1546588808656', '0');
INSERT INTO `friend` VALUES ('242', 'test13@gmail.com', 'test2@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('243', 'test2@gmail.com', 'test13@gmail.com', '0', '1546588808656', '0');
INSERT INTO `friend` VALUES ('244', 'test1@gmail.com', 'test2@gmail.com', '1', '1544608546680', '0');
INSERT INTO `friend` VALUES ('245', 'test2@gmail.com', 'test1@gmail.com', '1', '1546588808656', '0');
INSERT INTO `friend` VALUES ('246', 'test525@gmail.com', 'test1@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('247', 'test1@gmail.com', 'test525@gmail.com', '0', '1544608546680', '0');
INSERT INTO `friend` VALUES ('248', 'test2@gmail.com', 'test5@gmail.com', '1', '1546588808656', '0');
INSERT INTO `friend` VALUES ('249', 'test5@gmail.com', 'test2@gmail.com', '1', '1546588808656', '0');
INSERT INTO `friend` VALUES ('264', 'test2@gmail.com', 'test4@gmail.com', '1', '1546588808656', '0');
INSERT INTO `friend` VALUES ('265', 'test4@gmail.com', 'test2@gmail.com', '1', '1546587921300', '0');
INSERT INTO `friend` VALUES ('266', 'test5@gmail.com', 'test4@gmail.com', '0', '1546588808656', '0');
INSERT INTO `friend` VALUES ('267', 'test4@gmail.com', 'test5@gmail.com', '0', '1546587921300', '0');
INSERT INTO `friend` VALUES ('282', 'test4@gmail.com', 'test3@gmail.com', '1', '1546587921300', '0');
INSERT INTO `friend` VALUES ('283', 'test3@gmail.com', 'test4@gmail.com', '1', '1546588635554', '1');
INSERT INTO `friend` VALUES ('284', 'test3@gmail.com', 'test2@gmail.com', '0', '1546588635554', '0');
INSERT INTO `friend` VALUES ('285', 'test2@gmail.com', 'test3@gmail.com', '0', '1546588808656', '0');
INSERT INTO `friend` VALUES ('286', 'jack@gmail.com', 'test4@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('287', 'test4@gmail.com', 'jack@gmail.com', '0', '1546587921300', '0');
INSERT INTO `friend` VALUES ('288', 'test4@gmail.com', 'test1@gmail.com', '0', '1546587921300', '0');
INSERT INTO `friend` VALUES ('289', 'test1@gmail.com', 'test4@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('290', 'jack@gmail.com', 'test2@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('291', 'test2@gmail.com', 'jack@gmail.com', '0', '1546588808656', '0');
INSERT INTO `friend` VALUES ('292', 'c5f3cb5fb389b365e98c36778b38a5567129ee58', 'test2@gmail.com', '0', '0', '0');
INSERT INTO `friend` VALUES ('293', 'test2@gmail.com', 'c5f3cb5fb389b365e98c36778b38a5567129ee58', '0', '1546588808656', '0');

-- ----------------------------
-- Table structure for friend_request
-- ----------------------------
DROP TABLE IF EXISTS `friend_request`;
CREATE TABLE `friend_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `friend_email` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend_request
-- ----------------------------
INSERT INTO `friend_request` VALUES ('32', 'm@eaz.com', 'salina.x7@gmail.com', '1', '1529877797289');
INSERT INTO `friend_request` VALUES ('33', 'raed@s.com', 'salina.x7@gmail.com', '1', '1529878935231');
INSERT INTO `friend_request` VALUES ('34', '2125D293-9152-4EE7-B437-12A0F38BBA00', 'vitaliy@gmail.com', '1', '1530004982903');
INSERT INTO `friend_request` VALUES ('35', 'vitaliy@gmail.com', 'm@eaz.com', '1', '1530019842086');
INSERT INTO `friend_request` VALUES ('36', 'raed@s.com', 'CC6D0B68-7FA9-4A1B-AD74-680476F3079B', '0', '1530557511393');
INSERT INTO `friend_request` VALUES ('37', 'raed@s.com', 'CC6D0B68-7FA9-4A1B-AD74-680476F3079B', '0', '1530557668043');
INSERT INTO `friend_request` VALUES ('38', '26B2E539-CA3A-4654-8606-01BA595D32A5', 'raed@s.com', '1', '1530788184475');
INSERT INTO `friend_request` VALUES ('39', 'm@eaz.com', '26B2E539-CA3A-4654-8606-01BA595D32A5', '1', '1531069595423');
INSERT INTO `friend_request` VALUES ('40', '343D0F51-5B61-4D79-AB2F-08CC25BC5486', 'raed@s.com', '1', '1531143924020');
INSERT INTO `friend_request` VALUES ('41', '2A400980-80C0-4281-A8BE-E751C017F24A', 'raed@s.com', '1', '1531143925799');
INSERT INTO `friend_request` VALUES ('42', 'A83A4D44-A4C1-4AB2-9407-9F38A2ABE6B0', 'raed@s.com', '1', '1531143922495');
INSERT INTO `friend_request` VALUES ('43', 'soso@hotmail.com', 'raed@s.com', '1', '1531144952961');
INSERT INTO `friend_request` VALUES ('44', 'soso@hotmail.com', 'raed@s.com', '1', '1531144952961');
INSERT INTO `friend_request` VALUES ('45', 'raed@s.com', 'gm-1411@hotmail.com', '1', '1531445643588');
INSERT INTO `friend_request` VALUES ('46', '9EEE0E0F-F436-4A4D-9AA0-ECD41D744AD6', 'raed@s.com', '1', '1531450531147');
INSERT INTO `friend_request` VALUES ('47', 'raed@s.com', 'noor@hotmail.com', '1', '1531510815363');
INSERT INTO `friend_request` VALUES ('48', 'noor@hotmail.com', 'raed@s.com', '1', '1531510299453');
INSERT INTO `friend_request` VALUES ('49', 'gm-1411@hotmail.com', 'salina.x7@gmail.com', '1', '1531513401594');
INSERT INTO `friend_request` VALUES ('50', 'gm-1411@hotmail.com', 'noor@hotmail.com', '1', '1531512001318');
INSERT INTO `friend_request` VALUES ('51', 'm@eaz.com', 'soso@hotmail.com', '1', '1531673784572');
INSERT INTO `friend_request` VALUES ('52', 'm@eaz.com', 'gm-1411@hotmail.com', '1', '1531675585347');
INSERT INTO `friend_request` VALUES ('53', 'gm-1411@hotmail.com', 'soso@hotmail.com', '1', '1531675693203');
INSERT INTO `friend_request` VALUES ('54', 'salina.x7@gmail.com', 'soso@hotmail.com', '1', '1531763471340');
INSERT INTO `friend_request` VALUES ('55', 'vitaliy@gmail.com', 'raed@s.com', '1', '1531766760644');
INSERT INTO `friend_request` VALUES ('56', 'mm@hotmail.com', 'raed@s.com', '1', '1531774761643');
INSERT INTO `friend_request` VALUES ('57', 'jojo@hotmail.com', 'raed@s.com', '1', '1531783593768');
INSERT INTO `friend_request` VALUES ('58', 'jojo@hotmail.com', 'm@eaz.com', '1', '1531785074715');
INSERT INTO `friend_request` VALUES ('59', 'jojo@hotmail.com', 'salina.x7@gmail.com', '1', '1531786098135');
INSERT INTO `friend_request` VALUES ('60', 'genya@gmail.com', 'vitaliy@gmail.com', '1', '1531936072423');
INSERT INTO `friend_request` VALUES ('61', 'genya@gmail.com', 'vitaliy@gmail.com', '1', '1531936072423');
INSERT INTO `friend_request` VALUES ('62', 'm@pokerat.com', 'soso@hotmail.com', '1', '1532050432555');
INSERT INTO `friend_request` VALUES ('63', 'raed@s.com', 'm@pokerat.com', '1', '1532051931690');
INSERT INTO `friend_request` VALUES ('64', 'raed@s.com', 'm@pokerat.com', '1', '1532051931690');
INSERT INTO `friend_request` VALUES ('65', 'raed@s.com', 'm@pokerat.com', '1', '1532051931690');
INSERT INTO `friend_request` VALUES ('66', 'raed@s.com', 'm@pokerat.com', '1', '1532051931690');
INSERT INTO `friend_request` VALUES ('67', 'm@pokerat.com', 'gm-1411@hotmail.com', '1', '1532051956539');
INSERT INTO `friend_request` VALUES ('68', 'm@pokerat.com', 'salina.x7@gmail.com', '1', '1532192223849');
INSERT INTO `friend_request` VALUES ('69', 'raed@s.com', 'nano@pokerar.com', '1', '1532456597437');
INSERT INTO `friend_request` VALUES ('70', 'nano@n.com', 'soso@hotmail.com', '1', '1532459610608');
INSERT INTO `friend_request` VALUES ('71', 'nano@n.com', 'raed@s.com', '1', '1532458845540');
INSERT INTO `friend_request` VALUES ('72', 'nano@n.com', 'salina.x7@gmail.com', '1', '1532601350683');
INSERT INTO `friend_request` VALUES ('73', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', 'soso@hotmail.com', '1', '1533111698179');
INSERT INTO `friend_request` VALUES ('74', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', 'vitaliy@gmail.com', '1', '1535337601311');
INSERT INTO `friend_request` VALUES ('75', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', 'salina.x7@gmail.com', '1', '1533242702635');
INSERT INTO `friend_request` VALUES ('76', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', 'raed@s.com', '1', '1533038432789');
INSERT INTO `friend_request` VALUES ('77', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', 'nano@n.com', '1', '1534492715030');
INSERT INTO `friend_request` VALUES ('78', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', 'raed@s.com', '1', '1533038432789');
INSERT INTO `friend_request` VALUES ('79', 'raed@s.com', '5B955552-64F3-4421-94B8-E8FA2AE24787', '1', '1533394156846');
INSERT INTO `friend_request` VALUES ('80', 'raed@s.com', '5B955552-64F3-4421-94B8-E8FA2AE24787', '1', '1533394156846');
INSERT INTO `friend_request` VALUES ('81', 'raed@s.com', '5B955552-64F3-4421-94B8-E8FA2AE24787', '1', '1533394156846');
INSERT INTO `friend_request` VALUES ('82', 'raed@s.com', 'fafa1122@gmail.com', '1', '1533321025646');
INSERT INTO `friend_request` VALUES ('83', 'raed@s.com', 'CBC73BED-EACC-49C1-9F88-89630B2986F6', '1', '1533324123161');
INSERT INTO `friend_request` VALUES ('84', 'raed@s.com', 'CBC73BED-EACC-49C1-9F88-89630B2986F6', '1', '1533324123161');
INSERT INTO `friend_request` VALUES ('85', 'CBC73BED-EACC-49C1-9F88-89630B2986F6', 'nano@n.com', '1', '1534492715016');
INSERT INTO `friend_request` VALUES ('86', '9C785950-5A32-4906-866B-4880B4B51B18', 'raed@s.com', '1', '1534247780326');
INSERT INTO `friend_request` VALUES ('87', '9C785950-5A32-4906-866B-4880B4B51B18', 'raed@s.com', '1', '1534247780326');
INSERT INTO `friend_request` VALUES ('88', '9C785950-5A32-4906-866B-4880B4B51B18', 'raed@s.com', '1', '1534247780326');
INSERT INTO `friend_request` VALUES ('89', 'raed@s.com', 'rawan@hotmail.com', '1', '1534253194650');
INSERT INTO `friend_request` VALUES ('90', 'raed@s.com', 'hamadan992@gmail.com', '1', '1534286083623');
INSERT INTO `friend_request` VALUES ('91', 'raed@s.com', 'hamadan992@gmail.com', '1', '1534286083623');
INSERT INTO `friend_request` VALUES ('92', 'raed@s.com', 'HNA2030@hotmail.com', '1', '1534347405426');
INSERT INTO `friend_request` VALUES ('93', 'HNA2030@hotmail.com', 'gm-1411@hotmail.com', '1', '1534348527284');
INSERT INTO `friend_request` VALUES ('94', 'raed@s.com', 'alamra7@gmail.com', '1', '1534361695717');
INSERT INTO `friend_request` VALUES ('95', 'alamra7@gmail.com', 'gm-1411@hotmail.com', '1', '1534380505476');
INSERT INTO `friend_request` VALUES ('96', 'hamadan992@gmail.com', 'gm-1411@hotmail.com', '1', '1534436013752');
INSERT INTO `friend_request` VALUES ('97', 'hamadan992@gmail.com', 'HNA2030@hotmail.com', '1', '1534441694207');
INSERT INTO `friend_request` VALUES ('98', 'salina.x7@gmail.com', 'HNA2030@hotmail.com', '1', '1534450213628');
INSERT INTO `friend_request` VALUES ('99', 'salina.x7@gmail.com', 'hamadan992@gmail.com', '1', '1534450271182');
INSERT INTO `friend_request` VALUES ('100', 'hamadan992@gmail.com', 'salina.x7@gmail.com', '1', '1534450351460');
INSERT INTO `friend_request` VALUES ('101', 'hamadan992@gmail.com', 'fafa1122@gmail.com', '1', '1534629873746');
INSERT INTO `friend_request` VALUES ('102', 'hna2030', 'raed@s.com', '1', '1534895133135');
INSERT INTO `friend_request` VALUES ('103', 'hamadan992@gmail.com', 'fafa1122@gmail.com', '1', '1535935038882');
INSERT INTO `friend_request` VALUES ('104', 'EC969D9B-FFF1-46FE-8A0A-03B123D4BCA7', 'raed@s.com', '1', '1535126375259');
INSERT INTO `friend_request` VALUES ('105', 'raed@s.com', 'bayan@pokerat.com', '1', '1535280265986');
INSERT INTO `friend_request` VALUES ('106', '50EAFA68-1DB3-435F-A5D4-11A3FF4DA124', 'vitaliy@gmail.com', '1', '1535376622487');
INSERT INTO `friend_request` VALUES ('107', 'salina.x7@gmail.com', 'alamra7@gmail.com', '1', '1535408529271');
INSERT INTO `friend_request` VALUES ('108', 'raed@s.com', 'vitaliy@gmail.com', '1', '1535472144816');
INSERT INTO `friend_request` VALUES ('109', 'raed@s.com', 'aso.26@hotmail.com', '1', '1535575647996');
INSERT INTO `friend_request` VALUES ('110', 'm@pokerat.com', 'fafa1122@gmail.com', '1', '1535741858994');
INSERT INTO `friend_request` VALUES ('111', 'salina.x7@gmail.com', 'fafa1122@gmail.com', '1', '1535935036213');
INSERT INTO `friend_request` VALUES ('112', 'raed@s.com', 'omhmood27@yahoo.com', '1', '1536127698375');
INSERT INTO `friend_request` VALUES ('113', 'salina.x7@gmail.com', 'omhmood27@yahoo.com', '1', '1536177775874');
INSERT INTO `friend_request` VALUES ('114', '20835F78-01B8-4E33-A592-68794A7BC0ED', 'm@eaz.com', '1', '1536320293672');
INSERT INTO `friend_request` VALUES ('115', '20835F78-01B8-4E33-A592-68794A7BC0ED', 'salina.x7@gmail.com', '1', '1536231609987');
INSERT INTO `friend_request` VALUES ('116', 'queenb@pokerat.com', 'raed@s.com', '1', '1536180633837');
INSERT INTO `friend_request` VALUES ('117', 'queenb@pokerat.com', 'soso@hotmail.com', '1', '1536268119339');
INSERT INTO `friend_request` VALUES ('118', 'queenb@pokerat.com', 'hamadan992@gmail.com', '1', '1536203284892');
INSERT INTO `friend_request` VALUES ('119', 'queenb@pokerat.com', 'nano@n.com', '1', '1536395434630');
INSERT INTO `friend_request` VALUES ('120', 'queenb@pokerat.com', 'm@eaz.com', '1', '1536336709412');
INSERT INTO `friend_request` VALUES ('121', 'queenb@pokerat.com', 'm@eaz.com', '1', '1536336709412');
INSERT INTO `friend_request` VALUES ('122', 'm@eaz.com', 'queenb@pokerat.com', '1', '1536335237901');
INSERT INTO `friend_request` VALUES ('123', 'kw00kw@yahoo.com', 'raed@s.com', '1', '1536630334087');
INSERT INTO `friend_request` VALUES ('124', 'kw00kw@yahoo.com', 'salina.x7@gmail.com', '1', '1536688951293');
INSERT INTO `friend_request` VALUES ('125', 'kw00kw@yahoo.com', 'salina.x7@gmail.com', '1', '1536688951293');
INSERT INTO `friend_request` VALUES ('126', 'salina.x7@gmail.com', 'queenb@pokerat.com', '1', '1536846043616');
INSERT INTO `friend_request` VALUES ('127', 'aso.26@hotmail.com', 'aso.26@hotmail.com', '0', '1536873560415');
INSERT INTO `friend_request` VALUES ('128', 'aso.26@hotmail.com', 'aso.26@hotmail.com', '0', '1536916784804');
INSERT INTO `friend_request` VALUES ('129', 'aso.26@hotmail.com', 'aso.26@hotmail.com', '0', '1536916788933');
INSERT INTO `friend_request` VALUES ('130', 'aso.26@hotmail.com', 'aso.26@hotmail.com', '0', '1536916789675');
INSERT INTO `friend_request` VALUES ('131', 'mm@hotmail.com', 'queenb@pokerat.com', '1', '1537321034075');
INSERT INTO `friend_request` VALUES ('132', 'abc@abc.com', 'test2@gmail.com', '1', '1542849902465');
INSERT INTO `friend_request` VALUES ('133', 'abc@abc.com', '8098B9CF-886A-410C-B698-A2E1B45936CA', '0', '1540065085031');
INSERT INTO `friend_request` VALUES ('134', 'abc@abc.com', 'soso@hotmail.com', '0', '1540065111192');
INSERT INTO `friend_request` VALUES ('135', 'abc@abc.com', 'E916F39C-A6E3-4721-BA23-2B1072F4C3D9', '0', '1540598504571');
INSERT INTO `friend_request` VALUES ('136', 'a4dbbc381edf4d84994f679ff6e5262b1204e8fe', 'gm-1411@hotmail.com', '0', '1541065838259');
INSERT INTO `friend_request` VALUES ('137', 'a4dbbc381edf4d84994f679ff6e5262b1204e8fe', 'test5@gmail.com', '2', '1542958835978');
INSERT INTO `friend_request` VALUES ('138', 'jangth@gmail.com', 'vitaliy@gmail.com', '0', '1541439182541');
INSERT INTO `friend_request` VALUES ('139', '7e2f0d2b1c05ecae35e1747fcb8f37dc16bd001c', 'softdev1029@protonmail.com', '0', '1541544915689');
INSERT INTO `friend_request` VALUES ('140', '7e2f0d2b1c05ecae35e1747fcb8f37dc16bd001c', 'softdev1029@protonmail.com', '0', '1541545225179');
INSERT INTO `friend_request` VALUES ('141', 'CF2D2C5E-3360-4F9D-BB99-F38667D64A0A', '7e2f0d2b1c05ecae35e1747fcb8f37dc16bd001c', '1', '1541545351522');
INSERT INTO `friend_request` VALUES ('198', 'test4@gmail.com', 'test2@gmail.com', '1', '1542852720265');
INSERT INTO `friend_request` VALUES ('199', 'ac3593b44de30cbe213414e9ff38683751428aa1', '55ADE930-5FDF-5EC4-8429-15640684C489', '0', '1542859024810');
INSERT INTO `friend_request` VALUES ('200', 'ac3593b44de30cbe213414e9ff38683751428aa1', 'test@gmail.com', '0', '1542859047805');
INSERT INTO `friend_request` VALUES ('201', 'test4@gmail.com', 'test3@gmail.com', '1', '1542865566290');
INSERT INTO `friend_request` VALUES ('202', 'test4@gmail.com', 'test2@gmail.com', '1', '1542871284155');
INSERT INTO `friend_request` VALUES ('203', 'test4@gmail.com', 'test2@gmail.com', '1', '1542871334107');
INSERT INTO `friend_request` VALUES ('204', 'test4@gmail.com', 'test1@gmail.com', '1', '1542874012821');
INSERT INTO `friend_request` VALUES ('205', 'test4@gmail.com', 'test1@test1.com', '0', '1542873976413');
INSERT INTO `friend_request` VALUES ('206', 'test1@gmail.com', 'test1@gmail.com', '0', '1542877457585');
INSERT INTO `friend_request` VALUES ('207', 'test2@gmail.com', 'test3@gmail.com', '1', '1542884686940');
INSERT INTO `friend_request` VALUES ('208', 'test3@gmail.com', 'test1@gmail.com', '1', '1542958912218');
INSERT INTO `friend_request` VALUES ('209', 'test5@gmail.com', 'test1@gmail.com', '1', '1542958969010');
INSERT INTO `friend_request` VALUES ('210', 'test3@gmail.com', 'test1@gmail.com', '1', '1542958912218');
INSERT INTO `friend_request` VALUES ('211', 'test1@gmail.com', 'test3@gmail.com', '1', '1542958911708');
INSERT INTO `friend_request` VALUES ('212', 'test5@gmail.com', 'test3@gmail.com', '1', '1542958910696');
INSERT INTO `friend_request` VALUES ('213', 'test1@gmail.com', 'test1@gmail.com', '0', '1542958914185');
INSERT INTO `friend_request` VALUES ('214', 'test5@gmail.com', 'test1@gmail.com', '1', '1542958969010');
INSERT INTO `friend_request` VALUES ('215', 'test1@gmail.com', 'test1@gmail.com', '0', '1543051178952');
INSERT INTO `friend_request` VALUES ('216', 'test1@gmail.com', 'test2@gmail.com', '1', '1543198486452');
INSERT INTO `friend_request` VALUES ('217', 'test1@gmail.com', 'test1@gmail.com', '0', '1543198947912');
INSERT INTO `friend_request` VALUES ('218', 'test1@gmail.com', 'test1@gmail.com', '0', '1543219799435');
INSERT INTO `friend_request` VALUES ('219', 'test1@gmail.com', 'test1@gmail.com', '0', '1543219802712');
INSERT INTO `friend_request` VALUES ('220', 'test1@gmail.com', 'test1@gmail.com', '0', '1543219804325');
INSERT INTO `friend_request` VALUES ('221', 'test1@gmail.com', 'test1@gmail.com', '0', '1543219817671');
INSERT INTO `friend_request` VALUES ('222', 'test1@gmail.com', 'test1@gmail.com', '0', '1543219819815');
INSERT INTO `friend_request` VALUES ('223', 'test1@gmail.com', 'test1@gmail.com', '0', '1543219820528');
INSERT INTO `friend_request` VALUES ('224', 'test1@gmail.com', 'test1@gmail.com', '0', '1543219826889');
INSERT INTO `friend_request` VALUES ('225', 'test1@gmail.com', 'test1@gmail.com', '0', '1543219827421');
INSERT INTO `friend_request` VALUES ('226', 'test1@gmail.com', 'test1@gmail.com', '0', '1543219828103');
INSERT INTO `friend_request` VALUES ('227', 'test1@gmail.com', 'test1@gmail.com', '0', '1543220177505');
INSERT INTO `friend_request` VALUES ('228', 'test1@gmail.com', 'test2@gmail.com', '2', '1543220490352');
INSERT INTO `friend_request` VALUES ('229', 'test13@gmail.com', 'test2@gmail.com', '1', '1543477141811');
INSERT INTO `friend_request` VALUES ('230', 'test100@gmail.com', 'test2@gmail.com', '1', '1543309033739');
INSERT INTO `friend_request` VALUES ('231', 'test100@gmail.com', 'test4@gmail.com', '1', '1543284761587');
INSERT INTO `friend_request` VALUES ('232', 'test4@gmail.com', 'test2@gmail.com', '1', '1543284823621');
INSERT INTO `friend_request` VALUES ('233', 'test1@gmail.com', '55ADE930-5FDF-5EC4-8429-15640684C489', '0', '1543304270284');
INSERT INTO `friend_request` VALUES ('234', 'test105@gmail.com', 'test60@gmail.com', '1', '1543304604622');
INSERT INTO `friend_request` VALUES ('235', 'test4@gmail.com', 'test105@gmail.com', '1', '1543308296012');
INSERT INTO `friend_request` VALUES ('236', 'test4@gmail.com', 'test105@gmail.com', '0', '1543308603993');
INSERT INTO `friend_request` VALUES ('237', 'test105@gmail.com', 'test2@gmail.com', '0', '1543376895692');
INSERT INTO `friend_request` VALUES ('238', 'test105@gmail.com', 'test2@gmail.com', '0', '1543377155016');
INSERT INTO `friend_request` VALUES ('239', 'test105@gmail.com', 'test3@gmail.com', '0', '1543377200778');
INSERT INTO `friend_request` VALUES ('240', 'test105@gmail.com', 'test4@gmail.com', '0', '1543377242876');
INSERT INTO `friend_request` VALUES ('241', 'test105@gmail.com', 'test5@gmail.com', '0', '1543378929899');
INSERT INTO `friend_request` VALUES ('242', 'test1@gmail.com', 'test1@gmail.com', '0', '1543388419108');
INSERT INTO `friend_request` VALUES ('243', 'test1@gmail.com', 'test1@gmail.com', '0', '1543388425309');
INSERT INTO `friend_request` VALUES ('244', 'test1@gmail.com', 'test1@gmail.com', '0', '1543388426739');
INSERT INTO `friend_request` VALUES ('245', 'test1@gmail.com', 'test1@gmail.com', '0', '1543388427736');
INSERT INTO `friend_request` VALUES ('246', 'test1@gmail.com', 'test1@gmail.com', '0', '1543388428321');
INSERT INTO `friend_request` VALUES ('247', 'test1@gmail.com', 'test1@gmail.com', '0', '1543388429312');
INSERT INTO `friend_request` VALUES ('248', 'test1@gmail.com', 'test1@gmail.com', '0', '1543388430287');
INSERT INTO `friend_request` VALUES ('249', 'test1@gmail.com', 'test1@gmail.com', '0', '1543388431110');
INSERT INTO `friend_request` VALUES ('250', 'test2@gmail.com', 'test1@test1.com', '0', '1544089656129');
INSERT INTO `friend_request` VALUES ('251', 'test1@gmail.com', 'test1@gmail.com', '0', '1544089675730');
INSERT INTO `friend_request` VALUES ('252', 'test1@gmail.com', 'test1@gmail.com', '0', '1544089677651');
INSERT INTO `friend_request` VALUES ('253', 'test1@gmail.com', 'test1@gmail.com', '0', '1544089678662');
INSERT INTO `friend_request` VALUES ('254', 'test1@gmail.com', 'test2@gmail.com', '1', '1544161842132');
INSERT INTO `friend_request` VALUES ('255', 'test1@gmail.com', 'test1@gmail.com', '0', '1544250986763');
INSERT INTO `friend_request` VALUES ('256', 'test1@gmail.com', 'test1@gmail.com', '0', '1544250990364');
INSERT INTO `friend_request` VALUES ('257', 'test1@gmail.com', 'test1@gmail.com', '0', '1544250991833');
INSERT INTO `friend_request` VALUES ('258', 'test1@gmail.com', 'test1@gmail.com', '0', '1544250993102');
INSERT INTO `friend_request` VALUES ('259', 'test1@gmail.com', 'test1@gmail.com', '0', '1544250995418');
INSERT INTO `friend_request` VALUES ('260', 'test525@gmail.com', 'test1@gmail.com', '1', '1544257578780');
INSERT INTO `friend_request` VALUES ('261', 'test2@gmail.com', 'test5@gmail.com', '1', '1544602945009');
INSERT INTO `friend_request` VALUES ('262', 'test1@gmail.com', 'test4@gmail.com', '1', '1544758236635');
INSERT INTO `friend_request` VALUES ('263', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758250919');
INSERT INTO `friend_request` VALUES ('264', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758254618');
INSERT INTO `friend_request` VALUES ('265', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758255770');
INSERT INTO `friend_request` VALUES ('266', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758256718');
INSERT INTO `friend_request` VALUES ('267', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758257689');
INSERT INTO `friend_request` VALUES ('268', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758258165');
INSERT INTO `friend_request` VALUES ('269', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758258606');
INSERT INTO `friend_request` VALUES ('270', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758259032');
INSERT INTO `friend_request` VALUES ('271', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758259463');
INSERT INTO `friend_request` VALUES ('272', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758261731');
INSERT INTO `friend_request` VALUES ('273', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758262481');
INSERT INTO `friend_request` VALUES ('274', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758262939');
INSERT INTO `friend_request` VALUES ('275', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758263482');
INSERT INTO `friend_request` VALUES ('276', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758263935');
INSERT INTO `friend_request` VALUES ('277', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758272541');
INSERT INTO `friend_request` VALUES ('278', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758273197');
INSERT INTO `friend_request` VALUES ('279', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758273874');
INSERT INTO `friend_request` VALUES ('280', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758276113');
INSERT INTO `friend_request` VALUES ('281', 'test4@gmail.com', 'test1@gmail.com', '1', '1544758294809');
INSERT INTO `friend_request` VALUES ('282', 'test4@gmail.com', 'test1@gmail.com', '1', '1544758352622');
INSERT INTO `friend_request` VALUES ('283', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758357378');
INSERT INTO `friend_request` VALUES ('284', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758363085');
INSERT INTO `friend_request` VALUES ('285', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758386088');
INSERT INTO `friend_request` VALUES ('286', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758396370');
INSERT INTO `friend_request` VALUES ('287', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758397201');
INSERT INTO `friend_request` VALUES ('288', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758397944');
INSERT INTO `friend_request` VALUES ('289', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758398786');
INSERT INTO `friend_request` VALUES ('290', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758399727');
INSERT INTO `friend_request` VALUES ('291', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758400516');
INSERT INTO `friend_request` VALUES ('292', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758424804');
INSERT INTO `friend_request` VALUES ('293', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758427870');
INSERT INTO `friend_request` VALUES ('294', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758428716');
INSERT INTO `friend_request` VALUES ('295', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758429373');
INSERT INTO `friend_request` VALUES ('296', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758430757');
INSERT INTO `friend_request` VALUES ('297', 'test1@gmail.com', 'test1@gmail.com', '0', '1544758431555');
INSERT INTO `friend_request` VALUES ('298', 'test3@gmail.com', 'test4@gmail.com', '1', '1544765039699');
INSERT INTO `friend_request` VALUES ('299', 'test3@gmail.com', 'test4@gmail.com', '1', '1544765142214');
INSERT INTO `friend_request` VALUES ('300', 'test2@gmail.com', 'test4@gmail.com', '1', '1544792676359');
INSERT INTO `friend_request` VALUES ('301', 'test2@gmail.com', 'test4@gmail.com', '1', '1544793027886');
INSERT INTO `friend_request` VALUES ('302', 'test2@gmail.com', 'test4@gmail.com', '1', '1544793919997');
INSERT INTO `friend_request` VALUES ('303', 'test4@gmail.com', 'test4@gmail.com', '0', '1544795848316');
INSERT INTO `friend_request` VALUES ('304', 'test4@gmail.com', 'test4@gmail.com', '0', '1544795855364');
INSERT INTO `friend_request` VALUES ('305', 'test4@gmail.com', 'test4@gmail.com', '0', '1544795855758');
INSERT INTO `friend_request` VALUES ('306', 'test4@gmail.com', 'test4@gmail.com', '0', '1544795856297');
INSERT INTO `friend_request` VALUES ('307', 'test4@gmail.com', 'test4@gmail.com', '0', '1544795856591');
INSERT INTO `friend_request` VALUES ('308', 'test4@gmail.com', 'test4@gmail.com', '0', '1544795856990');
INSERT INTO `friend_request` VALUES ('309', 'test3@gmail.com', 'test3@gmail.com', '0', '1544797883890');
INSERT INTO `friend_request` VALUES ('310', 'test4@gmail.com', 'test4@gmail.com', '0', '1544849014958');
INSERT INTO `friend_request` VALUES ('311', 'test4@gmail.com', 'test4@gmail.com', '0', '1544849015487');
INSERT INTO `friend_request` VALUES ('312', 'test5@gmail.com', 'test4@gmail.com', '1', '1545096018596');
INSERT INTO `friend_request` VALUES ('313', 'test4@gmail.com', 'test3@gmail.com', '1', '1545129886842');
INSERT INTO `friend_request` VALUES ('314', 'test4@gmail.com', 'test3@gmail.com', '1', '1545141036419');
INSERT INTO `friend_request` VALUES ('315', 'test4@gmail.com', 'test3@gmail.com', '1', '1545141197409');
INSERT INTO `friend_request` VALUES ('316', 'test4@gmail.com', 'test3@gmail.com', '1', '1545141348693');
INSERT INTO `friend_request` VALUES ('317', 'test3@gmail.com', 'test3@gmail.com', '0', '1545141350174');
INSERT INTO `friend_request` VALUES ('318', 'test3@gmail.com', 'test3@gmail.com', '0', '1545141352053');
INSERT INTO `friend_request` VALUES ('319', 'test3@gmail.com', 'test3@gmail.com', '0', '1545141352804');
INSERT INTO `friend_request` VALUES ('320', 'test3@gmail.com', 'test3@gmail.com', '0', '1545141353857');
INSERT INTO `friend_request` VALUES ('321', 'test3@gmail.com', 'test3@gmail.com', '0', '1545141354656');
INSERT INTO `friend_request` VALUES ('322', 'test3@gmail.com', 'test3@gmail.com', '0', '1545141355520');
INSERT INTO `friend_request` VALUES ('323', 'test3@gmail.com', 'test3@gmail.com', '0', '1545141356441');
INSERT INTO `friend_request` VALUES ('324', 'test3@gmail.com', 'test3@gmail.com', '0', '1545141357223');
INSERT INTO `friend_request` VALUES ('325', 'test3@gmail.com', 'test4@gmail.com', '1', '1545141830597');
INSERT INTO `friend_request` VALUES ('326', 'test4@gmail.com', 'test1@gmail.com', '1', '1545643010598');
INSERT INTO `friend_request` VALUES ('327', 'test4@gmail.com', 'test3@gmail.com', '1', '1545144079988');
INSERT INTO `friend_request` VALUES ('328', 'test4@gmail.com', 'test1@gmail.com', '1', '1545643010598');
INSERT INTO `friend_request` VALUES ('329', 'test4@gmail.com', 'test3@gmail.com', '1', '1545196111994');
INSERT INTO `friend_request` VALUES ('330', 'test3@gmail.com', 'test1@gmail.com', '2', '1545643012797');
INSERT INTO `friend_request` VALUES ('331', 'test3@gmail.com', 'test4@gmail.com', '1', '1545195990862');
INSERT INTO `friend_request` VALUES ('332', 'test3@gmail.com', 'test4@gmail.com', '1', '1545195990862');
INSERT INTO `friend_request` VALUES ('333', 'test4@gmail.com', 'test4@gmail.com', '0', '1545195991791');
INSERT INTO `friend_request` VALUES ('334', 'test4@gmail.com', 'test3@gmail.com', '1', '1545196111994');
INSERT INTO `friend_request` VALUES ('335', 'test3@gmail.com', 'test2@gmail.com', '1', '1545265182562');
INSERT INTO `friend_request` VALUES ('336', 'jack@gmail.com', 'test2@gmail.com', '1', '1545699157559');
INSERT INTO `friend_request` VALUES ('337', 'jack@gmail.com', 'test4@gmail.com', '1', '1545627564428');
INSERT INTO `friend_request` VALUES ('338', 'jack@gmail.com', 'test4@gmail.com', '1', '1545627564428');
INSERT INTO `friend_request` VALUES ('339', 'test3@gmail.com', 'test3@gmail.com', '0', '1545628614273');
INSERT INTO `friend_request` VALUES ('340', 'test4@gmail.com', 'test1@gmail.com', '1', '1545643010598');
INSERT INTO `friend_request` VALUES ('341', 'c5f3cb5fb389b365e98c36778b38a5567129ee58', 'test2@gmail.com', '1', '1546513369532');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_email` varchar(50) NOT NULL,
  `to_email` varchar(50) NOT NULL,
  `content` varchar(300) NOT NULL,
  `time` bigint(20) NOT NULL,
  `message_read` int(11) NOT NULL DEFAULT '0',
  `deleted_from` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_to` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for news_level
-- ----------------------------
DROP TABLE IF EXISTS `news_level`;
CREATE TABLE `news_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `level` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `news_read` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for store_buy
-- ----------------------------
DROP TABLE IF EXISTS `store_buy`;
CREATE TABLE `store_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double(20,2) NOT NULL,
  `value` bigint(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` bigint(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for transfer_gift
-- ----------------------------
DROP TABLE IF EXISTS `transfer_gift`;
CREATE TABLE `transfer_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_email` varchar(50) NOT NULL,
  `to_email` varchar(50) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `value` bigint(20) NOT NULL,
  `time` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `privilege` int(11) DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `photo` int(11) NOT NULL DEFAULT '0',
  `chip` bigint(20) NOT NULL DEFAULT '0',
  `coin` bigint(20) NOT NULL DEFAULT '0',
  `ticket` bigint(20) NOT NULL DEFAULT '0',
  `gift_category` int(11) NOT NULL DEFAULT '-1',
  `gift_value` int(11) NOT NULL DEFAULT '0',
  `user_id` varchar(20) NOT NULL,
  `games_played` int(11) NOT NULL DEFAULT '0',
  `biggest_win` bigint(20) NOT NULL DEFAULT '0',
  `started_playing` bigint(1) NOT NULL,
  `last_login` bigint(20) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL,
  `location` varchar(30) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `total_earning` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root@root.com', 'root', '1', 'root', '0', '1', '1', '0', '-1', '0', '12-0394-8736', '0', '0', '0', '0', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('34', 'test1@gmail.com', 'a', '0', 'Test1', '1', '4839831361025', '10', '0', '1', '6', '12-0394-8769', '1518', '234013823139', '1522352433116', '1546662817633', 'test user and', 'UNKNOWN', '103', '8000000');
INSERT INTO `user` VALUES ('35', 'genya@gmail.com', 'a', '0', 'ïºŽïº—', '1', '200000000', '10', '0', '2', '0', '12-0394-8770', '115', '51049995904', '1522352433116', '1531939662738', '', 'Primorskiy kray, RU', '1', '0');
INSERT INTO `user` VALUES ('36', 'vitaliy@gmail.com', 'a', '0', 'vitaliy', '1', '13080520576', '2', '0', '6', '0', '12-0394-8771', '292', '181146980096', '1522352433116', '1539961382202', 's', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('37', 'test2@gmail.com', 'a', '0', 'test2', '0', '1222987634670211443', '523900', '60', '8', '10', '12-0394-8772', '2745', '253418808650', '1522352433116', '1546654123170', '', 'UNKNOWN', '109', '398000018');
INSERT INTO `user` VALUES ('38', 'test3@gmail.com', 'a', '0', 'test3', '0', '2222222095251312925', '0', '0', '4', '17', '12-0394-8773', '3819', '193763210326', '1522352433116', '1546141484492', '', 'UNKNOWN', '13', '0');
INSERT INTO `user` VALUES ('39', 'test4@gmail.com', 'a', '0', 'test4', '0', '20745352708724', '302400', '0', '5', '5', '12-0394-8774', '3539', '324273117412', '1522352433116', '1546654871000', '', 'UNKNOWN', '114', '30350525000');
INSERT INTO `user` VALUES ('40', 'test5@gmail.com', 'a', '0', 'test5', '1', '3000038777767119', '0', '0', '0', '1', '12-0394-8775', '676', '53879250000', '1522352433116', '1546656286457', '', 'UNKNOWN', '18', '0');
INSERT INTO `user` VALUES ('41', 'test6@gmail.com', 'a', '0', 'test6', '0', '214479', '10', '0', '-1', '0', '12-0394-8776', '1', '0', '1522352433116', '1545371388307', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('42', 'test7@gmail.com', 'a', '0', 'test7', '0', '218402', '10', '0', '-1', '0', '12-0394-8777', '0', '0', '1522352433116', '1544150722969', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('43', 'test8@gmail.com', 'a', '0', 'test8', '0', '112832', '10', '0', '-1', '0', '12-0394-8778', '0', '0', '1522352433116', '1543219903405', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('44', 'test9@gmail.com', 'a', '0', 'test9', '0', '148278', '10', '0', '-1', '0', '12-0394-8779', '0', '0', '1522352433116', '1545205367444', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('45', 'arab1@gmail.com', 'a', '0', 'test', '0', '59320', '10', '0', '-1', '0', '12-0394-8780', '0', '0', '1522352433116', '0', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('46', '55ADE930-5FDF-5EC4-8429-15640684C489', '', '0', 'Guest', '0', '1616529', '0', '0', '1', '14', '12-0394-8781', '11', '147', '1522352433116', '1535337502827', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('48', 'raed@s.com', 'aaa', '0', 'Raed', '1', '195325291675', '0', '0', '4', '5', '12-0394-8783', '17532', '167700000000', '1522352433116', '1538057517354', 'Standing on the edge', 'Florida,US', '25', '0');
INSERT INTO `user` VALUES ('49', 'salina.x7@gmail.com', 'Sa43214321', '0', 'RaHaF', '1', '2979600308581', '0', '0', '4', '2', '12-0394-8784', '11424', '9645425630336', '1522352433116', '1537005682439', '', 'Al Madinah Province, SA', '3', '0');
INSERT INTO `user` VALUES ('67', 'D43AC127-4C83-4C26-90C0-DF75D343718E', '', '0', 'Guest', '0', '10000000000', '10', '0', '-1', '0', '12-0394-8802', '0', '0', '1523991904689', '1523991904703', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('93', 'E916F39C-A6E3-4721-BA23-2B1072F4C3D9', '', '0', 'Gudge', '1', '10000000000', '10', '0', '8', '0', '12-0394-8828', '17', '452710', '1529089348436', '1529338476458', 'No. Way', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('95', 'm@eaz.com', 'aaa', '0', 'Gudge', '1', '119795197450', '0', '0', '0', '14', '12-0394-8830', '3390', '1400300000000', '1529338357421', '1536401166213', 'Only me ', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('121', '93D5ED73-2FA0-4799-84FE-F08E5EC382C5', '', '0', 'Guest', '0', '10000000000', '10', '0', '-1', '0', '12-0394-8856', '0', '0', '1530787162676', '1530787162683', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('122', 'soso@hotmail.com', '123456', '0', 'Ãà¸¿ÅÅÅÅ”Ã', '1', '15932129400', '0', '0', '4', '4', '12-0394-8857', '3063', '3597910728272', '1530787937630', '1537400702803', ' ïº®ï»´ïº¨ïº‘ ï»¢ïº˜ï»§Ø§Ùˆ Ù…ïºŽï»‹ ï»žï»›', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('123', '03FEF021-1DF4-45F7-BDF3-8C1913CF3EB7', '', '0', 'Guest', '0', '0', '10', '0', '-1', '0', '12-0394-8858', '0', '0', '1530800578022', '1530800578031', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('134', 'EE554737-C60C-45DC-A6EB-CD15E410BF55', '', '0', '123', '1', '10000000000', '10', '0', '-1', '0', '12-0394-8869', '0', '0', '1531379089986', '1531483866393', '', 'Makkah Province, SA', '1', '0');
INSERT INTO `user` VALUES ('135', 'E7CF86B4-4F8A-491E-8758-78D0C4875EF6', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8870', '0', '0', '1531445483358', '1531445483367', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('136', 'gm-1411@hotmail.com', '0556434090', '0', 'âˆ‚Ñ.Ð²Ñ”â„“Î±â„“', '1', '8290673161150', '0', '0', '4', '4', '12-0394-8871', '6259', '1750000000000', '1531445526999', '1540484677312', '', 'Eastern Province, SA', '50', '0');
INSERT INTO `user` VALUES ('137', 'noor@hotmail.com', '123456', '0', 'Noor', '1', '0', '8', '0', '3', '7', '12-0394-8872', '90', '144874993824', '1531450143864', '1531510250626', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('138', '5F860773-0C75-4BBC-80F8-1C5F196CAEAE', '', '0', 'Guest', '0', '310000', '10', '0', '-1', '0', '12-0394-8873', '0', '0', '1531506710073', '1531656394254', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('139', '8F336A3F-2AAD-4130-AA75-AAD4A4EB5DC1', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8874', '0', '0', '1531506863875', '1531506863880', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('140', '4979137F-449C-4E4E-A2B2-909F457F12D3', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8875', '0', '0', '1531507226681', '1531507226685', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('142', 'nooralsalmi@hotmail.com', 'noor1550', '0', 'Noor', '0', '110000', '10', '0', '-1', '0', '12-0394-8877', '0', '0', '1531508517924', '1531508574694', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('143', '5A16DA34-FF4D-4562-8029-9A8A1291F761', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8878', '0', '0', '1531508663689', '1531508663692', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('144', '0DBA1CEE-1C4A-4A4C-9452-BAA90A947D76', '', '0', 'Guest', '0', '310000', '10', '0', '-1', '0', '12-0394-8879', '0', '0', '1531531617135', '1531763687572', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('145', 'C17D62E6-51BA-4FF6-A398-24DE5A9A3423', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8880', '0', '0', '1531599173949', '1531599173958', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('146', 'jojo@hotmail.com', '1*3456', '0', 'Ù‡Ø±ïºŽïº³', '1', '0', '10', '0', '4', '7', '12-0394-8881', '993', '461500000000', '1531747433593', '1534029949100', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('147', 'B2AA5A40-B2C6-411F-B822-C6D226B43A87', '', '0', 'Guest', '0', '310000', '10', '0', '-1', '0', '12-0394-8882', '0', '0', '1531769241674', '1531941781111', '', 'Makkah Province, SA', '1', '0');
INSERT INTO `user` VALUES ('148', 'mm@hotmail.com', '123456', '0', '7mody', '1', '1500000000', '10', '0', '8', '0', '12-0394-8883', '1149', '793449942656', '1531769293631', '1537405979907', '', 'Makkah Province, SA', '1', '0');
INSERT INTO `user` VALUES ('149', '13D50BAD-68F5-43EB-8F6A-9170A4AEC3E2', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8884', '0', '0', '1531769618149', '1531769618154', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('150', '5F488FAF-BD2C-41F1-B3D8-77AD850EA35B', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8885', '0', '0', '1531770828482', '1531770828487', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('151', '3DC47087-5706-4778-82BC-05DD2A606B27', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8886', '0', '0', '1531771156290', '1531771156298', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('152', '2D3777EC-C33B-44BD-BF99-E70569233E63', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8887', '0', '0', '1531773191165', '1531777925367', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('153', 'E6FD9D52-3502-47CF-AC6D-45052386DEB2', '', '0', 'Guest', '0', '310000', '10', '0', '-1', '0', '12-0394-8888', '0', '0', '1531781700743', '1531913211744', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('154', '92592CEF-C421-4A28-98FE-B44571C7D41F', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8889', '0', '0', '1531782346979', '1531783509542', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('155', '79468B13-956A-4F67-9025-6A08BE92A4EA', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8890', '0', '0', '1531913433689', '1531913433697', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('156', 'C8934275-7CC2-40C0-A5BB-6A9B52869EB6', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8891', '0', '0', '1531942095918', '1531942095923', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('157', '57A9B806-AA1B-438C-9726-5C9A5952C177', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8892', '0', '0', '1531942481303', '1531942481307', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('158', '50F9F19C-19F2-41EC-A8FF-9C8D39F99E63', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8893', '0', '0', '1531943660473', '1531943660479', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('159', 'B21D2895-91A1-4978-AA72-0F0F016D3F61', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8894', '0', '0', '1531945674829', '1531945674834', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('160', '92FC4328-9C29-4A99-BE3E-7B87601AA463', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8895', '0', '0', '1531948634023', '1531999809600', '', 'Makkah Province, SA', '1', '0');
INSERT INTO `user` VALUES ('161', 'B7C86F03-C96C-4034-A0ED-16979782C9EA', '', '0', 'Guest', '0', '310000', '10', '0', '-1', '0', '12-0394-8896', '0', '0', '1531949019289', '1532122774809', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('162', '175006D1-D3C9-44B5-B5E8-C6D2A5D66DB0', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8897', '0', '0', '1531959388744', '1531959388755', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('163', 'BC8F5685-EF8F-4E28-8FC5-808E1BEC84E4', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8898', '0', '0', '1532010769803', '1532108955565', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('164', '57216E4D-4892-423B-943E-9864F7E70356', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8899', '0', '0', '1532014721059', '1532049572333', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('165', 'm@pokerat.com', '123456', '0', 'á¾„Ð¼á¼”Ê€á¾„Ñ’', '1', '298336533430', '0', '0', '5', '3', '12-0394-8900', '685', '533900000000', '1532044454901', '1538079701953', '', 'UNKNOWN', '31', '0');
INSERT INTO `user` VALUES ('166', 'r@pokerat.com', '123456', '0', 'Rema', '0', '1500000000', '10', '0', '-1', '0', '12-0394-8901', '0', '0', '1532044930470', '1532044994505', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('167', '21CB0DC0-14B7-496D-B106-5779E2F4A3A4', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8902', '0', '0', '1532050299666', '1532050299687', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('168', '5FD61D34-58F2-451F-AB29-BD99DA490992', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8903', '0', '0', '1532121026121', '1532121026134', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('169', '93A5B45F-4073-4B9E-ACEF-0DC317144A40', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8904', '0', '0', '1532121534742', '1532121534748', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('170', '7B7E94FA-8514-4522-AAE5-CB8AE6EC1FB1', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8905', '0', '0', '1532122621711', '1532122621716', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('171', '1FD01CF8-354D-4365-B5D3-D9AF771FFC84', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8906', '0', '0', '1532124470285', '1532203542967', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('172', '46A9EAA3-B4BB-4CA0-9995-E410E94E55A1', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8907', '0', '0', '1532128048448', '1532667127202', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('173', '15D37700-FD72-4940-8824-B6013E675CEE', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8908', '0', '0', '1532129225838', '1532260070957', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('174', 'F9B2EF6B-EAB9-4CB7-8C17-1099A6F31BB4', '', '0', 'Guest', '0', '108750', '10', '0', '-1', '0', '12-0394-8909', '2', '0', '1532134074780', '1532134521333', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('175', '0B72DDB5-A026-4F0D-B195-68469604F123', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8910', '0', '0', '1532192015518', '1532192085401', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('176', '8C1E7BED-CEC3-4A39-A346-0F9EBE0F9DA5', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8911', '0', '0', '1532275847624', '1532275847637', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('177', 'nano@n.com', '12345', '0', 'Guest', '1', '5574183666585', '0', '0', '4', '11', '12-0394-8912', '7712', '2188375000000', '1532454977136', '1537010744495', '', 'UNKNOWN', '21', '0');
INSERT INTO `user` VALUES ('178', '5C5A1744-F229-443F-89BC-8BEBC0F895FF', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8913', '0', '0', '1532456068896', '1532509031210', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('179', 'A661A6BF-E685-47AF-9DD3-6667C6EE3612', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8914', '0', '0', '1532458181062', '1532458657948', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('180', '043B2409-3FE5-41A7-A16B-DFDCA6147AFF', '', '0', 'Merra', '1', '310062', '10', '0', '-1', '0', '12-0394-8915', '1', '92', '1532982915031', '1533220781118', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('181', '5B955552-64F3-4421-94B8-E8FA2AE24787', '', '0', 'Ù‡ïº®ï»«ï»®ïº ï»ŸØ§', '0', '1500000000', '10', '0', '8', '0', '12-0394-8916', '251', '606675000000', '1533319185819', '1533618704804', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('182', 'fafa1122@gmail.com', '112311', '0', 'ï»¢ï»ƒïºŽï»¤ï»ƒ', '1', '303508476632', '0', '0', '1', '3', '12-0394-8917', '2153', '2245200000000', '1533320857771', '1537956007455', '', 'UNKNOWN', '6', '0');
INSERT INTO `user` VALUES ('183', 'bayan@pokerat.com', '12355456', '0', 'BÎ±ÑƒÎ±Î·', '1', '6267', '10', '0', '4', '5', '12-0394-8918', '261', '1419000000000', '1533323601539', '1535280317884', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('184', '31F77037-EAA0-4FC9-A199-F1AEB3583817', '', '0', 'Guest', '0', '310000', '10', '0', '-1', '0', '12-0394-8919', '0', '0', '1533340084602', '1534347373640', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('185', 'EF121590-C92D-4771-A177-76A5979FBF97', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8920', '0', '0', '1533342186001', '1533342186052', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('186', '20FB04EB-4809-4752-9BF4-274B66EB8F65', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8921', '0', '0', '1533386092026', '1533386092033', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('187', 'CA068799-89AD-4AD2-9E4A-CB0D4B54EC82', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8922', '0', '0', '1533399161309', '1533399699644', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('188', '6540B59B-74AC-4FEA-9319-93CA0995E14B', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8923', '0', '0', '1533401102998', '1533401103010', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('189', '19E49169-DEA6-479D-A673-B7737A578BBD', '', '0', 'Guest', '0', '209995', '10', '0', '-1', '0', '12-0394-8924', '4', '0', '1533511656868', '1534314254680', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('190', '17229497-0FB7-4C02-A742-3004DA6AD094', '', '0', 'Guest', '0', '410000', '10', '0', '-1', '0', '12-0394-8925', '0', '0', '1533711156503', '1534642028687', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('191', '9C785950-5A32-4906-866B-4880B4B51B18', '', '0', 'gÐ½Î±zÎ±â„“', '1', '1500000000', '10', '0', '4', '9', '12-0394-8926', '101', '161800000000', '1534247690527', '1534257068586', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('192', '34EEB483-8391-41A0-B86F-9B31498871E2', '', '0', 'Guest', '0', '10000000000', '10', '0', '-1', '0', '12-0394-8927', '0', '0', '1534252883802', '1534252883808', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('193', 'rawan@hotmail.com', 'at1010', '0', 'Rawan', '1', '1500000000', '10', '0', '1', '0', '12-0394-8928', '1193', '282650000000', '1534253148476', '1534616544846', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('194', '148A7F42-D64E-4D55-9925-0CB380649102', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8929', '0', '0', '1534285628346', '1534286049231', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('195', 'hamadan992@gmail.com', 'nouf4855', '0', 'Wed', '1', '19799225120940', '0', '0', '5', '2', '12-0394-8930', '3414', '7306875000024', '1534285891802', '1537628234948', '', 'Najran, SA', '96', '0');
INSERT INTO `user` VALUES ('196', '4352B5DC-A16B-499C-AA3D-6EED1F23F3A3', '', '0', 'Hmood914', '0', '110000', '10', '0', '-1', '0', '12-0394-8931', '0', '0', '1534346654539', '1534362691457', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('197', 'alamra7@gmail.com', 'h0547575041', '0', 'Hmood914', '1', '2087683472221', '0', '0', '8', '6', '12-0394-8932', '1345', '875400000000', '1534346958127', '1537829579230', '', 'UNKNOWN', '31', '0');
INSERT INTO `user` VALUES ('198', '65DC6983-9FA0-448A-8839-A748FC187F13', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8933', '0', '0', '1534347023632', '1534347023641', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('199', 'hna2030@hotmail.com', '123456', '0', 'Ð½Î±Î·Ïƒ', '1', '7696757006956', '0', '0', '1', '1', '12-0394-8934', '1034', '1748525000000', '1534347263156', '1537545766619', '', 'UNKNOWN', '41', '0');
INSERT INTO `user` VALUES ('200', 'FA55EF30-E5FB-47C2-AA52-C5DE43A74B74', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8935', '0', '0', '1534772710743', '1534819780687', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('201', '3B52A5DC-BAC8-48AC-A7E6-28B99EBC153B', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8936', '0', '0', '1534774563004', '1534845324120', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('202', '30324E5C-5E22-4730-8C4D-FBB4F7692C5D', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8937', '0', '0', '1534775456283', '1534818877896', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('203', 'BB764A53-C020-4D2D-B200-8C362118B005', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8938', '0', '0', '1534777024755', '1534783364913', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('204', '86456182-85FB-4B7B-84DE-A3026FD71C1A', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8939', '0', '0', '1534779897124', '1534779981770', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('205', '3BA96BC8-7D29-4F9B-BBB4-AE44F6A71458', '', '0', 'Hano', '1', '110000', '10', '0', '-1', '0', '12-0394-8940', '0', '0', '1534781448634', '1534782976850', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('206', '2E2E1F3B-02D9-403A-8594-4317756075B2', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8941', '0', '0', '1534783600842', '1534783600856', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('207', 'FE3ECAAA-EF17-4EC4-B570-DA5B2D856D62', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8942', '0', '0', '1534784266942', '1534784266946', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('208', '52F7B93E-17AB-4441-AFAB-B3A7DCBAAF06', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8943', '0', '0', '1534784765690', '1534784765695', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('209', 'DF013458-352D-41C7-947C-B157BE822F14', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8944', '0', '0', '1534812435623', '1534812902474', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('210', '6D1380E0-4606-4C0C-8148-63F270AD9D9B', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8945', '0', '0', '1534863052150', '1534863052157', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('211', 'D0D90346-6F05-4977-B32F-AB34F82B48E7', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8946', '0', '0', '1534866467778', '1534866596101', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('212', '7C165C02-7DA6-440D-8487-EB8CA6E5E2A2', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8947', '0', '0', '1534866779928', '1534883147119', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('213', '1A7847B1-4890-4F66-BE2E-48900DA04AB0', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8948', '0', '0', '1534868783177', '1534868783181', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('214', '64E2C4B0-5447-44F0-BCF8-ACD4A7485E99', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8949', '0', '0', '1534869080763', '1534894636020', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('215', '626370FB-E85B-4FD4-A30A-3C3585B2AA92', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8950', '0', '0', '1534872231682', '1534897423046', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('216', 'C22E3803-6FD8-4064-AABC-44DD2129DFCE', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8951', '0', '0', '1534872275468', '1534872340658', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('217', '754DADF2-B1D0-4004-A204-CAFB1E8A8B86', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8952', '0', '0', '1534875056468', '1534875056476', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('218', 'E8109AEA-C5EC-4433-8732-2583675E8DB8', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8953', '0', '0', '1534897233972', '1534897233983', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('219', '559FCB0B-E1AC-4AF3-A3FD-2B14E1283563', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8954', '0', '0', '1534897776830', '1534899058270', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('220', '9002ECC1-CBBE-4691-BD85-67725B11111B', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8955', '0', '0', '1534898062230', '1534898062237', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('221', '8162F512-CB42-439E-B64A-38E86580B0B6', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8956', '0', '0', '1534900041142', '1534900041147', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('222', 'EA05B487-7F52-4B54-9CE8-CFCAC88CB6F8', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8957', '0', '0', '1534910569512', '1534910569517', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('223', '480E6102-3822-4A15-AC6D-DC87504A7EFB', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8958', '0', '0', '1535118694688', '1535118694702', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('224', 'F60CDC7A-A72D-424C-94EF-F82E0CE04EFA', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8959', '0', '0', '1535119702154', '1535119871290', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('225', 'EC969D9B-FFF1-46FE-8A0A-03B123D4BCA7', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8960', '0', '0', '1535120906359', '1535227744022', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('226', '71854D26-AF50-4AA6-BA7B-1645B7E4D3B7', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8961', '0', '0', '1535123946583', '1535123946588', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('227', '714F0F9D-CE2F-440F-898E-D8BBCB8D70C7', '', '0', 'Guest', '0', '310000', '10', '0', '-1', '0', '12-0394-8962', '0', '0', '1535124025341', '1535387557740', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('228', 'CD894425-9212-443F-8D54-347656FC2AD3', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8963', '0', '0', '1535124389240', '1535124389245', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('229', '285810488898583', '', '0', 'Vladimir', '1', '109940', '10', '0', '-1', '0', '12-0394-8964', '0', '0', '1535132227409', '1535132227416', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('230', '7A622F9A-8C83-4EC5-B3F1-C7BE2FDB491E', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8965', '0', '0', '1535145596927', '1535145596947', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('231', '9E91B094-D66F-43D1-BE72-B96ECED11B61', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8966', '0', '0', '1535153411821', '1535153411827', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('232', '802E7B73-8700-415B-B116-F7960B9B1C31', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8967', '0', '0', '1535153646556', '1535153646561', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('233', '546A21E9-56E7-430C-9DC7-8D3EC3B0B8DF', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8968', '0', '0', '1535154949434', '1535155006150', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('234', 'F30E8D7A-1ADD-4F4E-8678-82343E214398', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8969', '0', '0', '1535178406996', '1535178407047', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('235', '98158725-5D1D-466B-82B7-A488AA1F6635', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8970', '0', '0', '1535183550834', '1535183705785', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('236', '91842043-3569-47CB-8BC1-C61F266DC21F', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8971', '0', '0', '1535280083498', '1539602470206', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('237', '50EAFA68-1DB3-435F-A5D4-11A3FF4DA124', '', '0', 'Guest', '0', '310001', '10', '0', '-1', '0', '12-0394-8972', '5', '8', '1535376580061', '1536322994556', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('238', '17771780-4DEC-4F7B-8946-5FBFEFB5C34E', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8973', '0', '0', '1535386950291', '1535387331838', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('239', 'CA5792E9-8FF2-4104-84F3-8C7D43C9C7EC', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8974', '0', '0', '1535388077339', '1535388246014', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('240', 'ED67F88B-68F2-4305-B10F-B4DC91870F86', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8975', '0', '0', '1535389100417', '1535389100420', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('241', 'E9928B4C-C5BC-4931-B5C7-B2E780155385', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8976', '0', '0', '1535390177732', '1535390177743', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('242', 'E7BFADE5-58F9-458E-9B95-1D8D9BAE9134', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8977', '0', '0', '1535391912571', '1535391912577', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('243', '82DB6E5E-A78E-43AA-89B9-374FCA7205B8', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8978', '0', '0', '1535392446373', '1535392446379', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('244', '780E15EB-00DE-44CD-87EC-894DE028843A', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8979', '0', '0', '1535404868126', '1535404868130', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('245', 'BDFF07DD-7D36-46AB-95FB-151999A4D01F', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8980', '0', '0', '1535405941553', '1535405941557', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('246', 'F6D48ABD-65EF-4CDC-B42C-79DB61A2A39B', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8981', '0', '0', '1535447544022', '1535447544028', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('247', 'F1B742A4-39DC-47A9-9E4A-D2A092EB2CE4', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8982', '0', '0', '1535455073933', '1535455325270', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('248', '353D1E85-F2DE-4DAD-B671-E9FE88EBD8D0', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8983', '0', '0', '1535458467696', '1535458833179', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('249', 'F7124743-6E28-43C5-BE48-EC6668870109', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-8984', '0', '0', '1535471529365', '1535575603216', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('250', 'DE6627F2-F1F7-4346-8076-6D1C9A89D395', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8985', '0', '0', '1535472292550', '1535486759496', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('251', '003D0636-99AE-468A-9211-34E6460D075D', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8986', '0', '0', '1535472432237', '1535472432242', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('252', '603430BD-4CD9-487D-9B02-31D176614DE5', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8987', '0', '0', '1535472458410', '1535472458416', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('253', '8DD90AA9-147C-4AA5-AA18-E73ECF8BB129', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8988', '0', '0', '1535472557350', '1535472557353', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('254', '64A254D3-F5C3-46A8-82D7-D1253AD2EB3A', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8989', '0', '0', '1535472754743', '1535472754748', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('255', 'DC772739-672A-4F8C-81CC-E9382CD43316', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8990', '0', '0', '1535473429563', '1535473477382', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('256', '1C246561-A3E1-41DF-BA85-1027CC2B23B1', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8991', '0', '0', '1535480216255', '1535480216277', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('257', '262BAC1A-FEC2-4521-BDCC-B770EF71FF95', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8992', '0', '0', '1535481178105', '1535481178113', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('258', '558A8FE3-43CC-44EB-AE8A-E2A5434DF1D8', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8993', '0', '0', '1535482481859', '1535482481864', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('259', '557A42A0-BF39-42D6-B57A-4978EC2AC781', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8994', '0', '0', '1535530312724', '1535530312733', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('260', '0E8F10C1-CF6D-4E9C-A174-9CF92CD2ABE7', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8995', '0', '0', '1535575412867', '1535575412872', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('261', 'aso.26@hotmail.com', 'asoomme26', '0', 'Ñ•Î±Ð¼Î±Ï‰Ñ”', '1', '16830709176018', '0', '0', '6', '9', '12-0394-8996', '1127', '5200100000024', '1535575546882', '1540572840426', '', 'UNKNOWN', '98', '0');
INSERT INTO `user` VALUES ('262', '141E0EEE-8F9A-4D42-8E23-41209D8CB7C9', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8997', '0', '0', '1535653360028', '1535653360044', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('263', '91C2C9D0-F7B7-4DAE-85BC-0C6CA6F8FC18', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8998', '0', '0', '1535653699545', '1535653699554', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('264', '58AB5905-CCEC-4D40-BD48-40218CFDCE68', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-8999', '0', '0', '1535654022275', '1535661017430', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('265', 'E5956470-A154-4DB6-B68B-6332C3E868D4', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9000', '0', '0', '1535654047968', '1535654047972', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('266', 'F76A76A3-09AB-4AD0-9031-03204DDB9D77', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9001', '0', '0', '1535655927846', '1535655927863', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('267', 'B7167FE0-DE24-41C7-BECF-9C293A89E465', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9002', '0', '0', '1535656338494', '1535656455971', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('268', '4D4136A2-8CA7-454B-A93D-65689D75A9A8', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9003', '0', '0', '1535662972540', '1535662972545', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('269', 'C58C2705-214C-4607-AB8C-7C15A4C9706F', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9004', '0', '0', '1535665309947', '1535665309969', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('270', '7B9116EB-C5A0-428B-9B4E-04AB0478E7DF', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9005', '0', '0', '1535674064747', '1535674064771', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('271', '0E4296AA-E81F-4390-AB43-E6E10E75934F', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9006', '0', '0', '1535677572292', '1535677572297', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('272', 'F0A263B2-0825-4D5E-BFDB-1B48A0D07896', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9007', '0', '0', '1535704107487', '1535704107543', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('273', 'E23629F2-15F2-4A96-91E2-D058C66BF908', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9008', '0', '0', '1535713711313', '1535713711323', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('274', '552AC731-3284-4F83-96D8-75D214F5F2E3', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9009', '0', '0', '1535738337474', '1535738384266', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('275', 'FC012C16-837D-476D-A0B4-158E5A97FEE2', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9010', '0', '0', '1535740027779', '1535740027786', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('276', 'D2ED5F72-1C7F-46A4-8CDB-9157DBBEB9EC', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9011', '0', '0', '1535740063040', '1535740063047', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('277', 'A50FEDD8-7152-47C6-8C2A-8B31A12E306C', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9012', '0', '0', '1535741384139', '1535741384144', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('278', '7CD9A736-689D-4BB8-B0A5-22C413AE2873', '', '0', 'Guest', '0', '310000', '10', '0', '-1', '0', '12-0394-9013', '0', '0', '1535741825107', '1535934994670', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('279', 'B5A494F7-421D-4260-B9D6-162FF590499A', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9014', '0', '0', '1535741885084', '1535741885089', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('280', 'CD2D4C23-A71C-4C55-AFE9-4D7EA343A033', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9015', '0', '0', '1535744423110', '1535744423116', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('281', 'D35E35A3-D479-4EE4-92C2-8AF1A8EE3258', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9016', '0', '0', '1535745935499', '1535745935504', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('282', '57C746B1-3440-4AFA-8F75-A1DF108D4611', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9017', '0', '0', '1535746008432', '1535746008439', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('283', 'D219092E-32F9-4FF4-96C9-4C99C672C51F', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9018', '0', '0', '1535777777202', '1535778343762', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('284', '024F1BD1-30E8-432F-8CFF-475F9AC0DCDB', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9019', '0', '0', '1535813788426', '1535813788451', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('285', 'test@gmail.com', 'a', '0', 'test', '0', '310000', '10', '0', '-1', '0', '12-0394-9020', '0', '0', '1535983817934', '1536154352090', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('286', '153BD572-6D7F-4232-81F7-D693002034ED', '', '0', 'Guest', '0', '110029', '10', '0', '-1', '0', '12-0394-9021', '2', '100', '1536099444284', '1536099444299', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('287', '8D4AED41-EFD0-4110-A2D3-0CBFE1E55A85', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9022', '0', '0', '1536102197707', '1536102197728', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('288', '93BD3539-DB97-432B-A425-556A8A5A7340', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9023', '0', '0', '1536103258606', '1536103258646', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('289', '2C0B3775-2628-45B7-BEC4-CDF7F696740E', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9024', '0', '0', '1536105009017', '1536105009027', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('290', '7AAE1CF3-6916-4014-B72A-B9794241CD0E', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9025', '0', '0', '1536126955500', '1536126955515', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('291', 'omhmood27@yahoo.com', 'Aomhmood27', '0', 'Ms love', '1', '1500000000', '10', '0', '1', '4', '12-0394-9026', '58', '50025000000', '1536127247870', '1536238734062', ' ï»žïºœï»¤ï»ŸïºŽïº‘ ï»ªï» ï»£ïºŽï»Œï»¤ï»ŸØ§', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('292', '71B08565-CA75-48CC-BD0C-2DFB1477A48B', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9027', '0', '0', '1536128700664', '1536128700682', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('293', '3854325A-A48C-40B6-A04D-F19DB88C6772', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9028', '0', '0', '1536153849284', '1536153849291', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('294', '2545BD2D-2247-467D-831F-67D1C5CC5860', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9029', '0', '0', '1536156023219', '1536177459433', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('295', 'A468DF27-307D-4BFC-9A5C-234B5384C537', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9030', '0', '0', '1536172780764', '1536172780770', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('296', '176AE666-1BDF-4C92-A2F5-E922E5010342', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9031', '0', '0', '1536173081296', '1536173081302', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('297', '325494DD-34B3-406A-A8EC-25C9F1932249', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9032', '0', '0', '1536174535561', '1536174535608', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('298', '061D5A03-B780-4098-A06F-72E3B20F4A85', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9033', '0', '0', '1536175361457', '1536175415306', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('299', '5467B066-1325-4ED5-B052-7B76FA1A30C7', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9034', '0', '0', '1536175966792', '1536175966798', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('300', '1BFB3706-177D-469C-B826-EC9696930D1D', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9035', '0', '0', '1536176043304', '1536176043308', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('301', '7F283263-B3E1-4435-A1D6-690948FB497E', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9036', '0', '0', '1536176447698', '1536176447703', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('302', 'D6D649A5-F8B0-4D21-A005-49048049D6BC', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9037', '0', '0', '1536179334913', '1536180033583', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('303', '20835F78-01B8-4E33-A592-68794A7BC0ED', '', '0', 'ê†°ê€ŽêŸêŸêˆ¤ êŒƒ', '1', '110000', '10', '0', '-1', '0', '12-0394-9038', '0', '0', '1536179576871', '1536180048789', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('304', 'B00048E7-8808-4056-9924-3DC2F5A52C8A', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9039', '0', '0', '1536179971445', '1536179971468', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('305', '52D854C0-906B-486E-9EE0-9D8A31D10C8F', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9040', '0', '0', '1536180046423', '1536180046428', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('306', 'queenb@pokerat.com', '20Senior09', '0', 'ê†°ê€ŽêŸêŸêˆ¤ êŒƒ', '1', '2228437670400', '0', '0', '8', '4', '12-0394-9041', '1531', '561150000000', '1536180351491', '1538063102300', '', 'TX, US', '27', '0');
INSERT INTO `user` VALUES ('307', '19B9425F-673A-437B-BEC9-0818CB66BF80', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9042', '0', '0', '1536181948662', '1536181948682', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('308', '04E5DAEF-E451-459F-898A-7A7100CAF860', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9043', '0', '0', '1536254880254', '1536254880266', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('309', '87D7C636-1EE1-4031-9A6F-7056D663A7DA', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9044', '0', '0', '1536255129854', '1536255129862', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('310', '112554BF-4315-47F7-B359-CA5EF5B7C6F9', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9045', '0', '0', '1536255307472', '1536255307476', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('311', 'E24921E9-2DCA-4369-86C7-006FF89C5B49', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9046', '0', '0', '1536257268610', '1536257268616', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('312', 'B6F4DAF8-0E58-484A-9A56-B1B9B64D913C', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9047', '0', '0', '1536257529402', '1536257529408', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('313', '4679A68D-01C4-4B40-821C-F42BB7E3AB90', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9048', '0', '0', '1536257865231', '1536264090365', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('314', '5FB60D7A-C992-45CD-997F-4019E8EC0395', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9049', '0', '0', '1536258128238', '1536258128244', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('315', '1FA2CFA0-90B8-45D6-A5F6-27E1EEDB0B67', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9050', '0', '0', '1536258134848', '1536258134852', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('316', 'E98B77CE-9638-4B5F-B160-94975835DB6E', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9051', '0', '0', '1536258223982', '1536258223988', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('317', '02A1BC86-095A-49DC-857F-D850AC556279', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9052', '0', '0', '1536258388741', '1536258388745', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('318', '5E7DA926-5BDE-4237-9676-B3A6B6A97687', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9053', '0', '0', '1536258717323', '1536258717327', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('319', '798A67DB-8844-4895-8ACB-41DFD8C3A986', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9054', '0', '0', '1536259048709', '1536259048714', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('320', 'BA70AB48-0EBC-4915-86A7-84B5E9289289', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9055', '0', '0', '1536262519645', '1536262812854', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('321', '3B4EC5A5-F3C5-48CB-AB89-D22959A54470', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9056', '0', '0', '1536264705789', '1536264705797', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('322', '31916E4E-1334-475E-BE4C-417494F99BBC', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9057', '0', '0', '1536266637706', '1536268029478', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('323', '86D37727-A3F1-4014-B164-6B146A52BB51', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9058', '0', '0', '1536272301455', '1536272301460', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('324', 'D967B8BF-6DC7-494C-94ED-81C23CDAFA29', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9059', '0', '0', '1536306308362', '1536306308368', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('325', '9D4727A3-829C-446D-81D8-DF7F72ED8E84', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9060', '0', '0', '1536318209926', '1536334533131', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('326', '3E05C1D7-BCFF-42DD-A0CA-5A0663D26890', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9061', '0', '0', '1536357450267', '1536357450284', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('327', '67E231FE-8D49-43FA-8B64-998FF88E4E0B', '', '0', 'Rahaf 2', '0', '210000', '10', '0', '-1', '0', '12-0394-9062', '0', '0', '1536357709280', '1536444495177', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('328', 'CA8DB736-BE3C-4406-AC2E-A9271D042F1B', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9063', '0', '0', '1536357741872', '1536357741880', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('329', '263E4F64-DC54-4681-94EC-579D4D0A352F', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9064', '0', '0', '1536357862813', '1536357862818', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('330', 'E229C5F9-BF7D-4CA6-B265-88BE251A92CE', '', '0', 'Guest', '0', '210000', '10', '0', '-1', '0', '12-0394-9065', '0', '0', '1536359429648', '1536390312850', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('331', '00636101-9F91-40F1-B936-5AD9C7896D97', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9066', '0', '0', '1536359504024', '1536359504030', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('332', '4230152B-8E24-4B11-B074-5A2721970DB0', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9067', '0', '0', '1536367633296', '1536367633310', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('333', '5060495E-5D2D-475F-AF6B-AC49B3DB5F38', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9068', '0', '0', '1536367993140', '1536368350463', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('334', '457E15D0-7527-4F21-B557-AB693C4AD0F5', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9069', '0', '0', '1536368903187', '1536368903192', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('335', '91E47124-1C70-4C13-B45B-09C6EB4F639D', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9070', '0', '0', '1536398648223', '1536398648231', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('336', '696430AB-B6FC-47AB-B0C3-EEAF0EE4C518', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9071', '0', '0', '1536402857494', '1536402857504', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('337', 'E761C77B-912C-49BC-96FD-C2AF3C4C4046', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9072', '0', '0', '1536409191233', '1536409191284', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('338', '9555BB82-3B21-45EC-8625-0B88E71C9CBB', '', '0', 'Guest', '0', '110000', '10', '0', '-1', '0', '12-0394-9073', '0', '0', '1536419212830', '1536419212893', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('339', 'E350D59A-7E0E-482E-B468-045E9BE557C5', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9074', '0', '0', '1536627613628', '1536627613647', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('340', '3A75085B-DA76-47EE-A794-F05E312468B1', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9075', '0', '0', '1536628327028', '1536628327041', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('341', '62F7536B-41CB-4E1C-815E-23D0941CCF72', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9076', '0', '0', '1536628406133', '1536628406142', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('342', 'F0F1B3AA-EA4C-44BA-8468-803814AF6281', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9077', '0', '0', '1536628477970', '1536628477982', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('343', '8098B9CF-886A-410C-B698-A2E1B45936CA', '', '0', 'Guest', '1', '10000', '10', '0', '-1', '0', '12-0394-9078', '0', '0', '1536628575011', '1536629638414', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('344', 'kw00kw@yahoo.com', 'Aa123123', '0', 'Ms Love', '1', '9110077562502', '0', '0', '4', '5', '12-0394-9079', '1111', '1935000000000', '1536629743763', '1537014453984', 'ï»žïºœï»¤ï»ŸïºŽïº‘ ï»ªï» ï»£ïºŽï»Œï»¤ï»ŸØ§', 'UNKNOWN', '56', '100000000');
INSERT INTO `user` VALUES ('345', 'CD14B376-DB6C-4C21-8598-2DF666BA1E73', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9080', '0', '0', '1536635054026', '1536635054082', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('346', '0640715E-CB57-44A5-B9B5-766304A20E26', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9081', '0', '0', '1536642191056', '1536642191082', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('347', '7854468A-E0C3-4C13-B11A-17D5D5131158', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9082', '0', '0', '1536642659965', '1536642670726', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('348', '692E3F08-5355-454A-B4A1-597AFB1D6343', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9083', '0', '0', '1536685507103', '1536685507111', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('349', '6211CD95-803E-4EB1-B63A-C9E2A587358C', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9084', '0', '0', '1536689783104', '1536689783108', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('350', 'FC202540-4B2D-48EB-80D8-8AD8B8C00C05', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9085', '0', '0', '1536693027723', '1536693027727', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('351', 'D3C32010-04DA-4F1E-AC7A-C7811C00F11B', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9086', '0', '0', '1536712231609', '1536712231619', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('352', 'BFE2A4E1-884E-413B-BEEF-80540B64F9D1', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9087', '0', '0', '1536713803298', '1536713803308', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('353', 'DF58AA12-465B-4433-AD4D-4BC3814F3AC1', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9088', '0', '0', '1536716722726', '1536716722731', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('354', 'D7B89741-F545-4F21-9B70-5A5AB25AEBF7', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9089', '0', '0', '1536716860629', '1536716860633', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('355', '4AE9B965-5D30-4465-97AA-72208B4E2EB3', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9090', '0', '0', '1536718674692', '1536756667924', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('356', 'AFD02116-7242-4539-88DF-F1FB6D08479F', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9091', '0', '0', '1536719450517', '1536719450524', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('357', 'ED3BE5FD-9B27-410A-8107-891380E01CAF', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9092', '0', '0', '1536721817527', '1536721864852', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('358', '4DC58C73-554D-4F7D-9E0F-89D88D584765', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9093', '0', '0', '1536727186310', '1536727186314', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('359', '88CBF6A6-8FB8-43EE-B390-1F07DBE90060', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9094', '0', '0', '1536730944801', '1536730996005', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('360', '20EFEB9B-C917-4123-9ACB-480E0505934F', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9095', '0', '0', '1536733213529', '1536733213533', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('361', 'BD0D4A57-EDA0-4D01-8880-CA0772502B48', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9096', '0', '0', '1536741134207', '1536741134212', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('362', 'AC62FA5F-3513-4A81-93C2-60602A08B15F', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9097', '0', '0', '1536755775371', '1536755775376', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('363', 'A1D53E16-DAD3-4E4A-BC6E-7DD60E53AFB6', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9098', '0', '0', '1536783595167', '1536846101963', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('364', 'C07FD399-E649-4542-A15B-7E5EF21CBE74', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9099', '0', '0', '1536784059627', '1536784059633', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('365', '619FAC88-9747-48DB-BABF-6BB438F434C5', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9100', '0', '0', '1536784515525', '1536784515529', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('366', 'ECB63647-4EB9-4FF9-BF74-203CFDA02B0B', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9101', '0', '0', '1536785632059', '1536786150195', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('367', 'E1124018-C46B-49AD-8AB0-4B62D80D7178', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9102', '0', '0', '1536786975776', '1536786975782', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('368', 'CA07F60F-506B-4099-8534-46752F6BB26F', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9103', '0', '0', '1536790989525', '1536790989529', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('369', 'DB1D9FC3-605B-4B8F-8981-AFBCBEF0892D', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9104', '0', '0', '1536808646804', '1536808646808', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('370', '29049947-FBE7-4DC9-B819-75BA477B961E', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9105', '0', '0', '1536818640271', '1536818640276', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('371', 'FF727565-315F-4CEE-B630-6B0E22CA0FA9', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9106', '0', '0', '1536839486232', '1536839486240', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('372', '1A78A384-ACE7-4050-BBDE-F7700B110833', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9107', '0', '0', '1536878965418', '1536878965423', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('373', 'A13EF276-3BD9-4E50-83E8-86A9D1761F1B', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9108', '0', '0', '1536879180735', '1536879180740', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('374', '3364D7C8-7762-48D8-B4D4-D6467001234C', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9109', '0', '0', '1536879660505', '1536879660512', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('375', '19223D28-3404-43E9-8D5C-3560FF47FB39', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9110', '0', '0', '1536881209034', '1536894519521', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('376', 'DE747F81-EA02-4F97-B881-DFC3ECBD1F42', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9111', '0', '0', '1536882035257', '1536882035263', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('377', '1954A550-6D1A-4BF8-AC58-B1A09241DCF4', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9112', '0', '0', '1536882146824', '1536882146829', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('378', 'ABDB6E58-357D-472C-876F-12D8483DB687', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9113', '0', '0', '1536888347286', '1536888347292', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('379', '339CBA8F-7C08-4189-ABB5-EC8A8D5D7FFD', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9114', '0', '0', '1536898160726', '1536898160731', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('380', '977103B3-21BB-4625-81D7-9988CD019F5C', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9115', '0', '0', '1536902956957', '1536902956963', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('381', '9D823616-64BE-420F-B1F0-93EA32E2DABB', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9116', '0', '0', '1536944919174', '1536944919190', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('382', '1A527166-9925-4AAE-BB64-E570A23C5E16', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9117', '0', '0', '1536969567650', '1536969567660', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('383', '6B100628-34BB-4C17-B251-759C8A7D6250', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9118', '0', '0', '1536988524008', '1536988600027', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('384', '7D3C1E93-8EDE-4FEE-8D0F-3CE44440E2FE', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9119', '0', '0', '1537026784637', '1537400652810', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('385', '013ACCC2-5BDB-4B9A-8718-F331C52490C2', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9120', '0', '0', '1537027174749', '1537109465125', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('386', 'a4dbbc381edf4d84994f679ff6e5262b1204e8fe', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9121', '0', '0', '1539976563499', '1541348871980', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('387', '7e2f0d2b1c05ecae35e1747fcb8f37dc16bd001c', '', '0', 'Guest3232', '0', '10000', '10', '0', '-1', '0', '12-0394-9122', '0', '0', '1539978437688', '1541544063819', '2332424234111234', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('388', 'bedc567d47d6c7d3d27741eb992f1fad6a78bdb3', '', '0', 'Guest', '0', '9994', '10', '0', '-1', '0', '12-0394-9123', '7', '34', '1539978794301', '1541436482122', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('389', 'softdev1029@outlook.com', 'aaaaaa', '0', 'softdev', '0', '10030', '10', '0', '-1', '0', '12-0394-9124', '2', '34', '1539986339842', '1541534791855', '', 'UNKNOWN', '1', '26');
INSERT INTO `user` VALUES ('390', 'abc@abc.com', '123', '0', 'abc', '0', '15004', '10', '0', '-1', '0', '12-0394-9125', '12', '22', '1540045779057', '1541583794399', '', 'UNKNOWN', '1', '46');
INSERT INTO `user` VALUES ('392', '564D8BE9-F647-679B-8583-18DE3479899E', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9127', '0', '0', '1541184989608', '1541414292045', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('393', 'c701537294ef2437e90abf756eb0853ae94f122f', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9128', '0', '0', '1541346033073', '1541346530904', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('394', 'test1@test1.com', 'test1', '0', 'test1', '0', '9970', '10', '0', '-1', '0', '12-0394-9129', '0', '0', '1541346151315', '1541408955390', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('395', 'CF2D2C5E-3360-4F9D-BB99-F38667D64A0A', '', '0', 'Guest', '0', '10000', '10', '0', '-1', '0', '12-0394-9130', '0', '0', '1541416860962', '1541545967923', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('396', 'softdev1029@protonmail.com', '123456', '0', 'Ftyfr', '0', '9970', '10', '0', '-1', '0', '12-0394-9131', '0', '0', '1541417492261', '1541543938277', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('428', '2cf307174caa03f0526d43b04359371c43f14bbb', '', '0', 'Guest', '0', '509969', '10', '0', '-1', '0', '12-0394-9163', '2', '0', '1542849326144', '1544144328480', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('429', 'cefb281decb88d5cfe00b4b65d27cbfd15dd53b0', '', '0', 'Guest', '0', '310589', '10', '0', '-1', '0', '12-0394-9164', '27', '354', '1542853111767', '1543387956618', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('430', 'ac3593b44de30cbe213414e9ff38683751428aa1', '', '0', 'Guest', '0', '409970', '10', '0', '-1', '0', '12-0394-9165', '34', '8', '1542858938709', '1543470663578', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('436', '0899d50974228793f9c07cf6b9480bf49bd165b5', '', '0', 'Guest', '0', '310000', '10', '0', '-1', '0', '12-0394-9171', '0', '0', '1542882576070', '1544598852749', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('464', 'test10@gmail.com', 'a', '0', 'test10', '0', '10654', '110', '0', '-1', '0', '12-0394-9199', '42', '30', '1543458780963', '1543468788307', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('465', 'test110@gmail.com', 'a', '0', 'test110', '0', '10681', '110', '0', '-1', '0', '12-0394-9200', '16', '7', '1543467392564', '1543483204253', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('466', 'test11@gmail.com', 'a', '0', 'test11', '0', '110750', '110', '0', '-1', '0', '12-0394-9201', '0', '0', '1543468818509', '1543470538336', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('467', 'test12@gmail.com', 'a', '0', 'test12', '0', '110750', '110', '0', '-1', '0', '12-0394-9202', '0', '0', '1543470553248', '1543470630375', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('468', 'test13@gmail.com', 'a', '0', 'test13', '0', '110750', '110', '0', '-1', '0', '12-0394-9203', '0', '0', '1543470656606', '1543470657338', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('469', 'test310@gmail.com', 'a', '0', 'test310', '0', '13999', '110', '0', '-1', '0', '12-0394-9204', '20', '0', '1544142097586', '1544155953970', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('470', 'test400@gmail.com', 'a', '0', 'test400', '0', '10750', '110', '0', '-1', '0', '12-0394-9205', '0', '0', '1544145982252', '1544146180181', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('471', 'test401@gmail.com', 'a', '0', 'test401', '0', '10748', '110', '0', '-1', '0', '12-0394-9206', '0', '0', '1544146204033', '1544148384697', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('472', 'test402@gmail.com', 'a', '0', 'test402', '0', '10750', '110', '0', '-1', '0', '12-0394-9207', '0', '0', '1544148419708', '1544148421015', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('473', 'test403@gmail.com', 'a', '0', 'test403', '0', '10750', '110', '0', '-1', '0', '12-0394-9208', '0', '0', '1544148489400', '1544148572027', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('474', 'test404@gmail.com', 'a', '0', 'test404', '0', '14250', '110', '0', '-1', '0', '12-0394-9209', '0', '0', '1544148603850', '1544150151159', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('475', 'test405@gmail.com', 'a', '0', 'test405', '0', '114250', '110', '0', '-1', '0', '12-0394-9210', '0', '0', '1544150171486', '1544150651615', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('476', 'test406@gmail.com', 'a', '0', 'test406', '0', '110750', '110', '0', '-1', '0', '12-0394-9211', '0', '0', '1544150672204', '1544150673091', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('477', 'test410@gmail.com', 'a', '0', 'test410', '0', '110750', '110', '0', '-1', '0', '12-0394-9212', '0', '0', '1544150752960', '1544152253353', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('478', 'test41ttt0@gmail.com', 'a', '0', 'test410', '0', '10730', '110', '0', '-1', '0', '12-0394-9213', '2', '7', '1544155998198', '1544156598841', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('479', 'test311@gmail.com', 'a', '0', 'test311', '0', '10756', '110', '0', '-1', '0', '12-0394-9214', '2', '8', '1544247814157', '1544250950866', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('480', 'test522@gmail.com', 'a', '0', 'test522', '0', '10750', '110', '0', '-1', '0', '12-0394-9215', '0', '0', '1544253296622', '1544254033141', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('481', 'test525@gmail.com', 'a', '0', 'test525', '0', '999750', '110', '0', '-1', '0', '12-0394-9216', '0', '0', '1544254055170', '1544257689598', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('482', 'test526@gmail.com', 'a', '0', 'test526', '0', '110748', '110', '0', '-1', '0', '12-0394-9217', '1', '0', '1544255174448', '1544255644078', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('483', '751082e2a8a60420104343d8a2957f8518cac72c', '', '0', 'Guest', '0', '10589', '110', '0', '-1', '0', '12-0394-9218', '9', '8', '1544503347564', '1546588324182', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('484', 'test1000@gmail.com', 'a', '0', 'شلاؤيثب', '0', '210758', '110', '0', '-1', '0', '12-0394-9219', '3', '24', '1544610431450', '1544758159144', '', 'UNKNOWN', '1', '24');
INSERT INTO `user` VALUES ('485', '57943c41c8d5c88098a90fb35164257ae204a3dd', '', '0', 'Guest', '0', '110750', '110', '0', '-1', '0', '12-0394-9220', '0', '0', '1544676292204', '1544676375937', '', 'UNKNOWN', '0', '0');
INSERT INTO `user` VALUES ('486', 'test78@gmail.com', 'a', '0', 'test78', '0', '110750', '110', '0', '-1', '0', '12-0394-9221', '0', '0', '1544687885895', '1544687887667', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('487', 'c5f3cb5fb389b365e98c36778b38a5567129ee58', '', '0', 'jack', '0', '752922649222', '710', '0', '-1', '0', '12-0394-9222', '206', '62217350000', '1544783363950', '1546654746247', '', 'UNKNOWN', '34', '0');
INSERT INTO `user` VALUES ('488', 'test2000@gmail.com', 'a', '0', 'شلاؤي', '0', '110745', '110', '0', '-1', '0', '12-0394-9223', '3', '0', '1544850452656', '1544851087208', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('489', 'test5000@gmail.com', 'a', '0', 'test5000', '0', '10750', '110', '0', '-1', '0', '12-0394-9224', '0', '0', '1545616407222', '1545616408779', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('490', 'test5001@gmail.com', 'a', '0', 'test5001', '0', '14250', '110', '0', '-1', '0', '12-0394-9225', '0', '0', '1545616452948', '1545630771292', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('491', 'jack@gmail.com', 'a', '0', 'jack', '0', '110200', '110', '0', '0', '1', '12-0394-9226', '1', '0', '1545627073023', '1545627244331', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('492', 'gail@gmail.com', 'a', '0', 'gail', '0', '14246', '110', '0', '-1', '0', '12-0394-9227', '0', '0', '1545627621172', '1545627622863', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('493', 'cook@gmail.com', 'a', '0', 'cook', '0', '14250', '110', '0', '-1', '0', '12-0394-9228', '0', '0', '1545627807986', '1545628580228', '', 'UNKNOWN', '1', '0');
INSERT INTO `user` VALUES ('494', 'HeapByteBuffer@3a98da32', 'a', '0', 'Heap', '0', '29792250', '110', '0', '-1', '0', '12-0394-9229', '1', '0', '1546570169544', '1546588495392', '', 'UNKNOWN', '1', '0');
