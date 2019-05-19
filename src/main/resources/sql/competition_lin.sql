/*
 Navicat Premium Data Transfer

 Source Server         : Lin
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : competition

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 18/05/2019 21:03:40
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
  UNIQUE INDEX `athID`(`athID`) USING BTREE,
  UNIQUE INDEX `no`(`no`) USING BTREE,
  INDEX `teamid`(`teamid`) USING BTREE,
  CONSTRAINT `athlete_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of athlete
-- ----------------------------
INSERT INTO `athlete` VALUES (18, '1ath1_1', 0, 7, '635156', NULL, 1);
INSERT INTO `athlete` VALUES (19, '1ath1_2', 0, 7, '635167', NULL, 1);
INSERT INTO `athlete` VALUES (20, '1ath1_3', 0, 7, '635178', NULL, 1);
INSERT INTO `athlete` VALUES (21, '1ath1_4', 0, 7, '635189', NULL, 1);
INSERT INTO `athlete` VALUES (22, '1ath1_5', 0, 7, '635200', NULL, 1);
INSERT INTO `athlete` VALUES (23, '1ath1_6', 0, 7, '635211', NULL, 1);
INSERT INTO `athlete` VALUES (24, '1ath1_7', 1, 7, '635222', NULL, 1);
INSERT INTO `athlete` VALUES (25, '1ath1_8', 1, 7, '635233', NULL, 1);
INSERT INTO `athlete` VALUES (26, '1ath1_9', 1, 7, '635244', NULL, 1);
INSERT INTO `athlete` VALUES (27, '1ath1_10', 1, 7, '635255', NULL, 1);
INSERT INTO `athlete` VALUES (28, '1ath1_11', 1, 7, '635266', NULL, 1);
INSERT INTO `athlete` VALUES (29, '1ath1_12', 1, 7, '635277', NULL, 1);
INSERT INTO `athlete` VALUES (30, '1ath2_1', 0, 9, '635276', NULL, 1);
INSERT INTO `athlete` VALUES (31, '1ath2_2', 0, 9, '635287', NULL, 1);
INSERT INTO `athlete` VALUES (32, '1ath2_3', 0, 9, '635298', NULL, 1);
INSERT INTO `athlete` VALUES (33, '1ath2_4', 0, 9, '635309', NULL, 1);
INSERT INTO `athlete` VALUES (34, '1ath2_5', 0, 9, '635320', NULL, 1);
INSERT INTO `athlete` VALUES (35, '1ath2_6', 0, 9, '635331', NULL, 1);
INSERT INTO `athlete` VALUES (36, '1ath2_7', 1, 9, '635342', NULL, 1);
INSERT INTO `athlete` VALUES (37, '1ath2_8', 1, 9, '635353', NULL, 1);
INSERT INTO `athlete` VALUES (38, '1ath2_9', 1, 9, '635364', NULL, 1);
INSERT INTO `athlete` VALUES (39, '1ath2_10', 1, 9, '635375', NULL, 1);
INSERT INTO `athlete` VALUES (40, '1ath2_11', 1, 9, '635386', NULL, 1);
INSERT INTO `athlete` VALUES (41, '1ath2_12', 1, 9, '635397', NULL, 1);
INSERT INTO `athlete` VALUES (42, '1ath3_1', 0, 11, '635396', NULL, 1);
INSERT INTO `athlete` VALUES (43, '1ath3_2', 0, 11, '635407', NULL, 1);
INSERT INTO `athlete` VALUES (44, '1ath3_3', 0, 11, '635418', NULL, 1);
INSERT INTO `athlete` VALUES (45, '1ath3_4', 0, 11, '635429', NULL, 1);
INSERT INTO `athlete` VALUES (46, '1ath3_5', 0, 11, '635440', NULL, 1);
INSERT INTO `athlete` VALUES (47, '1ath3_6', 0, 11, '635451', NULL, 1);
INSERT INTO `athlete` VALUES (48, '1ath3_7', 1, 11, '635462', NULL, 1);
INSERT INTO `athlete` VALUES (49, '1ath3_8', 1, 11, '635473', NULL, 1);
INSERT INTO `athlete` VALUES (50, '1ath3_9', 1, 11, '635484', NULL, 1);
INSERT INTO `athlete` VALUES (51, '1ath3_10', 1, 11, '635495', NULL, 1);
INSERT INTO `athlete` VALUES (52, '1ath3_11', 1, 11, '635506', NULL, 1);
INSERT INTO `athlete` VALUES (53, '1ath3_12', 1, 11, '635517', NULL, 1);
INSERT INTO `athlete` VALUES (54, '2ath1_1', 0, 7, '636676', NULL, 2);
INSERT INTO `athlete` VALUES (55, '2ath1_2', 0, 7, '636687', NULL, 2);
INSERT INTO `athlete` VALUES (56, '2ath1_3', 0, 7, '636698', NULL, 2);
INSERT INTO `athlete` VALUES (57, '2ath1_4', 0, 7, '636709', NULL, 2);
INSERT INTO `athlete` VALUES (58, '2ath1_5', 0, 7, '636720', NULL, 2);
INSERT INTO `athlete` VALUES (59, '2ath1_6', 0, 7, '636731', NULL, 2);
INSERT INTO `athlete` VALUES (60, '2ath1_7', 1, 7, '636742', NULL, 2);
INSERT INTO `athlete` VALUES (61, '2ath1_8', 1, 7, '636753', NULL, 2);
INSERT INTO `athlete` VALUES (62, '2ath1_9', 1, 7, '636764', NULL, 2);
INSERT INTO `athlete` VALUES (63, '2ath1_10', 1, 7, '636775', NULL, 2);
INSERT INTO `athlete` VALUES (64, '2ath1_11', 1, 7, '636786', NULL, 2);
INSERT INTO `athlete` VALUES (65, '2ath1_12', 1, 7, '636797', NULL, 2);
INSERT INTO `athlete` VALUES (66, '2ath2_1', 0, 9, '636796', NULL, 2);
INSERT INTO `athlete` VALUES (67, '2ath2_2', 0, 9, '636807', NULL, 2);
INSERT INTO `athlete` VALUES (68, '2ath2_3', 0, 9, '636818', NULL, 2);
INSERT INTO `athlete` VALUES (69, '2ath2_4', 0, 9, '636829', NULL, 2);
INSERT INTO `athlete` VALUES (70, '2ath2_5', 0, 9, '636840', NULL, 2);
INSERT INTO `athlete` VALUES (71, '2ath2_6', 0, 9, '636851', NULL, 2);
INSERT INTO `athlete` VALUES (72, '2ath2_7', 1, 9, '636862', NULL, 2);
INSERT INTO `athlete` VALUES (73, '2ath2_8', 1, 9, '636873', NULL, 2);
INSERT INTO `athlete` VALUES (74, '2ath2_9', 1, 9, '636884', NULL, 2);
INSERT INTO `athlete` VALUES (75, '2ath2_10', 1, 9, '636895', NULL, 2);
INSERT INTO `athlete` VALUES (76, '2ath2_11', 1, 9, '636906', NULL, 2);
INSERT INTO `athlete` VALUES (77, '2ath2_12', 1, 9, '636917', NULL, 2);
INSERT INTO `athlete` VALUES (78, '2ath3_1', 0, 11, '636916', NULL, 2);
INSERT INTO `athlete` VALUES (79, '2ath3_2', 0, 11, '636927', NULL, 2);
INSERT INTO `athlete` VALUES (80, '2ath3_3', 0, 11, '636938', NULL, 2);
INSERT INTO `athlete` VALUES (81, '2ath3_4', 0, 11, '636949', NULL, 2);
INSERT INTO `athlete` VALUES (82, '2ath3_5', 0, 11, '636960', NULL, 2);
INSERT INTO `athlete` VALUES (83, '2ath3_6', 0, 11, '636971', NULL, 2);
INSERT INTO `athlete` VALUES (84, '2ath3_7', 1, 11, '636982', NULL, 2);
INSERT INTO `athlete` VALUES (85, '2ath3_8', 1, 11, '636993', NULL, 2);
INSERT INTO `athlete` VALUES (86, '2ath3_9', 1, 11, '637004', NULL, 2);
INSERT INTO `athlete` VALUES (87, '2ath3_10', 1, 11, '637015', NULL, 2);
INSERT INTO `athlete` VALUES (88, '2ath3_11', 1, 11, '637026', NULL, 2);
INSERT INTO `athlete` VALUES (89, '2ath3_12', 1, 11, '637037', NULL, 2);
INSERT INTO `athlete` VALUES (90, '3ath1_1', 0, 7, '638196', NULL, 3);
INSERT INTO `athlete` VALUES (91, '3ath1_2', 0, 7, '638207', NULL, 3);
INSERT INTO `athlete` VALUES (92, '3ath1_3', 0, 7, '638218', NULL, 3);
INSERT INTO `athlete` VALUES (93, '3ath1_4', 0, 7, '638229', NULL, 3);
INSERT INTO `athlete` VALUES (94, '3ath1_5', 0, 7, '638240', NULL, 3);
INSERT INTO `athlete` VALUES (95, '3ath1_6', 0, 7, '638251', NULL, 3);
INSERT INTO `athlete` VALUES (96, '3ath1_7', 1, 7, '638262', NULL, 3);
INSERT INTO `athlete` VALUES (97, '3ath1_8', 1, 7, '638273', NULL, 3);
INSERT INTO `athlete` VALUES (98, '3ath1_9', 1, 7, '638284', NULL, 3);
INSERT INTO `athlete` VALUES (99, '3ath1_10', 1, 7, '638295', NULL, 3);
INSERT INTO `athlete` VALUES (100, '3ath1_11', 1, 7, '638306', NULL, 3);
INSERT INTO `athlete` VALUES (101, '3ath1_12', 1, 7, '638317', NULL, 3);
INSERT INTO `athlete` VALUES (102, '3ath2_1', 0, 9, '638316', NULL, 3);
INSERT INTO `athlete` VALUES (103, '3ath2_2', 0, 9, '638327', NULL, 3);
INSERT INTO `athlete` VALUES (104, '3ath2_3', 0, 9, '638338', NULL, 3);
INSERT INTO `athlete` VALUES (105, '3ath2_4', 0, 9, '638349', NULL, 3);
INSERT INTO `athlete` VALUES (106, '3ath2_5', 0, 9, '638360', NULL, 3);
INSERT INTO `athlete` VALUES (107, '3ath2_6', 0, 9, '638371', NULL, 3);
INSERT INTO `athlete` VALUES (108, '3ath2_7', 1, 9, '638382', NULL, 3);
INSERT INTO `athlete` VALUES (109, '3ath2_8', 1, 9, '638393', NULL, 3);
INSERT INTO `athlete` VALUES (110, '3ath2_9', 1, 9, '638404', NULL, 3);
INSERT INTO `athlete` VALUES (111, '3ath2_10', 1, 9, '638415', NULL, 3);
INSERT INTO `athlete` VALUES (112, '3ath2_11', 1, 9, '638426', NULL, 3);
INSERT INTO `athlete` VALUES (113, '3ath2_12', 1, 9, '638437', NULL, 3);
INSERT INTO `athlete` VALUES (114, '3ath3_1', 0, 11, '638436', NULL, 3);
INSERT INTO `athlete` VALUES (115, '3ath3_2', 0, 11, '638447', NULL, 3);
INSERT INTO `athlete` VALUES (116, '3ath3_3', 0, 11, '638458', NULL, 3);
INSERT INTO `athlete` VALUES (117, '3ath3_4', 0, 11, '638469', NULL, 3);
INSERT INTO `athlete` VALUES (118, '3ath3_5', 0, 11, '638480', NULL, 3);
INSERT INTO `athlete` VALUES (119, '3ath3_6', 0, 11, '638491', NULL, 3);
INSERT INTO `athlete` VALUES (120, '3ath3_7', 1, 11, '638502', NULL, 3);
INSERT INTO `athlete` VALUES (121, '3ath3_8', 1, 11, '638513', NULL, 3);
INSERT INTO `athlete` VALUES (122, '3ath3_9', 1, 11, '638524', NULL, 3);
INSERT INTO `athlete` VALUES (123, '3ath3_10', 1, 11, '638535', NULL, 3);
INSERT INTO `athlete` VALUES (124, '3ath3_11', 1, 11, '638546', NULL, 3);
INSERT INTO `athlete` VALUES (125, '3ath3_12', 1, 11, '638557', NULL, 3);
INSERT INTO `athlete` VALUES (126, '4ath1_1', 0, 7, '639716', NULL, 4);
INSERT INTO `athlete` VALUES (127, '4ath1_2', 0, 7, '639727', NULL, 4);
INSERT INTO `athlete` VALUES (128, '4ath1_3', 0, 7, '639738', NULL, 4);
INSERT INTO `athlete` VALUES (129, '4ath1_4', 0, 7, '639749', NULL, 4);
INSERT INTO `athlete` VALUES (130, '4ath1_5', 0, 7, '639760', NULL, 4);
INSERT INTO `athlete` VALUES (131, '4ath1_6', 0, 7, '639771', NULL, 4);
INSERT INTO `athlete` VALUES (132, '4ath1_7', 1, 7, '639782', NULL, 4);
INSERT INTO `athlete` VALUES (133, '4ath1_8', 1, 7, '639793', NULL, 4);
INSERT INTO `athlete` VALUES (134, '4ath1_9', 1, 7, '639804', NULL, 4);
INSERT INTO `athlete` VALUES (135, '4ath1_10', 1, 7, '639815', NULL, 4);
INSERT INTO `athlete` VALUES (136, '4ath1_11', 1, 7, '639826', NULL, 4);
INSERT INTO `athlete` VALUES (137, '4ath1_12', 1, 7, '639837', NULL, 4);
INSERT INTO `athlete` VALUES (138, '4ath2_1', 0, 9, '639836', NULL, 4);
INSERT INTO `athlete` VALUES (139, '4ath2_2', 0, 9, '639847', NULL, 4);
INSERT INTO `athlete` VALUES (140, '4ath2_3', 0, 9, '639858', NULL, 4);
INSERT INTO `athlete` VALUES (141, '4ath2_4', 0, 9, '639869', NULL, 4);
INSERT INTO `athlete` VALUES (142, '4ath2_5', 0, 9, '639880', NULL, 4);
INSERT INTO `athlete` VALUES (143, '4ath2_6', 0, 9, '639891', NULL, 4);
INSERT INTO `athlete` VALUES (144, '4ath2_7', 1, 9, '639902', NULL, 4);
INSERT INTO `athlete` VALUES (145, '4ath2_8', 1, 9, '639913', NULL, 4);
INSERT INTO `athlete` VALUES (146, '4ath2_9', 1, 9, '639924', NULL, 4);
INSERT INTO `athlete` VALUES (147, '4ath2_10', 1, 9, '639935', NULL, 4);
INSERT INTO `athlete` VALUES (148, '4ath2_11', 1, 9, '639946', NULL, 4);
INSERT INTO `athlete` VALUES (149, '4ath2_12', 1, 9, '639957', NULL, 4);
INSERT INTO `athlete` VALUES (150, '4ath3_1', 0, 11, '639956', NULL, 4);
INSERT INTO `athlete` VALUES (151, '4ath3_2', 0, 11, '639967', NULL, 4);
INSERT INTO `athlete` VALUES (152, '4ath3_3', 0, 11, '639978', NULL, 4);
INSERT INTO `athlete` VALUES (153, '4ath3_4', 0, 11, '639989', NULL, 4);
INSERT INTO `athlete` VALUES (154, '4ath3_5', 0, 11, '640000', NULL, 4);
INSERT INTO `athlete` VALUES (155, '4ath3_6', 0, 11, '640011', NULL, 4);
INSERT INTO `athlete` VALUES (156, '4ath3_7', 1, 11, '640022', NULL, 4);
INSERT INTO `athlete` VALUES (157, '4ath3_8', 1, 11, '640033', NULL, 4);
INSERT INTO `athlete` VALUES (158, '4ath3_9', 1, 11, '640044', NULL, 4);
INSERT INTO `athlete` VALUES (159, '4ath3_10', 1, 11, '640055', NULL, 4);
INSERT INTO `athlete` VALUES (160, '4ath3_11', 1, 11, '640066', NULL, 4);
INSERT INTO `athlete` VALUES (161, '4ath3_12', 1, 11, '640077', NULL, 4);
INSERT INTO `athlete` VALUES (162, '5ath1_1', 0, 7, '641236', NULL, 5);
INSERT INTO `athlete` VALUES (163, '5ath1_2', 0, 7, '641247', NULL, 5);
INSERT INTO `athlete` VALUES (164, '5ath1_3', 0, 7, '641258', NULL, 5);
INSERT INTO `athlete` VALUES (165, '5ath1_4', 0, 7, '641269', NULL, 5);
INSERT INTO `athlete` VALUES (166, '5ath1_5', 0, 7, '641280', NULL, 5);
INSERT INTO `athlete` VALUES (167, '5ath1_6', 0, 7, '641291', NULL, 5);
INSERT INTO `athlete` VALUES (168, '5ath1_7', 1, 7, '641302', NULL, 5);
INSERT INTO `athlete` VALUES (169, '5ath1_8', 1, 7, '641313', NULL, 5);
INSERT INTO `athlete` VALUES (170, '5ath1_9', 1, 7, '641324', NULL, 5);
INSERT INTO `athlete` VALUES (171, '5ath1_10', 1, 7, '641335', NULL, 5);
INSERT INTO `athlete` VALUES (172, '5ath1_11', 1, 7, '641346', NULL, 5);
INSERT INTO `athlete` VALUES (173, '5ath1_12', 1, 7, '641357', NULL, 5);
INSERT INTO `athlete` VALUES (174, '5ath2_1', 0, 9, '641356', NULL, 5);
INSERT INTO `athlete` VALUES (175, '5ath2_2', 0, 9, '641367', NULL, 5);
INSERT INTO `athlete` VALUES (176, '5ath2_3', 0, 9, '641378', NULL, 5);
INSERT INTO `athlete` VALUES (177, '5ath2_4', 0, 9, '641389', NULL, 5);
INSERT INTO `athlete` VALUES (178, '5ath2_5', 0, 9, '641400', NULL, 5);
INSERT INTO `athlete` VALUES (179, '5ath2_6', 0, 9, '641411', NULL, 5);
INSERT INTO `athlete` VALUES (180, '5ath2_7', 1, 9, '641422', NULL, 5);
INSERT INTO `athlete` VALUES (181, '5ath2_8', 1, 9, '641433', NULL, 5);
INSERT INTO `athlete` VALUES (182, '5ath2_9', 1, 9, '641444', NULL, 5);
INSERT INTO `athlete` VALUES (183, '5ath2_10', 1, 9, '641455', NULL, 5);
INSERT INTO `athlete` VALUES (184, '5ath2_11', 1, 9, '641466', NULL, 5);
INSERT INTO `athlete` VALUES (185, '5ath2_12', 1, 9, '641477', NULL, 5);
INSERT INTO `athlete` VALUES (186, '5ath3_1', 0, 11, '641476', NULL, 5);
INSERT INTO `athlete` VALUES (187, '5ath3_2', 0, 11, '641487', NULL, 5);
INSERT INTO `athlete` VALUES (188, '5ath3_3', 0, 11, '641498', NULL, 5);
INSERT INTO `athlete` VALUES (189, '5ath3_4', 0, 11, '641509', NULL, 5);
INSERT INTO `athlete` VALUES (190, '5ath3_5', 0, 11, '641520', NULL, 5);
INSERT INTO `athlete` VALUES (191, '5ath3_6', 0, 11, '641531', NULL, 5);
INSERT INTO `athlete` VALUES (192, '5ath3_7', 1, 11, '641542', NULL, 5);
INSERT INTO `athlete` VALUES (193, '5ath3_8', 1, 11, '641553', NULL, 5);
INSERT INTO `athlete` VALUES (194, '5ath3_9', 1, 11, '641564', NULL, 5);
INSERT INTO `athlete` VALUES (195, '5ath3_10', 1, 11, '641575', NULL, 5);
INSERT INTO `athlete` VALUES (196, '5ath3_11', 1, 11, '641586', NULL, 5);
INSERT INTO `athlete` VALUES (197, '5ath3_12', 1, 11, '641597', NULL, 5);
INSERT INTO `athlete` VALUES (198, '6ath1_1', 0, 7, '642756', NULL, 6);
INSERT INTO `athlete` VALUES (199, '6ath1_2', 0, 7, '642767', NULL, 6);
INSERT INTO `athlete` VALUES (200, '6ath1_3', 0, 7, '642778', NULL, 6);
INSERT INTO `athlete` VALUES (201, '6ath1_4', 0, 7, '642789', NULL, 6);
INSERT INTO `athlete` VALUES (202, '6ath1_5', 0, 7, '642800', NULL, 6);
INSERT INTO `athlete` VALUES (203, '6ath1_6', 0, 7, '642811', NULL, 6);
INSERT INTO `athlete` VALUES (204, '6ath1_7', 1, 7, '642822', NULL, 6);
INSERT INTO `athlete` VALUES (205, '6ath1_8', 1, 7, '642833', NULL, 6);
INSERT INTO `athlete` VALUES (206, '6ath1_9', 1, 7, '642844', NULL, 6);
INSERT INTO `athlete` VALUES (207, '6ath1_10', 1, 7, '642855', NULL, 6);
INSERT INTO `athlete` VALUES (208, '6ath1_11', 1, 7, '642866', NULL, 6);
INSERT INTO `athlete` VALUES (209, '6ath1_12', 1, 7, '642877', NULL, 6);
INSERT INTO `athlete` VALUES (210, '6ath2_1', 0, 9, '642876', NULL, 6);
INSERT INTO `athlete` VALUES (211, '6ath2_2', 0, 9, '642887', NULL, 6);
INSERT INTO `athlete` VALUES (212, '6ath2_3', 0, 9, '642898', NULL, 6);
INSERT INTO `athlete` VALUES (213, '6ath2_4', 0, 9, '642909', NULL, 6);
INSERT INTO `athlete` VALUES (214, '6ath2_5', 0, 9, '642920', NULL, 6);
INSERT INTO `athlete` VALUES (215, '6ath2_6', 0, 9, '642931', NULL, 6);
INSERT INTO `athlete` VALUES (216, '6ath2_7', 1, 9, '642942', NULL, 6);
INSERT INTO `athlete` VALUES (217, '6ath2_8', 1, 9, '642953', NULL, 6);
INSERT INTO `athlete` VALUES (218, '6ath2_9', 1, 9, '642964', NULL, 6);
INSERT INTO `athlete` VALUES (219, '6ath2_10', 1, 9, '642975', NULL, 6);
INSERT INTO `athlete` VALUES (220, '6ath2_11', 1, 9, '642986', NULL, 6);
INSERT INTO `athlete` VALUES (221, '6ath2_12', 1, 9, '642997', NULL, 6);
INSERT INTO `athlete` VALUES (222, '6ath3_1', 0, 11, '642996', NULL, 6);
INSERT INTO `athlete` VALUES (223, '6ath3_2', 0, 11, '643007', NULL, 6);
INSERT INTO `athlete` VALUES (224, '6ath3_3', 0, 11, '643018', NULL, 6);
INSERT INTO `athlete` VALUES (225, '6ath3_4', 0, 11, '643029', NULL, 6);
INSERT INTO `athlete` VALUES (226, '6ath3_5', 0, 11, '643040', NULL, 6);
INSERT INTO `athlete` VALUES (227, '6ath3_6', 0, 11, '643051', NULL, 6);
INSERT INTO `athlete` VALUES (228, '6ath3_7', 1, 11, '643062', NULL, 6);
INSERT INTO `athlete` VALUES (229, '6ath3_8', 1, 11, '643073', NULL, 6);
INSERT INTO `athlete` VALUES (230, '6ath3_9', 1, 11, '643084', NULL, 6);
INSERT INTO `athlete` VALUES (231, '6ath3_10', 1, 11, '643095', NULL, 6);
INSERT INTO `athlete` VALUES (232, '6ath3_11', 1, 11, '643106', NULL, 6);
INSERT INTO `athlete` VALUES (233, '6ath3_12', 1, 11, '643117', NULL, 6);

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `teamid` int(11) NOT NULL,
  `attach` blob NULL COMMENT '存储队伍上传的人员信息附件',
  PRIMARY KEY (`teamid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
  UNIQUE INDEX `capID`(`capID`) USING BTREE,
  INDEX `teamid`(`teamid`) USING BTREE,
  CONSTRAINT `captain_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of captain
-- ----------------------------
INSERT INTO `captain` VALUES (1, 'cap1', '856186', '64516161', 1);
INSERT INTO `captain` VALUES (2, 'cap2', '524813', '25486156', 2);
INSERT INTO `captain` VALUES (3, 'cap3', '254633', '64866425', 3);
INSERT INTO `captain` VALUES (4, 'cap4', '531535', '68616845', 4);
INSERT INTO `captain` VALUES (5, 'cap5', '246834', '84938134', 5);
INSERT INTO `captain` VALUES (6, 'cap6', '518348', '81684319', 6);

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
  UNIQUE INDEX `coachID`(`coachID`) USING BTREE COMMENT '唯一身份证标识',
  INDEX `teamid`(`teamid`) USING BTREE,
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coach
-- ----------------------------
INSERT INTO `coach` VALUES (1, 'coach1', 1, '1686163', '516351316', 1);
INSERT INTO `coach` VALUES (2, 'coach2', 0, '1164641', '231353153', 2);
INSERT INTO `coach` VALUES (3, 'coach3', 1, '1643164', '516615168', 3);
INSERT INTO `coach` VALUES (4, 'coach4', 1, '1545525', '154641646', 4);
INSERT INTO `coach` VALUES (5, 'coach5', 0, '3515364', '464135613', 5);
INSERT INTO `coach` VALUES (6, 'coach6', 0, '5324846', '531481531', 6);

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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of competition
-- ----------------------------
INSERT INTO `competition` VALUES (10, '跳马', 0, 0, 0, '洪山区', '2019-10-03 00:00:00.00000', 1);
INSERT INTO `competition` VALUES (11, '跳马', 0, 0, 1, '黄石', '2019-08-12 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (12, '跳马', 0, 0, 2, '沙洲', '2019-07-06 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (13, '高低杠', 0, 0, 0, '洪山区', '2019-10-12 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (14, '高低杠', 0, 0, 1, NULL, '2019-06-03 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (15, '高低杠', 0, 0, 2, '武昌区', '2019-04-12 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (16, '平衡木', 0, 0, 0, NULL, '2019-08-06 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (17, '平衡木', 0, 0, 1, NULL, '2019-09-03 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (18, '平衡木', 0, 0, 2, NULL, '2019-11-02 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (19, '自由体操', 0, 0, 0, NULL, '2019-04-29 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (20, '自由体操', 0, 0, 1, NULL, '2019-04-02 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (21, '自由体操', 0, 0, 2, NULL, '2019-07-02 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (22, '蹦床', 0, 0, 0, NULL, '2019-07-03 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (23, '蹦床', 0, 0, 1, NULL, '2019-04-09 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (24, '蹦床', 0, 0, 2, NULL, '2019-10-18 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (25, '单杠', 0, 1, 0, '武汉大学', '2019-05-06 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (26, '单杠', 0, 1, 1, '武大', '2019-05-07 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (27, '单杠', 0, 1, 2, '武大', '2019-05-08 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (28, '双杠', 0, 1, 0, '华科', '2019-05-01 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (29, '双杠', 0, 1, 1, '华科', '2019-05-02 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (30, '双杠', 0, 1, 2, '华科', '2019-05-01 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (31, '吊环', 0, 1, 0, '武大', '2019-08-01 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (32, '吊环', 0, 1, 1, '中南财经', '2019-08-02 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (33, '吊环', 0, 1, 2, '体育学院', '2019-08-03 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (34, '跳马', 0, 1, 0, '武大', '2019-08-04 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (35, '跳马', 0, 1, 1, NULL, '2019-08-05 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (36, '跳马', 0, 1, 2, NULL, '2019-08-06 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (37, '自由体操', 0, 1, 0, NULL, '2019-08-07 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (38, '自由体操', 0, 1, 1, NULL, '2019-08-08 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (39, '自由体操', 0, 1, 2, NULL, '2019-08-09 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (40, '鞍马', 0, 1, 0, NULL, '2019-08-10 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (41, '鞍马', 0, 1, 1, NULL, '2019-08-11 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (42, '鞍马', 0, 1, 2, NULL, '2019-08-12 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (43, '蹦床', 0, 1, 0, NULL, '2019-08-13 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (44, '蹦床', 0, 1, 1, NULL, '2019-08-14 00:00:00.00000', 0);
INSERT INTO `competition` VALUES (45, '蹦床', 0, 1, 2, NULL, '2019-08-15 00:00:00.00000', 0);

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
  UNIQUE INDEX `docID`(`docID`) USING BTREE,
  INDEX `teamid`(`teamid`) USING BTREE,
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, 'dr1', '1461684', '653651616', 1);
INSERT INTO `doctor` VALUES (2, 'dr2', '1984641', '131651361', 2);
INSERT INTO `doctor` VALUES (3, 'dr3', '1674633', '511643015', 3);
INSERT INTO `doctor` VALUES (4, 'dr4', '1644463', '564315184', 4);
INSERT INTO `doctor` VALUES (5, 'dr5', '1534931', '524646418', 5);
INSERT INTO `doctor` VALUES (6, 'dr6', '1643843', '646183168', 6);

-- ----------------------------
-- Table structure for judge
-- ----------------------------
DROP TABLE IF EXISTS `judge`;
CREATE TABLE `judge`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `comp_id` int(5) NOT NULL,
  `ref_id` int(5) NOT NULL,
  `groupno` int(2) UNSIGNED NULL DEFAULT 0 COMMENT '每场比赛的组别，第1组，第2组类似的',
  `reftype` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'normal(0) or major(1) referee\r\n因为只有判决了才有裁判类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comp_id`(`comp_id`) USING BTREE,
  INDEX `ref_id`(`ref_id`) USING BTREE,
  CONSTRAINT `judge_ibfk_1` FOREIGN KEY (`comp_id`) REFERENCES `competition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `judge_ibfk_2` FOREIGN KEY (`ref_id`) REFERENCES `referee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of judge
-- ----------------------------
INSERT INTO `judge` VALUES (38, 10, 5, 1, 0);
INSERT INTO `judge` VALUES (39, 10, 9, 1, 0);
INSERT INTO `judge` VALUES (40, 10, 1, 1, 1);
INSERT INTO `judge` VALUES (41, 10, 8, 2, 0);
INSERT INTO `judge` VALUES (42, 10, 12, 2, 0);
INSERT INTO `judge` VALUES (43, 10, 4, 2, 1);
INSERT INTO `judge` VALUES (44, 10, 11, 3, 0);
INSERT INTO `judge` VALUES (45, 10, 15, 3, 0);
INSERT INTO `judge` VALUES (46, 10, 7, 3, 1);
INSERT INTO `judge` VALUES (47, 10, 14, 4, 0);
INSERT INTO `judge` VALUES (48, 10, 18, 4, 0);
INSERT INTO `judge` VALUES (49, 10, 10, 4, 1);
INSERT INTO `judge` VALUES (50, 10, 3, 5, 0);
INSERT INTO `judge` VALUES (51, 10, 17, 5, 0);
INSERT INTO `judge` VALUES (52, 10, 13, 5, 1);
INSERT INTO `judge` VALUES (53, 10, 2, 6, 0);
INSERT INTO `judge` VALUES (54, 10, 6, 6, 0);
INSERT INTO `judge` VALUES (55, 10, 16, 6, 1);

-- ----------------------------
-- Table structure for participate
-- ----------------------------
DROP TABLE IF EXISTS `participate`;
CREATE TABLE `participate`  (
  `ath_id` int(5) NOT NULL,
  `comp_id` int(5) NOT NULL,
  `groupno` int(2) UNSIGNED NULL DEFAULT 0 COMMENT '一场比赛中的组别号，第1组，第2组',
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
INSERT INTO `participate` VALUES (18, 10, 6, 9.71);
INSERT INTO `participate` VALUES (18, 13, 0, NULL);
INSERT INTO `participate` VALUES (18, 16, 0, NULL);
INSERT INTO `participate` VALUES (18, 19, 0, NULL);
INSERT INTO `participate` VALUES (19, 10, 3, 9.66);
INSERT INTO `participate` VALUES (19, 13, 0, NULL);
INSERT INTO `participate` VALUES (19, 19, 0, NULL);
INSERT INTO `participate` VALUES (19, 22, 0, NULL);
INSERT INTO `participate` VALUES (20, 10, 4, 9.66);
INSERT INTO `participate` VALUES (20, 13, 0, NULL);
INSERT INTO `participate` VALUES (20, 16, 0, NULL);
INSERT INTO `participate` VALUES (20, 19, 0, NULL);
INSERT INTO `participate` VALUES (20, 22, 0, NULL);
INSERT INTO `participate` VALUES (21, 10, 5, 9.66);
INSERT INTO `participate` VALUES (21, 13, 0, NULL);
INSERT INTO `participate` VALUES (21, 16, 0, NULL);
INSERT INTO `participate` VALUES (21, 22, 0, NULL);
INSERT INTO `participate` VALUES (22, 10, 2, 9.73);
INSERT INTO `participate` VALUES (22, 13, 0, NULL);
INSERT INTO `participate` VALUES (22, 16, 0, NULL);
INSERT INTO `participate` VALUES (22, 19, 0, NULL);
INSERT INTO `participate` VALUES (22, 22, 0, NULL);
INSERT INTO `participate` VALUES (23, 16, 0, NULL);
INSERT INTO `participate` VALUES (23, 19, 0, NULL);
INSERT INTO `participate` VALUES (23, 22, 0, NULL);
INSERT INTO `participate` VALUES (24, 25, 0, NULL);
INSERT INTO `participate` VALUES (24, 28, 0, NULL);
INSERT INTO `participate` VALUES (24, 31, 0, NULL);
INSERT INTO `participate` VALUES (24, 34, 0, NULL);
INSERT INTO `participate` VALUES (24, 37, 0, NULL);
INSERT INTO `participate` VALUES (24, 40, 0, NULL);
INSERT INTO `participate` VALUES (24, 43, 0, NULL);
INSERT INTO `participate` VALUES (25, 25, 0, NULL);
INSERT INTO `participate` VALUES (25, 28, 0, NULL);
INSERT INTO `participate` VALUES (25, 31, 0, NULL);
INSERT INTO `participate` VALUES (25, 34, 0, NULL);
INSERT INTO `participate` VALUES (25, 40, 0, NULL);
INSERT INTO `participate` VALUES (25, 43, 0, NULL);
INSERT INTO `participate` VALUES (26, 25, 0, NULL);
INSERT INTO `participate` VALUES (26, 28, 0, NULL);
INSERT INTO `participate` VALUES (26, 31, 0, NULL);
INSERT INTO `participate` VALUES (26, 34, 0, NULL);
INSERT INTO `participate` VALUES (26, 37, 0, NULL);
INSERT INTO `participate` VALUES (27, 25, 0, NULL);
INSERT INTO `participate` VALUES (27, 28, 0, NULL);
INSERT INTO `participate` VALUES (27, 31, 0, NULL);
INSERT INTO `participate` VALUES (27, 37, 0, NULL);
INSERT INTO `participate` VALUES (27, 40, 0, NULL);
INSERT INTO `participate` VALUES (27, 43, 0, NULL);
INSERT INTO `participate` VALUES (28, 25, 0, NULL);
INSERT INTO `participate` VALUES (28, 34, 0, NULL);
INSERT INTO `participate` VALUES (28, 37, 0, NULL);
INSERT INTO `participate` VALUES (28, 40, 0, NULL);
INSERT INTO `participate` VALUES (28, 43, 0, NULL);
INSERT INTO `participate` VALUES (29, 28, 0, NULL);
INSERT INTO `participate` VALUES (29, 31, 0, NULL);
INSERT INTO `participate` VALUES (29, 34, 0, NULL);
INSERT INTO `participate` VALUES (29, 37, 0, NULL);
INSERT INTO `participate` VALUES (29, 40, 0, NULL);
INSERT INTO `participate` VALUES (29, 43, 0, NULL);
INSERT INTO `participate` VALUES (30, 11, 0, NULL);
INSERT INTO `participate` VALUES (30, 14, 0, NULL);
INSERT INTO `participate` VALUES (30, 17, 0, NULL);
INSERT INTO `participate` VALUES (30, 20, 0, NULL);
INSERT INTO `participate` VALUES (30, 23, 0, NULL);
INSERT INTO `participate` VALUES (31, 11, 0, NULL);
INSERT INTO `participate` VALUES (31, 14, 0, NULL);
INSERT INTO `participate` VALUES (31, 17, 0, NULL);
INSERT INTO `participate` VALUES (31, 20, 0, NULL);
INSERT INTO `participate` VALUES (31, 23, 0, NULL);
INSERT INTO `participate` VALUES (32, 11, 0, NULL);
INSERT INTO `participate` VALUES (32, 14, 0, NULL);
INSERT INTO `participate` VALUES (32, 17, 0, NULL);
INSERT INTO `participate` VALUES (32, 20, 0, NULL);
INSERT INTO `participate` VALUES (32, 23, 0, NULL);
INSERT INTO `participate` VALUES (33, 11, 0, NULL);
INSERT INTO `participate` VALUES (33, 14, 0, NULL);
INSERT INTO `participate` VALUES (33, 20, 0, NULL);
INSERT INTO `participate` VALUES (33, 23, 0, NULL);
INSERT INTO `participate` VALUES (34, 17, 0, NULL);
INSERT INTO `participate` VALUES (34, 20, 0, NULL);
INSERT INTO `participate` VALUES (34, 23, 0, NULL);
INSERT INTO `participate` VALUES (35, 11, 0, NULL);
INSERT INTO `participate` VALUES (35, 14, 0, NULL);
INSERT INTO `participate` VALUES (35, 17, 0, NULL);
INSERT INTO `participate` VALUES (36, 29, 0, NULL);
INSERT INTO `participate` VALUES (36, 32, 0, NULL);
INSERT INTO `participate` VALUES (36, 41, 0, NULL);
INSERT INTO `participate` VALUES (37, 26, 0, NULL);
INSERT INTO `participate` VALUES (37, 29, 0, NULL);
INSERT INTO `participate` VALUES (37, 35, 0, NULL);
INSERT INTO `participate` VALUES (37, 38, 0, NULL);
INSERT INTO `participate` VALUES (37, 41, 0, NULL);
INSERT INTO `participate` VALUES (37, 44, 0, NULL);
INSERT INTO `participate` VALUES (38, 26, 0, NULL);
INSERT INTO `participate` VALUES (38, 29, 0, NULL);
INSERT INTO `participate` VALUES (38, 32, 0, NULL);
INSERT INTO `participate` VALUES (38, 35, 0, NULL);
INSERT INTO `participate` VALUES (38, 38, 0, NULL);
INSERT INTO `participate` VALUES (38, 41, 0, NULL);
INSERT INTO `participate` VALUES (38, 44, 0, NULL);
INSERT INTO `participate` VALUES (39, 26, 0, NULL);
INSERT INTO `participate` VALUES (39, 32, 0, NULL);
INSERT INTO `participate` VALUES (39, 35, 0, NULL);
INSERT INTO `participate` VALUES (39, 38, 0, NULL);
INSERT INTO `participate` VALUES (39, 44, 0, NULL);
INSERT INTO `participate` VALUES (40, 26, 0, NULL);
INSERT INTO `participate` VALUES (40, 29, 0, NULL);
INSERT INTO `participate` VALUES (40, 32, 0, NULL);
INSERT INTO `participate` VALUES (40, 35, 0, NULL);
INSERT INTO `participate` VALUES (40, 38, 0, NULL);
INSERT INTO `participate` VALUES (40, 41, 0, NULL);
INSERT INTO `participate` VALUES (40, 44, 0, NULL);
INSERT INTO `participate` VALUES (41, 26, 0, NULL);
INSERT INTO `participate` VALUES (41, 29, 0, NULL);
INSERT INTO `participate` VALUES (41, 32, 0, NULL);
INSERT INTO `participate` VALUES (41, 35, 0, NULL);
INSERT INTO `participate` VALUES (41, 38, 0, NULL);
INSERT INTO `participate` VALUES (41, 41, 0, NULL);
INSERT INTO `participate` VALUES (41, 44, 0, NULL);
INSERT INTO `participate` VALUES (42, 12, 0, NULL);
INSERT INTO `participate` VALUES (42, 15, 0, NULL);
INSERT INTO `participate` VALUES (42, 21, 0, NULL);
INSERT INTO `participate` VALUES (43, 12, 0, NULL);
INSERT INTO `participate` VALUES (43, 15, 0, NULL);
INSERT INTO `participate` VALUES (43, 18, 0, NULL);
INSERT INTO `participate` VALUES (43, 21, 0, NULL);
INSERT INTO `participate` VALUES (43, 24, 0, NULL);
INSERT INTO `participate` VALUES (44, 12, 0, NULL);
INSERT INTO `participate` VALUES (44, 15, 0, NULL);
INSERT INTO `participate` VALUES (44, 18, 0, NULL);
INSERT INTO `participate` VALUES (44, 21, 0, NULL);
INSERT INTO `participate` VALUES (44, 24, 0, NULL);
INSERT INTO `participate` VALUES (45, 18, 0, NULL);
INSERT INTO `participate` VALUES (45, 24, 0, NULL);
INSERT INTO `participate` VALUES (46, 12, 0, NULL);
INSERT INTO `participate` VALUES (46, 15, 0, NULL);
INSERT INTO `participate` VALUES (46, 18, 0, NULL);
INSERT INTO `participate` VALUES (46, 21, 0, NULL);
INSERT INTO `participate` VALUES (46, 24, 0, NULL);
INSERT INTO `participate` VALUES (47, 12, 0, NULL);
INSERT INTO `participate` VALUES (47, 15, 0, NULL);
INSERT INTO `participate` VALUES (47, 18, 0, NULL);
INSERT INTO `participate` VALUES (47, 21, 0, NULL);
INSERT INTO `participate` VALUES (47, 24, 0, NULL);
INSERT INTO `participate` VALUES (48, 27, 0, NULL);
INSERT INTO `participate` VALUES (48, 30, 0, NULL);
INSERT INTO `participate` VALUES (48, 33, 0, NULL);
INSERT INTO `participate` VALUES (48, 36, 0, NULL);
INSERT INTO `participate` VALUES (48, 39, 0, NULL);
INSERT INTO `participate` VALUES (48, 42, 0, NULL);
INSERT INTO `participate` VALUES (48, 45, 0, NULL);
INSERT INTO `participate` VALUES (49, 30, 0, NULL);
INSERT INTO `participate` VALUES (49, 33, 0, NULL);
INSERT INTO `participate` VALUES (49, 36, 0, NULL);
INSERT INTO `participate` VALUES (49, 39, 0, NULL);
INSERT INTO `participate` VALUES (49, 42, 0, NULL);
INSERT INTO `participate` VALUES (50, 27, 0, NULL);
INSERT INTO `participate` VALUES (50, 30, 0, NULL);
INSERT INTO `participate` VALUES (50, 33, 0, NULL);
INSERT INTO `participate` VALUES (50, 36, 0, NULL);
INSERT INTO `participate` VALUES (50, 45, 0, NULL);
INSERT INTO `participate` VALUES (51, 27, 0, NULL);
INSERT INTO `participate` VALUES (51, 30, 0, NULL);
INSERT INTO `participate` VALUES (51, 33, 0, NULL);
INSERT INTO `participate` VALUES (51, 36, 0, NULL);
INSERT INTO `participate` VALUES (51, 39, 0, NULL);
INSERT INTO `participate` VALUES (51, 42, 0, NULL);
INSERT INTO `participate` VALUES (51, 45, 0, NULL);
INSERT INTO `participate` VALUES (52, 27, 0, NULL);
INSERT INTO `participate` VALUES (52, 33, 0, NULL);
INSERT INTO `participate` VALUES (52, 36, 0, NULL);
INSERT INTO `participate` VALUES (52, 39, 0, NULL);
INSERT INTO `participate` VALUES (52, 42, 0, NULL);
INSERT INTO `participate` VALUES (52, 45, 0, NULL);
INSERT INTO `participate` VALUES (53, 27, 0, NULL);
INSERT INTO `participate` VALUES (53, 30, 0, NULL);
INSERT INTO `participate` VALUES (53, 39, 0, NULL);
INSERT INTO `participate` VALUES (53, 42, 0, NULL);
INSERT INTO `participate` VALUES (53, 45, 0, NULL);
INSERT INTO `participate` VALUES (54, 10, 6, 9.63);
INSERT INTO `participate` VALUES (54, 13, 0, NULL);
INSERT INTO `participate` VALUES (54, 16, 0, NULL);
INSERT INTO `participate` VALUES (54, 19, 0, NULL);
INSERT INTO `participate` VALUES (54, 22, 0, NULL);
INSERT INTO `participate` VALUES (55, 10, 1, 9.82);
INSERT INTO `participate` VALUES (55, 13, 0, NULL);
INSERT INTO `participate` VALUES (55, 22, 0, NULL);
INSERT INTO `participate` VALUES (56, 10, 5, 9.72);
INSERT INTO `participate` VALUES (56, 13, 0, NULL);
INSERT INTO `participate` VALUES (56, 16, 0, NULL);
INSERT INTO `participate` VALUES (56, 19, 0, NULL);
INSERT INTO `participate` VALUES (56, 22, 0, NULL);
INSERT INTO `participate` VALUES (57, 10, 4, 9.94);
INSERT INTO `participate` VALUES (57, 16, 0, NULL);
INSERT INTO `participate` VALUES (57, 19, 0, NULL);
INSERT INTO `participate` VALUES (57, 22, 0, NULL);
INSERT INTO `participate` VALUES (58, 10, 3, 9.87);
INSERT INTO `participate` VALUES (58, 13, 0, NULL);
INSERT INTO `participate` VALUES (58, 16, 0, NULL);
INSERT INTO `participate` VALUES (58, 19, 0, NULL);
INSERT INTO `participate` VALUES (58, 22, 0, NULL);
INSERT INTO `participate` VALUES (59, 13, 0, NULL);
INSERT INTO `participate` VALUES (59, 16, 0, NULL);
INSERT INTO `participate` VALUES (59, 19, 0, NULL);
INSERT INTO `participate` VALUES (60, 25, 0, NULL);
INSERT INTO `participate` VALUES (60, 28, 0, NULL);
INSERT INTO `participate` VALUES (60, 31, 0, NULL);
INSERT INTO `participate` VALUES (60, 34, 0, NULL);
INSERT INTO `participate` VALUES (60, 37, 0, NULL);
INSERT INTO `participate` VALUES (60, 40, 0, NULL);
INSERT INTO `participate` VALUES (60, 43, 0, NULL);
INSERT INTO `participate` VALUES (61, 28, 0, NULL);
INSERT INTO `participate` VALUES (61, 31, 0, NULL);
INSERT INTO `participate` VALUES (61, 34, 0, NULL);
INSERT INTO `participate` VALUES (61, 43, 0, NULL);
INSERT INTO `participate` VALUES (62, 25, 0, NULL);
INSERT INTO `participate` VALUES (62, 28, 0, NULL);
INSERT INTO `participate` VALUES (62, 34, 0, NULL);
INSERT INTO `participate` VALUES (62, 37, 0, NULL);
INSERT INTO `participate` VALUES (62, 40, 0, NULL);
INSERT INTO `participate` VALUES (62, 43, 0, NULL);
INSERT INTO `participate` VALUES (63, 25, 0, NULL);
INSERT INTO `participate` VALUES (63, 28, 0, NULL);
INSERT INTO `participate` VALUES (63, 31, 0, NULL);
INSERT INTO `participate` VALUES (63, 34, 0, NULL);
INSERT INTO `participate` VALUES (63, 37, 0, NULL);
INSERT INTO `participate` VALUES (63, 40, 0, NULL);
INSERT INTO `participate` VALUES (63, 43, 0, NULL);
INSERT INTO `participate` VALUES (64, 25, 0, NULL);
INSERT INTO `participate` VALUES (64, 31, 0, NULL);
INSERT INTO `participate` VALUES (64, 37, 0, NULL);
INSERT INTO `participate` VALUES (64, 40, 0, NULL);
INSERT INTO `participate` VALUES (65, 25, 0, NULL);
INSERT INTO `participate` VALUES (65, 28, 0, NULL);
INSERT INTO `participate` VALUES (65, 31, 0, NULL);
INSERT INTO `participate` VALUES (65, 34, 0, NULL);
INSERT INTO `participate` VALUES (65, 37, 0, NULL);
INSERT INTO `participate` VALUES (65, 40, 0, NULL);
INSERT INTO `participate` VALUES (65, 43, 0, NULL);
INSERT INTO `participate` VALUES (66, 11, 0, NULL);
INSERT INTO `participate` VALUES (66, 14, 0, NULL);
INSERT INTO `participate` VALUES (66, 17, 0, NULL);
INSERT INTO `participate` VALUES (66, 20, 0, NULL);
INSERT INTO `participate` VALUES (66, 23, 0, NULL);
INSERT INTO `participate` VALUES (67, 14, 0, NULL);
INSERT INTO `participate` VALUES (67, 17, 0, NULL);
INSERT INTO `participate` VALUES (67, 23, 0, NULL);
INSERT INTO `participate` VALUES (68, 11, 0, NULL);
INSERT INTO `participate` VALUES (68, 14, 0, NULL);
INSERT INTO `participate` VALUES (68, 17, 0, NULL);
INSERT INTO `participate` VALUES (68, 20, 0, NULL);
INSERT INTO `participate` VALUES (68, 23, 0, NULL);
INSERT INTO `participate` VALUES (69, 11, 0, NULL);
INSERT INTO `participate` VALUES (69, 20, 0, NULL);
INSERT INTO `participate` VALUES (70, 11, 0, NULL);
INSERT INTO `participate` VALUES (70, 14, 0, NULL);
INSERT INTO `participate` VALUES (70, 17, 0, NULL);
INSERT INTO `participate` VALUES (70, 20, 0, NULL);
INSERT INTO `participate` VALUES (70, 23, 0, NULL);
INSERT INTO `participate` VALUES (71, 11, 0, NULL);
INSERT INTO `participate` VALUES (71, 14, 0, NULL);
INSERT INTO `participate` VALUES (71, 17, 0, NULL);
INSERT INTO `participate` VALUES (71, 20, 0, NULL);
INSERT INTO `participate` VALUES (71, 23, 0, NULL);
INSERT INTO `participate` VALUES (72, 26, 0, NULL);
INSERT INTO `participate` VALUES (72, 29, 0, NULL);
INSERT INTO `participate` VALUES (72, 32, 0, NULL);
INSERT INTO `participate` VALUES (72, 35, 0, NULL);
INSERT INTO `participate` VALUES (72, 41, 0, NULL);
INSERT INTO `participate` VALUES (72, 44, 0, NULL);
INSERT INTO `participate` VALUES (73, 26, 0, NULL);
INSERT INTO `participate` VALUES (73, 29, 0, NULL);
INSERT INTO `participate` VALUES (73, 32, 0, NULL);
INSERT INTO `participate` VALUES (73, 35, 0, NULL);
INSERT INTO `participate` VALUES (73, 38, 0, NULL);
INSERT INTO `participate` VALUES (73, 41, 0, NULL);
INSERT INTO `participate` VALUES (73, 44, 0, NULL);
INSERT INTO `participate` VALUES (74, 26, 0, NULL);
INSERT INTO `participate` VALUES (74, 35, 0, NULL);
INSERT INTO `participate` VALUES (74, 38, 0, NULL);
INSERT INTO `participate` VALUES (74, 44, 0, NULL);
INSERT INTO `participate` VALUES (75, 29, 0, NULL);
INSERT INTO `participate` VALUES (75, 32, 0, NULL);
INSERT INTO `participate` VALUES (75, 38, 0, NULL);
INSERT INTO `participate` VALUES (75, 41, 0, NULL);
INSERT INTO `participate` VALUES (75, 44, 0, NULL);
INSERT INTO `participate` VALUES (76, 26, 0, NULL);
INSERT INTO `participate` VALUES (76, 29, 0, NULL);
INSERT INTO `participate` VALUES (76, 32, 0, NULL);
INSERT INTO `participate` VALUES (76, 35, 0, NULL);
INSERT INTO `participate` VALUES (76, 38, 0, NULL);
INSERT INTO `participate` VALUES (76, 41, 0, NULL);
INSERT INTO `participate` VALUES (76, 44, 0, NULL);
INSERT INTO `participate` VALUES (77, 26, 0, NULL);
INSERT INTO `participate` VALUES (77, 29, 0, NULL);
INSERT INTO `participate` VALUES (77, 32, 0, NULL);
INSERT INTO `participate` VALUES (77, 35, 0, NULL);
INSERT INTO `participate` VALUES (77, 38, 0, NULL);
INSERT INTO `participate` VALUES (77, 41, 0, NULL);
INSERT INTO `participate` VALUES (78, 15, 0, NULL);
INSERT INTO `participate` VALUES (78, 21, 0, NULL);
INSERT INTO `participate` VALUES (78, 24, 0, NULL);
INSERT INTO `participate` VALUES (79, 12, 0, NULL);
INSERT INTO `participate` VALUES (79, 15, 0, NULL);
INSERT INTO `participate` VALUES (79, 18, 0, NULL);
INSERT INTO `participate` VALUES (79, 21, 0, NULL);
INSERT INTO `participate` VALUES (80, 12, 0, NULL);
INSERT INTO `participate` VALUES (80, 15, 0, NULL);
INSERT INTO `participate` VALUES (80, 18, 0, NULL);
INSERT INTO `participate` VALUES (80, 21, 0, NULL);
INSERT INTO `participate` VALUES (80, 24, 0, NULL);
INSERT INTO `participate` VALUES (81, 12, 0, NULL);
INSERT INTO `participate` VALUES (81, 15, 0, NULL);
INSERT INTO `participate` VALUES (81, 18, 0, NULL);
INSERT INTO `participate` VALUES (81, 24, 0, NULL);
INSERT INTO `participate` VALUES (82, 12, 0, NULL);
INSERT INTO `participate` VALUES (82, 18, 0, NULL);
INSERT INTO `participate` VALUES (82, 21, 0, NULL);
INSERT INTO `participate` VALUES (82, 24, 0, NULL);
INSERT INTO `participate` VALUES (83, 12, 0, NULL);
INSERT INTO `participate` VALUES (83, 15, 0, NULL);
INSERT INTO `participate` VALUES (83, 18, 0, NULL);
INSERT INTO `participate` VALUES (83, 21, 0, NULL);
INSERT INTO `participate` VALUES (83, 24, 0, NULL);
INSERT INTO `participate` VALUES (84, 27, 0, NULL);
INSERT INTO `participate` VALUES (84, 30, 0, NULL);
INSERT INTO `participate` VALUES (84, 36, 0, NULL);
INSERT INTO `participate` VALUES (84, 42, 0, NULL);
INSERT INTO `participate` VALUES (84, 45, 0, NULL);
INSERT INTO `participate` VALUES (85, 27, 0, NULL);
INSERT INTO `participate` VALUES (85, 30, 0, NULL);
INSERT INTO `participate` VALUES (85, 33, 0, NULL);
INSERT INTO `participate` VALUES (85, 36, 0, NULL);
INSERT INTO `participate` VALUES (85, 39, 0, NULL);
INSERT INTO `participate` VALUES (85, 42, 0, NULL);
INSERT INTO `participate` VALUES (86, 27, 0, NULL);
INSERT INTO `participate` VALUES (86, 30, 0, NULL);
INSERT INTO `participate` VALUES (86, 33, 0, NULL);
INSERT INTO `participate` VALUES (86, 39, 0, NULL);
INSERT INTO `participate` VALUES (86, 42, 0, NULL);
INSERT INTO `participate` VALUES (86, 45, 0, NULL);
INSERT INTO `participate` VALUES (87, 30, 0, NULL);
INSERT INTO `participate` VALUES (87, 33, 0, NULL);
INSERT INTO `participate` VALUES (87, 36, 0, NULL);
INSERT INTO `participate` VALUES (87, 39, 0, NULL);
INSERT INTO `participate` VALUES (87, 45, 0, NULL);
INSERT INTO `participate` VALUES (88, 27, 0, NULL);
INSERT INTO `participate` VALUES (88, 33, 0, NULL);
INSERT INTO `participate` VALUES (88, 36, 0, NULL);
INSERT INTO `participate` VALUES (88, 39, 0, NULL);
INSERT INTO `participate` VALUES (88, 42, 0, NULL);
INSERT INTO `participate` VALUES (88, 45, 0, NULL);
INSERT INTO `participate` VALUES (89, 27, 0, NULL);
INSERT INTO `participate` VALUES (89, 30, 0, NULL);
INSERT INTO `participate` VALUES (89, 33, 0, NULL);
INSERT INTO `participate` VALUES (89, 36, 0, NULL);
INSERT INTO `participate` VALUES (89, 39, 0, NULL);
INSERT INTO `participate` VALUES (89, 42, 0, NULL);
INSERT INTO `participate` VALUES (89, 45, 0, NULL);
INSERT INTO `participate` VALUES (90, 10, 1, 9.67);
INSERT INTO `participate` VALUES (90, 13, 0, NULL);
INSERT INTO `participate` VALUES (90, 19, 0, NULL);
INSERT INTO `participate` VALUES (90, 22, 0, NULL);
INSERT INTO `participate` VALUES (91, 10, 6, 9.59);
INSERT INTO `participate` VALUES (91, 13, 0, NULL);
INSERT INTO `participate` VALUES (91, 16, 0, NULL);
INSERT INTO `participate` VALUES (91, 19, 0, NULL);
INSERT INTO `participate` VALUES (91, 22, 0, NULL);
INSERT INTO `participate` VALUES (92, 16, 0, NULL);
INSERT INTO `participate` VALUES (92, 19, 0, NULL);
INSERT INTO `participate` VALUES (93, 10, 4, 9.60);
INSERT INTO `participate` VALUES (93, 13, 0, NULL);
INSERT INTO `participate` VALUES (93, 16, 0, NULL);
INSERT INTO `participate` VALUES (93, 22, 0, NULL);
INSERT INTO `participate` VALUES (94, 10, 2, 9.76);
INSERT INTO `participate` VALUES (94, 13, 0, NULL);
INSERT INTO `participate` VALUES (94, 16, 0, NULL);
INSERT INTO `participate` VALUES (94, 19, 0, NULL);
INSERT INTO `participate` VALUES (94, 22, 0, NULL);
INSERT INTO `participate` VALUES (95, 10, 5, 9.73);
INSERT INTO `participate` VALUES (95, 13, 0, NULL);
INSERT INTO `participate` VALUES (95, 16, 0, NULL);
INSERT INTO `participate` VALUES (95, 19, 0, NULL);
INSERT INTO `participate` VALUES (95, 22, 0, NULL);
INSERT INTO `participate` VALUES (96, 25, 0, NULL);
INSERT INTO `participate` VALUES (96, 28, 0, NULL);
INSERT INTO `participate` VALUES (96, 31, 0, NULL);
INSERT INTO `participate` VALUES (96, 34, 0, NULL);
INSERT INTO `participate` VALUES (96, 37, 0, NULL);
INSERT INTO `participate` VALUES (96, 40, 0, NULL);
INSERT INTO `participate` VALUES (96, 43, 0, NULL);
INSERT INTO `participate` VALUES (97, 28, 0, NULL);
INSERT INTO `participate` VALUES (97, 31, 0, NULL);
INSERT INTO `participate` VALUES (97, 34, 0, NULL);
INSERT INTO `participate` VALUES (97, 37, 0, NULL);
INSERT INTO `participate` VALUES (97, 40, 0, NULL);
INSERT INTO `participate` VALUES (97, 43, 0, NULL);
INSERT INTO `participate` VALUES (98, 25, 0, NULL);
INSERT INTO `participate` VALUES (98, 28, 0, NULL);
INSERT INTO `participate` VALUES (98, 31, 0, NULL);
INSERT INTO `participate` VALUES (98, 34, 0, NULL);
INSERT INTO `participate` VALUES (98, 37, 0, NULL);
INSERT INTO `participate` VALUES (98, 40, 0, NULL);
INSERT INTO `participate` VALUES (98, 43, 0, NULL);
INSERT INTO `participate` VALUES (99, 25, 0, NULL);
INSERT INTO `participate` VALUES (99, 31, 0, NULL);
INSERT INTO `participate` VALUES (99, 37, 0, NULL);
INSERT INTO `participate` VALUES (99, 43, 0, NULL);
INSERT INTO `participate` VALUES (100, 25, 0, NULL);
INSERT INTO `participate` VALUES (100, 28, 0, NULL);
INSERT INTO `participate` VALUES (100, 34, 0, NULL);
INSERT INTO `participate` VALUES (100, 40, 0, NULL);
INSERT INTO `participate` VALUES (101, 25, 0, NULL);
INSERT INTO `participate` VALUES (101, 28, 0, NULL);
INSERT INTO `participate` VALUES (101, 31, 0, NULL);
INSERT INTO `participate` VALUES (101, 34, 0, NULL);
INSERT INTO `participate` VALUES (101, 37, 0, NULL);
INSERT INTO `participate` VALUES (101, 40, 0, NULL);
INSERT INTO `participate` VALUES (101, 43, 0, NULL);
INSERT INTO `participate` VALUES (102, 11, 0, NULL);
INSERT INTO `participate` VALUES (102, 14, 0, NULL);
INSERT INTO `participate` VALUES (102, 17, 0, NULL);
INSERT INTO `participate` VALUES (102, 20, 0, NULL);
INSERT INTO `participate` VALUES (103, 14, 0, NULL);
INSERT INTO `participate` VALUES (103, 20, 0, NULL);
INSERT INTO `participate` VALUES (103, 23, 0, NULL);
INSERT INTO `participate` VALUES (104, 11, 0, NULL);
INSERT INTO `participate` VALUES (104, 14, 0, NULL);
INSERT INTO `participate` VALUES (104, 17, 0, NULL);
INSERT INTO `participate` VALUES (104, 20, 0, NULL);
INSERT INTO `participate` VALUES (104, 23, 0, NULL);
INSERT INTO `participate` VALUES (105, 11, 0, NULL);
INSERT INTO `participate` VALUES (105, 17, 0, NULL);
INSERT INTO `participate` VALUES (105, 20, 0, NULL);
INSERT INTO `participate` VALUES (105, 23, 0, NULL);
INSERT INTO `participate` VALUES (106, 11, 0, NULL);
INSERT INTO `participate` VALUES (106, 14, 0, NULL);
INSERT INTO `participate` VALUES (106, 17, 0, NULL);
INSERT INTO `participate` VALUES (106, 23, 0, NULL);
INSERT INTO `participate` VALUES (107, 11, 0, NULL);
INSERT INTO `participate` VALUES (107, 14, 0, NULL);
INSERT INTO `participate` VALUES (107, 17, 0, NULL);
INSERT INTO `participate` VALUES (107, 20, 0, NULL);
INSERT INTO `participate` VALUES (107, 23, 0, NULL);
INSERT INTO `participate` VALUES (108, 26, 0, NULL);
INSERT INTO `participate` VALUES (108, 29, 0, NULL);
INSERT INTO `participate` VALUES (108, 32, 0, NULL);
INSERT INTO `participate` VALUES (108, 35, 0, NULL);
INSERT INTO `participate` VALUES (108, 38, 0, NULL);
INSERT INTO `participate` VALUES (108, 41, 0, NULL);
INSERT INTO `participate` VALUES (108, 44, 0, NULL);
INSERT INTO `participate` VALUES (109, 26, 0, NULL);
INSERT INTO `participate` VALUES (109, 29, 0, NULL);
INSERT INTO `participate` VALUES (109, 32, 0, NULL);
INSERT INTO `participate` VALUES (109, 35, 0, NULL);
INSERT INTO `participate` VALUES (109, 38, 0, NULL);
INSERT INTO `participate` VALUES (109, 44, 0, NULL);
INSERT INTO `participate` VALUES (110, 26, 0, NULL);
INSERT INTO `participate` VALUES (110, 29, 0, NULL);
INSERT INTO `participate` VALUES (110, 38, 0, NULL);
INSERT INTO `participate` VALUES (110, 41, 0, NULL);
INSERT INTO `participate` VALUES (110, 44, 0, NULL);
INSERT INTO `participate` VALUES (111, 26, 0, NULL);
INSERT INTO `participate` VALUES (111, 32, 0, NULL);
INSERT INTO `participate` VALUES (111, 35, 0, NULL);
INSERT INTO `participate` VALUES (111, 38, 0, NULL);
INSERT INTO `participate` VALUES (111, 41, 0, NULL);
INSERT INTO `participate` VALUES (112, 29, 0, NULL);
INSERT INTO `participate` VALUES (112, 32, 0, NULL);
INSERT INTO `participate` VALUES (112, 35, 0, NULL);
INSERT INTO `participate` VALUES (112, 41, 0, NULL);
INSERT INTO `participate` VALUES (112, 44, 0, NULL);
INSERT INTO `participate` VALUES (113, 26, 0, NULL);
INSERT INTO `participate` VALUES (113, 29, 0, NULL);
INSERT INTO `participate` VALUES (113, 32, 0, NULL);
INSERT INTO `participate` VALUES (113, 35, 0, NULL);
INSERT INTO `participate` VALUES (113, 38, 0, NULL);
INSERT INTO `participate` VALUES (113, 41, 0, NULL);
INSERT INTO `participate` VALUES (113, 44, 0, NULL);
INSERT INTO `participate` VALUES (114, 15, 0, NULL);
INSERT INTO `participate` VALUES (114, 18, 0, NULL);
INSERT INTO `participate` VALUES (114, 21, 0, NULL);
INSERT INTO `participate` VALUES (114, 24, 0, NULL);
INSERT INTO `participate` VALUES (115, 12, 0, NULL);
INSERT INTO `participate` VALUES (115, 15, 0, NULL);
INSERT INTO `participate` VALUES (115, 18, 0, NULL);
INSERT INTO `participate` VALUES (115, 21, 0, NULL);
INSERT INTO `participate` VALUES (115, 24, 0, NULL);
INSERT INTO `participate` VALUES (116, 12, 0, NULL);
INSERT INTO `participate` VALUES (116, 15, 0, NULL);
INSERT INTO `participate` VALUES (116, 18, 0, NULL);
INSERT INTO `participate` VALUES (116, 24, 0, NULL);
INSERT INTO `participate` VALUES (117, 12, 0, NULL);
INSERT INTO `participate` VALUES (117, 15, 0, NULL);
INSERT INTO `participate` VALUES (117, 18, 0, NULL);
INSERT INTO `participate` VALUES (117, 21, 0, NULL);
INSERT INTO `participate` VALUES (117, 24, 0, NULL);
INSERT INTO `participate` VALUES (118, 12, 0, NULL);
INSERT INTO `participate` VALUES (118, 18, 0, NULL);
INSERT INTO `participate` VALUES (118, 21, 0, NULL);
INSERT INTO `participate` VALUES (119, 12, 0, NULL);
INSERT INTO `participate` VALUES (119, 15, 0, NULL);
INSERT INTO `participate` VALUES (119, 21, 0, NULL);
INSERT INTO `participate` VALUES (119, 24, 0, NULL);
INSERT INTO `participate` VALUES (120, 27, 0, NULL);
INSERT INTO `participate` VALUES (120, 30, 0, NULL);
INSERT INTO `participate` VALUES (120, 33, 0, NULL);
INSERT INTO `participate` VALUES (120, 36, 0, NULL);
INSERT INTO `participate` VALUES (120, 39, 0, NULL);
INSERT INTO `participate` VALUES (120, 42, 0, NULL);
INSERT INTO `participate` VALUES (120, 45, 0, NULL);
INSERT INTO `participate` VALUES (121, 27, 0, NULL);
INSERT INTO `participate` VALUES (121, 30, 0, NULL);
INSERT INTO `participate` VALUES (121, 33, 0, NULL);
INSERT INTO `participate` VALUES (121, 36, 0, NULL);
INSERT INTO `participate` VALUES (121, 39, 0, NULL);
INSERT INTO `participate` VALUES (121, 42, 0, NULL);
INSERT INTO `participate` VALUES (122, 30, 0, NULL);
INSERT INTO `participate` VALUES (122, 33, 0, NULL);
INSERT INTO `participate` VALUES (122, 42, 0, NULL);
INSERT INTO `participate` VALUES (122, 45, 0, NULL);
INSERT INTO `participate` VALUES (123, 27, 0, NULL);
INSERT INTO `participate` VALUES (123, 30, 0, NULL);
INSERT INTO `participate` VALUES (123, 33, 0, NULL);
INSERT INTO `participate` VALUES (123, 36, 0, NULL);
INSERT INTO `participate` VALUES (123, 39, 0, NULL);
INSERT INTO `participate` VALUES (123, 42, 0, NULL);
INSERT INTO `participate` VALUES (123, 45, 0, NULL);
INSERT INTO `participate` VALUES (124, 27, 0, NULL);
INSERT INTO `participate` VALUES (124, 30, 0, NULL);
INSERT INTO `participate` VALUES (124, 36, 0, NULL);
INSERT INTO `participate` VALUES (124, 39, 0, NULL);
INSERT INTO `participate` VALUES (124, 42, 0, NULL);
INSERT INTO `participate` VALUES (124, 45, 0, NULL);
INSERT INTO `participate` VALUES (125, 27, 0, NULL);
INSERT INTO `participate` VALUES (125, 33, 0, NULL);
INSERT INTO `participate` VALUES (125, 36, 0, NULL);
INSERT INTO `participate` VALUES (125, 39, 0, NULL);
INSERT INTO `participate` VALUES (125, 45, 0, NULL);
INSERT INTO `participate` VALUES (126, 10, 6, 9.70);
INSERT INTO `participate` VALUES (126, 13, 0, NULL);
INSERT INTO `participate` VALUES (126, 16, 0, NULL);
INSERT INTO `participate` VALUES (126, 19, 0, NULL);
INSERT INTO `participate` VALUES (126, 22, 0, NULL);
INSERT INTO `participate` VALUES (127, 10, 2, 9.67);
INSERT INTO `participate` VALUES (127, 13, 0, NULL);
INSERT INTO `participate` VALUES (127, 16, 0, NULL);
INSERT INTO `participate` VALUES (127, 19, 0, NULL);
INSERT INTO `participate` VALUES (127, 22, 0, NULL);
INSERT INTO `participate` VALUES (128, 10, 3, 9.74);
INSERT INTO `participate` VALUES (128, 16, 0, NULL);
INSERT INTO `participate` VALUES (128, 22, 0, NULL);
INSERT INTO `participate` VALUES (129, 10, 5, 9.57);
INSERT INTO `participate` VALUES (129, 13, 0, NULL);
INSERT INTO `participate` VALUES (129, 16, 0, NULL);
INSERT INTO `participate` VALUES (129, 19, 0, NULL);
INSERT INTO `participate` VALUES (129, 22, 0, NULL);
INSERT INTO `participate` VALUES (130, 10, 1, 9.40);
INSERT INTO `participate` VALUES (130, 13, 0, NULL);
INSERT INTO `participate` VALUES (130, 16, 0, NULL);
INSERT INTO `participate` VALUES (130, 19, 0, NULL);
INSERT INTO `participate` VALUES (130, 22, 0, NULL);
INSERT INTO `participate` VALUES (131, 13, 0, NULL);
INSERT INTO `participate` VALUES (131, 19, 0, NULL);
INSERT INTO `participate` VALUES (132, 25, 0, NULL);
INSERT INTO `participate` VALUES (132, 28, 0, NULL);
INSERT INTO `participate` VALUES (132, 31, 0, NULL);
INSERT INTO `participate` VALUES (132, 34, 0, NULL);
INSERT INTO `participate` VALUES (132, 37, 0, NULL);
INSERT INTO `participate` VALUES (132, 40, 0, NULL);
INSERT INTO `participate` VALUES (132, 43, 0, NULL);
INSERT INTO `participate` VALUES (133, 25, 0, NULL);
INSERT INTO `participate` VALUES (133, 31, 0, NULL);
INSERT INTO `participate` VALUES (133, 37, 0, NULL);
INSERT INTO `participate` VALUES (133, 40, 0, NULL);
INSERT INTO `participate` VALUES (133, 43, 0, NULL);
INSERT INTO `participate` VALUES (134, 28, 0, NULL);
INSERT INTO `participate` VALUES (134, 31, 0, NULL);
INSERT INTO `participate` VALUES (134, 34, 0, NULL);
INSERT INTO `participate` VALUES (134, 37, 0, NULL);
INSERT INTO `participate` VALUES (134, 43, 0, NULL);
INSERT INTO `participate` VALUES (135, 25, 0, NULL);
INSERT INTO `participate` VALUES (135, 28, 0, NULL);
INSERT INTO `participate` VALUES (135, 31, 0, NULL);
INSERT INTO `participate` VALUES (135, 34, 0, NULL);
INSERT INTO `participate` VALUES (135, 40, 0, NULL);
INSERT INTO `participate` VALUES (135, 43, 0, NULL);
INSERT INTO `participate` VALUES (136, 25, 0, NULL);
INSERT INTO `participate` VALUES (136, 28, 0, NULL);
INSERT INTO `participate` VALUES (136, 34, 0, NULL);
INSERT INTO `participate` VALUES (136, 37, 0, NULL);
INSERT INTO `participate` VALUES (136, 40, 0, NULL);
INSERT INTO `participate` VALUES (137, 25, 0, NULL);
INSERT INTO `participate` VALUES (137, 28, 0, NULL);
INSERT INTO `participate` VALUES (137, 31, 0, NULL);
INSERT INTO `participate` VALUES (137, 34, 0, NULL);
INSERT INTO `participate` VALUES (137, 37, 0, NULL);
INSERT INTO `participate` VALUES (137, 40, 0, NULL);
INSERT INTO `participate` VALUES (137, 43, 0, NULL);
INSERT INTO `participate` VALUES (138, 11, 0, NULL);
INSERT INTO `participate` VALUES (138, 14, 0, NULL);
INSERT INTO `participate` VALUES (138, 17, 0, NULL);
INSERT INTO `participate` VALUES (138, 20, 0, NULL);
INSERT INTO `participate` VALUES (138, 23, 0, NULL);
INSERT INTO `participate` VALUES (139, 11, 0, NULL);
INSERT INTO `participate` VALUES (139, 17, 0, NULL);
INSERT INTO `participate` VALUES (139, 23, 0, NULL);
INSERT INTO `participate` VALUES (140, 11, 0, NULL);
INSERT INTO `participate` VALUES (140, 14, 0, NULL);
INSERT INTO `participate` VALUES (140, 17, 0, NULL);
INSERT INTO `participate` VALUES (140, 20, 0, NULL);
INSERT INTO `participate` VALUES (140, 23, 0, NULL);
INSERT INTO `participate` VALUES (141, 11, 0, NULL);
INSERT INTO `participate` VALUES (141, 14, 0, NULL);
INSERT INTO `participate` VALUES (141, 17, 0, NULL);
INSERT INTO `participate` VALUES (141, 20, 0, NULL);
INSERT INTO `participate` VALUES (141, 23, 0, NULL);
INSERT INTO `participate` VALUES (142, 14, 0, NULL);
INSERT INTO `participate` VALUES (142, 20, 0, NULL);
INSERT INTO `participate` VALUES (143, 11, 0, NULL);
INSERT INTO `participate` VALUES (143, 14, 0, NULL);
INSERT INTO `participate` VALUES (143, 17, 0, NULL);
INSERT INTO `participate` VALUES (143, 20, 0, NULL);
INSERT INTO `participate` VALUES (143, 23, 0, NULL);
INSERT INTO `participate` VALUES (144, 26, 0, NULL);
INSERT INTO `participate` VALUES (144, 29, 0, NULL);
INSERT INTO `participate` VALUES (144, 32, 0, NULL);
INSERT INTO `participate` VALUES (144, 35, 0, NULL);
INSERT INTO `participate` VALUES (144, 38, 0, NULL);
INSERT INTO `participate` VALUES (144, 41, 0, NULL);
INSERT INTO `participate` VALUES (144, 44, 0, NULL);
INSERT INTO `participate` VALUES (145, 29, 0, NULL);
INSERT INTO `participate` VALUES (145, 32, 0, NULL);
INSERT INTO `participate` VALUES (145, 38, 0, NULL);
INSERT INTO `participate` VALUES (145, 41, 0, NULL);
INSERT INTO `participate` VALUES (146, 26, 0, NULL);
INSERT INTO `participate` VALUES (146, 32, 0, NULL);
INSERT INTO `participate` VALUES (146, 35, 0, NULL);
INSERT INTO `participate` VALUES (146, 38, 0, NULL);
INSERT INTO `participate` VALUES (146, 44, 0, NULL);
INSERT INTO `participate` VALUES (147, 26, 0, NULL);
INSERT INTO `participate` VALUES (147, 29, 0, NULL);
INSERT INTO `participate` VALUES (147, 32, 0, NULL);
INSERT INTO `participate` VALUES (147, 35, 0, NULL);
INSERT INTO `participate` VALUES (147, 38, 0, NULL);
INSERT INTO `participate` VALUES (147, 41, 0, NULL);
INSERT INTO `participate` VALUES (147, 44, 0, NULL);
INSERT INTO `participate` VALUES (148, 26, 0, NULL);
INSERT INTO `participate` VALUES (148, 29, 0, NULL);
INSERT INTO `participate` VALUES (148, 32, 0, NULL);
INSERT INTO `participate` VALUES (148, 35, 0, NULL);
INSERT INTO `participate` VALUES (148, 41, 0, NULL);
INSERT INTO `participate` VALUES (148, 44, 0, NULL);
INSERT INTO `participate` VALUES (149, 26, 0, NULL);
INSERT INTO `participate` VALUES (149, 29, 0, NULL);
INSERT INTO `participate` VALUES (149, 35, 0, NULL);
INSERT INTO `participate` VALUES (149, 38, 0, NULL);
INSERT INTO `participate` VALUES (149, 41, 0, NULL);
INSERT INTO `participate` VALUES (149, 44, 0, NULL);
INSERT INTO `participate` VALUES (150, 12, 0, NULL);
INSERT INTO `participate` VALUES (150, 18, 0, NULL);
INSERT INTO `participate` VALUES (150, 24, 0, NULL);
INSERT INTO `participate` VALUES (151, 12, 0, NULL);
INSERT INTO `participate` VALUES (151, 15, 0, NULL);
INSERT INTO `participate` VALUES (151, 18, 0, NULL);
INSERT INTO `participate` VALUES (151, 21, 0, NULL);
INSERT INTO `participate` VALUES (151, 24, 0, NULL);
INSERT INTO `participate` VALUES (152, 12, 0, NULL);
INSERT INTO `participate` VALUES (152, 15, 0, NULL);
INSERT INTO `participate` VALUES (152, 18, 0, NULL);
INSERT INTO `participate` VALUES (152, 21, 0, NULL);
INSERT INTO `participate` VALUES (152, 24, 0, NULL);
INSERT INTO `participate` VALUES (153, 15, 0, NULL);
INSERT INTO `participate` VALUES (153, 21, 0, NULL);
INSERT INTO `participate` VALUES (154, 12, 0, NULL);
INSERT INTO `participate` VALUES (154, 15, 0, NULL);
INSERT INTO `participate` VALUES (154, 18, 0, NULL);
INSERT INTO `participate` VALUES (154, 21, 0, NULL);
INSERT INTO `participate` VALUES (154, 24, 0, NULL);
INSERT INTO `participate` VALUES (155, 12, 0, NULL);
INSERT INTO `participate` VALUES (155, 15, 0, NULL);
INSERT INTO `participate` VALUES (155, 18, 0, NULL);
INSERT INTO `participate` VALUES (155, 21, 0, NULL);
INSERT INTO `participate` VALUES (155, 24, 0, NULL);
INSERT INTO `participate` VALUES (156, 30, 0, NULL);
INSERT INTO `participate` VALUES (156, 36, 0, NULL);
INSERT INTO `participate` VALUES (156, 39, 0, NULL);
INSERT INTO `participate` VALUES (156, 45, 0, NULL);
INSERT INTO `participate` VALUES (157, 27, 0, NULL);
INSERT INTO `participate` VALUES (157, 30, 0, NULL);
INSERT INTO `participate` VALUES (157, 33, 0, NULL);
INSERT INTO `participate` VALUES (157, 36, 0, NULL);
INSERT INTO `participate` VALUES (157, 39, 0, NULL);
INSERT INTO `participate` VALUES (157, 42, 0, NULL);
INSERT INTO `participate` VALUES (157, 45, 0, NULL);
INSERT INTO `participate` VALUES (158, 27, 0, NULL);
INSERT INTO `participate` VALUES (158, 30, 0, NULL);
INSERT INTO `participate` VALUES (158, 33, 0, NULL);
INSERT INTO `participate` VALUES (158, 39, 0, NULL);
INSERT INTO `participate` VALUES (158, 42, 0, NULL);
INSERT INTO `participate` VALUES (158, 45, 0, NULL);
INSERT INTO `participate` VALUES (159, 27, 0, NULL);
INSERT INTO `participate` VALUES (159, 33, 0, NULL);
INSERT INTO `participate` VALUES (159, 36, 0, NULL);
INSERT INTO `participate` VALUES (159, 39, 0, NULL);
INSERT INTO `participate` VALUES (159, 42, 0, NULL);
INSERT INTO `participate` VALUES (160, 27, 0, NULL);
INSERT INTO `participate` VALUES (160, 30, 0, NULL);
INSERT INTO `participate` VALUES (160, 33, 0, NULL);
INSERT INTO `participate` VALUES (160, 36, 0, NULL);
INSERT INTO `participate` VALUES (160, 39, 0, NULL);
INSERT INTO `participate` VALUES (160, 42, 0, NULL);
INSERT INTO `participate` VALUES (160, 45, 0, NULL);
INSERT INTO `participate` VALUES (161, 27, 0, NULL);
INSERT INTO `participate` VALUES (161, 30, 0, NULL);
INSERT INTO `participate` VALUES (161, 33, 0, NULL);
INSERT INTO `participate` VALUES (161, 36, 0, NULL);
INSERT INTO `participate` VALUES (161, 42, 0, NULL);
INSERT INTO `participate` VALUES (161, 45, 0, NULL);
INSERT INTO `participate` VALUES (162, 10, 6, 9.63);
INSERT INTO `participate` VALUES (162, 13, 0, NULL);
INSERT INTO `participate` VALUES (162, 19, 0, NULL);
INSERT INTO `participate` VALUES (162, 22, 0, NULL);
INSERT INTO `participate` VALUES (163, 10, 3, 9.80);
INSERT INTO `participate` VALUES (163, 13, 0, NULL);
INSERT INTO `participate` VALUES (163, 16, 0, NULL);
INSERT INTO `participate` VALUES (163, 19, 0, NULL);
INSERT INTO `participate` VALUES (163, 22, 0, NULL);
INSERT INTO `participate` VALUES (164, 10, 1, 9.61);
INSERT INTO `participate` VALUES (164, 16, 0, NULL);
INSERT INTO `participate` VALUES (164, 19, 0, NULL);
INSERT INTO `participate` VALUES (164, 22, 0, NULL);
INSERT INTO `participate` VALUES (165, 10, 4, 9.77);
INSERT INTO `participate` VALUES (165, 13, 0, NULL);
INSERT INTO `participate` VALUES (165, 16, 0, NULL);
INSERT INTO `participate` VALUES (165, 19, 0, NULL);
INSERT INTO `participate` VALUES (165, 22, 0, NULL);
INSERT INTO `participate` VALUES (166, 10, 2, 9.73);
INSERT INTO `participate` VALUES (166, 13, 0, NULL);
INSERT INTO `participate` VALUES (166, 16, 0, NULL);
INSERT INTO `participate` VALUES (167, 13, 0, NULL);
INSERT INTO `participate` VALUES (167, 16, 0, NULL);
INSERT INTO `participate` VALUES (167, 19, 0, NULL);
INSERT INTO `participate` VALUES (167, 22, 0, NULL);
INSERT INTO `participate` VALUES (168, 25, 0, NULL);
INSERT INTO `participate` VALUES (168, 28, 0, NULL);
INSERT INTO `participate` VALUES (168, 31, 0, NULL);
INSERT INTO `participate` VALUES (168, 37, 0, NULL);
INSERT INTO `participate` VALUES (169, 28, 0, NULL);
INSERT INTO `participate` VALUES (169, 34, 0, NULL);
INSERT INTO `participate` VALUES (169, 37, 0, NULL);
INSERT INTO `participate` VALUES (169, 40, 0, NULL);
INSERT INTO `participate` VALUES (169, 43, 0, NULL);
INSERT INTO `participate` VALUES (170, 25, 0, NULL);
INSERT INTO `participate` VALUES (170, 28, 0, NULL);
INSERT INTO `participate` VALUES (170, 31, 0, NULL);
INSERT INTO `participate` VALUES (170, 34, 0, NULL);
INSERT INTO `participate` VALUES (170, 37, 0, NULL);
INSERT INTO `participate` VALUES (170, 40, 0, NULL);
INSERT INTO `participate` VALUES (170, 43, 0, NULL);
INSERT INTO `participate` VALUES (171, 25, 0, NULL);
INSERT INTO `participate` VALUES (171, 28, 0, NULL);
INSERT INTO `participate` VALUES (171, 31, 0, NULL);
INSERT INTO `participate` VALUES (171, 34, 0, NULL);
INSERT INTO `participate` VALUES (171, 40, 0, NULL);
INSERT INTO `participate` VALUES (171, 43, 0, NULL);
INSERT INTO `participate` VALUES (172, 25, 0, NULL);
INSERT INTO `participate` VALUES (172, 31, 0, NULL);
INSERT INTO `participate` VALUES (172, 34, 0, NULL);
INSERT INTO `participate` VALUES (172, 37, 0, NULL);
INSERT INTO `participate` VALUES (172, 40, 0, NULL);
INSERT INTO `participate` VALUES (172, 43, 0, NULL);
INSERT INTO `participate` VALUES (173, 25, 0, NULL);
INSERT INTO `participate` VALUES (173, 28, 0, NULL);
INSERT INTO `participate` VALUES (173, 31, 0, NULL);
INSERT INTO `participate` VALUES (173, 34, 0, NULL);
INSERT INTO `participate` VALUES (173, 37, 0, NULL);
INSERT INTO `participate` VALUES (173, 40, 0, NULL);
INSERT INTO `participate` VALUES (173, 43, 0, NULL);
INSERT INTO `participate` VALUES (174, 11, 0, NULL);
INSERT INTO `participate` VALUES (174, 14, 0, NULL);
INSERT INTO `participate` VALUES (174, 17, 0, NULL);
INSERT INTO `participate` VALUES (174, 20, 0, NULL);
INSERT INTO `participate` VALUES (174, 23, 0, NULL);
INSERT INTO `participate` VALUES (175, 11, 0, NULL);
INSERT INTO `participate` VALUES (175, 20, 0, NULL);
INSERT INTO `participate` VALUES (175, 23, 0, NULL);
INSERT INTO `participate` VALUES (176, 11, 0, NULL);
INSERT INTO `participate` VALUES (176, 14, 0, NULL);
INSERT INTO `participate` VALUES (176, 17, 0, NULL);
INSERT INTO `participate` VALUES (176, 20, 0, NULL);
INSERT INTO `participate` VALUES (176, 23, 0, NULL);
INSERT INTO `participate` VALUES (177, 11, 0, NULL);
INSERT INTO `participate` VALUES (177, 14, 0, NULL);
INSERT INTO `participate` VALUES (177, 17, 0, NULL);
INSERT INTO `participate` VALUES (177, 20, 0, NULL);
INSERT INTO `participate` VALUES (178, 14, 0, NULL);
INSERT INTO `participate` VALUES (178, 17, 0, NULL);
INSERT INTO `participate` VALUES (178, 20, 0, NULL);
INSERT INTO `participate` VALUES (178, 23, 0, NULL);
INSERT INTO `participate` VALUES (179, 11, 0, NULL);
INSERT INTO `participate` VALUES (179, 14, 0, NULL);
INSERT INTO `participate` VALUES (179, 17, 0, NULL);
INSERT INTO `participate` VALUES (179, 23, 0, NULL);
INSERT INTO `participate` VALUES (180, 29, 0, NULL);
INSERT INTO `participate` VALUES (180, 35, 0, NULL);
INSERT INTO `participate` VALUES (180, 38, 0, NULL);
INSERT INTO `participate` VALUES (180, 41, 0, NULL);
INSERT INTO `participate` VALUES (180, 44, 0, NULL);
INSERT INTO `participate` VALUES (181, 26, 0, NULL);
INSERT INTO `participate` VALUES (181, 29, 0, NULL);
INSERT INTO `participate` VALUES (181, 38, 0, NULL);
INSERT INTO `participate` VALUES (182, 26, 0, NULL);
INSERT INTO `participate` VALUES (182, 29, 0, NULL);
INSERT INTO `participate` VALUES (182, 35, 0, NULL);
INSERT INTO `participate` VALUES (182, 38, 0, NULL);
INSERT INTO `participate` VALUES (182, 41, 0, NULL);
INSERT INTO `participate` VALUES (182, 44, 0, NULL);
INSERT INTO `participate` VALUES (183, 26, 0, NULL);
INSERT INTO `participate` VALUES (183, 35, 0, NULL);
INSERT INTO `participate` VALUES (183, 38, 0, NULL);
INSERT INTO `participate` VALUES (183, 41, 0, NULL);
INSERT INTO `participate` VALUES (183, 44, 0, NULL);
INSERT INTO `participate` VALUES (184, 26, 0, NULL);
INSERT INTO `participate` VALUES (184, 29, 0, NULL);
INSERT INTO `participate` VALUES (184, 35, 0, NULL);
INSERT INTO `participate` VALUES (184, 41, 0, NULL);
INSERT INTO `participate` VALUES (184, 44, 0, NULL);
INSERT INTO `participate` VALUES (185, 26, 0, NULL);
INSERT INTO `participate` VALUES (185, 29, 0, NULL);
INSERT INTO `participate` VALUES (185, 35, 0, NULL);
INSERT INTO `participate` VALUES (185, 38, 0, NULL);
INSERT INTO `participate` VALUES (185, 41, 0, NULL);
INSERT INTO `participate` VALUES (185, 44, 0, NULL);
INSERT INTO `participate` VALUES (186, 12, 0, NULL);
INSERT INTO `participate` VALUES (186, 18, 0, NULL);
INSERT INTO `participate` VALUES (186, 21, 0, NULL);
INSERT INTO `participate` VALUES (186, 24, 0, NULL);
INSERT INTO `participate` VALUES (187, 12, 0, NULL);
INSERT INTO `participate` VALUES (187, 15, 0, NULL);
INSERT INTO `participate` VALUES (187, 18, 0, NULL);
INSERT INTO `participate` VALUES (187, 21, 0, NULL);
INSERT INTO `participate` VALUES (187, 24, 0, NULL);
INSERT INTO `participate` VALUES (188, 12, 0, NULL);
INSERT INTO `participate` VALUES (188, 15, 0, NULL);
INSERT INTO `participate` VALUES (188, 21, 0, NULL);
INSERT INTO `participate` VALUES (189, 15, 0, NULL);
INSERT INTO `participate` VALUES (189, 18, 0, NULL);
INSERT INTO `participate` VALUES (189, 21, 0, NULL);
INSERT INTO `participate` VALUES (189, 24, 0, NULL);
INSERT INTO `participate` VALUES (190, 12, 0, NULL);
INSERT INTO `participate` VALUES (190, 15, 0, NULL);
INSERT INTO `participate` VALUES (190, 18, 0, NULL);
INSERT INTO `participate` VALUES (190, 21, 0, NULL);
INSERT INTO `participate` VALUES (190, 24, 0, NULL);
INSERT INTO `participate` VALUES (191, 12, 0, NULL);
INSERT INTO `participate` VALUES (191, 15, 0, NULL);
INSERT INTO `participate` VALUES (191, 18, 0, NULL);
INSERT INTO `participate` VALUES (191, 24, 0, NULL);
INSERT INTO `participate` VALUES (192, 27, 0, NULL);
INSERT INTO `participate` VALUES (192, 30, 0, NULL);
INSERT INTO `participate` VALUES (192, 36, 0, NULL);
INSERT INTO `participate` VALUES (192, 39, 0, NULL);
INSERT INTO `participate` VALUES (192, 42, 0, NULL);
INSERT INTO `participate` VALUES (192, 45, 0, NULL);
INSERT INTO `participate` VALUES (193, 27, 0, NULL);
INSERT INTO `participate` VALUES (193, 30, 0, NULL);
INSERT INTO `participate` VALUES (193, 33, 0, NULL);
INSERT INTO `participate` VALUES (193, 36, 0, NULL);
INSERT INTO `participate` VALUES (193, 39, 0, NULL);
INSERT INTO `participate` VALUES (193, 42, 0, NULL);
INSERT INTO `participate` VALUES (193, 45, 0, NULL);
INSERT INTO `participate` VALUES (194, 27, 0, NULL);
INSERT INTO `participate` VALUES (194, 33, 0, NULL);
INSERT INTO `participate` VALUES (194, 39, 0, NULL);
INSERT INTO `participate` VALUES (194, 42, 0, NULL);
INSERT INTO `participate` VALUES (195, 27, 0, NULL);
INSERT INTO `participate` VALUES (195, 30, 0, NULL);
INSERT INTO `participate` VALUES (195, 33, 0, NULL);
INSERT INTO `participate` VALUES (195, 36, 0, NULL);
INSERT INTO `participate` VALUES (195, 39, 0, NULL);
INSERT INTO `participate` VALUES (195, 42, 0, NULL);
INSERT INTO `participate` VALUES (195, 45, 0, NULL);
INSERT INTO `participate` VALUES (196, 27, 0, NULL);
INSERT INTO `participate` VALUES (196, 30, 0, NULL);
INSERT INTO `participate` VALUES (196, 33, 0, NULL);
INSERT INTO `participate` VALUES (196, 36, 0, NULL);
INSERT INTO `participate` VALUES (196, 39, 0, NULL);
INSERT INTO `participate` VALUES (196, 42, 0, NULL);
INSERT INTO `participate` VALUES (196, 45, 0, NULL);
INSERT INTO `participate` VALUES (197, 30, 0, NULL);
INSERT INTO `participate` VALUES (197, 33, 0, NULL);
INSERT INTO `participate` VALUES (197, 36, 0, NULL);
INSERT INTO `participate` VALUES (197, 45, 0, NULL);
INSERT INTO `participate` VALUES (198, 10, 5, 9.72);
INSERT INTO `participate` VALUES (198, 13, 0, NULL);
INSERT INTO `participate` VALUES (198, 19, 0, NULL);
INSERT INTO `participate` VALUES (198, 22, 0, NULL);
INSERT INTO `participate` VALUES (199, 10, 4, 9.79);
INSERT INTO `participate` VALUES (199, 13, 0, NULL);
INSERT INTO `participate` VALUES (199, 16, 0, NULL);
INSERT INTO `participate` VALUES (199, 19, 0, NULL);
INSERT INTO `participate` VALUES (199, 22, 0, NULL);
INSERT INTO `participate` VALUES (200, 10, 1, 9.70);
INSERT INTO `participate` VALUES (200, 16, 0, NULL);
INSERT INTO `participate` VALUES (200, 19, 0, NULL);
INSERT INTO `participate` VALUES (200, 22, 0, NULL);
INSERT INTO `participate` VALUES (201, 10, 2, 9.75);
INSERT INTO `participate` VALUES (201, 13, 0, NULL);
INSERT INTO `participate` VALUES (201, 16, 0, NULL);
INSERT INTO `participate` VALUES (201, 22, 0, NULL);
INSERT INTO `participate` VALUES (202, 10, 3, 9.68);
INSERT INTO `participate` VALUES (202, 13, 0, NULL);
INSERT INTO `participate` VALUES (202, 16, 0, NULL);
INSERT INTO `participate` VALUES (202, 19, 0, NULL);
INSERT INTO `participate` VALUES (202, 22, 0, NULL);
INSERT INTO `participate` VALUES (203, 13, 0, NULL);
INSERT INTO `participate` VALUES (203, 16, 0, NULL);
INSERT INTO `participate` VALUES (203, 19, 0, NULL);
INSERT INTO `participate` VALUES (204, 25, 0, NULL);
INSERT INTO `participate` VALUES (204, 28, 0, NULL);
INSERT INTO `participate` VALUES (204, 31, 0, NULL);
INSERT INTO `participate` VALUES (204, 34, 0, NULL);
INSERT INTO `participate` VALUES (204, 37, 0, NULL);
INSERT INTO `participate` VALUES (204, 40, 0, NULL);
INSERT INTO `participate` VALUES (204, 43, 0, NULL);
INSERT INTO `participate` VALUES (205, 28, 0, NULL);
INSERT INTO `participate` VALUES (205, 31, 0, NULL);
INSERT INTO `participate` VALUES (205, 37, 0, NULL);
INSERT INTO `participate` VALUES (205, 40, 0, NULL);
INSERT INTO `participate` VALUES (205, 43, 0, NULL);
INSERT INTO `participate` VALUES (206, 25, 0, NULL);
INSERT INTO `participate` VALUES (206, 28, 0, NULL);
INSERT INTO `participate` VALUES (206, 31, 0, NULL);
INSERT INTO `participate` VALUES (206, 34, 0, NULL);
INSERT INTO `participate` VALUES (206, 37, 0, NULL);
INSERT INTO `participate` VALUES (206, 40, 0, NULL);
INSERT INTO `participate` VALUES (207, 25, 0, NULL);
INSERT INTO `participate` VALUES (207, 28, 0, NULL);
INSERT INTO `participate` VALUES (207, 31, 0, NULL);
INSERT INTO `participate` VALUES (207, 34, 0, NULL);
INSERT INTO `participate` VALUES (207, 40, 0, NULL);
INSERT INTO `participate` VALUES (207, 43, 0, NULL);
INSERT INTO `participate` VALUES (208, 25, 0, NULL);
INSERT INTO `participate` VALUES (208, 34, 0, NULL);
INSERT INTO `participate` VALUES (208, 37, 0, NULL);
INSERT INTO `participate` VALUES (208, 40, 0, NULL);
INSERT INTO `participate` VALUES (208, 43, 0, NULL);
INSERT INTO `participate` VALUES (209, 25, 0, NULL);
INSERT INTO `participate` VALUES (209, 28, 0, NULL);
INSERT INTO `participate` VALUES (209, 31, 0, NULL);
INSERT INTO `participate` VALUES (209, 34, 0, NULL);
INSERT INTO `participate` VALUES (209, 37, 0, NULL);
INSERT INTO `participate` VALUES (209, 43, 0, NULL);
INSERT INTO `participate` VALUES (210, 11, 0, NULL);
INSERT INTO `participate` VALUES (210, 14, 0, NULL);
INSERT INTO `participate` VALUES (210, 17, 0, NULL);
INSERT INTO `participate` VALUES (210, 20, 0, NULL);
INSERT INTO `participate` VALUES (210, 23, 0, NULL);
INSERT INTO `participate` VALUES (211, 11, 0, NULL);
INSERT INTO `participate` VALUES (211, 20, 0, NULL);
INSERT INTO `participate` VALUES (211, 23, 0, NULL);
INSERT INTO `participate` VALUES (212, 11, 0, NULL);
INSERT INTO `participate` VALUES (212, 14, 0, NULL);
INSERT INTO `participate` VALUES (212, 17, 0, NULL);
INSERT INTO `participate` VALUES (212, 20, 0, NULL);
INSERT INTO `participate` VALUES (212, 23, 0, NULL);
INSERT INTO `participate` VALUES (213, 11, 0, NULL);
INSERT INTO `participate` VALUES (213, 14, 0, NULL);
INSERT INTO `participate` VALUES (213, 17, 0, NULL);
INSERT INTO `participate` VALUES (213, 20, 0, NULL);
INSERT INTO `participate` VALUES (213, 23, 0, NULL);
INSERT INTO `participate` VALUES (214, 14, 0, NULL);
INSERT INTO `participate` VALUES (214, 17, 0, NULL);
INSERT INTO `participate` VALUES (215, 11, 0, NULL);
INSERT INTO `participate` VALUES (215, 14, 0, NULL);
INSERT INTO `participate` VALUES (215, 17, 0, NULL);
INSERT INTO `participate` VALUES (215, 20, 0, NULL);
INSERT INTO `participate` VALUES (215, 23, 0, NULL);
INSERT INTO `participate` VALUES (216, 29, 0, NULL);
INSERT INTO `participate` VALUES (216, 32, 0, NULL);
INSERT INTO `participate` VALUES (216, 35, 0, NULL);
INSERT INTO `participate` VALUES (216, 38, 0, NULL);
INSERT INTO `participate` VALUES (216, 41, 0, NULL);
INSERT INTO `participate` VALUES (216, 44, 0, NULL);
INSERT INTO `participate` VALUES (217, 26, 0, NULL);
INSERT INTO `participate` VALUES (217, 29, 0, NULL);
INSERT INTO `participate` VALUES (217, 32, 0, NULL);
INSERT INTO `participate` VALUES (217, 38, 0, NULL);
INSERT INTO `participate` VALUES (217, 41, 0, NULL);
INSERT INTO `participate` VALUES (218, 26, 0, NULL);
INSERT INTO `participate` VALUES (218, 29, 0, NULL);
INSERT INTO `participate` VALUES (218, 32, 0, NULL);
INSERT INTO `participate` VALUES (218, 35, 0, NULL);
INSERT INTO `participate` VALUES (218, 38, 0, NULL);
INSERT INTO `participate` VALUES (218, 41, 0, NULL);
INSERT INTO `participate` VALUES (218, 44, 0, NULL);
INSERT INTO `participate` VALUES (219, 26, 0, NULL);
INSERT INTO `participate` VALUES (219, 32, 0, NULL);
INSERT INTO `participate` VALUES (219, 35, 0, NULL);
INSERT INTO `participate` VALUES (219, 38, 0, NULL);
INSERT INTO `participate` VALUES (219, 41, 0, NULL);
INSERT INTO `participate` VALUES (219, 44, 0, NULL);
INSERT INTO `participate` VALUES (220, 26, 0, NULL);
INSERT INTO `participate` VALUES (220, 29, 0, NULL);
INSERT INTO `participate` VALUES (220, 32, 0, NULL);
INSERT INTO `participate` VALUES (220, 35, 0, NULL);
INSERT INTO `participate` VALUES (220, 44, 0, NULL);
INSERT INTO `participate` VALUES (221, 26, 0, NULL);
INSERT INTO `participate` VALUES (221, 29, 0, NULL);
INSERT INTO `participate` VALUES (221, 35, 0, NULL);
INSERT INTO `participate` VALUES (221, 38, 0, NULL);
INSERT INTO `participate` VALUES (221, 41, 0, NULL);
INSERT INTO `participate` VALUES (221, 44, 0, NULL);
INSERT INTO `participate` VALUES (222, 12, 0, NULL);
INSERT INTO `participate` VALUES (222, 18, 0, NULL);
INSERT INTO `participate` VALUES (222, 21, 0, NULL);
INSERT INTO `participate` VALUES (222, 24, 0, NULL);
INSERT INTO `participate` VALUES (223, 12, 0, NULL);
INSERT INTO `participate` VALUES (223, 15, 0, NULL);
INSERT INTO `participate` VALUES (223, 18, 0, NULL);
INSERT INTO `participate` VALUES (223, 21, 0, NULL);
INSERT INTO `participate` VALUES (223, 24, 0, NULL);
INSERT INTO `participate` VALUES (224, 12, 0, NULL);
INSERT INTO `participate` VALUES (224, 15, 0, NULL);
INSERT INTO `participate` VALUES (224, 21, 0, NULL);
INSERT INTO `participate` VALUES (224, 24, 0, NULL);
INSERT INTO `participate` VALUES (225, 15, 0, NULL);
INSERT INTO `participate` VALUES (225, 18, 0, NULL);
INSERT INTO `participate` VALUES (225, 21, 0, NULL);
INSERT INTO `participate` VALUES (226, 12, 0, NULL);
INSERT INTO `participate` VALUES (226, 15, 0, NULL);
INSERT INTO `participate` VALUES (226, 18, 0, NULL);
INSERT INTO `participate` VALUES (226, 21, 0, NULL);
INSERT INTO `participate` VALUES (226, 24, 0, NULL);
INSERT INTO `participate` VALUES (227, 12, 0, NULL);
INSERT INTO `participate` VALUES (227, 15, 0, NULL);
INSERT INTO `participate` VALUES (227, 18, 0, NULL);
INSERT INTO `participate` VALUES (227, 24, 0, NULL);
INSERT INTO `participate` VALUES (228, 27, 0, NULL);
INSERT INTO `participate` VALUES (228, 30, 0, NULL);
INSERT INTO `participate` VALUES (228, 36, 0, NULL);
INSERT INTO `participate` VALUES (228, 39, 0, NULL);
INSERT INTO `participate` VALUES (228, 42, 0, NULL);
INSERT INTO `participate` VALUES (229, 27, 0, NULL);
INSERT INTO `participate` VALUES (229, 30, 0, NULL);
INSERT INTO `participate` VALUES (229, 33, 0, NULL);
INSERT INTO `participate` VALUES (229, 36, 0, NULL);
INSERT INTO `participate` VALUES (229, 39, 0, NULL);
INSERT INTO `participate` VALUES (229, 42, 0, NULL);
INSERT INTO `participate` VALUES (229, 45, 0, NULL);
INSERT INTO `participate` VALUES (230, 27, 0, NULL);
INSERT INTO `participate` VALUES (230, 33, 0, NULL);
INSERT INTO `participate` VALUES (230, 39, 0, NULL);
INSERT INTO `participate` VALUES (230, 42, 0, NULL);
INSERT INTO `participate` VALUES (230, 45, 0, NULL);
INSERT INTO `participate` VALUES (231, 27, 0, NULL);
INSERT INTO `participate` VALUES (231, 30, 0, NULL);
INSERT INTO `participate` VALUES (231, 33, 0, NULL);
INSERT INTO `participate` VALUES (231, 36, 0, NULL);
INSERT INTO `participate` VALUES (231, 39, 0, NULL);
INSERT INTO `participate` VALUES (231, 45, 0, NULL);
INSERT INTO `participate` VALUES (232, 27, 0, NULL);
INSERT INTO `participate` VALUES (232, 30, 0, NULL);
INSERT INTO `participate` VALUES (232, 33, 0, NULL);
INSERT INTO `participate` VALUES (232, 36, 0, NULL);
INSERT INTO `participate` VALUES (232, 39, 0, NULL);
INSERT INTO `participate` VALUES (232, 42, 0, NULL);
INSERT INTO `participate` VALUES (232, 45, 0, NULL);
INSERT INTO `participate` VALUES (233, 30, 0, NULL);
INSERT INTO `participate` VALUES (233, 33, 0, NULL);
INSERT INTO `participate` VALUES (233, 36, 0, NULL);
INSERT INTO `participate` VALUES (233, 42, 0, NULL);
INSERT INTO `participate` VALUES (233, 45, 0, NULL);

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
  UNIQUE INDEX `refID`(`refID`) USING BTREE,
  INDEX `teamid`(`teamid`) USING BTREE,
  CONSTRAINT `referee_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of referee
-- ----------------------------
INSERT INTO `referee` VALUES (1, '1ref1', '5168416', '164866418', '1ref1', 1);
INSERT INTO `referee` VALUES (2, '1ref2', '5644813', '156434831', '1ref2', 1);
INSERT INTO `referee` VALUES (3, '1ref3', '6548344', '186431546', '1ref3', 1);
INSERT INTO `referee` VALUES (4, '2ref1', '5153776', '164863718', '2ref1', 2);
INSERT INTO `referee` VALUES (5, '2ref2', '5642523', '156737831', '2ref2', 2);
INSERT INTO `referee` VALUES (6, '2ref3', '6537373', '186536836', '2ref3', 2);
INSERT INTO `referee` VALUES (7, '3ref1', '5611666', '164544618', '3ref1', 3);
INSERT INTO `referee` VALUES (8, '3ref2', '2351561', '157968411', '3ref2', 3);
INSERT INTO `referee` VALUES (9, '3ref3', '5641458', '108654156', '3ref3', 3);
INSERT INTO `referee` VALUES (10, '4ref1', '5848434', '151653153', '4ref1', 4);
INSERT INTO `referee` VALUES (11, '4ref2', '6613543', '151381361', '4ref2', 4);
INSERT INTO `referee` VALUES (12, '4ref3', '1584842', '164618812', '4ref3', 4);
INSERT INTO `referee` VALUES (13, '5ref1', '1255135', '156374936', '5ref1', 5);
INSERT INTO `referee` VALUES (14, '5ref2', '8914633', '194466483', '5ref2', 5);
INSERT INTO `referee` VALUES (15, '5ref3', '4843749', '153494348', '5ref3', 5);
INSERT INTO `referee` VALUES (16, '6ref1', '6461864', '164866418', '6ref1', 6);
INSERT INTO `referee` VALUES (17, '6ref2', '1556438', '156434831', '6ref2', 6);
INSERT INTO `referee` VALUES (18, '6ref3', '5556468', '186431546', '6ref3', 6);

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compid` int(5) NULL DEFAULT NULL,
  `teamid` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `compid`(`compid`) USING BTREE,
  INDEX `teamid`(`teamid`) USING BTREE,
  CONSTRAINT `sign_ibfk_1` FOREIGN KEY (`compid`) REFERENCES `competition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sign_ibfk_2` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES (2, 10, 1);
INSERT INTO `sign` VALUES (3, 11, 1);
INSERT INTO `sign` VALUES (4, 12, 1);
INSERT INTO `sign` VALUES (5, 13, 1);
INSERT INTO `sign` VALUES (6, 14, 1);
INSERT INTO `sign` VALUES (7, 15, 1);
INSERT INTO `sign` VALUES (8, 16, 1);
INSERT INTO `sign` VALUES (9, 17, 1);
INSERT INTO `sign` VALUES (10, 18, 1);
INSERT INTO `sign` VALUES (11, 19, 1);
INSERT INTO `sign` VALUES (12, 20, 1);
INSERT INTO `sign` VALUES (13, 21, 1);
INSERT INTO `sign` VALUES (14, 22, 1);
INSERT INTO `sign` VALUES (15, 23, 1);
INSERT INTO `sign` VALUES (16, 24, 1);
INSERT INTO `sign` VALUES (17, 25, 1);
INSERT INTO `sign` VALUES (18, 26, 1);
INSERT INTO `sign` VALUES (19, 27, 1);
INSERT INTO `sign` VALUES (20, 28, 1);
INSERT INTO `sign` VALUES (21, 29, 1);
INSERT INTO `sign` VALUES (22, 30, 1);
INSERT INTO `sign` VALUES (23, 31, 1);
INSERT INTO `sign` VALUES (24, 32, 1);
INSERT INTO `sign` VALUES (25, 33, 1);
INSERT INTO `sign` VALUES (26, 34, 1);
INSERT INTO `sign` VALUES (27, 36, 1);
INSERT INTO `sign` VALUES (28, 37, 1);
INSERT INTO `sign` VALUES (29, 38, 1);
INSERT INTO `sign` VALUES (30, 39, 1);
INSERT INTO `sign` VALUES (31, 40, 1);
INSERT INTO `sign` VALUES (32, 41, 1);
INSERT INTO `sign` VALUES (33, 42, 1);
INSERT INTO `sign` VALUES (34, 43, 1);
INSERT INTO `sign` VALUES (35, 44, 1);
INSERT INTO `sign` VALUES (36, 45, 1);
INSERT INTO `sign` VALUES (37, 35, 1);
INSERT INTO `sign` VALUES (38, 10, 2);
INSERT INTO `sign` VALUES (39, 11, 2);
INSERT INTO `sign` VALUES (40, 12, 2);
INSERT INTO `sign` VALUES (41, 13, 2);
INSERT INTO `sign` VALUES (42, 14, 2);
INSERT INTO `sign` VALUES (43, 15, 2);
INSERT INTO `sign` VALUES (44, 16, 2);
INSERT INTO `sign` VALUES (45, 17, 2);
INSERT INTO `sign` VALUES (46, 18, 2);
INSERT INTO `sign` VALUES (47, 19, 2);
INSERT INTO `sign` VALUES (48, 20, 2);
INSERT INTO `sign` VALUES (49, 21, 2);
INSERT INTO `sign` VALUES (50, 22, 2);
INSERT INTO `sign` VALUES (51, 23, 2);
INSERT INTO `sign` VALUES (52, 24, 2);
INSERT INTO `sign` VALUES (53, 25, 2);
INSERT INTO `sign` VALUES (54, 26, 2);
INSERT INTO `sign` VALUES (55, 27, 2);
INSERT INTO `sign` VALUES (56, 28, 2);
INSERT INTO `sign` VALUES (57, 29, 2);
INSERT INTO `sign` VALUES (58, 30, 2);
INSERT INTO `sign` VALUES (59, 31, 2);
INSERT INTO `sign` VALUES (60, 33, 2);
INSERT INTO `sign` VALUES (61, 32, 2);
INSERT INTO `sign` VALUES (62, 34, 2);
INSERT INTO `sign` VALUES (63, 35, 2);
INSERT INTO `sign` VALUES (64, 36, 2);
INSERT INTO `sign` VALUES (65, 37, 2);
INSERT INTO `sign` VALUES (66, 38, 2);
INSERT INTO `sign` VALUES (67, 39, 2);
INSERT INTO `sign` VALUES (68, 40, 2);
INSERT INTO `sign` VALUES (69, 41, 2);
INSERT INTO `sign` VALUES (70, 42, 2);
INSERT INTO `sign` VALUES (71, 43, 2);
INSERT INTO `sign` VALUES (72, 44, 2);
INSERT INTO `sign` VALUES (73, 45, 2);
INSERT INTO `sign` VALUES (74, 10, 3);
INSERT INTO `sign` VALUES (75, 13, 3);
INSERT INTO `sign` VALUES (76, 11, 3);
INSERT INTO `sign` VALUES (77, 12, 3);
INSERT INTO `sign` VALUES (78, 14, 3);
INSERT INTO `sign` VALUES (79, 15, 3);
INSERT INTO `sign` VALUES (80, 16, 3);
INSERT INTO `sign` VALUES (81, 17, 3);
INSERT INTO `sign` VALUES (82, 18, 3);
INSERT INTO `sign` VALUES (83, 21, 3);
INSERT INTO `sign` VALUES (84, 23, 3);
INSERT INTO `sign` VALUES (85, 22, 3);
INSERT INTO `sign` VALUES (86, 24, 3);
INSERT INTO `sign` VALUES (87, 19, 3);
INSERT INTO `sign` VALUES (88, 20, 3);
INSERT INTO `sign` VALUES (89, 25, 3);
INSERT INTO `sign` VALUES (90, 26, 3);
INSERT INTO `sign` VALUES (91, 27, 3);
INSERT INTO `sign` VALUES (92, 28, 3);
INSERT INTO `sign` VALUES (93, 29, 3);
INSERT INTO `sign` VALUES (94, 30, 3);
INSERT INTO `sign` VALUES (95, 31, 3);
INSERT INTO `sign` VALUES (96, 32, 3);
INSERT INTO `sign` VALUES (97, 34, 3);
INSERT INTO `sign` VALUES (98, 33, 3);
INSERT INTO `sign` VALUES (99, 35, 3);
INSERT INTO `sign` VALUES (100, 36, 3);
INSERT INTO `sign` VALUES (101, 37, 3);
INSERT INTO `sign` VALUES (102, 38, 3);
INSERT INTO `sign` VALUES (103, 39, 3);
INSERT INTO `sign` VALUES (104, 40, 3);
INSERT INTO `sign` VALUES (105, 41, 3);
INSERT INTO `sign` VALUES (106, 42, 3);
INSERT INTO `sign` VALUES (107, 43, 3);
INSERT INTO `sign` VALUES (108, 44, 3);
INSERT INTO `sign` VALUES (109, 45, 3);
INSERT INTO `sign` VALUES (110, 10, 4);
INSERT INTO `sign` VALUES (111, 11, 4);
INSERT INTO `sign` VALUES (112, 12, 4);
INSERT INTO `sign` VALUES (113, 13, 4);
INSERT INTO `sign` VALUES (114, 14, 4);
INSERT INTO `sign` VALUES (115, 15, 4);
INSERT INTO `sign` VALUES (116, 16, 4);
INSERT INTO `sign` VALUES (117, 17, 4);
INSERT INTO `sign` VALUES (118, 18, 4);
INSERT INTO `sign` VALUES (119, 19, 4);
INSERT INTO `sign` VALUES (120, 20, 4);
INSERT INTO `sign` VALUES (121, 21, 4);
INSERT INTO `sign` VALUES (122, 22, 4);
INSERT INTO `sign` VALUES (123, 23, 4);
INSERT INTO `sign` VALUES (124, 24, 4);
INSERT INTO `sign` VALUES (125, 25, 4);
INSERT INTO `sign` VALUES (126, 26, 4);
INSERT INTO `sign` VALUES (127, 27, 4);
INSERT INTO `sign` VALUES (128, 28, 4);
INSERT INTO `sign` VALUES (129, 29, 4);
INSERT INTO `sign` VALUES (130, 30, 4);
INSERT INTO `sign` VALUES (131, 31, 4);
INSERT INTO `sign` VALUES (132, 32, 4);
INSERT INTO `sign` VALUES (133, 33, 4);
INSERT INTO `sign` VALUES (134, 34, 4);
INSERT INTO `sign` VALUES (135, 35, 4);
INSERT INTO `sign` VALUES (136, 36, 4);
INSERT INTO `sign` VALUES (137, 37, 4);
INSERT INTO `sign` VALUES (138, 38, 4);
INSERT INTO `sign` VALUES (139, 39, 4);
INSERT INTO `sign` VALUES (140, 40, 4);
INSERT INTO `sign` VALUES (141, 41, 4);
INSERT INTO `sign` VALUES (142, 42, 4);
INSERT INTO `sign` VALUES (143, 43, 4);
INSERT INTO `sign` VALUES (144, 44, 4);
INSERT INTO `sign` VALUES (145, 45, 4);
INSERT INTO `sign` VALUES (146, 10, 5);
INSERT INTO `sign` VALUES (147, 11, 5);
INSERT INTO `sign` VALUES (148, 12, 5);
INSERT INTO `sign` VALUES (149, 13, 5);
INSERT INTO `sign` VALUES (150, 14, 5);
INSERT INTO `sign` VALUES (151, 15, 5);
INSERT INTO `sign` VALUES (152, 16, 5);
INSERT INTO `sign` VALUES (153, 17, 5);
INSERT INTO `sign` VALUES (154, 18, 5);
INSERT INTO `sign` VALUES (155, 19, 5);
INSERT INTO `sign` VALUES (156, 20, 5);
INSERT INTO `sign` VALUES (157, 21, 5);
INSERT INTO `sign` VALUES (158, 22, 5);
INSERT INTO `sign` VALUES (159, 23, 5);
INSERT INTO `sign` VALUES (160, 24, 5);
INSERT INTO `sign` VALUES (161, 25, 5);
INSERT INTO `sign` VALUES (162, 26, 5);
INSERT INTO `sign` VALUES (163, 27, 5);
INSERT INTO `sign` VALUES (164, 28, 5);
INSERT INTO `sign` VALUES (165, 29, 5);
INSERT INTO `sign` VALUES (166, 30, 5);
INSERT INTO `sign` VALUES (167, 31, 5);
INSERT INTO `sign` VALUES (168, 33, 5);
INSERT INTO `sign` VALUES (169, 34, 5);
INSERT INTO `sign` VALUES (170, 35, 5);
INSERT INTO `sign` VALUES (171, 36, 5);
INSERT INTO `sign` VALUES (172, 37, 5);
INSERT INTO `sign` VALUES (173, 38, 5);
INSERT INTO `sign` VALUES (174, 39, 5);
INSERT INTO `sign` VALUES (175, 40, 5);
INSERT INTO `sign` VALUES (176, 41, 5);
INSERT INTO `sign` VALUES (177, 42, 5);
INSERT INTO `sign` VALUES (178, 43, 5);
INSERT INTO `sign` VALUES (179, 44, 5);
INSERT INTO `sign` VALUES (180, 45, 5);
INSERT INTO `sign` VALUES (181, 10, 6);
INSERT INTO `sign` VALUES (182, 11, 6);
INSERT INTO `sign` VALUES (183, 12, 6);
INSERT INTO `sign` VALUES (184, 13, 6);
INSERT INTO `sign` VALUES (185, 14, 6);
INSERT INTO `sign` VALUES (186, 15, 6);
INSERT INTO `sign` VALUES (187, 16, 6);
INSERT INTO `sign` VALUES (188, 17, 6);
INSERT INTO `sign` VALUES (189, 18, 6);
INSERT INTO `sign` VALUES (190, 19, 6);
INSERT INTO `sign` VALUES (191, 20, 6);
INSERT INTO `sign` VALUES (192, 21, 6);
INSERT INTO `sign` VALUES (193, 22, 6);
INSERT INTO `sign` VALUES (194, 23, 6);
INSERT INTO `sign` VALUES (195, 24, 6);
INSERT INTO `sign` VALUES (196, 25, 6);
INSERT INTO `sign` VALUES (197, 26, 6);
INSERT INTO `sign` VALUES (198, 27, 6);
INSERT INTO `sign` VALUES (199, 28, 6);
INSERT INTO `sign` VALUES (200, 29, 6);
INSERT INTO `sign` VALUES (201, 30, 6);
INSERT INTO `sign` VALUES (202, 31, 6);
INSERT INTO `sign` VALUES (203, 32, 6);
INSERT INTO `sign` VALUES (204, 33, 6);
INSERT INTO `sign` VALUES (205, 34, 6);
INSERT INTO `sign` VALUES (206, 35, 6);
INSERT INTO `sign` VALUES (207, 36, 6);
INSERT INTO `sign` VALUES (208, 37, 6);
INSERT INTO `sign` VALUES (209, 38, 6);
INSERT INTO `sign` VALUES (210, 39, 6);
INSERT INTO `sign` VALUES (211, 40, 6);
INSERT INTO `sign` VALUES (212, 41, 6);
INSERT INTO `sign` VALUES (213, 42, 6);
INSERT INTO `sign` VALUES (214, 43, 6);
INSERT INTO `sign` VALUES (215, 44, 6);
INSERT INTO `sign` VALUES (216, 45, 6);

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
  `attachment` blob NULL COMMENT '附件',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, 'team1', 'one', 'one', 0, 1, NULL);
INSERT INTO `team` VALUES (2, 'team2', 'two', 'two', 0, 0, NULL);
INSERT INTO `team` VALUES (3, 'team3', 'three', 'three', 0, 0, NULL);
INSERT INTO `team` VALUES (4, 'team4', 'four', 'four', 0, 0, NULL);
INSERT INTO `team` VALUES (5, 'team5', 'five', 'five', 0, 0, NULL);
INSERT INTO `team` VALUES (6, 'team6', 'six', 'six', 0, 0, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tempscore
-- ----------------------------
INSERT INTO `tempscore` VALUES (17, 38, 55, 9.88, 1);
INSERT INTO `tempscore` VALUES (18, 38, 90, 9.70, 1);
INSERT INTO `tempscore` VALUES (19, 38, 130, 9.46, 1);
INSERT INTO `tempscore` VALUES (20, 38, 164, 9.66, 1);
INSERT INTO `tempscore` VALUES (21, 38, 200, 9.80, 1);
INSERT INTO `tempscore` VALUES (22, 39, 55, 9.77, 1);
INSERT INTO `tempscore` VALUES (23, 39, 90, 9.64, 1);
INSERT INTO `tempscore` VALUES (24, 39, 130, 9.34, 1);
INSERT INTO `tempscore` VALUES (25, 39, 164, 9.55, 1);
INSERT INTO `tempscore` VALUES (26, 39, 200, 9.60, 1);
INSERT INTO `tempscore` VALUES (27, 41, 22, 9.88, 0);
INSERT INTO `tempscore` VALUES (28, 41, 22, 9.80, 1);
INSERT INTO `tempscore` VALUES (29, 53, 18, 9.60, 1);
INSERT INTO `tempscore` VALUES (30, 53, 54, 9.70, 1);
INSERT INTO `tempscore` VALUES (31, 53, 91, 9.40, 1);
INSERT INTO `tempscore` VALUES (32, 53, 126, 9.80, 1);
INSERT INTO `tempscore` VALUES (33, 53, 162, 9.60, 1);
INSERT INTO `tempscore` VALUES (34, 50, 21, 9.64, 1);
INSERT INTO `tempscore` VALUES (35, 50, 56, 9.77, 1);
INSERT INTO `tempscore` VALUES (36, 50, 95, 9.66, 1);
INSERT INTO `tempscore` VALUES (37, 50, 129, 9.44, 1);
INSERT INTO `tempscore` VALUES (38, 50, 198, 9.70, 1);
INSERT INTO `tempscore` VALUES (39, 54, 18, 9.82, 1);
INSERT INTO `tempscore` VALUES (40, 54, 54, 9.56, 1);
INSERT INTO `tempscore` VALUES (41, 54, 91, 9.77, 1);
INSERT INTO `tempscore` VALUES (42, 54, 126, 9.60, 1);
INSERT INTO `tempscore` VALUES (43, 54, 162, 9.67, 0);
INSERT INTO `tempscore` VALUES (44, 41, 94, 9.77, 1);
INSERT INTO `tempscore` VALUES (45, 41, 127, 9.66, 1);
INSERT INTO `tempscore` VALUES (46, 41, 166, 9.68, 1);
INSERT INTO `tempscore` VALUES (47, 41, 201, 9.70, 1);
INSERT INTO `tempscore` VALUES (48, 44, 19, 9.65, 1);
INSERT INTO `tempscore` VALUES (49, 44, 58, 9.86, 1);
INSERT INTO `tempscore` VALUES (50, 44, 128, 9.73, 1);
INSERT INTO `tempscore` VALUES (51, 44, 163, 9.77, 1);
INSERT INTO `tempscore` VALUES (52, 44, 202, 9.67, 1);
INSERT INTO `tempscore` VALUES (53, 42, 22, 9.66, 1);
INSERT INTO `tempscore` VALUES (54, 42, 94, 9.75, 1);
INSERT INTO `tempscore` VALUES (55, 42, 127, 9.68, 1);
INSERT INTO `tempscore` VALUES (56, 42, 166, 9.78, 1);
INSERT INTO `tempscore` VALUES (57, 42, 201, 9.80, 1);
INSERT INTO `tempscore` VALUES (58, 47, 20, 9.66, 1);
INSERT INTO `tempscore` VALUES (59, 47, 57, 9.88, 1);
INSERT INTO `tempscore` VALUES (60, 47, 93, 9.55, 1);
INSERT INTO `tempscore` VALUES (61, 47, 165, 9.76, 1);
INSERT INTO `tempscore` VALUES (62, 47, 199, 9.70, 1);
INSERT INTO `tempscore` VALUES (63, 45, 19, 9.67, 1);
INSERT INTO `tempscore` VALUES (64, 45, 58, 9.88, 1);
INSERT INTO `tempscore` VALUES (65, 45, 128, 9.75, 1);
INSERT INTO `tempscore` VALUES (66, 45, 163, 9.84, 1);
INSERT INTO `tempscore` VALUES (67, 45, 202, 9.70, 1);
INSERT INTO `tempscore` VALUES (68, 51, 21, 9.68, 1);
INSERT INTO `tempscore` VALUES (69, 51, 95, 9.80, 1);
INSERT INTO `tempscore` VALUES (70, 51, 56, 9.67, 1);
INSERT INTO `tempscore` VALUES (71, 51, 129, 9.70, 1);
INSERT INTO `tempscore` VALUES (72, 51, 198, 9.75, 1);
INSERT INTO `tempscore` VALUES (73, 48, 20, 9.67, 1);
INSERT INTO `tempscore` VALUES (74, 48, 57, 9.99, 1);
INSERT INTO `tempscore` VALUES (75, 48, 93, 9.65, 1);
INSERT INTO `tempscore` VALUES (76, 48, 165, 9.77, 1);
INSERT INTO `tempscore` VALUES (77, 48, 199, 9.88, 1);
INSERT INTO `tempscore` VALUES (78, 54, 162, 9.67, 1);

SET FOREIGN_KEY_CHECKS = 1;
