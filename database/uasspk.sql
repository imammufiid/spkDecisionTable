/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100408
 Source Host           : localhost:3306
 Source Schema         : uas_spk

 Target Server Type    : MySQL
 Target Server Version : 100408
 File Encoding         : 65001

 Date: 28/01/2020 20:20:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for _sys_group
-- ----------------------------
DROP TABLE IF EXISTS `_sys_group`;
CREATE TABLE `_sys_group`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_group
-- ----------------------------
INSERT INTO `_sys_group` VALUES (1, 'Administrator');
INSERT INTO `_sys_group` VALUES (2, 'HRD');
INSERT INTO `_sys_group` VALUES (3, 'user');

-- ----------------------------
-- Table structure for _sys_setting
-- ----------------------------
DROP TABLE IF EXISTS `_sys_setting`;
CREATE TABLE `_sys_setting`  (
  `setting_web_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `setting_web_credit` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `setting_web_credit_href` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `setting_web_logo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `setting_web_icon` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_setting
-- ----------------------------
INSERT INTO `_sys_setting` VALUES ('SPK Decision Table', 'Sistem Pendukung Keputusan', '#asdas', 'assets/media/logos/logos.png', 'assets/media/logos/logos.png');

-- ----------------------------
-- Table structure for _sys_sidebar
-- ----------------------------
DROP TABLE IF EXISTS `_sys_sidebar`;
CREATE TABLE `_sys_sidebar`  (
  `sidebar_id` int(11) NOT NULL AUTO_INCREMENT,
  `sidebar_parent` int(11) NULL DEFAULT 0,
  `sidebar_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sidebar_href` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sidebar_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'fa fa-angle-right',
  `sidebar_index` int(5) NULL DEFAULT NULL,
  `sidebar_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`sidebar_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_sidebar
-- ----------------------------
INSERT INTO `_sys_sidebar` VALUES (2, 0, 'System', '#', ' flaticon2-gear', 99, '1');
INSERT INTO `_sys_sidebar` VALUES (15, 2, 'Sidebars', 'core/sidebars', 'flaticon2-files-and-folders', 3, '1');
INSERT INTO `_sys_sidebar` VALUES (16, 2, 'Navbars', 'core/navbars', 'flaticon2-ui', 4, '0');
INSERT INTO `_sys_sidebar` VALUES (17, 2, 'Users', 'core/users', 'flaticon2-user-1', 1, '1');
INSERT INTO `_sys_sidebar` VALUES (18, 2, 'Groups', 'core/groups', ' flaticon2-group', 2, '1');
INSERT INTO `_sys_sidebar` VALUES (19, 2, 'Settings', 'core/settings', ' flaticon2-console', 5, '1');
INSERT INTO `_sys_sidebar` VALUES (24, 0, 'Dashboard', 'dashboard', ' flaticon-pie-chart-1', 1, '1');
INSERT INTO `_sys_sidebar` VALUES (25, 0, 'Entry', '#', 'fa fa-file-import', 3, '1');
INSERT INTO `_sys_sidebar` VALUES (30, 0, 'Data Master', '#', ' flaticon2-delivery-package', 2, '1');
INSERT INTO `_sys_sidebar` VALUES (31, 30, 'Condition Stub', 'condition', ' flaticon2-list-1', 2, '1');
INSERT INTO `_sys_sidebar` VALUES (37, 30, 'Devisi', 'devisi', 'fa fa-user-friends', 1, '1');
INSERT INTO `_sys_sidebar` VALUES (38, 30, 'Action Stub', 'action', 'fa fa-running', 3, '1');
INSERT INTO `_sys_sidebar` VALUES (41, 25, 'WD Entry', 'entry?id=1&devisi=Web Developer', 'fa fa-pager', 1, '1');
INSERT INTO `_sys_sidebar` VALUES (44, 0, 'SPK', '#', 'fa fa-user-check', 4, '1');
INSERT INTO `_sys_sidebar` VALUES (45, 44, 'Web Developer', 'spk?id=1&devisi=Web Developer', 'fa fa-pager', 1, '1');
INSERT INTO `_sys_sidebar` VALUES (47, 44, 'Mobile Developer', 'spk?id=2&devisi=Mobile Developer', 'fa fa-mobile-alt', 2, '1');
INSERT INTO `_sys_sidebar` VALUES (48, 44, 'Game Developer', 'spk?id=3&devisi=Game Developer', 'fa fa-gamepad', 3, '1');
INSERT INTO `_sys_sidebar` VALUES (49, 44, 'Multimedia', 'spk?id=4&devisi=Multimedia', 'fa fa-camera-retro', 4, '1');
INSERT INTO `_sys_sidebar` VALUES (50, 25, 'MD Entry', 'entry?id=2&devisi=Mobile Developer', 'fa fa-mobile-alt', 2, '1');
INSERT INTO `_sys_sidebar` VALUES (51, 25, 'GD Entry', 'entry?id=3&devisi=Game Developer', 'fa fa-gamepad', 3, '1');
INSERT INTO `_sys_sidebar` VALUES (52, 25, 'MM Entry', 'entry?id=4&devisi=Multimedia', 'fa fa-camera-retro', 4, '1');

-- ----------------------------
-- Table structure for _sys_sidebar_access
-- ----------------------------
DROP TABLE IF EXISTS `_sys_sidebar_access`;
CREATE TABLE `_sys_sidebar_access`  (
  `sidebar_access_group_id` int(11) NULL DEFAULT NULL,
  `sidebar_access_sidebar_id` int(11) NULL DEFAULT NULL,
  `sidebar_access_create` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `sidebar_access_read` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `sidebar_access_update` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `sidebar_access_delete` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  INDEX `id_sidebar`(`sidebar_access_sidebar_id`) USING BTREE,
  INDEX `id_sidebar_group`(`sidebar_access_group_id`) USING BTREE,
  CONSTRAINT `_sys_sidebar_access_ibfk_1` FOREIGN KEY (`sidebar_access_sidebar_id`) REFERENCES `_sys_sidebar` (`sidebar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_sys_sidebar_access_ibfk_2` FOREIGN KEY (`sidebar_access_group_id`) REFERENCES `_sys_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_sidebar_access
-- ----------------------------
INSERT INTO `_sys_sidebar_access` VALUES (3, 2, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 15, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 16, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 17, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 18, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 19, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 24, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (3, 25, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 30, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 31, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 37, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 38, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 2, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 15, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 16, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 17, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 18, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 19, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 24, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (2, 25, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (2, 30, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (2, 31, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (2, 37, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (2, 38, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (2, 41, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 44, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 45, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (1, 2, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 15, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 16, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 17, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 18, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 19, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 24, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 25, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 30, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 31, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 37, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 38, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 41, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 44, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 45, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 47, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 48, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 49, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 50, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 51, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 52, '1', '1', '1', '1');

-- ----------------------------
-- Table structure for _sys_status
-- ----------------------------
DROP TABLE IF EXISTS `_sys_status`;
CREATE TABLE `_sys_status`  (
  `status_id` int(2) NOT NULL,
  `status_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`status_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_status
-- ----------------------------
INSERT INTO `_sys_status` VALUES (0, 'Non-Aktif');
INSERT INTO `_sys_status` VALUES (1, 'Aktif');

-- ----------------------------
-- Table structure for _sys_user
-- ----------------------------
DROP TABLE IF EXISTS `_sys_user`;
CREATE TABLE `_sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_birth` date NULL DEFAULT NULL,
  `user_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_group_id` int(11) NULL DEFAULT NULL,
  `user_status_id` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `group_id`(`user_group_id`) USING BTREE,
  CONSTRAINT `_sys_user_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `_sys_group` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_user
-- ----------------------------
INSERT INTO `_sys_user` VALUES (1, 'Mas', 'Admin', '1996-03-23', '085655209270', 'admin@admin.com', 'Sumberdiren, Garum, Blitar', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, '1');
INSERT INTO `_sys_user` VALUES (2, 'Si', 'HRD', '1996-05-25', '0857478858', 'hrd@gmail.com', 'Minggirsari, Kanigoro, Blitar', 'hrd', '5f4dcc3b5aa765d61d8327deb882cf99', 2, '1');
INSERT INTO `_sys_user` VALUES (4, 'user', 'user', '2019-12-18', '123', '123@123', '123', 'user', '5f4dcc3b5aa765d61d8327deb882cf99', 3, '1');

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devisi_id` int(11) NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(2) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `devisi_id`(`devisi_id`) USING BTREE,
  CONSTRAINT `action_ibfk_1` FOREIGN KEY (`devisi_id`) REFERENCES `devisi` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO `action` VALUES (1, 1, 'Diterima Non Biaya', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-13 15:14:26', '2020-01-26 07:43:55');
INSERT INTO `action` VALUES (2, 1, 'Diterima Bagian FrontEnd', 'a:8:{i:0;s:1:\"0\";i:1;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-13 15:28:24', '2020-01-28 19:35:12');
INSERT INTO `action` VALUES (3, 1, 'Masuk Program Magang', 'a:8:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"1\";i:4;s:1:\"1\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-13 15:28:38', '2020-01-28 19:30:25');
INSERT INTO `action` VALUES (4, 1, 'Ditolak', 'a:8:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"1\";i:6;s:1:\"1\";i:7;s:1:\"1\";}', 1, '2020-01-13 15:28:46', '2020-01-26 07:43:55');
INSERT INTO `action` VALUES (6, 2, 'Diterima Non Biaya', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:32:51', '2020-01-28 19:42:10');
INSERT INTO `action` VALUES (7, 2, 'Diterima FrontEnd', 'a:8:{i:0;s:1:\"0\";i:1;s:1:\"1\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"1\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:33:06', '2020-01-28 19:42:10');
INSERT INTO `action` VALUES (8, 2, 'Masuk Program Magang', 'a:8:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"1\";i:3;s:1:\"1\";i:4;s:1:\"0\";i:5;s:1:\"1\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:33:14', '2020-01-28 19:42:10');
INSERT INTO `action` VALUES (9, 2, 'Ditolak', 'a:8:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"1\";i:7;s:1:\"1\";}', 1, '2020-01-26 07:33:22', '2020-01-28 19:42:10');
INSERT INTO `action` VALUES (10, 3, 'Diterima Non Biaya', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"0\";i:2;s:1:\"1\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:33:35', '2020-01-28 19:43:09');
INSERT INTO `action` VALUES (11, 3, 'Masuk program magang', 'a:8:{i:0;s:1:\"0\";i:1;s:1:\"1\";i:2;s:1:\"0\";i:3;s:1:\"1\";i:4;s:1:\"1\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:33:46', '2020-01-28 19:43:09');
INSERT INTO `action` VALUES (12, 3, 'Ditolak', 'a:8:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"1\";i:6;s:1:\"1\";i:7;s:1:\"1\";}', 1, '2020-01-26 07:33:54', '2020-01-28 19:43:09');
INSERT INTO `action` VALUES (13, 4, 'Diterima', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"0\";i:2;s:1:\"1\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:34:04', '2020-01-28 19:45:15');
INSERT INTO `action` VALUES (14, 4, 'Masuk Program magang', 'a:8:{i:0;s:1:\"0\";i:1;s:1:\"1\";i:2;s:1:\"0\";i:3;s:1:\"1\";i:4;s:1:\"1\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:34:14', '2020-01-28 19:45:15');
INSERT INTO `action` VALUES (15, 4, 'Ditolak', 'a:8:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"1\";i:6;s:1:\"1\";i:7;s:1:\"1\";}', 1, '2020-01-26 07:34:23', '2020-01-28 19:45:16');

-- ----------------------------
-- Table structure for condition
-- ----------------------------
DROP TABLE IF EXISTS `condition`;
CREATE TABLE `condition`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devisi_id` int(11) NULL DEFAULT NULL,
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(2) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `devisi_id`(`devisi_id`) USING BTREE,
  CONSTRAINT `condition_ibfk_1` FOREIGN KEY (`devisi_id`) REFERENCES `devisi` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of condition
-- ----------------------------
INSERT INTO `condition` VALUES (1, 1, 'Apakah sudah CRUD dan Menggunakan CI?', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"1\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-10 21:06:57', '2020-01-15 08:21:12');
INSERT INTO `condition` VALUES (2, 1, 'Apakah menggunakan Admin LTE?', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"1\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"1\";i:5;s:1:\"1\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-10 21:07:46', '2020-01-15 08:21:12');
INSERT INTO `condition` VALUES (3, 1, 'Apakah penguji puas', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"0\";i:2;s:1:\"1\";i:3;s:1:\"0\";i:4;s:1:\"1\";i:5;s:1:\"0\";i:6;s:1:\"1\";i:7;s:1:\"0\";}', 1, '2020-01-10 21:07:50', '2020-01-15 08:21:12');
INSERT INTO `condition` VALUES (7, 2, 'Apakah sudah Web Service?', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"1\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:30:40', '2020-01-28 19:44:06');
INSERT INTO `condition` VALUES (8, 2, 'Apakah Menguasai AS/IOS?', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"1\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"1\";i:5;s:1:\"1\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:31:01', '2020-01-28 19:42:10');
INSERT INTO `condition` VALUES (9, 2, 'Apakah Penguji Puas?', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"0\";i:2;s:1:\"1\";i:3;s:1:\"0\";i:4;s:1:\"1\";i:5;s:1:\"0\";i:6;s:1:\"1\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:31:11', '2020-01-28 19:42:10');
INSERT INTO `condition` VALUES (10, 3, 'Apakah berhasil membuat game?', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"1\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:31:31', '2020-01-28 19:43:09');
INSERT INTO `condition` VALUES (11, 3, 'Apakah menguasai software Game Dev?', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"1\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"1\";i:5;s:1:\"1\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:31:42', '2020-01-28 19:43:09');
INSERT INTO `condition` VALUES (12, 3, 'Apakah penguji puas?', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"0\";i:2;s:1:\"1\";i:3;s:1:\"0\";i:4;s:1:\"1\";i:5;s:1:\"0\";i:6;s:1:\"1\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:31:59', '2020-01-28 19:43:09');
INSERT INTO `condition` VALUES (13, 4, 'Apakah bisa Desain/Edit?', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"1\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:32:08', '2020-01-28 19:45:15');
INSERT INTO `condition` VALUES (14, 4, 'Apakah Bisa Software?', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"1\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"1\";i:5;s:1:\"1\";i:6;s:1:\"0\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:32:22', '2020-01-28 19:45:15');
INSERT INTO `condition` VALUES (15, 4, 'Apakah Penguji Puas?', 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"0\";i:2;s:1:\"1\";i:3;s:1:\"0\";i:4;s:1:\"1\";i:5;s:1:\"0\";i:6;s:1:\"1\";i:7;s:1:\"0\";}', 1, '2020-01-26 07:32:32', '2020-01-28 19:45:15');

-- ----------------------------
-- Table structure for devisi
-- ----------------------------
DROP TABLE IF EXISTS `devisi`;
CREATE TABLE `devisi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_devisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(2) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of devisi
-- ----------------------------
INSERT INTO `devisi` VALUES (1, 'Web Developer', 1, '0000-00-00 00:00:00', '2020-01-13 14:06:23');
INSERT INTO `devisi` VALUES (2, 'Mobile Developer', 1, '0000-00-00 00:00:00', NULL);
INSERT INTO `devisi` VALUES (3, 'Game Developer', 1, '0000-00-00 00:00:00', NULL);
INSERT INTO `devisi` VALUES (4, 'Multimedia', 1, '0000-00-00 00:00:00', NULL);

-- ----------------------------
-- View structure for v_action
-- ----------------------------
DROP VIEW IF EXISTS `v_action`;
CREATE VIEW `v_action` AS SELECT
action.id,
devisi.nama_devisi,
action.action,
action.`status`,
action.created_at,
action.updated_at
FROM
devisi
INNER JOIN action ON action.devisi_id = devisi.id ;

-- ----------------------------
-- View structure for v_condition
-- ----------------------------
DROP VIEW IF EXISTS `v_condition`;
CREATE VIEW `v_condition` AS SELECT
`condition`.id,
devisi.nama_devisi,
`condition`.`condition`,
`condition`.`status`,
`condition`.created_at,
`condition`.updated_at
FROM
devisi
INNER JOIN `condition` ON `condition`.devisi_id = devisi.id ;

-- ----------------------------
-- View structure for _v_sys_page_access
-- ----------------------------
DROP VIEW IF EXISTS `_v_sys_page_access`;
CREATE VIEW `_v_sys_page_access` AS SELECT
	`_sys_sidebar_access`.`sidebar_access_group_id` AS `group_id`,
	`_sys_sidebar`.`sidebar_label` AS `label`,
	`_sys_sidebar`.`sidebar_icon` AS `icon`,
	`_sys_sidebar`.`sidebar_href` AS `href`,
	`_sys_sidebar_access`.`sidebar_access_create` AS `create`,
	`_sys_sidebar_access`.`sidebar_access_read` AS `read`,
	`_sys_sidebar_access`.`sidebar_access_update` AS `update`,
	`_sys_sidebar_access`.`sidebar_access_delete` AS `delete` 
FROM
	( `_sys_sidebar_access` JOIN `_sys_sidebar` ON ( ( `_sys_sidebar_access`.`sidebar_access_sidebar_id` = `_sys_sidebar`.`sidebar_id` ) ) )
ORDER BY
	`group_id` ;

-- ----------------------------
-- View structure for _v_sys_sidebar
-- ----------------------------
DROP VIEW IF EXISTS `_v_sys_sidebar`;
CREATE VIEW `_v_sys_sidebar` AS select `_sys_sidebar`.`sidebar_id` AS `sidebar_id`,`_sys_sidebar`.`sidebar_parent` AS `sidebar_parent`,(select if((`_sys_sidebar`.`sidebar_parent` = 0),'Parent',(select `sdbar`.`sidebar_label` from `_sys_sidebar` `sdbar` where (`sdbar`.`sidebar_id` = `_sys_sidebar`.`sidebar_parent`)))) AS `sidebar_parent_label`,(select `sdbar`.`sidebar_label` from `_sys_sidebar` `sdbar` where (`sdbar`.`sidebar_id` = `_sys_sidebar`.`sidebar_parent`)) AS `sidebar_child_parent_label`,`_sys_sidebar`.`sidebar_label` AS `sidebar_label`,`_sys_sidebar`.`sidebar_href` AS `sidebar_href`,`_sys_sidebar`.`sidebar_icon` AS `sidebar_icon`,`_sys_sidebar`.`sidebar_index` AS `sidebar_index`,`_sys_sidebar`.`sidebar_status` AS `sidebar_status`,`_sys_status`.`status_id` AS `status_id`,`_sys_status`.`status_label` AS `status_label` from (`_sys_sidebar` join `_sys_status` on((`_sys_status`.`status_id` = `_sys_sidebar`.`sidebar_status`))) ;

-- ----------------------------
-- View structure for _v_sys_user
-- ----------------------------
DROP VIEW IF EXISTS `_v_sys_user`;
CREATE VIEW `_v_sys_user` AS select `_sys_user`.`user_id` AS `user_id`,`_sys_user`.`user_firstname` AS `user_firstname`,`_sys_user`.`user_lastname` AS `user_lastname`,`_sys_user`.`user_birth` AS `user_birth`,`_sys_user`.`user_phone` AS `user_phone`,`_sys_user`.`user_email` AS `user_email`,`_sys_user`.`user_address` AS `user_address`,`_sys_user`.`user_username` AS `user_username`,`_sys_user`.`user_password` AS `user_password`,`_sys_user`.`user_group_id` AS `user_group_id`,`_sys_user`.`user_status_id` AS `user_status_id`,`_sys_group`.`group_id` AS `group_id`,`_sys_group`.`group_label` AS `group_label`,`_sys_status`.`status_id` AS `status_id`,`_sys_status`.`status_label` AS `status_label` from ((`_sys_user` join `_sys_group` on((`_sys_group`.`group_id` = `_sys_user`.`user_group_id`))) join `_sys_status` on((`_sys_status`.`status_id` = `_sys_user`.`user_status_id`))) ;

SET FOREIGN_KEY_CHECKS = 1;
