/*
 Navicat Premium Data Transfer

 Source Server         : Dormitory
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : dormitorysystem

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 15/05/2022 17:25:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `schedule` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('0206001', '陈东岗', '男', '1-101', '18162834922', 'user.jpg', '1');
INSERT INTO `admin` VALUES ('0206002', '韩雪', '女', '1-301', '18923159642', 'user.jpg', '2');
INSERT INTO `admin` VALUES ('0711001', '黄家强', '男', '1-101', '18346582135', 'user.jpg', '1');
INSERT INTO `admin` VALUES ('0711002', '李思蓓', '女', '1-301', '18642834156', 'user.jpg', '2');
INSERT INTO `admin` VALUES ('1216001', '王楠', '男', '1-101', '18489632486', 'user.jpg', '1');
INSERT INTO `admin` VALUES ('1216002', '凝香书', '女', '1-301', '18434568451', 'user.jpg', '2');

-- ----------------------------
-- Table structure for dorinfo
-- ----------------------------
DROP TABLE IF EXISTS `dorinfo`;
CREATE TABLE `dorinfo`  (
  `dorid` int(100) NOT NULL AUTO_INCREMENT,
  `dor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `num` int(10) NULL DEFAULT NULL,
  `quarantine` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `electricity` int(100) NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `score` int(100) NULL DEFAULT NULL,
  `admin1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`dorid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dorinfo
-- ----------------------------
INSERT INTO `dorinfo` VALUES (1, '9-101', 6, '是', 113, '男', 1, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (2, '9-102', 6, '否', 100, '男', 3, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (3, '9-103', 6, '否', 100, '男', NULL, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (4, '9-104', 6, '否', 100, '男', NULL, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (5, '9-105', 6, '否', 100, '男', NULL, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (6, '10-101', 6, '否', 253, '女', 3, '王楠', '凝香书');
INSERT INTO `dorinfo` VALUES (7, '10-102', 6, '否', 100, '女', NULL, '王楠', '凝香书');
INSERT INTO `dorinfo` VALUES (14, '9-208', 6, '否', 0, '男', 0, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (16, '9-209', 6, '否', 0, '男', NULL, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (17, '9-210', 6, '否', 0, '男', NULL, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (18, '9-106', 6, '否', 0, '男', 4, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (23, '9-107', 6, '否', 0, '男', NULL, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (26, '9-110', 6, '否', 0, '男', NULL, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (27, '9-111', 6, '否', 0, '男', NULL, '黄家强', '陈东岗');
INSERT INTO `dorinfo` VALUES (31, '9-108', 6, '否', 0, '男', NULL, '黄家强', '李思蓓');
INSERT INTO `dorinfo` VALUES (32, '9-109', 6, '否', 0, '男', NULL, '黄家强', '李思蓓');

-- ----------------------------
-- Table structure for fixinfo
-- ----------------------------
DROP TABLE IF EXISTS `fixinfo`;
CREATE TABLE `fixinfo`  (
  `fid` int(100) NOT NULL AUTO_INCREMENT,
  `fdate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stuff` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `marks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fixinfo
-- ----------------------------
INSERT INTO `fixinfo` VALUES (6, '2022-03-09 08:00:00', '9-208', '床', '损坏', '床.jpg', NULL, '0');
INSERT INTO `fixinfo` VALUES (7, '2022-03-10 13:00:00', '9-103', '花洒', '损坏', '花洒.jpg', NULL, '1');
INSERT INTO `fixinfo` VALUES (27, '2022-04-13 23:00:00', '9-101', '饮水机', '损坏', '饮水机.jpg', NULL, '1');
INSERT INTO `fixinfo` VALUES (28, '2022-05-03 16:00:00', '9-101', '水龙头', '损坏', '水龙头.jpg', NULL, '1');
INSERT INTO `fixinfo` VALUES (32, '2022-05-08 11:38:47', '9-101', '123', '损坏', '空调.jpg', NULL, '1');

-- ----------------------------
-- Table structure for health
-- ----------------------------
DROP TABLE IF EXISTS `health`;
CREATE TABLE `health`  (
  `hid` int(100) NOT NULL AUTO_INCREMENT,
  `sid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `QRcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `health` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `control` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`hid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  CONSTRAINT `sid` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health
-- ----------------------------
INSERT INTO `health` VALUES (2, '2018001', '红码', '均无异常', '广州市（校内）', '2022-05-12', '否', 'chengxiao.jpg');
INSERT INTO `health` VALUES (3, '2018002', '绿码', '均无异常', '广州市（校内）', '2022-03-20', '否', NULL);
INSERT INTO `health` VALUES (4, '2018003', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (5, '2018004', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (6, '2018005', '绿码', '均无异常', '广州市（校内）', '2022-04-14', '否', NULL);
INSERT INTO `health` VALUES (7, '2018006', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (8, '2018007', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (9, '2018008', '绿码', '均无异常', '广东省外', '2022-04-11', '否', NULL);
INSERT INTO `health` VALUES (10, '2018009', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (11, '2018010', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (12, '2018011', '绿码', '均无异常', '广州市（校内）', '2022-04-11', '否', NULL);
INSERT INTO `health` VALUES (13, '2018012', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (14, '2018013', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (15, '2018014', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (16, '2018015', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (17, '2018016', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (18, '2018017', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (19, '2018018', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (20, '2018019', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (21, '2018020', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (22, '2018021', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (23, '2018022', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (24, '2018023', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (25, '2018024', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (26, '2018025', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (27, '2018026', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (28, '2018027', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (29, '2018028', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (30, '2018029', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (31, '2018030', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (32, '2018031', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (33, '2018032', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (34, '2018033', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (35, '2018034', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (36, '2018035', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (37, '2018036', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (38, '2018037', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (39, '2018038', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (40, '2018039', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (41, '2018040', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (42, '2018041', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (43, '2018042', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (44, '2018043', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (45, '2018044', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (46, '2018045', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (47, '2018046', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (48, '2018047', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (49, '2018048', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (50, '2018049', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (51, '2018050', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (52, '2018051', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (53, '2018052', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (54, '2018053', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (55, '2018054', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (56, '2018055', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (57, '2018056', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (58, '2018057', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (59, '2018058', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (60, '2018059', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (61, '2018060', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (62, '2018061', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (63, '2018062', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (64, '2018063', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (65, '2018064', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (66, '2018065', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (67, '2018066', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (68, '2018067', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (69, '2018068', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (70, '2018069', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (71, '2018070', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (72, '2018071', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (73, '2018072', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (74, '2018073', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (75, '2018074', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (76, '2018075', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (77, '2018076', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (78, '2018077', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (79, '2018078', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (80, '2018079', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (81, '2018080', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (82, '2018081', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (83, '2018082', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (84, '2018083', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (85, '2018084', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (86, '2018085', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (87, '2018086', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (88, '2018087', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (89, '2018088', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (90, '2018089', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (91, '2018090', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (92, '2018091', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (93, '2018092', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (94, '2018093', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (95, '2018094', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (96, '2018095', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (97, '2018096', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (98, '2018097', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (99, '2018098', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (100, '2018099', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `health` VALUES (101, '2018100', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for public
-- ----------------------------
DROP TABLE IF EXISTS `public`;
CREATE TABLE `public`  (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pdate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of public
-- ----------------------------
INSERT INTO `public` VALUES (1, '停水通知', '陈东岗', '白云校区2月25日至2月26日停水通知', '2022-02-25 15:00:00', '接自来水公司通知，因配合水厂至黄浦区抗旱应急供水管建设工程需要，我校白云校区将于2月25日23：00至2月26日7：00停水，请各学生社区的师生员工做好停水准备。');
INSERT INTO `public` VALUES (7, '核酸检测', '陈东岗', '4月13日全员核酸', '2022-03-13 12:00:00', '接上级安排，现要求白云校区今晚必须完成全员核酸表面抗原检测。全体学生需统一在杨楼210集中培训并进行抗原检测。');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2018001', '陈伟邦', '男', '9-101', '16548465165', 'tanjianci.jpg');
INSERT INTO `student` VALUES ('2018002', '陈锦昌', '男', '9-101', '13546242681', 'zhangyixing.jpg');
INSERT INTO `student` VALUES ('2018003', '程咬金', '男', '9-101', '1346821386', 'zhangruoyun.jpg');
INSERT INTO `student` VALUES ('2018004', '史佩西', '男', '9-101', '13715692015', 'user.jpg');
INSERT INTO `student` VALUES ('2018005', '霍金斯', '男', '9-101', '13905306841', 'user.jpg');
INSERT INTO `student` VALUES ('2018006', '孙建伟', '男', '9-101', '15680341987', 'user.jpg');
INSERT INTO `student` VALUES ('2018007', '姜文', '男', '9-102', '15612308460', 'user.jpg');
INSERT INTO `student` VALUES ('2018008', '韩童声', '女', '10-101', '17531568091', 'jennie.jpg');
INSERT INTO `student` VALUES ('2018009', '徐鸿钧', '男', '9-102', '13654869210', 'user.jpg');
INSERT INTO `student` VALUES ('2018010', '昆坤', '男', '9-102', '16748923468', 'user.jpg');
INSERT INTO `student` VALUES ('2018011', '刘娜娜', '女', '10-101', '13694183201', 'rose.jpg');
INSERT INTO `student` VALUES ('2018012', '南成勋', '男', '9-102', '15495680132', 'user.jpg');
INSERT INTO `student` VALUES ('2018013', '欧比', '男', '9-102', '15489623210', 'user.jpg');
INSERT INTO `student` VALUES ('2018014', '嘉庆', '男', '9-102', '16928231546', 'user.jpg');
INSERT INTO `student` VALUES ('2018015', '诺瑞斯', '男', '9-103', '16923525690', 'zhangyixing.jpg');
INSERT INTO `student` VALUES ('2018016', '康佳德', '男', '9-103', '14628234682', 'user.jpg');
INSERT INTO `student` VALUES ('2018017', '马雯田', '女', '10-101', '16923180567', 'lisa.jpg');
INSERT INTO `student` VALUES ('2018018', '哈维斯', '男', '9-103', '14823549561', 'user.jpg');
INSERT INTO `student` VALUES ('2018019', '海克斯', '男', '9-103', '16483250841', 'user.jpg');
INSERT INTO `student` VALUES ('2018020', '傅海峰', '男', '9-103', '13824689026', 'user.jpg');
INSERT INTO `student` VALUES ('2018021', '海大富', '男', '9-103', '18624238458', 'user.jpg');
INSERT INTO `student` VALUES ('2018022', '张国华', '男', '9-104', '13544568512', 'user.jpg');
INSERT INTO `student` VALUES ('2018023', '顾静冬', '女', '10-101', '16783120564', 'jisoo.jpg');
INSERT INTO `student` VALUES ('2018024', '俊达', '男', '9-104', '18865135482', 'user.jpg');
INSERT INTO `student` VALUES ('2018025', '冯国庆', '男', '9-104', '13456895124', 'user.jpg');
INSERT INTO `student` VALUES ('2018026', '金大福', '男', '9-104', '18864632481', 'user.jpg');
INSERT INTO `student` VALUES ('2018027', '潘妮', '女', '10-101', '16823421834', 'user.jpg');
INSERT INTO `student` VALUES ('2018028', '北乃绮', '女', NULL, '13546482031', 'user.jpg');
INSERT INTO `student` VALUES ('2018029', '刘倩碧', '女', '10-102', '16582342542', 'user.jpg');
INSERT INTO `student` VALUES ('2018030', '徐海乔', '女', '10-102', '18634898031', 'user.jpg');
INSERT INTO `student` VALUES ('2018031', '富康王', '男', '9-104', '15621385468', 'user.jpg');
INSERT INTO `student` VALUES ('2018032', '酷睿建', '男', '9-104', '13764135291', 'user.jpg');
INSERT INTO `student` VALUES ('2018033', '黄嘉琪', '女', '10-102', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018034', '陈家辉', '男', '9-105', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018035', '刘嘉慧', '女', '10-102', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018036', '王俊辉', '男', '9-105', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018037', '丁俊才', '男', '9-105', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018038', '李家琪', '女', '10-102', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018039', '蔡琴文', '女', '10-102', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018040', '龚继安', '男', '9-105', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018041', '罗汉松', '男', '9-105', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018042', '胡伟立', '男', '9-105', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018043', '刘永刚', '男', '9-106', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018044', '王国贤', '男', '9-106', '18000000000', 'user.jpg');
INSERT INTO `student` VALUES ('2018045', '乐文尼', '男', '9-106', '', 'user.jpg');
INSERT INTO `student` VALUES ('2018046', '降谷晓', '男', '9-106', '', 'user.jpg');
INSERT INTO `student` VALUES ('2018047', '秦川间', '男', '9-106', '', 'user.jpg');
INSERT INTO `student` VALUES ('2018048', '田少波', '男', '9-106', '', 'user.jpg');
INSERT INTO `student` VALUES ('2018049', '朴秀俊', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018050', '陈婉莹', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018051', '马苏', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018052', '展布凡', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018053', '将颐真', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018054', '城雅志', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018055', '关晓旋', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018056', '勾望雅', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018057', '屈洁玉', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018058', '胡高', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018059', '贺桂帆', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018060', '良奇', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018061', '谷紫桐', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018062', '钊春雨', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018063', '敏听芹', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018064', '贯建白', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018065', '怀梦竹', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018066', '威令羽', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018067', '翟清晖', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018068', '虞震轩', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018069', '冷童童', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018070', '卞向雁', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018071', '易巍然', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018072', '詹豫', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018073', '廖侠骞', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018074', '岑康伯', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018075', '仲陶', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018076', '梅宛丝', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018077', '本俊明', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018078', '马佳今', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018079', '伟奕叶', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018080', '梁喆', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018081', '禹白柏', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018082', '千柔雅', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018083', '邝玮艺', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018084', '邵彭泽', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018085', '渠俊弼', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018086', '林博耘', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018087', '柴哲瀚', '男', '9-208', '', 'user.jpg');
INSERT INTO `student` VALUES ('2018088', '瑞景辉', '男', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018089', '姜寄波', '男', '9-208', '', 'user.jpg');
INSERT INTO `student` VALUES ('2018090', '崔嘉怡', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018091', '郭逸雅', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018092', '童琪华', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018093', '兆梓倩', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018094', '辟雅柔', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018095', '孛曼彤', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018096', '魏德曜', '男', '9-208', '', 'user.jpg');
INSERT INTO `student` VALUES ('2018097', '潘贞韵', '女', NULL, '', 'user.jpg');
INSERT INTO `student` VALUES ('2018098', '田幼安', '男', '9-208', '', 'user.jpg');
INSERT INTO `student` VALUES ('2018099', '原易真', '男', '9-208', '', 'user.jpg');
INSERT INTO `student` VALUES ('2018100', '蔚凝莲', '女', NULL, '', 'user.jpg');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `loginid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `sid`(`loginid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '123456', '2018001', 'student');
INSERT INTO `users` VALUES (2, '123456', '2018002', 'student');
INSERT INTO `users` VALUES (3, '123456', '2018003', 'student');
INSERT INTO `users` VALUES (4, '123456', '2018004', 'student');
INSERT INTO `users` VALUES (5, '123456', '2018005', 'student');
INSERT INTO `users` VALUES (6, '123456', '2018006', 'student');
INSERT INTO `users` VALUES (7, '123456', '2018007', 'student');
INSERT INTO `users` VALUES (8, '123456', '2018008', 'student');
INSERT INTO `users` VALUES (9, '123456', '2018009', 'student');
INSERT INTO `users` VALUES (10, '123456', '2018010', 'student');
INSERT INTO `users` VALUES (11, '123456', '2018011', 'student');
INSERT INTO `users` VALUES (12, '123456', '2018012', 'student');
INSERT INTO `users` VALUES (13, '123456', '2018013', 'student');
INSERT INTO `users` VALUES (14, '123456', '2018014', 'student');
INSERT INTO `users` VALUES (15, '123456', '2018015', 'student');
INSERT INTO `users` VALUES (16, '123456', '2018016', 'student');
INSERT INTO `users` VALUES (17, '123456', '2018017', 'student');
INSERT INTO `users` VALUES (18, '123456', '2018018', 'student');
INSERT INTO `users` VALUES (19, '123456', '2018019', 'student');
INSERT INTO `users` VALUES (20, '123456', '2018020', 'student');
INSERT INTO `users` VALUES (21, '123456', '2018021', 'student');
INSERT INTO `users` VALUES (22, '123456', '2018022', 'student');
INSERT INTO `users` VALUES (23, '123456', '2018023', 'student');
INSERT INTO `users` VALUES (24, '123456', '2018024', 'student');
INSERT INTO `users` VALUES (25, '123456', '2018025', 'student');
INSERT INTO `users` VALUES (26, '123456', '2018026', 'student');
INSERT INTO `users` VALUES (27, '123456', '2018027', 'student');
INSERT INTO `users` VALUES (28, '123456', '2018028', 'student');
INSERT INTO `users` VALUES (29, '123456', '2018029', 'student');
INSERT INTO `users` VALUES (30, '123456', '2018030', 'student');
INSERT INTO `users` VALUES (31, '123456', '2018031', 'student');
INSERT INTO `users` VALUES (32, '123456', '2018032', 'student');
INSERT INTO `users` VALUES (33, '123456', '2018033', 'student');
INSERT INTO `users` VALUES (34, '123456', '2018034', 'student');
INSERT INTO `users` VALUES (35, '123456', '2018035', 'student');
INSERT INTO `users` VALUES (36, '123456', '2018036', 'student');
INSERT INTO `users` VALUES (37, '123456', '2018037', 'student');
INSERT INTO `users` VALUES (38, '123456', '2018038', 'student');
INSERT INTO `users` VALUES (39, '123456', '2018039', 'student');
INSERT INTO `users` VALUES (40, '123456', '2018040', 'student');
INSERT INTO `users` VALUES (41, '123456', '2018041', 'student');
INSERT INTO `users` VALUES (42, '123456', '2018042', 'student');
INSERT INTO `users` VALUES (43, '123456', '2018043', 'student');
INSERT INTO `users` VALUES (44, '123456', '2018044', 'student');
INSERT INTO `users` VALUES (45, '123456', '2018045', 'student');
INSERT INTO `users` VALUES (46, '123456', '2018046', 'student');
INSERT INTO `users` VALUES (47, '123456', '2018047', 'student');
INSERT INTO `users` VALUES (48, '123456', '2018048', 'student');
INSERT INTO `users` VALUES (49, '123456', '2018049', 'student');
INSERT INTO `users` VALUES (50, '123456', '2018050', 'student');
INSERT INTO `users` VALUES (51, '123456', '2018051', 'student');
INSERT INTO `users` VALUES (52, '123456', '2018052', 'student');
INSERT INTO `users` VALUES (53, '123456', '2018053', 'student');
INSERT INTO `users` VALUES (54, '123456', '2018054', 'student');
INSERT INTO `users` VALUES (55, '123456', '2018055', 'student');
INSERT INTO `users` VALUES (56, '123456', '2018056', 'student');
INSERT INTO `users` VALUES (57, '123456', '2018057', 'student');
INSERT INTO `users` VALUES (58, '123456', '2018058', 'student');
INSERT INTO `users` VALUES (59, '123456', '2018059', 'student');
INSERT INTO `users` VALUES (60, '123456', '2018060', 'student');
INSERT INTO `users` VALUES (61, '123456', '2018061', 'student');
INSERT INTO `users` VALUES (62, '123456', '2018062', 'student');
INSERT INTO `users` VALUES (63, '123456', '2018063', 'student');
INSERT INTO `users` VALUES (64, '123456', '2018064', 'student');
INSERT INTO `users` VALUES (65, '123456', '2018065', 'student');
INSERT INTO `users` VALUES (66, '123456', '2018066', 'student');
INSERT INTO `users` VALUES (67, '123456', '2018067', 'student');
INSERT INTO `users` VALUES (68, '123456', '2018068', 'student');
INSERT INTO `users` VALUES (69, '123456', '2018069', 'student');
INSERT INTO `users` VALUES (70, '123456', '2018070', 'student');
INSERT INTO `users` VALUES (71, '123456', '2018071', 'student');
INSERT INTO `users` VALUES (72, '123456', '2018072', 'student');
INSERT INTO `users` VALUES (73, '123456', '2018073', 'student');
INSERT INTO `users` VALUES (74, '123456', '2018074', 'student');
INSERT INTO `users` VALUES (75, '123456', '2018075', 'student');
INSERT INTO `users` VALUES (76, '123456', '2018076', 'student');
INSERT INTO `users` VALUES (77, '123456', '2018077', 'student');
INSERT INTO `users` VALUES (78, '123456', '2018078', 'student');
INSERT INTO `users` VALUES (79, '123456', '2018079', 'student');
INSERT INTO `users` VALUES (80, '123456', '2018080', 'student');
INSERT INTO `users` VALUES (81, '123456', '2018081', 'student');
INSERT INTO `users` VALUES (82, '123456', '2018082', 'student');
INSERT INTO `users` VALUES (83, '123456', '2018083', 'student');
INSERT INTO `users` VALUES (84, '123456', '2018084', 'student');
INSERT INTO `users` VALUES (85, '123456', '2018085', 'student');
INSERT INTO `users` VALUES (86, '123456', '2018086', 'student');
INSERT INTO `users` VALUES (87, '123456', '2018087', 'student');
INSERT INTO `users` VALUES (88, '123456', '2018088', 'student');
INSERT INTO `users` VALUES (89, '123456', '2018089', 'student');
INSERT INTO `users` VALUES (90, '123456', '2018090', 'student');
INSERT INTO `users` VALUES (91, '123456', '2018091', 'student');
INSERT INTO `users` VALUES (92, '123456', '2018092', 'student');
INSERT INTO `users` VALUES (93, '123456', '2018093', 'student');
INSERT INTO `users` VALUES (94, '123456', '2018094', 'student');
INSERT INTO `users` VALUES (95, '123456', '2018095', 'student');
INSERT INTO `users` VALUES (96, '123456', '2018096', 'student');
INSERT INTO `users` VALUES (97, '123456', '2018097', 'student');
INSERT INTO `users` VALUES (98, '123456', '2018098', 'student');
INSERT INTO `users` VALUES (99, '123456', '2018099', 'student');
INSERT INTO `users` VALUES (100, '123456', '2018100', 'student');
INSERT INTO `users` VALUES (101, '123456', '0206001', 'admin');
INSERT INTO `users` VALUES (102, '123456', '0206002', 'admin');
INSERT INTO `users` VALUES (103, '123456', '0711001', 'admin');
INSERT INTO `users` VALUES (104, '123456', '0711002', 'admin');
INSERT INTO `users` VALUES (105, '123456', '1216001', 'admin');
INSERT INTO `users` VALUES (106, '123456', '1216002', 'admin');

-- ----------------------------
-- Triggers structure for table health
-- ----------------------------
DROP TRIGGER IF EXISTS `health_quarantine`;
delimiter ;;
CREATE TRIGGER `health_quarantine` BEFORE UPDATE ON `health` FOR EACH ROW BEGIN
IF new.QRcode='红码' or new.QRcode='黄码' THEN
if new.location='广州市（校内）' THEN
update dorinfo set quarantine='是' WHERE dor=(SELECT dor from student WHERE sid=new.sid);
end if;
ELSE 
update dorinfo set quarantine='否' WHERE dor=(SELECT dor from student WHERE sid=new.sid);
end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_student_insert`;
delimiter ;;
CREATE TRIGGER `tri_student_insert` AFTER INSERT ON `student` FOR EACH ROW BEGIN
if EXISTS(SELECT * FROM dorinfo where dor=new.dor) then
UPDATE dorinfo SET num=(SELECT count(dor) FROM student WHERE dor=new.dor) WHERE dor=new.dor;
ELSE
INSERT INTO dorinfo(dor,num,quarantine,electricity,gender) VALUES(new.dor,1,'否',100,new.gender) ;
end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_student_delete`;
delimiter ;;
CREATE TRIGGER `tri_student_delete` AFTER DELETE ON `student` FOR EACH ROW BEGIN
UPDATE dorinfo SET num=(SELECT count(dor) FROM student WHERE dor=old.dor) WHERE dor=old.dor;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
