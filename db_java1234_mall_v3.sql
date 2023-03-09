/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : db_java1234_mall_v3

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 09/03/2023 20:25:39
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userName` varchar(66) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(66) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'java', '1234');

-- ----------------------------
-- Table structure for t_bigtype
-- ----------------------------
DROP TABLE IF EXISTS `t_bigtype`;
CREATE TABLE `t_bigtype`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bigtype
-- ----------------------------
INSERT INTO `t_bigtype` VALUES (1, '压缩袋', '压缩袋描述', '11.jpg');
INSERT INTO `t_bigtype` VALUES (2, '吸盘挂钩', '吸盘挂钩描述', '22.jpg');
INSERT INTO `t_bigtype` VALUES (3, '置物架', '置物架描述', '33.jpg');
INSERT INTO `t_bigtype` VALUES (4, '厨房用品', '厨房用品描述', '44.jpg');
INSERT INTO `t_bigtype` VALUES (5, '卧室收纳', '卧室收纳描述', '55.jpg');
INSERT INTO `t_bigtype` VALUES (6, '卫浴置物', '卫浴置物描述', '66.jpg');
INSERT INTO `t_bigtype` VALUES (7, '洗晒护理', '洗晒护理描述', '77.jpg');
INSERT INTO `t_bigtype` VALUES (8, '差旅用品', '差旅用品描述', '88.jpg');
INSERT INTO `t_bigtype` VALUES (9, '户外露营用品', '户外露营用品描述', '99.jpg');
INSERT INTO `t_bigtype` VALUES (10, '食品保鲜', '食品保鲜描述', '101.jpg');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `totalPrice` decimal(8, 2) NULL DEFAULT NULL,
  `address` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consignee` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telNumber` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `payDate` datetime(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, 'JAVA20230305074150000000511', 'o00sM5ZR6uXEEuzFOjbUIFgH8-To', 162.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-03-05 19:41:51', '2023-03-05 19:41:51', 2);
INSERT INTO `t_order` VALUES (2, 'JAVA20230305074200000000529', 'o00sM5ZR6uXEEuzFOjbUIFgH8-To', 40.00, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-03-05 19:42:01', '2023-03-05 19:42:01', 2);

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `mId` int(0) NULL DEFAULT NULL,
  `goodsId` int(0) NULL DEFAULT NULL,
  `goodsNumber` int(0) NULL DEFAULT NULL,
  `goodsPrice` decimal(10, 0) NULL DEFAULT NULL,
  `goodsName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsPic` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES (1, 1, 19, 3, 54, '太力真空袋压缩袋', 'ya31.jpg');
INSERT INTO `t_order_detail` VALUES (2, 2, 3, 2, 20, '太力吸盘挂钩', 'xi1.jpg');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `stock` int(0) NULL DEFAULT NULL,
  `proPic` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isHot` bit(1) NULL DEFAULT NULL,
  `isSwiper` bit(1) NULL DEFAULT NULL,
  `swiperPic` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `swiperSort` int(0) NULL DEFAULT NULL,
  `typeId` int(0) NULL DEFAULT NULL,
  `hotDateTime` datetime(0) NULL DEFAULT NULL,
  `productIntroImgs` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productParaImgs` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (1, '太力抽气真空压缩袋', 66, 4000, 'ya1.jpg', b'1', b'0', 'default.jpg', 0, 2, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/ya1.jpg\'></img><img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/ya2.jpg\'></img><img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/ya3.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/ya1.jpg\'></img><img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/ya2.jpg\'></img><img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/ya3.jpg\'></img><img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img><img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力抽气真空压缩收纳袋羽绒服衣服被子专用加厚棉被家用立体电泵');
INSERT INTO `t_product` VALUES (2, '太力抗菌免抽气真空压缩袋', 70, 4000, 'ya21.jpg', b'1', b'0', 'default.jpg', 0, 1, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/ya21.jpg\'></img><img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/ya22.jpg\'></img><img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/ya23.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/ya21.jpg\'></img><img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/ya22.jpg\'></img><img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img><img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力抗菌免抽气真空压缩袋装棉被子专用衣物棉服羽绒衣服收纳袋子');
INSERT INTO `t_product` VALUES (3, '太力吸盘挂钩', 20, 4000, 'xi1.jpg', b'1', b'1', '22.jpg', 2, 3, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/xi1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/xi2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/xi3.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/xi1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力吸盘挂钩免打孔浴室无痕强力粘胶卫生间厨房门后墙壁毛巾粘钩');
INSERT INTO `t_product` VALUES (4, '太力毛巾架免打孔收纳架', 120, 4000, 'xi21.jpg', b'1', b'0', 'default.jpg', 0, 4, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/xi21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/xi22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/xi23.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/xi21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/xi22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力毛巾架免打孔收纳架卫生间太空铝置物架浴室厕所壁挂式浴巾架');
INSERT INTO `t_product` VALUES (5, '太力卫生间置物架', 40, 4000, 'zhi11.jpg', b'1', b'1', '33.jpg', 3, 5, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/zhi1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/zhi2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/zhi3.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/zhi4.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/zhi5.jpg\'></img>', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/zhi1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/zhi2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力浴室卫生间置物架吸盘真空免打孔洗手间厕所洗漱台挂墙收纳架');
INSERT INTO `t_product` VALUES (6, '太力浴室拖鞋架', 19, 4000, 'zhi21.jpg', b'1', b'0', 'default.jpg', 0, 5, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/zhi21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/zhi22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/zhi23.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/xi21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/xi22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力浴室拖鞋架免打孔卫生间收纳神器厕所吸盘置物鞋沥水壁挂架子');
INSERT INTO `t_product` VALUES (7, '太力密封罐', 25, 4000, 'chu1.jpg', b'0', b'0', 'default.jpg', 0, 6, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu3.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/chu1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/chu2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/chu3.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力密封罐五谷杂粮面条收纳盒厨房装豆子谷物粮食储存储物分格桶');
INSERT INTO `t_product` VALUES (8, '太力厨房纸巾架子', 23, 4000, 'chu21.jpg', b'0', b'0', 'default.jpg', 0, 7, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu23.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu24.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/chu21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/chu22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/chu23.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力厨房纸巾架子壁挂用纸架免打孔卷纸架懒人抹布挂杆吸油纸挂架');
INSERT INTO `t_product` VALUES (9, '太力厨房置物架', 60, 4000, 'chu31.jpg', b'0', b'0', 'default.jpg', 0, 7, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu31.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu32.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu33.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu34.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chu35.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/chu31.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/chu32.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/chu33.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力厨房置物架壁挂式调味料收纳不锈钢挂架免打孔挂钩刀架锅盖架');
INSERT INTO `t_product` VALUES (10, '太力羽绒服收纳袋', 45, 4000, 'wo1.jpg', b'0', b'0', 'default.jpg', 0, 8, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/wo11.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/wo1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/wo2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/wo3.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/wo1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/wo2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力羽绒服收纳袋真空压缩袋衣服大衣抽挂式衣物专用衣柜收纳神器');
INSERT INTO `t_product` VALUES (11, '太力收纳箱抽屉式', 69, 4000, 'wo21.jpg', b'0', b'0', 'default.jpg', 0, 9, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/wo21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/wo22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/wo23.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/wo24.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/wo25.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/wo21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/wo22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/wo23.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/wo24.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/wo25.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力收纳箱抽屉式衣服家用储物收纳神器衣橱衣物整理箱衣柜收纳盒');
INSERT INTO `t_product` VALUES (12, '太力家用墙面肥皂盒', 10, 4000, 'yu21.jpg', b'0', b'0', 'default.jpg', 0, 10, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yu21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yu22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yu23.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yu24.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yu25.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/yu21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/yu22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力家用墙面肥皂盒吸盘壁挂式双层沥水卫生间免打孔香皂盒置物架');
INSERT INTO `t_product` VALUES (13, '太力脸盆挂钩', 17, 4000, 'yu31.jpg', b'0', b'0', 'default.jpg', 0, 10, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yu31.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yu32.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yu33.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yu34.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yu35.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/yu31.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/yu32.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力脸盆挂钩浴盆免打孔浴室卫生间盆架洗澡盆挂盆神器盆子收纳架');
INSERT INTO `t_product` VALUES (14, '太力洗衣袋', 7, 4000, 'yang1.jpg', b'0', b'0', 'default.jpg', 0, 11, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yang1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yang2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yang3.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yang4.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/yang1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/yang2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/yang3.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力洗衣袋洗衣机专用加厚毛衣内衣网兜过滤护洗袋大号网袋防变形');
INSERT INTO `t_product` VALUES (15, '太力植绒衣架', 36, 4000, 'yang21.jpg', b'0', b'0', 'default.jpg', 0, 12, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yang21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yang22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yang23.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/yang24.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/yang21.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/yang22.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/yang23.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力植绒衣架家用挂衣10个薄防滑无痕整理师专用衣柜晾衣服撑子');
INSERT INTO `t_product` VALUES (16, '太力旅行真空压缩袋', 18, 4000, 'chai1.jpg', b'0', b'0', 'default.jpg', 0, 13, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chai1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chai2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chai3.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/chai4.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/chai1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/chai2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力旅行真空压缩袋行李箱专用手卷小号便携衣物衣服羽绒服收纳袋');
INSERT INTO `t_product` VALUES (17, '太力户外黑胶天幕帐篷', 180, 4000, 'hu1.jpg', b'0', b'0', 'default.jpg', 0, 14, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/hu1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/hu2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/hu3.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/hu4.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/hu1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/hu2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/hu3.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力户外黑胶天幕帐篷露营野营野餐涂层防雨防晒方形便携遮阳棚');
INSERT INTO `t_product` VALUES (18, '太力冰箱保鲜袋食品袋', 30, 4000, 'hu1.jpg', b'0', b'0', 'default.jpg', 0, 15, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/shi1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/shi2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/shi3.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/shi4.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/shi1.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/shi2.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/shi3.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力冰箱保鲜袋食品袋家用食物密实袋自封袋密封袋食品级冷冻专用');
INSERT INTO `t_product` VALUES (19, '太力真空袋压缩袋', 54, 4000, 'ya31.jpg', b'0', b'1', '11.jpg', 1, 1, NULL, '<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/ya31.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/ya32.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/ya33.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productIntroImgs/ya34.jpg\'></img>\r\n', '<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/ya31.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/ya32.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/ya33.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/2222.jpg\'></img>\r\n<img width=\'100%\' src=\'http://localhost:8000/image/productParaImgs/1111.jpg\'></img>\r\n\r\n', '太力真空袋压缩袋免抽气大号棉被子整理衣物立体被褥神器收纳袋子');

-- ----------------------------
-- Table structure for t_product_swiper_image
-- ----------------------------
DROP TABLE IF EXISTS `t_product_swiper_image`;
CREATE TABLE `t_product_swiper_image`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `image` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `productId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product_swiper_image
-- ----------------------------
INSERT INTO `t_product_swiper_image` VALUES (1, 'ya1.jpg', 1, 1);
INSERT INTO `t_product_swiper_image` VALUES (2, 'ya2.jpg', 2, 1);
INSERT INTO `t_product_swiper_image` VALUES (3, 'ya3.jpg', 3, 1);
INSERT INTO `t_product_swiper_image` VALUES (4, 'ya4.jpg', 4, 1);
INSERT INTO `t_product_swiper_image` VALUES (5, 'ya21.jpg', 1, 2);
INSERT INTO `t_product_swiper_image` VALUES (6, 'ya22.jpg', 2, 2);
INSERT INTO `t_product_swiper_image` VALUES (7, 'ya23.jpg', 3, 2);
INSERT INTO `t_product_swiper_image` VALUES (8, 'ya24.jpg', 4, 2);
INSERT INTO `t_product_swiper_image` VALUES (9, 'xi1.jpg', 1, 3);
INSERT INTO `t_product_swiper_image` VALUES (10, 'xi2.jpg', 2, 3);
INSERT INTO `t_product_swiper_image` VALUES (11, 'xi3.jpg', 3, 3);
INSERT INTO `t_product_swiper_image` VALUES (12, 'xi4.jpg', 4, 3);
INSERT INTO `t_product_swiper_image` VALUES (13, 'xi21.jpg', 1, 4);
INSERT INTO `t_product_swiper_image` VALUES (14, 'xi22.jpg', 2, 4);
INSERT INTO `t_product_swiper_image` VALUES (15, 'xi23.jpg', 3, 4);
INSERT INTO `t_product_swiper_image` VALUES (16, 'xi24.jpg', 4, 4);
INSERT INTO `t_product_swiper_image` VALUES (17, 'zhi1.jpg', 1, 5);
INSERT INTO `t_product_swiper_image` VALUES (18, 'zhi2.jpg', 2, 5);
INSERT INTO `t_product_swiper_image` VALUES (19, 'zhi3.jpg', 3, 5);
INSERT INTO `t_product_swiper_image` VALUES (20, 'zhi4.jpg', 4, 5);
INSERT INTO `t_product_swiper_image` VALUES (21, 'zhi21.jpg', 1, 6);
INSERT INTO `t_product_swiper_image` VALUES (22, 'zhi22.jpg', 2, 6);
INSERT INTO `t_product_swiper_image` VALUES (23, 'zhi23.jpg', 3, 6);
INSERT INTO `t_product_swiper_image` VALUES (24, 'zhi24.jpg', 4, 6);
INSERT INTO `t_product_swiper_image` VALUES (25, 'chu1.jpg', 1, 7);
INSERT INTO `t_product_swiper_image` VALUES (26, 'chu2.jpg', 2, 7);
INSERT INTO `t_product_swiper_image` VALUES (27, 'chu3.jpg', 3, 7);
INSERT INTO `t_product_swiper_image` VALUES (28, 'chu4.jpg', 4, 7);
INSERT INTO `t_product_swiper_image` VALUES (29, 'chu21.jpg', 1, 8);
INSERT INTO `t_product_swiper_image` VALUES (30, 'chu22.jpg', 2, 8);
INSERT INTO `t_product_swiper_image` VALUES (31, 'chu23.jpg', 3, 8);
INSERT INTO `t_product_swiper_image` VALUES (32, 'chu24.jpg', 4, 8);
INSERT INTO `t_product_swiper_image` VALUES (33, 'chu31.jpg', 1, 9);
INSERT INTO `t_product_swiper_image` VALUES (34, 'chu32.jpg', 2, 9);
INSERT INTO `t_product_swiper_image` VALUES (35, 'chu33.jpg', 3, 9);
INSERT INTO `t_product_swiper_image` VALUES (36, 'chu34.jpg', 4, 9);
INSERT INTO `t_product_swiper_image` VALUES (37, 'wo1.jpg', 1, 10);
INSERT INTO `t_product_swiper_image` VALUES (38, 'wo2.jpg', 2, 10);
INSERT INTO `t_product_swiper_image` VALUES (39, 'wo3.jpg', 3, 10);
INSERT INTO `t_product_swiper_image` VALUES (40, 'wo21.jpg', 1, 11);
INSERT INTO `t_product_swiper_image` VALUES (41, 'wo22.jpg', 2, 11);
INSERT INTO `t_product_swiper_image` VALUES (42, 'wo23.jpg', 3, 11);
INSERT INTO `t_product_swiper_image` VALUES (43, 'wo24.jpg', 4, 11);
INSERT INTO `t_product_swiper_image` VALUES (44, 'yu21.jpg', 1, 12);
INSERT INTO `t_product_swiper_image` VALUES (45, 'yu22.jpg', 2, 12);
INSERT INTO `t_product_swiper_image` VALUES (46, 'yu23.jpg', 3, 12);
INSERT INTO `t_product_swiper_image` VALUES (47, 'yu24.jpg', 4, 12);
INSERT INTO `t_product_swiper_image` VALUES (48, 'yu31.jpg', 1, 13);
INSERT INTO `t_product_swiper_image` VALUES (49, 'yu32.jpg', 2, 13);
INSERT INTO `t_product_swiper_image` VALUES (50, 'yu33.jpg', 3, 13);
INSERT INTO `t_product_swiper_image` VALUES (51, 'yu34.jpg', 4, 13);
INSERT INTO `t_product_swiper_image` VALUES (52, 'yang1.jpg', 1, 14);
INSERT INTO `t_product_swiper_image` VALUES (53, 'yang2.jpg', 2, 14);
INSERT INTO `t_product_swiper_image` VALUES (54, 'yang3.jpg', 3, 14);
INSERT INTO `t_product_swiper_image` VALUES (55, 'yang4.jpg', 4, 14);
INSERT INTO `t_product_swiper_image` VALUES (56, 'yang21.jpg', 1, 15);
INSERT INTO `t_product_swiper_image` VALUES (57, 'yang22.jpg', 2, 15);
INSERT INTO `t_product_swiper_image` VALUES (58, 'yang23.jpg', 3, 15);
INSERT INTO `t_product_swiper_image` VALUES (59, 'yang24.jpg', 4, 15);
INSERT INTO `t_product_swiper_image` VALUES (60, 'chai1.jpg', 1, 16);
INSERT INTO `t_product_swiper_image` VALUES (61, 'chai2.jpg', 2, 16);
INSERT INTO `t_product_swiper_image` VALUES (62, 'chai3.jpg', 3, 16);
INSERT INTO `t_product_swiper_image` VALUES (63, 'chai4.jpg', 4, 16);
INSERT INTO `t_product_swiper_image` VALUES (64, 'hu1.jpg', 1, 17);
INSERT INTO `t_product_swiper_image` VALUES (65, 'hu2.jpg', 2, 17);
INSERT INTO `t_product_swiper_image` VALUES (66, 'hu3.jpg', 3, 17);
INSERT INTO `t_product_swiper_image` VALUES (67, 'hu4.jpg', 4, 17);
INSERT INTO `t_product_swiper_image` VALUES (68, 'shi1.jpg', 1, 18);
INSERT INTO `t_product_swiper_image` VALUES (69, 'shi2.jpg', 2, 18);
INSERT INTO `t_product_swiper_image` VALUES (70, 'shi3.jpg', 3, 18);
INSERT INTO `t_product_swiper_image` VALUES (71, 'shi4.jpg', 4, 18);
INSERT INTO `t_product_swiper_image` VALUES (72, 'ya31.jpg', 1, 19);
INSERT INTO `t_product_swiper_image` VALUES (73, 'ya32.jpg', 2, 19);
INSERT INTO `t_product_swiper_image` VALUES (74, 'ya33.jpg', 3, 19);
INSERT INTO `t_product_swiper_image` VALUES (75, 'ya34.jpg', 4, 19);

-- ----------------------------
-- Table structure for t_smalltype
-- ----------------------------
DROP TABLE IF EXISTS `t_smalltype`;
CREATE TABLE `t_smalltype`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bigTypeId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_smalltype
-- ----------------------------
INSERT INTO `t_smalltype` VALUES (1, 'Venus简约白', 'Venus简约白', 1);
INSERT INTO `t_smalltype` VALUES (2, '蓝色经典', '蓝色经典', 1);
INSERT INTO `t_smalltype` VALUES (3, 'NICE真空吸盘系列', 'NICE真空吸盘系列', 2);
INSERT INTO `t_smalltype` VALUES (4, '铁艺系列', '铁艺系列', 2);
INSERT INTO `t_smalltype` VALUES (5, '置物架', '置物架', 3);
INSERT INTO `t_smalltype` VALUES (6, '食品真空保鲜', '食品真空保鲜', 4);
INSERT INTO `t_smalltype` VALUES (7, '真空吸盘--NICE系列', '真空吸盘--NICE系列', 4);
INSERT INTO `t_smalltype` VALUES (8, '真空收纳', '真空收纳', 5);
INSERT INTO `t_smalltype` VALUES (9, '常规收纳', '常规收纳', 5);
INSERT INTO `t_smalltype` VALUES (10, '真空吸盘—NICE系列', '真空吸盘—NICE系列', 6);
INSERT INTO `t_smalltype` VALUES (11, '洗', '洗', 7);
INSERT INTO `t_smalltype` VALUES (12, '晒', '晒', 7);
INSERT INTO `t_smalltype` VALUES (13, '常规收纳', '常规收纳', 8);
INSERT INTO `t_smalltype` VALUES (14, '无骨充气帐篷', '无骨充气帐篷', 9);
INSERT INTO `t_smalltype` VALUES (15, '食品真空保鲜', '食品真空保鲜', 10);

-- ----------------------------
-- Table structure for t_wxuserinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_wxuserinfo`;
CREATE TABLE `t_wxuserinfo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `openid` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatarUrl` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerDate` datetime(0) NULL DEFAULT NULL,
  `lastLoginDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wxuserinfo
-- ----------------------------
INSERT INTO `t_wxuserinfo` VALUES (1, 'o00sM5ZR6uXEEuzFOjbUIFgH8-To', 'Killua', 'https://thirdwx.qlogo.cn/mmopen/vi_32/gFgXhVibyHlz58vYPIKtOeJI4ecPkIsQxhIVXczPaO3Jcdfiaichz7MG48eic1fzibibuwrlr5dwAbqgy3EGH2Qcl0Fw/132', '2023-02-21 17:06:55', '2023-03-05 19:41:50');
INSERT INTO `t_wxuserinfo` VALUES (2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (4, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (7, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (8, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (9, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_wxuserinfo` VALUES (11, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
