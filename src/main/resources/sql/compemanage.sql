/*
 Navicat Premium Data Transfer

 Source Server         : MyCon
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : compemanage

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 17/04/2019 21:19:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for athlete
-- ----------------------------
DROP TABLE IF EXISTS `athlete`;
CREATE TABLE `athlete`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` tinyint(1) NOT NULL COMMENT 'true(1)为男',
  `age` int(5) NOT NULL,
  `athID` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '身份证',
  `no` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '队员编号 000 - 999',
  `teamid` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `no`(`no`) USING BTREE,
  INDEX `teamid`(`teamid`) USING BTREE,
  CONSTRAINT `athlete_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of athlete
-- ----------------------------
INSERT INTO `athlete` VALUES (1, 'John', 1, 12, '640021', NULL, 1);
INSERT INTO `athlete` VALUES (2, 'Jane', 0, 9, '12312', NULL, 2);
INSERT INTO `athlete` VALUES (3, 'Curry', 1, 10, '23189', NULL, 3);

-- ----------------------------
-- Table structure for captain
-- ----------------------------
DROP TABLE IF EXISTS `captain`;
CREATE TABLE `captain`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `capID` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '身份证',
  `teamid` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teamid`(`teamid`) USING BTREE,
  CONSTRAINT `captain_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of captain
-- ----------------------------
INSERT INTO `captain` VALUES (1, 'Tom', '111', '22222', 1);
INSERT INTO `captain` VALUES (2, 'Micheal', '333', '44444', 2);

-- ----------------------------
-- Table structure for coach
-- ----------------------------
DROP TABLE IF EXISTS `coach`;
CREATE TABLE `coach`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` tinyint(1) NOT NULL COMMENT 'true(1)为男',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `coachID` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '身份证',
  `teamid` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teamid`(`teamid`) USING BTREE,
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coach
-- ----------------------------
INSERT INTO `coach` VALUES (1, 'Luo', 0, '1232141', 'uio', 2);
INSERT INTO `coach` VALUES (2, 'UI', 1, '12', 'asd', 1);

-- ----------------------------
-- Table structure for competition
-- ----------------------------
DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `project` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT 'false(0)为初赛',
  `sexgroup` tinyint(1) NOT NULL COMMENT 'true(1)为男子组',
  `agegroup` int(2) NOT NULL COMMENT '0为7-8组，1为9-10，2为11-12',
  `place` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `date` datetime(5) NULL DEFAULT NULL COMMENT '\"yyyy-MM-dd HH:mm“格式的日期',
  `isEnd` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0为未结束',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of competition
-- ----------------------------
INSERT INTO `competition` VALUES (1, '单杠', 0, 0, 0, NULL, NULL, 1);
INSERT INTO `competition` VALUES (2, '跳马', 0, 1, 2, NULL, NULL, 0);

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `docID` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '身份证',
  `teamid` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teamid`(`teamid`) USING BTREE,
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, 'Mr.Cap', '99921', 'qwe', 1);
INSERT INTO `doctor` VALUES (2, 'Mrs.Xin', 'iqwe3', '1212', 2);

-- ----------------------------
-- Table structure for judge
-- ----------------------------
DROP TABLE IF EXISTS `judge`;
CREATE TABLE `judge`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `comp_id` int(5) NOT NULL,
  `ref_id` int(5) NOT NULL,
  `groupno` int(2) NOT NULL COMMENT '每场比赛的组别，第1组，第2组类似的',
  `reftype` tinyint(4) NOT NULL COMMENT 'normal(0) or major(1) referee',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comp_id`(`comp_id`) USING BTREE,
  INDEX `ref_id`(`ref_id`) USING BTREE,
  CONSTRAINT `judge_ibfk_1` FOREIGN KEY (`comp_id`) REFERENCES `competition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `judge_ibfk_2` FOREIGN KEY (`ref_id`) REFERENCES `referee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of judge
-- ----------------------------
INSERT INTO `judge` VALUES (1, 1, 1, 1, 0);
INSERT INTO `judge` VALUES (2, 1, 3, 2, 1);
INSERT INTO `judge` VALUES (3, 2, 3, 1, 1);

-- ----------------------------
-- Table structure for participate
-- ----------------------------
DROP TABLE IF EXISTS `participate`;
CREATE TABLE `participate`  (
  `ath_id` int(5) NOT NULL,
  `comp_id` int(5) NOT NULL,
  `groupno` int(2) NULL DEFAULT NULL COMMENT '一场比赛中的组别号，第1组，第2组',
  `score` double(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ath_id`, `comp_id`) USING BTREE,
  INDEX `ath_id`(`ath_id`) USING BTREE,
  INDEX `comp_id`(`comp_id`) USING BTREE,
  CONSTRAINT `participate_ibfk_1` FOREIGN KEY (`ath_id`) REFERENCES `athlete` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participate_ibfk_2` FOREIGN KEY (`comp_id`) REFERENCES `competition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of participate
-- ----------------------------
INSERT INTO `participate` VALUES (1, 1, NULL, 90.20);
INSERT INTO `participate` VALUES (1, 2, 1, 90.20);
INSERT INTO `participate` VALUES (2, 1, NULL, 98.11);
INSERT INTO `participate` VALUES (3, 1, NULL, 401.00);

-- ----------------------------
-- Table structure for referee
-- ----------------------------
DROP TABLE IF EXISTS `referee`;
CREATE TABLE `referee`  (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'auto-generated',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `refID` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '身份证',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '账户名',
  `teamid` int(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teamid`(`teamid`) USING BTREE,
  CONSTRAINT `referee_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of referee
-- ----------------------------
INSERT INTO `referee` VALUES (1, 'Kelao', '123124', '189220', '0', 1);
INSERT INTO `referee` VALUES (2, 'Rose', '88210', '132098', '1', 2);
INSERT INTO `referee` VALUES (3, 'Tompson', '81200', '178001', NULL, 2);

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `isSign` tinyint(1) NULL DEFAULT 0 COMMENT '是否报名结束',
  `isHost` tinyint(1) NULL DEFAULT 0 COMMENT '是否为东道主',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, 'Wuhan', 'whu', 'qqw123', 1, 1);
INSERT INTO `team` VALUES (2, 'Beijing', 'bts', '456', 0, 0);
INSERT INTO `team` VALUES (3, 'Shanghai', 'scc', '789', 1, 0);
INSERT INTO `team` VALUES (4, 'Changsha', 'uux', '10293', 0, 0);

-- ----------------------------
-- Table structure for tempscore
-- ----------------------------
DROP TABLE IF EXISTS `tempscore`;
CREATE TABLE `tempscore`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `judge_id` int(5) NOT NULL,
  `ath_id` int(5) NOT NULL,
  `score` double(5, 2) NULL DEFAULT NULL,
  `isValid` tinyint(1) NULL DEFAULT NULL COMMENT 'true(1)代表成绩有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `judge_id`(`judge_id`) USING BTREE,
  INDEX `ath_id`(`ath_id`) USING BTREE,
  CONSTRAINT `tempscore_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `judge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tempscore_ibfk_2` FOREIGN KEY (`ath_id`) REFERENCES `athlete` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tempscore
-- ----------------------------
INSERT INTO `tempscore` VALUES (1, 1, 1, 90.10, NULL);
INSERT INTO `tempscore` VALUES (2, 1, 2, 100.00, 0);
INSERT INTO `tempscore` VALUES (3, 3, 3, 55.80, NULL);

SET FOREIGN_KEY_CHECKS = 1;
