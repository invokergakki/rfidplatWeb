/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : localhost:3306
 Source Schema         : iotplat

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : 65001

 Date: 13/03/2020 17:01:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assets_info
-- ----------------------------
DROP TABLE IF EXISTS `assets_info`;
CREATE TABLE `assets_info`  (
  `assets_id` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `assets_name` varchar(192) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assets_type` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assets_use` varchar(192) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field1` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field2` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field3` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field4` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field5` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`assets_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of assets_info
-- ----------------------------
INSERT INTO `assets_info` VALUES ('1700000020BE6F4', 'Cam2K', 'Camera', 'work', '二部', 'css', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('1700000020BE6F8', 'PC2010', 'PC', 'work', '一部', 'sdd', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSF2540D2B9', 'Q', 'Q', 'work', '一部', 'CJ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSF8FC920F2', 'Q', 'Q', 'work', '一部', 'CC', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSF8FC92337', 'Q', 'Q', 'work', '一部', 'AS', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSF8FC924B7', 'Q', 'Q', 'work', '一部', 'cc', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSF8FC924CB', 'Q', 'Q', 'work', '一部', 'CC', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSF8FC92504', 'C', 'Z', 'work', '二部', 'vv', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSF8FC92517', 'F', 'F', 'work', '二部', 'xx', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSF8FC92558', 'vv', 'vv', 'work', '二部', 'ccc', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSF8FC925A4', 'XX', 'SS', 'work', '二部', 'VV', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSF8FC92754', 'XZ', 'WD', 'work', '二部', 'VF', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFMB20190714	PC2019	PC	work	一部	zjz					\r\nBOCSFMD20190711	PC2019	PC	work	二部	zjztoo					\r\nBOCSF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFMB20190714', 'PC2019', 'PC', 'work', '一部', 'zjz', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFMD20190711', 'PC2019', 'PC', 'work', '二部', 'zjztoo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFMD20190712', 'PC2018', 'PC', 'work', '一部', 'tkk', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFMD20190714', 'Moniter', 'Mon', 'work', '二部', 'xjj', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFOT20190711', 'Cam7200', 'Camera', 'work', '二部', 'okk', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFOT20190712', 'Kinston16G', 'USBDrive', 'work', '二部', 'cii', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFOT20190713', 'MacBook', 'PC', 'work', '一部', 'vxs', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFOT20190714', 'Mac', 'PC', 'work', '一部', 'cjj', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFOT20190726', 'TBD', 'TBD', 'TBA', '仓库', 'TBA', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFOT20190727', 'TBD', 'TBD', 'TBA', '仓库', 'TBA', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFOT20190728', 'TBD', 'TBD', 'TBA', '仓库', 'TBA', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_info` VALUES ('BOCSFOT20190729', 'TBD', 'TBD', 'TBA', '仓库', 'TBA', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for assets_tag_info
-- ----------------------------
DROP TABLE IF EXISTS `assets_tag_info`;
CREATE TABLE `assets_tag_info`  (
  `assets_id` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `epc_id` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assets_number` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scan_date` datetime(0) NULL DEFAULT NULL,
  `scan_place` varchar(384) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dev_name` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opreate` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field3` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field4` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field5` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`assets_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for assets_tags_info
-- ----------------------------
DROP TABLE IF EXISTS `assets_tags_info`;
CREATE TABLE `assets_tags_info`  (
  `assets_id` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `epc_id` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assets_number` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scan_date` datetime(0) NULL DEFAULT NULL,
  `scan_place` varchar(384) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dev_name` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opreate` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field3` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field4` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `field5` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`assets_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of assets_tags_info
-- ----------------------------
INSERT INTO `assets_tags_info` VALUES ('', '00000000A88268A1E6F4FCA9', '7', '2019-07-10 10:37:13', '测试', '扫', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('0000000020BE6DF', '000000000000020BE6DF9D84', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('000A88268A1E6F4', '00000000A88268A1E6F4FCA9', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('000A88360A60A0A', '00000000A88360A60A0AD350', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('1700000020BE6F4', '00000000A88268A1E6F4FCA9', '7', '2019-07-10 10:37:13', '测试', '扫', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('1700000020BE6F8', 'E28011700000020BE6EEC177', '7', '2019-07-10 10:37:13', '测试', '扫', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFMB20190714', 'E28011700000020BE6F84A9D', '7', '2019-07-10 10:37:13', '测试', '扫', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFMD20190711', '00000000A88360A60A0AD350', '4', '2019-07-10 10:37:13', '测试', '扫', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFMD20190712', 'E28011700000020BE6DEC26B', '4', '2019-07-10 10:37:13', '测试', '扫', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFMD20190714', 'E28011700000020BE6F4D1F6', '4', '2019-07-10 10:37:13', '测试', '扫', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190711', '4F5400000000000020190711', '8', '2019-08-06 09:40:45', '一期1F138', '扫码枪C72', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190712', '4F5400000000000020190712', '8', '2019-08-06 09:40:45', '一期1F138', '扫码枪C72', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190713', '4F5400000000000020190713', '8', '2019-08-06 09:40:45', '一期1F138', '扫码枪C72', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190714', '4F5400000000000020190714', '8', '2019-08-06 09:40:45', '一期1F138', '扫码枪C72', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190716', '000000000000020BE6DF9D84', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190721', '000000000000020BE6DF9D84', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190722', '000000000000020BE6DF9D84', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190723', '000000000000020BE6DF9D84', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190724', '000000000000020BE6DF9D84', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190725', '000000000000020BE6DF9D84', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190726', '000000000000020BE6DF9D84', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190727', '000000000000020BE6DF9D84', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190728', '000000000000020BE6DF9D84', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `assets_tags_info` VALUES ('BOCSFOT20190729', '000000000000020BE6DF9D84', '7', '2019-07-10 10:37:13', '测试', '扫码枪', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for opreate_record
-- ----------------------------
DROP TABLE IF EXISTS `opreate_record`;
CREATE TABLE `opreate_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_number` int(11) NOT NULL,
  `updated_number` int(11) NOT NULL,
  `is_queried` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of opreate_record
-- ----------------------------
INSERT INTO `opreate_record` VALUES (73, 4, 0, 'Y');
INSERT INTO `opreate_record` VALUES (74, 0, 4, 'Y');
INSERT INTO `opreate_record` VALUES (75, 4, 0, 'Y');
INSERT INTO `opreate_record` VALUES (76, 4, 0, 'Y');
INSERT INTO `opreate_record` VALUES (77, 3, 4, 'Y');
INSERT INTO `opreate_record` VALUES (78, 3, 4, 'Y');
INSERT INTO `opreate_record` VALUES (79, 7, 0, 'Y');
INSERT INTO `opreate_record` VALUES (80, 0, 7, 'Y');
INSERT INTO `opreate_record` VALUES (81, 0, 0, 'Y');
INSERT INTO `opreate_record` VALUES (82, 8, 0, 'Y');
INSERT INTO `opreate_record` VALUES (83, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (84, 0, 0, 'Y');
INSERT INTO `opreate_record` VALUES (85, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (86, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (87, 8, 0, 'Y');
INSERT INTO `opreate_record` VALUES (88, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (89, 0, 6, 'Y');
INSERT INTO `opreate_record` VALUES (90, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (91, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (92, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (93, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (94, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (95, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (96, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (97, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (98, 0, 8, 'Y');
INSERT INTO `opreate_record` VALUES (99, 0, 5, 'Y');
INSERT INTO `opreate_record` VALUES (100, 8, 0, 'Y');
INSERT INTO `opreate_record` VALUES (101, 0, 4, 'Y');
INSERT INTO `opreate_record` VALUES (102, 2, 1, 'Y');
INSERT INTO `opreate_record` VALUES (103, 3, 0, 'Y');
INSERT INTO `opreate_record` VALUES (104, 0, 0, 'Y');
INSERT INTO `opreate_record` VALUES (105, 0, 0, 'Y');
INSERT INTO `opreate_record` VALUES (106, 3, 0, 'Y');
INSERT INTO `opreate_record` VALUES (107, 18, 0, 'Y');
INSERT INTO `opreate_record` VALUES (108, 8, 12, 'Y');
INSERT INTO `opreate_record` VALUES (109, 3, 17, 'Y');
INSERT INTO `opreate_record` VALUES (110, 0, 2, 'Y');
INSERT INTO `opreate_record` VALUES (111, 0, 5, 'Y');
INSERT INTO `opreate_record` VALUES (112, 2, 18, 'Y');
INSERT INTO `opreate_record` VALUES (113, 0, 20, 'Y');
INSERT INTO `opreate_record` VALUES (114, 16, 0, 'Y');
INSERT INTO `opreate_record` VALUES (115, 15, 0, 'Y');
INSERT INTO `opreate_record` VALUES (116, 1, 2, 'Y');
INSERT INTO `opreate_record` VALUES (117, 0, 2, 'Y');
INSERT INTO `opreate_record` VALUES (118, 0, 2, 'Y');
INSERT INTO `opreate_record` VALUES (119, 0, 3, 'Y');

SET FOREIGN_KEY_CHECKS = 1;
