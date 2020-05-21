/*
 Navicat Premium Data Transfer

 Source Server         : localhost_MySQL
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : jizhang

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 21/05/2020 21:17:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smalltype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, '消费', '一日三餐');
INSERT INTO `account` VALUES (4, '收入', '工资收入');
INSERT INTO `account` VALUES (10, '收入', '副业');
INSERT INTO `account` VALUES (11, '消费', '娱乐');
INSERT INTO `account` VALUES (12, '消费', '饮料');

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smalltype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` double(255, 0) NULL DEFAULT NULL,
  `pay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`bill_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (1, 'zhangsan', '消费', '一日三餐', '四个包子', 8, '支付宝', '2020-04-07');
INSERT INTO `bill` VALUES (2, 'zhangsan', '收入', '工资收入', '一个月', 1000, '银行卡', '2020-04-21');
INSERT INTO `bill` VALUES (3, 'lisi', '消费', '一日三餐', '包子6个', 10, '微信', '2020-04-07');
INSERT INTO `bill` VALUES (5, 'lisi', '消费', '饮料', '三瓶农夫山泉', 12, '支付宝', '2019-02-03');
INSERT INTO `bill` VALUES (6, 'zhangsan', '消费', '一日三餐', '午餐', 15, '支付宝', '2019-02-03');
INSERT INTO `bill` VALUES (8, 'zhangsan', '消费', '饮料', '三瓶冰红茶', 9, '支付宝', '2019-02-03');
INSERT INTO `bill` VALUES (11, 'zhangsan', '消费', '饮料', '一件农夫山泉', 30, '支付宝', '2019-02-03');
INSERT INTO `bill` VALUES (12, 'zhangsan', '收入', '副业', '余额宝12天收入', 12, '支付宝', '2020-04-26');
INSERT INTO `bill` VALUES (15, 'zhangsan', '消费', '娱乐', 'KTV唱歌', 128, '支付宝', '2020-04-15');
INSERT INTO `bill` VALUES (16, 'zhangsan', '收入', '副业', '兼职代课两天', 200, '微信', '2020-05-14');
INSERT INTO `bill` VALUES (17, 'zhangsan', '消费', '一日三餐', '晚餐面条', 12, '支付宝', '2020-05-15');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhangsan', '123');
INSERT INTO `user` VALUES (2, 'lisi', '456');

SET FOREIGN_KEY_CHECKS = 1;
