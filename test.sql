/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 12/12/2024 17:39:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `monday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tuesday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `wednesday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `thursday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `friday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('8:00-8:45', '语文', '数学', '英语', '物理', '化学');
INSERT INTO `course` VALUES ('9:00-9:45', '英语', '化学', '数学', '语文', '生物');
INSERT INTO `course` VALUES ('10:00-10:45', '化学', '英语', '语文', '英语', '物理');
INSERT INTO `course` VALUES ('11:00-11:45', '生物', '生物', '英语', '物理', '英语');
INSERT INTO `course` VALUES ('14:00-14:45', '数学', '数学', '物理', '数学', '化学');
INSERT INTO `course` VALUES ('15:00-15:45', '语文', '语文', '生物', '生物', '语文');
INSERT INTO `course` VALUES ('16:00-16:45', '物理', '物理', '化学', '化学', '数学');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gander` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2024044 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (2024001, '小明', '男', '南昌', '计算机系', '145234648', '1234@qq.com');
INSERT INTO `student` VALUES (2024002, '小王', '男', '北京', '物理系', '134521465', '132@qq.com');
INSERT INTO `student` VALUES (2024003, '张伟', '男', '北京', '计算机系', '13712345678', 'zhangwei01@example.com');
INSERT INTO `student` VALUES (2024004, '李娜', '女', '上海', '美术系', '13898765432', 'lina02@example.com');
INSERT INTO `student` VALUES (2024005, '王强', '男', '广州', '数学系', '13987654321', 'wangqiang03@example.com');
INSERT INTO `student` VALUES (2024006, '刘芳', '女', '深圳', '物理系', '13676543210', 'liufang04@example.com');
INSERT INTO `student` VALUES (2024007, '陈杰', '男', '成都', '化学系', '13565432109', 'chenjie05@example.com');
INSERT INTO `student` VALUES (2024008, '杨洋', '男', '南京', '生物系', '13454321098', 'yangyang06@example.com');
INSERT INTO `student` VALUES (2024009, '赵敏', '女', '武汉', '电子工程系', '13343210987', 'zhaomin07@example.com');
INSERT INTO `student` VALUES (2024010, '孙伟', '男', '西安', '建筑系', '13232109876', 'sunwei08@example.com');
INSERT INTO `student` VALUES (2024011, '周洁', '女', '重庆', '环境科学系', '13121098765', 'zhoujie09@example.com');
INSERT INTO `student` VALUES (2024012, '吴涛', '男', '杭州', '机械工程系', '13010987654', 'wutao10@example.com');
INSERT INTO `student` VALUES (2024013, '徐丽', '女', '苏州', '教育系', '13999887766', 'xuli11@example.com');
INSERT INTO `student` VALUES (2024014, '胡斌', '男', '天津', '经济系', '13888776655', 'hubin12@example.com');
INSERT INTO `student` VALUES (2024015, '郭静', '女', '青岛', '哲学系', '13777665544', 'guojing13@example.com');
INSERT INTO `student` VALUES (2024016, '何强', '男', '大连', '历史系', '13666554433', 'heqiang14@example.com');
INSERT INTO `student` VALUES (2024017, '蒋楠', '女', '长春', '新闻系', '13555443322', 'jiangnan15@example.com');
INSERT INTO `student` VALUES (2024018, '段磊', '男', '哈尔滨', '音乐系', '13444332211', 'duanlei16@example.com');
INSERT INTO `student` VALUES (2024019, '余婷', '女', '福州', '体育系', '13333221100', 'yuting17@example.com');
INSERT INTO `student` VALUES (2024020, '谭昊', '男', '厦门', '管理系', '13222110099', 'tanhao18@example.com');
INSERT INTO `student` VALUES (2024021, '廖玉', '女', '南宁', '艺术系', '13111009988', 'liaoyu19@example.com');
INSERT INTO `student` VALUES (2024022, '彭飞', '男', '昆明', '法学系', '13099988877', 'pengfei20@example.com');
INSERT INTO `student` VALUES (2024023, '张涛', '男', '北京', '计算机系', '13712341234', 'zhangtao21@example.com');
INSERT INTO `student` VALUES (2024024, '李艳', '女', '上海', '美术系', '13898767890', 'liyan22@example.com');
INSERT INTO `student` VALUES (2024025, '王丽', '女', '广州', '数学系', '13987651234', 'wangli23@example.com');
INSERT INTO `student` VALUES (2024026, '刘伟', '男', '深圳', '物理系', '13676549876', 'liu24@example.com');
INSERT INTO `student` VALUES (2024027, '陈欣', '女', '成都', '化学系', '13565436509', 'chenxin25@example.com');
INSERT INTO `student` VALUES (2024028, '杨帆', '男', '南京', '生物系', '13454329871', 'yangfan26@example.com');
INSERT INTO `student` VALUES (2024029, '赵悦', '女', '武汉', '电子工程系', '13343212348', 'zhaoyue27@example.com');
INSERT INTO `student` VALUES (2024030, '孙强', '男', '西安', '建筑系', '13232101239', 'sunqiang28@example.com');
INSERT INTO `student` VALUES (2024031, '周楠', '女', '重庆', '环境科学系', '13121098237', 'zhounan29@example.com');
INSERT INTO `student` VALUES (2024032, '吴晶', '女', '杭州', '机械工程系', '13010987609', 'wujing30@example.com');
INSERT INTO `student` VALUES (2024033, '徐军', '男', '苏州', '教育系', '13999880002', 'xujun31@example.com');
INSERT INTO `student` VALUES (2024034, '胡慧', '女', '天津', '经济系', '13888770003', 'huhui32@example.com');
INSERT INTO `student` VALUES (2024035, '郭伟', '男', '青岛', '哲学系', '13777660004', 'guowei33@example.com');
INSERT INTO `student` VALUES (2024036, '何芳', '女', '大连', '历史系', '13666550005', 'hefang34@example.com');
INSERT INTO `student` VALUES (2024037, '蒋欣', '女', '长春', '新闻系', '13555440006', 'jiangxin35@example.com');
INSERT INTO `student` VALUES (2024038, '段杰', '男', '哈尔滨', '音乐系', '13444330007', 'duanjie36@example.com');
INSERT INTO `student` VALUES (2024039, '余强', '男', '福州', '体育系', '13333220008', 'yuqiang37@example.com');
INSERT INTO `student` VALUES (2024040, '王伟', '男', '南昌', '计算机系', '13111009900', 'wangwei31@example.com');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'root', '123456');
INSERT INTO `user` VALUES (2, 'admin', '123456');
INSERT INTO `user` VALUES (7, 'laow', '123456');

SET FOREIGN_KEY_CHECKS = 1;
