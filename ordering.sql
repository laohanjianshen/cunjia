/*
Navicat MySQL Data Transfer

Source Server         : fuwuqi
Source Server Version : 50711
Source Host           : 192.168.1.250:3306
Source Database       : ordering

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2018-06-08 12:59:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `address_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `user_id` int(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `address_name` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收件人姓名',
  `address_sex` int(10) NOT NULL DEFAULT '0' COMMENT '收件人性别：0、男性；1、女性',
  `address_phone` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `location_id` int(20) NOT NULL DEFAULT '0' COMMENT '位置id',
  `address_default` int(10) NOT NULL DEFAULT '0' COMMENT '是否为默认地址：0、否；1、是、99=作废',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='支持配送的大厦';

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('1', '1', '陈雨川', '1', '13350119137', '1', '1');
INSERT INTO `addresses` VALUES ('3', '1', '黄一帆', '0', '12345646544', '2', '1');
INSERT INTO `addresses` VALUES ('5', '1', 'string', '0', 'string', '0', '1');
INSERT INTO `addresses` VALUES ('6', '0', 'string1', '1', 'string1', '0', '1');
INSERT INTO `addresses` VALUES ('10', '33', '张嘉璐', '1', '17764530241', '3', '1');
INSERT INTO `addresses` VALUES ('11', '33', '张嘉璐', '1', '17764530241', '4', '1');
INSERT INTO `addresses` VALUES ('12', '33', 'yyy', '1', '12345678910', '3', '1');
INSERT INTO `addresses` VALUES ('13', '59', 'string', '0', 'string', '0', '0');
INSERT INTO `addresses` VALUES ('17', '32', '张嘉璐', '1', '17764530241', '1', '1');
INSERT INTO `addresses` VALUES ('18', '59', '叶子', '0', '17764530241', '4', '99');
INSERT INTO `addresses` VALUES ('19', '59', 'd\'d\'d', '1', '17764530243', '1', '0');
INSERT INTO `addresses` VALUES ('20', '59', 'dddd', '0', '12345698741', '4', '1');
INSERT INTO `addresses` VALUES ('21', '32', '张嘉璐', '1', '12346578908', '1', '1');
INSERT INTO `addresses` VALUES ('22', '39', 'fsdfdsfdsfds', '0', '11456978956', '2', '1');
INSERT INTO `addresses` VALUES ('23', '39', '大师傅似的', '1', '17764530249', '2', '1');
INSERT INTO `addresses` VALUES ('24', '39', '张嘉璐', '1', '17764530241', '3', '1');
INSERT INTO `addresses` VALUES ('25', '39', 'dfgds', '1', '12345678985', '5', '1');
INSERT INTO `addresses` VALUES ('26', '39', 'www', '0', '12345678998', '1', '1');
INSERT INTO `addresses` VALUES ('27', '39', 'fdgdf', '0', '12345678909', '2', '1');
INSERT INTO `addresses` VALUES ('28', '39', 'fghdf', '1', '12345678985', '3', '1');
INSERT INTO `addresses` VALUES ('29', '39', 'df', '0', '12345678985', '3', '1');
INSERT INTO `addresses` VALUES ('30', '39', 'dfsd', '0', '78963214565', '3', '1');
INSERT INTO `addresses` VALUES ('31', '39', 'hbfg', '0', '12341567898', '2', '1');
INSERT INTO `addresses` VALUES ('32', '39', 'dsfsd', '0', '12345678952', '2', '1');
INSERT INTO `addresses` VALUES ('33', '39', '45646', '0', '64564464669', '4', '1');
INSERT INTO `addresses` VALUES ('34', '39', 'dsf', '0', '78965412301', '1', '1');
INSERT INTO `addresses` VALUES ('35', '39', '虎扑jrs', '0', '17764530241', '3', '1');
INSERT INTO `addresses` VALUES ('36', '39', '否定的', '0', '12345678908', '4', '1');
INSERT INTO `addresses` VALUES ('37', '39', '张嘉璐', '1', '17764530241', '3', '1');
INSERT INTO `addresses` VALUES ('38', '39', '就很好', '0', '17764530241', '3', '1');
INSERT INTO `addresses` VALUES ('39', '51', '张嘉璐', '0', '17764530241', '1', '99');
INSERT INTO `addresses` VALUES ('40', '51', '张无忌', '0', '17764530241', '2', '99');
INSERT INTO `addresses` VALUES ('41', '51', '虎扑路人', '0', '17764530245', '1', '99');
INSERT INTO `addresses` VALUES ('42', '51', '从学校', '0', '17764530241', '1', '0');
INSERT INTO `addresses` VALUES ('43', '51', '张嘉璐', '0', '17764530333', '3', '99');
INSERT INTO `addresses` VALUES ('44', '51', '张嘉璐', '1', '17764530541', '1', '0');
INSERT INTO `addresses` VALUES ('45', '60', '陆月炎', '1', '19956325487', '5', '99');
INSERT INTO `addresses` VALUES ('46', '62', '靳楠楠', '0', '18309203830', '1', '1');
INSERT INTO `addresses` VALUES ('47', '51', '发发发方法', '0', '17764530247', '5', '0');
INSERT INTO `addresses` VALUES ('48', '51', '发llll', '0', '17764530248', '3', '99');
INSERT INTO `addresses` VALUES ('49', '51', '发llll', '0', '17764530248', '1', '99');
INSERT INTO `addresses` VALUES ('50', '51', 'zjl', '0', '17764530241', '3', '99');
INSERT INTO `addresses` VALUES ('51', '51', 'zjle', '0', '17764530241', '3', '99');
INSERT INTO `addresses` VALUES ('52', '51', 'zhgfh', '0', '17764530241', '3', '99');
INSERT INTO `addresses` VALUES ('53', '51', 'yjtr', '0', '17798745654', '4', '99');
INSERT INTO `addresses` VALUES ('54', '51', 'gfgfh', '0', '17764530241', '5', '99');
INSERT INTO `addresses` VALUES ('55', '60', '凤飞飞', '1', '17823456789', '1', '99');
INSERT INTO `addresses` VALUES ('56', '60', 'fff', '1', '17854333333', '2', '99');
INSERT INTO `addresses` VALUES ('57', '60', 'zjl', '0', '17854341237', '4', '99');
INSERT INTO `addresses` VALUES ('58', '51', 'cxz', '0', '17764530241', '3', '99');
INSERT INTO `addresses` VALUES ('59', '51', 'xc', '0', '15647895422', '3', '99');
INSERT INTO `addresses` VALUES ('60', '51', 'fdfd', '0', '17764530241', '4', '0');
INSERT INTO `addresses` VALUES ('61', '51', '周杰伦', '1', '17764530544', '2', '0');
INSERT INTO `addresses` VALUES ('62', '51', 'dgd', '0', '17365489875', '2', '0');
INSERT INTO `addresses` VALUES ('63', '51', '张无忌', '0', '17764530241', '3', '0');
INSERT INTO `addresses` VALUES ('64', '64', '胡永恒', '0', '13429101356', '4', '0');
INSERT INTO `addresses` VALUES ('65', '60', 'qqq', '1', '17834567890', '2', '0');
INSERT INTO `addresses` VALUES ('66', '60', 'zjl', '0', '17854341237', '3', '99');
INSERT INTO `addresses` VALUES ('67', '60', 'zjl', '0', '17854341237', '1', '0');
INSERT INTO `addresses` VALUES ('68', '59', '啦啦啦', '1', '15236482369', '2', '0');
INSERT INTO `addresses` VALUES ('69', '59', '来咯', '1', '15236593658', '2', '0');
INSERT INTO `addresses` VALUES ('70', '51', '虎扑路人', '0', '17764530244', '1', '0');
INSERT INTO `addresses` VALUES ('71', '51', '张嘉璐', '0', '17764530333', '3', '0');
INSERT INTO `addresses` VALUES ('72', '51', '张嘉璐', '0', '17764530241', '4', '0');
INSERT INTO `addresses` VALUES ('73', '61', '六千', '1', '13636363636', '1', '0');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `banner_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `banner_url` varchar(200) NOT NULL DEFAULT '' COMMENT '图片url',
  `banner_detail_url` varchar(200) NOT NULL DEFAULT '' COMMENT '详情url',
  `banner_type` tinyint(2) DEFAULT '1' COMMENT '类型：1 = 轮播图， 2 = 广告',
  `banner_status` tinyint(2) DEFAULT '0' COMMENT '状态：0=未启用 1=启用 99=作废',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='轮播图和广告图';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `banner` VALUES ('2', '2', '2', '2', '1');

-- ----------------------------
-- Table structure for box_lunch
-- ----------------------------
DROP TABLE IF EXISTS `box_lunch`;
CREATE TABLE `box_lunch` (
  `box_lunch_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '盒饭id',
  `category_id` int(10) NOT NULL COMMENT '盒饭类型id',
  `box_lunch_name` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '盒饭名称',
  `box_lunch_price` decimal(10,2) NOT NULL COMMENT '盒饭价格',
  `box_lunch_sale_price` decimal(10,2) NOT NULL COMMENT '盒饭折扣价',
  `box_lunch_desc` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '盒饭描述',
  `box_lunch_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '盒饭创建时间',
  `box_lunch_update_time` timestamp NOT NULL DEFAULT '2018-05-28 16:56:38' COMMENT '盒饭信息更新时间',
  `box_lunch_status` int(2) NOT NULL DEFAULT '0' COMMENT '盒饭状态：0、未上架，1、上架中，2、折扣中，3、已售完 99=已作废',
  `box_lunch_like_number` int(10) NOT NULL DEFAULT '0' COMMENT '盒饭点赞数量',
  `box_lunch_sold_number` int(10) NOT NULL DEFAULT '0' COMMENT '盒饭已卖数量',
  `box_lunch_images_url` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '盒饭图片url',
  `box_lunch_detail` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '盒饭详情图片url',
  `default_sku_id` int(10) DEFAULT '0' COMMENT '盒饭sku首选id：0，单品',
  `box_lunch_remain_number` int(10) NOT NULL DEFAULT '0' COMMENT '盒饭库存',
  `box_lunch_surface_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '盒饭包装价格',
  `box_lunch_is_fire` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上月爆款 0 否，1是',
  `box_lunch_is_condiment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '盒饭是否有调料包 0 否 1 是',
  PRIMARY KEY (`box_lunch_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of box_lunch
-- ----------------------------
INSERT INTO `box_lunch` VALUES ('1', '3', '锅包肉', '13.00', '16.00', '美味', '2018-06-05 14:18:03', '2018-05-16 09:12:54', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '午餐', '7', '0', '0.00', '0', '0');
INSERT INTO `box_lunch` VALUES ('2', '1', '红烧鸡腿', '10.20', '8.30', '好吃的一批', '2018-06-05 14:18:07', '2018-05-18 11:21:33', '1', '100', '50', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '这是爆款啊', '6', '102', '0.00', '1', '1');
INSERT INTO `box_lunch` VALUES ('3', '1', '鱼排', '15.00', '11.00', '还行吧', '2018-06-05 14:18:09', '2018-05-16 09:16:41', '1', '1001', '30', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '好东西啊', '5', '105', '10.00', '1', '0');
INSERT INTO `box_lunch` VALUES ('4', '1', '红烧狮子头', '99.00', '87.00', '味道很好', '2018-06-05 14:18:10', '2018-05-21 11:01:40', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '热卖食物哦', '0', '0', '3.00', '1', '0');
INSERT INTO `box_lunch` VALUES ('5', '3', '板栗烧鸡', '23.00', '56.00', '不错哦', '2018-06-05 14:18:11', '2018-05-16 09:17:57', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '秋季美味', '3', '0', '0.00', '0', '1');
INSERT INTO `box_lunch` VALUES ('6', '3', '黄豆焖猪肉', '17.00', '26.00', '不油腻的猪肉', '2018-06-05 14:18:12', '2018-05-16 09:18:37', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '味道很好', '2', '0', '0.00', '0', '0');
INSERT INTO `box_lunch` VALUES ('7', '2', '黄豆焖猪肉', '17.00', '23.00', '不油腻猪肉', '2018-06-05 14:18:13', '2018-05-16 08:43:50', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '不错的午餐', '1', '0', '0.00', '0', '0');
INSERT INTO `box_lunch` VALUES ('8', '1', '宫爆鸡丁', '16.00', '15.00', '好吃不贵', '2018-06-05 14:18:14', '2018-05-16 09:20:05', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '好吃不贵', '8', '0', '0.00', '0', '0');
INSERT INTO `box_lunch` VALUES ('11', '3', '东坡肉', '15.00', '10.00', 'www.baidu.com', '2018-06-05 14:18:15', '2018-05-28 16:56:38', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '美味', '9', '0', '0.00', '0', '0');
INSERT INTO `box_lunch` VALUES ('12', '2', '炸酱面', '15.00', '17.00', '很清凉的面', '2018-06-05 14:18:19', '2018-05-28 16:56:38', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '特色的零食', '4', '5', '0.00', '0', '0');
INSERT INTO `box_lunch` VALUES ('13', '1', '热干面', '13.00', '18.00', '武汉小吃', '2018-06-05 14:18:22', '2018-05-28 16:56:38', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '武汉大众食物', '7', '3', '9.00', '0', '0');
INSERT INTO `box_lunch` VALUES ('14', '1', '方便面', '16.00', '19.00', 'fangbianmian', '2018-06-05 14:18:24', '2018-05-28 16:56:38', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '', '3', '2', '8.00', '0', '0');

-- ----------------------------
-- Table structure for box_lunch_food
-- ----------------------------
DROP TABLE IF EXISTS `box_lunch_food`;
CREATE TABLE `box_lunch_food` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `box_lunch_id` int(20) NOT NULL DEFAULT '0' COMMENT '盒饭id',
  `food_id` int(20) NOT NULL DEFAULT '0' COMMENT '食品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of box_lunch_food
-- ----------------------------
INSERT INTO `box_lunch_food` VALUES ('1', '2', '2');
INSERT INTO `box_lunch_food` VALUES ('3', '2', '3');
INSERT INTO `box_lunch_food` VALUES ('4', '3', '4');
INSERT INTO `box_lunch_food` VALUES ('5', '3', '5');
INSERT INTO `box_lunch_food` VALUES ('6', '3', '6');
INSERT INTO `box_lunch_food` VALUES ('7', '4', '1');
INSERT INTO `box_lunch_food` VALUES ('10', '5', '5');
INSERT INTO `box_lunch_food` VALUES ('11', '5', '4');

-- ----------------------------
-- Table structure for box_lunch_praise
-- ----------------------------
DROP TABLE IF EXISTS `box_lunch_praise`;
CREATE TABLE `box_lunch_praise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `box_lunch_id` int(11) NOT NULL COMMENT '盒饭id',
  `box_lunch_praise_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否取消点赞 0=已点赞 1=已取消点赞',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='盒饭点赞记录表';

-- ----------------------------
-- Records of box_lunch_praise
-- ----------------------------
INSERT INTO `box_lunch_praise` VALUES ('49', '59', '564', '1');
INSERT INTO `box_lunch_praise` VALUES ('50', '59', '554', '1');
INSERT INTO `box_lunch_praise` VALUES ('51', '59', '563', '1');
INSERT INTO `box_lunch_praise` VALUES ('52', '59', '553', '1');
INSERT INTO `box_lunch_praise` VALUES ('53', '59', '552', '0');
INSERT INTO `box_lunch_praise` VALUES ('54', '59', '551', '0');
INSERT INTO `box_lunch_praise` VALUES ('55', '59', '550', '0');
INSERT INTO `box_lunch_praise` VALUES ('56', '59', '549', '0');
INSERT INTO `box_lunch_praise` VALUES ('57', '59', '548', '0');
INSERT INTO `box_lunch_praise` VALUES ('58', '59', '546', '0');
INSERT INTO `box_lunch_praise` VALUES ('59', '59', '510', '0');

-- ----------------------------
-- Table structure for box_lunch_sku
-- ----------------------------
DROP TABLE IF EXISTS `box_lunch_sku`;
CREATE TABLE `box_lunch_sku` (
  `sku_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '盒饭sku id',
  `box_lunch_id` int(11) NOT NULL DEFAULT '0' COMMENT '盒饭id',
  `sku_name` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '盒饭sku名称',
  `sku_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '盒饭sku原价',
  `sku_sale_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '盒饭sku折扣价',
  `sku_status` int(2) NOT NULL DEFAULT '0' COMMENT '盒饭sku状态：0、未上架，1、上架中，2、折扣中，3、已售完',
  `sku_surface_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '盒饭包装价格',
  `sku_send_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '盒饭配送价格',
  PRIMARY KEY (`sku_id`),
  KEY `box_lunch_id` (`box_lunch_id`)
) ENGINE=MyISAM AUTO_INCREMENT=799 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of box_lunch_sku
-- ----------------------------
INSERT INTO `box_lunch_sku` VALUES ('6', '2', '白银套餐', '8.80', '6.60', '1', '0.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('5', '3', '黄金套餐', '6.60', '4.50', '1', '3.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('7', '1', '亲民套餐', '9.90', '10.00', '1', '0.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('4', '8', '瘦身套餐', '5.50', '6.60', '1', '0.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('3', '5', '美白套餐', '7.70', '8.80', '1', '0.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('2', '6', '盖浇饭套餐', '5.50', '7.70', '1', '0.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('1', '7', '紫菜包饭套餐', '5.50', '6.60', '1', '0.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('666', '3', '白银套餐', '8.80', '6.60', '1', '0.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('668', '2', '黄金套餐', '6.60', '4.50', '1', '0.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('8', '8', '能量热餐', '0.00', '0.00', '1', '0.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('9', '0', '汤面类', '0.00', '0.00', '1', '0.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('10', '3', '大餐', '8.00', '7.50', '1', '5.00', '0.00');
INSERT INTO `box_lunch_sku` VALUES ('11', '111', '盖浇饭套餐', '0.01', '0.01', '0', '0.00', '0.00');

-- ----------------------------
-- Table structure for box_lunch_types
-- ----------------------------
DROP TABLE IF EXISTS `box_lunch_types`;
CREATE TABLE `box_lunch_types` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '盒饭类型id',
  `category_name` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '盒饭类型名称',
  `category_desc` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '盒饭类型描述',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of box_lunch_types
-- ----------------------------
INSERT INTO `box_lunch_types` VALUES ('1', '商务套餐', '商务套餐');
INSERT INTO `box_lunch_types` VALUES ('2', '自助点餐', '自助点餐');
INSERT INTO `box_lunch_types` VALUES ('3', '经济套餐', '经济套餐');
INSERT INTO `box_lunch_types` VALUES ('4', '盖浇饭', '盖浇饭');

-- ----------------------------
-- Table structure for cart_history
-- ----------------------------
DROP TABLE IF EXISTS `cart_history`;
CREATE TABLE `cart_history` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cart_id` int(20) NOT NULL DEFAULT '0' COMMENT '购物车id',
  `box_lunch_id` int(20) NOT NULL DEFAULT '0' COMMENT '盒饭Id',
  `box_lunch_number` int(11) NOT NULL DEFAULT '0' COMMENT '盒饭数量',
  `box_lunch_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '盒饭单价',
  `box_lunch_type` int(2) NOT NULL DEFAULT '0' COMMENT '购物车类型,0:个人点餐,1:自助点餐',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品sku的Id',
  `box_lunch_date` bigint(20) NOT NULL DEFAULT '0' COMMENT '订购那一天的盒饭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cart_history
-- ----------------------------
INSERT INTO `cart_history` VALUES ('7', '1', '2', '10', '12.58', '0', '0', '20180514102559');
INSERT INTO `cart_history` VALUES ('3', '1', '3', '4', '0.00', '1', '1', '20180514102559');
INSERT INTO `cart_history` VALUES ('4', '0', '2', '4', '0.00', '1', '2', '20180514102559');
INSERT INTO `cart_history` VALUES ('5', '0', '3', '100', '10.50', '1', '3', '20180514102559');
INSERT INTO `cart_history` VALUES ('48', '0', '3', '4', '55.00', '0', '0', '20180514102559');

-- ----------------------------
-- Table structure for cart_personal
-- ----------------------------
DROP TABLE IF EXISTS `cart_personal`;
CREATE TABLE `cart_personal` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `box_lunch_id` int(20) NOT NULL,
  `box_lunch_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '盒饭名称',
  `box_lunch_number` int(20) NOT NULL,
  `box_lunch_sale_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '盒饭折扣价',
  `box_lunch_type` int(10) DEFAULT NULL COMMENT '0:不含sku,1:含sku',
  `sku_id` int(20) DEFAULT NULL,
  `box_lunch_date` bigint(20) NOT NULL DEFAULT '0' COMMENT '盒饭订购日期',
  `box_lunch_image_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '盒饭图片地址',
  `condiment_id` int(20) DEFAULT NULL COMMENT '调料Id',
  `condiment_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调料名',
  `box_lunch_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '盒饭原价',
  `box_lunch_discount_date` bigint(20) DEFAULT NULL COMMENT '盒饭优惠截止时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cart_personal
-- ----------------------------
INSERT INTO `cart_personal` VALUES ('257', '64', '2', '白银套餐', '1', '6.60', '1', '6', '1528509603000', 'http://xxx.jpg', null, null, '8.80', null);
INSERT INTO `cart_personal` VALUES ('259', '64', '4', '红烧狮子头', '1', '87.00', '0', null, '1528509603000', '', null, null, '99.00', null);
INSERT INTO `cart_personal` VALUES ('260', '59', '4', '红烧狮子头', '20', '87.00', '0', null, '1528509603000', '', null, null, '99.00', null);
INSERT INTO `cart_personal` VALUES ('262', '61', '2', '白银套餐', '1', '6.60', '1', '6', '1528509603000', 'http://xxx.jpg', null, null, '8.80', null);
INSERT INTO `cart_personal` VALUES ('263', '61', '4', '红烧狮子头', '1', '87.00', '0', null, '1528509603000', '', null, null, '99.00', null);

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `city_name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '市',
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '杭州市');
INSERT INTO `city` VALUES ('2', '上海');
INSERT INTO `city` VALUES ('17', '北京');
INSERT INTO `city` VALUES ('18', '北京');
INSERT INTO `city` VALUES ('19', '北京');
INSERT INTO `city` VALUES ('20', '北京');
INSERT INTO `city` VALUES ('21', '北京');
INSERT INTO `city` VALUES ('22', '北京');
INSERT INTO `city` VALUES ('23', '北京');
INSERT INTO `city` VALUES ('24', '北京');
INSERT INTO `city` VALUES ('25', '北京');
INSERT INTO `city` VALUES ('26', '北京');
INSERT INTO `city` VALUES ('27', '北京');
INSERT INTO `city` VALUES ('28', '北京');
INSERT INTO `city` VALUES ('29', '北京');
INSERT INTO `city` VALUES ('30', '北京');
INSERT INTO `city` VALUES ('31', '北京');
INSERT INTO `city` VALUES ('32', '北京');
INSERT INTO `city` VALUES ('33', '北京');

-- ----------------------------
-- Table structure for comment_first_level
-- ----------------------------
DROP TABLE IF EXISTS `comment_first_level`;
CREATE TABLE `comment_first_level` (
  `comment_first_level_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(20) DEFAULT NULL COMMENT '商品id 来源为1对应box_lunch,来源为2对应foods',
  `flavor` tinyint(1) DEFAULT NULL COMMENT '口味',
  `packing` tinyint(1) DEFAULT NULL COMMENT '包装',
  `comment_detail` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '评论详情',
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `picture_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '图片url',
  `comment_source` tinyint(1) DEFAULT NULL COMMENT '评价来源 1=盒饭,2=食物',
  `praise_number` int(20) DEFAULT '0' COMMENT '点赞数量',
  `is_anonymous` tinyint(1) DEFAULT '0' COMMENT '是否匿名0=否 1=是',
  `total_evaluate` tinyint(1) DEFAULT '0' COMMENT '总评价(1=差，2=一般，3=还不错，4=很满意，5=强烈推荐)',
  `comment_number` int(20) DEFAULT '0' COMMENT '二级评论总数量',
  PRIMARY KEY (`comment_first_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=634 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='一级评论';

-- ----------------------------
-- Records of comment_first_level
-- ----------------------------
INSERT INTO `comment_first_level` VALUES ('510', '59', '2', '4', '4', '的方式是', '2018-05-15 15:30:12', 'http://tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.fN0ad7RtDJxT6c4d87af67ff7f59258cd224ac2285c2.png', '1', '1', '0', '4', '0');
INSERT INTO `comment_first_level` VALUES ('511', '59', '2', '4', '4', '这是测试', '2018-05-15 15:35:03', 'http://tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.nLPZWI4t8lP2460407b67289ced92d0d5d8783babcc6.png', '1', '0', '1', '4', '0');
INSERT INTO `comment_first_level` VALUES ('512', '59', '2', '4', '5', '的撒', '2018-05-15 15:35:29', 'http://tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.ZhYKStuNDroa6c4d87af67ff7f59258cd224ac2285c2.png', '1', '0', '0', '4', '0');
INSERT INTO `comment_first_level` VALUES ('513', '59', '2', '5', '5', '111111111111111111111111', '2018-05-15 15:37:08', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('514', '59', '2', '5', '5', '', '2018-05-15 15:44:28', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('515', '59', '2', '4', '4', '讽德诵功', '2018-05-16 09:42:00', 'http://tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Ggm0Z9D3IvhR6c4d87af67ff7f59258cd224ac2285c2.png', '1', '0', '0', '4', '0');
INSERT INTO `comment_first_level` VALUES ('516', '59', '2', '5', '5', '', '2018-05-16 09:46:48', '0', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('517', '59', '2', '5', '5', '', '2018-05-16 09:47:15', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('518', '59', '2', '5', '5', '', '2018-05-16 09:47:52', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('519', '59', '2', '5', '5', '', '2018-05-16 09:48:16', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('520', '59', '2', '5', '5', '', '2018-05-16 09:49:06', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('521', '59', '2', '5', '5', '', '2018-05-16 09:49:30', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('522', '59', '2', '5', '5', '', '2018-05-16 09:50:10', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('523', '59', '2', '5', '5', '', '2018-05-16 09:50:33', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('524', '59', '2', '5', '5', '', '2018-05-16 09:51:33', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('525', '59', '2', '5', '5', '', '2018-05-16 09:51:44', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('526', '59', '2', '5', '5', '', '2018-05-16 09:52:05', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('527', '59', '2', '5', '5', '', '2018-05-16 09:52:29', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('528', '59', '2', '5', '5', '', '2018-05-16 09:52:48', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('529', '59', '2', '5', '5', '', '2018-05-16 09:56:46', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('530', '59', '2', '5', '5', '', '2018-05-16 09:57:15', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('531', '59', '2', '5', '5', '', '2018-05-16 09:58:48', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('532', '59', '2', '5', '5', '', '2018-05-16 09:59:00', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('533', '59', '2', '5', '5', '', '2018-05-16 10:00:31', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('534', '51', '2', '5', '5', '', '2018-05-16 10:12:48', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('535', '51', '2', '5', '5', '', '2018-05-16 10:12:53', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('536', '51', '2', '5', '5', 'dfsd dfdfdffdf dsfdsf ', '2018-05-16 10:13:47', 'http://tmp/wx7a8795e5bef769da.o6zAJs_vch9r9yQvxvmfVOAoy9kM.dIZX7cbbHxDw5fb5d15ffacc413f3517ceab667426db.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('537', '59', '2', '5', '5', 'zheshi ceshi', '2018-05-16 10:48:18', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('544', '51', '0', '0', '0', 'string', '2018-05-16 11:07:01', 'string', '0', '0', '0', '0', '0');
INSERT INTO `comment_first_level` VALUES ('545', '51', '0', '0', '0', 'string', '2018-05-16 11:07:32', 'string', '0', '0', '0', '0', '0');
INSERT INTO `comment_first_level` VALUES ('546', '51', '2', '5', '5', 'string', '2018-05-16 11:19:37', null, '1', '1', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('548', '59', '2', '5', '5', 'etgdr', '2018-05-16 11:33:11', '', '1', '1', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('549', '51', '2', '5', '5', 'WTGESRGEF', '2018-05-16 12:31:46', '', '1', '1', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('550', '51', '2', '5', '5', 'gsdgdsfgsd', '2018-05-16 12:33:34', '', '1', '1', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('551', '51', '2', '5', '5', 'gsdgdsfgsddsgf', '2018-05-16 12:33:39', '', '1', '1', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('552', '51', '2', '5', '5', 'sdgdsgsdfgs', '2018-05-16 12:34:48', '', '1', '1', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('553', '51', '2', '5', '5', 'sdgdsgsdfgs', '2018-05-16 12:34:50', '', '1', '0', '0', '5', '1');
INSERT INTO `comment_first_level` VALUES ('554', '51', '2', '5', '5', 'dsgfsd', '2018-05-16 12:35:14', '', '1', '0', '0', '5', '6');
INSERT INTO `comment_first_level` VALUES ('558', '51', null, null, null, null, '2018-05-16 14:14:44', null, null, '0', null, null, '0');
INSERT INTO `comment_first_level` VALUES ('559', '51', null, null, null, null, '2018-05-16 14:17:11', null, null, '0', null, null, '0');
INSERT INTO `comment_first_level` VALUES ('560', '51', null, null, null, null, '2018-05-16 14:19:29', null, null, '0', null, null, '0');
INSERT INTO `comment_first_level` VALUES ('561', '51', null, null, null, null, '2018-05-16 14:35:10', null, null, '0', null, null, '0');
INSERT INTO `comment_first_level` VALUES ('562', '51', null, null, null, null, '2018-05-16 14:35:55', null, null, '0', null, null, '0');
INSERT INTO `comment_first_level` VALUES ('563', '59', '2', '5', '5', 'zsdfdxg', '2018-05-16 14:37:31', '', '1', '0', '0', '5', '3');
INSERT INTO `comment_first_level` VALUES ('564', '59', '2', '5', '5', 'fdhfdgh', '2018-05-16 14:37:50', '', '1', '0', '0', '5', '10');
INSERT INTO `comment_first_level` VALUES ('565', '59', '2', '4', '4', '这是测试哈哈哈哈', '2018-05-21 12:57:02', 'http://tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Ts37Qxf1nFR65f7b7c8364b03af8be98772a959271bb.png,http://tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.p7EUHdgv1FJGde613f0e99c84a8d8def8c8f3462961c.png,http://tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.VEsI0b4LOFBrb805cccf98a8c4607928bee7e7c546ec.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('566', '59', '2', '5', '5', '这是测试哈哈哈哈哈哈哈 ', '2018-05-21 12:59:47', 'http://tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.liBKBBDcNmjZ755bb0fa1ab49f10284e31f360446dba.png,http://tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.UWGnAs1TK9IF3821ae8c291a90eeefa186f839f28988.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('567', '59', '2', '5', '5', '', '2018-05-21 13:00:32', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('568', '59', '2', '5', '5', '', '2018-05-21 15:15:30', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.5qFqS572CveUe7baa7f9b7d41c06e3ca9ab58aefa91c.png,http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.oPc1TzKVrR1Kda437426f4a0d60b3bdd21352be9458c.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('569', '59', '2', '5', '5', '', '2018-05-21 15:16:41', '/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.xc6lALueHvVj5f7b7c8364b03af8be98772a959271bb.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('570', '59', '2', '5', '5', '这是最终添加', '2018-05-21 15:21:24', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.aNEBTER0DN1J4379fb320e26b103282bfdf12107b09f.png,http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Y5QLX9iGDG6Yb805cccf98a8c4607928bee7e7c546ec.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('571', '51', '2', '5', '5', '', '2018-05-21 15:40:57', 'http://p8p794w7d.bkt.clouddn.com/tmp_172e3f1c75ca7fc93972341b8e7b17a5.jpg,http://p8p794w7d.bkt.clouddn.com/tmp_183a2e8cd506112b2992b0836e18d59e.jpg', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('572', '51', '2', '5', '5', '', '2018-05-21 15:43:06', 'http://p8p794w7d.bkt.clouddn.com/tmp_47709b1c97027b4d8f98a951340306f1.jpg', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('573', '51', '2', '5', '5', '', '2018-05-21 15:46:53', 'http://p8p794w7d.bkt.clouddn.com/tmp_4b3448fe649592cddda409a41ba0ab75.jpg', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('574', '51', '2', '5', '5', '', '2018-05-21 15:52:57', 'http://p8p794w7d.bkt.clouddn.com/tmp_90244980addad1de8d8a410532d2cbc1.jpg', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('575', '59', '2', '5', '5', '客家话艰苦', '2018-05-21 15:53:33', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Uq0TCfY2y1FHde613f0e99c84a8d8def8c8f3462961c.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('576', '59', '2', '5', '5', '合法u合法', '2018-05-21 16:08:11', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.AYaph1EjbMeH8f92cbeb8437e55ba380144698080ea9.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('577', '59', '2', '5', '5', '', '2018-05-21 16:09:09', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('578', '59', '2', '5', '5', '', '2018-05-21 16:10:31', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('579', '59', '2', '5', '5', '', '2018-05-21 16:16:45', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('580', '59', '2', '4', '5', '官方n你', '2018-05-21 16:17:07', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('581', '59', '2', '5', '5', '', '2018-05-21 16:21:24', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.R6yPCdgiCqfcf83f111ee95e439248edf6b0053a0a89.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('582', '59', '2', '5', '5', '', '2018-05-21 16:21:47', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.PO01rl8fnU0ef83f111ee95e439248edf6b0053a0a89.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('583', '59', '2', '5', '5', '', '2018-05-21 16:27:28', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.HsiiWxINVGR0f83f111ee95e439248edf6b0053a0a89.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('584', '51', '2', '5', '5', '', '2018-05-22 09:28:57', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('585', '59', '2', '5', '5', '', '2018-05-22 09:29:07', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('586', '59', '2', '5', '5', '', '2018-05-22 09:29:58', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.UodHacCKCXd15f7b7c8364b03af8be98772a959271bb.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('587', '59', '2', '5', '5', '你妈逼', '2018-05-25 13:54:02', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.GaVMHs5Si5hk1a56f49b6316bdcdf736548bf8524f7d.png', '1', '0', '0', '5', '1');
INSERT INTO `comment_first_level` VALUES ('588', '59', '2', '5', '5', '草你妈', '2018-05-25 13:54:48', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.knuJJ4lUiSC91a56f49b6316bdcdf736548bf8524f7d.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('589', '59', '2', '5', '5', '你好', '2018-05-25 13:56:06', 'http://p8p794w7d.bkt.clouddn.com/tmp_7098865eac19729f756e772ba6b8b509eb293db801b8ca5a.jpg', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('590', '60', '2', '5', '5', '叽叽咕咕', '2018-05-25 13:57:14', 'http://p8p794w7d.bkt.clouddn.com/tmp_46244eccb0055fed2aa9440e98bdc76f5d44768e3323a6d2.jpg', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('591', '59', '2', '5', '5', '草', '2018-05-25 14:10:39', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.azQc89qA8W4n610f295698a4f6c3330fa0c80bfc6537.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('592', '59', '2', '5', '5', '草你妈 *** **', '2018-05-25 14:11:14', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('593', '51', '2', '2', '4', '一般', '2018-05-28 15:28:40', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs_vch9r9yQvxvmfVOAoy9kM.wxrIWxBIAncK5fb5d15ffacc413f3517ceab667426db.png,http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs_vch9r9yQvxvmfVOAoy9kM.iQDH9bSBpszx5fb5d15ffacc413f3517ceab667426db.png', '1', '0', '0', '5', '6');
INSERT INTO `comment_first_level` VALUES ('594', '51', '2', '4', '4', '一般公共个呵呵呵呵呵vvvhhvhjj', '2018-05-29 10:15:41', 'http://p8p794w7d.bkt.clouddn.com/tmp_ad319886ae2ba33df94726db4e447a0e.jpg', '1', '0', '0', '3', '0');
INSERT INTO `comment_first_level` VALUES ('595', '59', '2', '4', '4', '水龙头5卡默默SJM呕吐', '2018-05-29 10:15:43', 'http://p8p794w7d.bkt.clouddn.com/tmp_cea4810670c0bf4fc06097ac5626e5cc7848b5d4f1a61492.jpg', '1', '0', '0', '4', '1');
INSERT INTO `comment_first_level` VALUES ('596', '64', '2', '4', '5', '旅途**舞啦咯来肉上', '2018-05-29 10:15:45', 'http://p8p794w7d.bkt.clouddn.com/tmp_ae5268c9435364c7adad4552df6ba726.jpg', '1', '0', '0', '4', '0');
INSERT INTO `comment_first_level` VALUES ('597', '64', '2', '1', '2', 'KTV图', '2018-05-29 12:40:42', 'http://p8p794w7d.bkt.clouddn.com/tmp_9d331d9ca50f92ce6145c2cf6ba5606a.jpg,http://p8p794w7d.bkt.clouddn.com/tmp_f91225fcbf42d533f816eda6d605602a.jpg,http://p8p794w7d.bkt.clouddn.com/tmp_cd682b651eb6d71948059feeb4aa8053.jpg', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('598', '59', '2', '5', '5', 'atfrs', '2018-05-29 13:21:07', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.dZeMAZ2n0DTK5f7b7c8364b03af8be98772a959271bb.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('599', '59', '2', '5', '5', 'dxfg ', '2018-05-29 13:26:15', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.R0tCcLErXfMl5f7b7c8364b03af8be98772a959271bb.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('600', '59', '2', '5', '5', 'gfdsgfds', '2018-05-29 13:26:39', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('601', '59', '2', '5', '5', 'dfgdg', '2018-05-29 13:27:07', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('602', '59', '2', '5', '5', 'dfg', '2018-05-29 13:27:57', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('603', '59', '2', '5', '5', 'dsf', '2018-05-29 13:35:37', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('604', '59', '2', '5', '5', 'hgh', '2018-05-29 13:38:49', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('605', '59', '2', '5', '5', '', '2018-05-29 13:39:45', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('606', '59', '2', '5', '5', '', '2018-05-29 13:40:42', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('607', '59', '2', '5', '5', 'dsf', '2018-05-29 13:41:57', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('608', '59', '2', '5', '5', '', '2018-05-29 13:42:14', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('609', '59', '2', '5', '5', '', '2018-05-29 13:43:02', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('610', '59', '2', '5', '5', 'fsdf', '2018-05-29 13:54:14', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('611', '59', '2', '5', '5', '', '2018-05-29 13:54:47', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('612', '51', '2', '5', '5', '', '2018-05-29 13:54:58', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('613', '59', '2', '5', '5', '', '2018-05-29 13:59:29', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('614', '51', '2', '5', '5', '', '2018-05-29 13:59:31', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('615', '59', '2', '5', '5', '', '2018-05-29 13:59:40', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('616', '59', '2', '5', '5', '', '2018-05-29 14:01:37', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('617', '51', '2', '1', '1', '奋斗', '2018-05-29 14:01:39', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('618', '59', '2', '5', '5', '', '2018-05-29 14:03:27', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('619', '51', '2', '3', '5', '你好', '2018-05-29 14:05:16', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('620', '59', '2', '5', '5', '', '2018-05-29 14:05:27', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('621', '59', '2', '5', '5', '', '2018-05-29 14:06:51', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('622', '59', '2', '5', '5', '', '2018-05-29 14:08:05', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('623', '59', '2', '5', '5', '', '2018-05-29 14:08:20', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('624', '51', '2', '5', '4', '烟灰缸', '2018-05-29 14:08:25', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('625', '64', '2', '5', '5', '', '2018-05-29 14:12:34', '', '1', '0', '0', '5', '1');
INSERT INTO `comment_first_level` VALUES ('626', '64', '2', '5', '5', '', '2018-05-29 15:10:59', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('627', '65', '2', '3', '2', '滚滚滚古古怪怪', '2018-05-29 15:16:02', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('628', '64', '2', '5', '5', '', '2018-05-31 09:38:30', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('629', '64', '2', '5', '5', '', '2018-05-31 13:07:01', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('630', '64', '2', '5', '5', '', '2018-05-31 13:20:27', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('631', '59', '2', '4', '4', '发生大幅度', '2018-06-04 11:12:13', '', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('632', '59', '2', '5', '5', '这是饭', '2018-06-05 14:00:57', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.qRPSHOIbiCdp3b42fb766a482d217ec9e0a70a014124.png', '1', '0', '0', '5', '0');
INSERT INTO `comment_first_level` VALUES ('633', '59', '2', '5', '5', 'V型成本', '2018-06-05 14:05:28', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '1', '0', '0', '5', '0');

-- ----------------------------
-- Table structure for comment_first_level_describe
-- ----------------------------
DROP TABLE IF EXISTS `comment_first_level_describe`;
CREATE TABLE `comment_first_level_describe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_describe_id` int(20) NOT NULL COMMENT '商品描述id',
  `comment_first_level_id` int(11) NOT NULL COMMENT '一级评论id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=625 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='一级评价关联商品描述表';

-- ----------------------------
-- Records of comment_first_level_describe
-- ----------------------------
INSERT INTO `comment_first_level_describe` VALUES ('509', '0', '544');
INSERT INTO `comment_first_level_describe` VALUES ('510', '0', '545');
INSERT INTO `comment_first_level_describe` VALUES ('511', '1', '545');
INSERT INTO `comment_first_level_describe` VALUES ('512', '3', '546');
INSERT INTO `comment_first_level_describe` VALUES ('513', '6', '546');
INSERT INTO `comment_first_level_describe` VALUES ('514', '7', '546');
INSERT INTO `comment_first_level_describe` VALUES ('515', '6', '549');
INSERT INTO `comment_first_level_describe` VALUES ('516', '7', '549');
INSERT INTO `comment_first_level_describe` VALUES ('517', '3', '550');
INSERT INTO `comment_first_level_describe` VALUES ('518', '6', '550');
INSERT INTO `comment_first_level_describe` VALUES ('519', '3', '551');
INSERT INTO `comment_first_level_describe` VALUES ('520', '6', '551');
INSERT INTO `comment_first_level_describe` VALUES ('521', '2', '552');
INSERT INTO `comment_first_level_describe` VALUES ('522', '3', '552');
INSERT INTO `comment_first_level_describe` VALUES ('523', '6', '552');
INSERT INTO `comment_first_level_describe` VALUES ('524', '2', '553');
INSERT INTO `comment_first_level_describe` VALUES ('525', '3', '553');
INSERT INTO `comment_first_level_describe` VALUES ('526', '6', '553');
INSERT INTO `comment_first_level_describe` VALUES ('527', '3', '554');
INSERT INTO `comment_first_level_describe` VALUES ('528', '6', '554');
INSERT INTO `comment_first_level_describe` VALUES ('529', '3', '562');
INSERT INTO `comment_first_level_describe` VALUES ('530', '6', '562');
INSERT INTO `comment_first_level_describe` VALUES ('531', '3', '563');
INSERT INTO `comment_first_level_describe` VALUES ('532', '6', '563');
INSERT INTO `comment_first_level_describe` VALUES ('533', '3', '564');
INSERT INTO `comment_first_level_describe` VALUES ('534', '6', '564');
INSERT INTO `comment_first_level_describe` VALUES ('535', '4', '565');
INSERT INTO `comment_first_level_describe` VALUES ('536', '8', '565');
INSERT INTO `comment_first_level_describe` VALUES ('537', '4', '566');
INSERT INTO `comment_first_level_describe` VALUES ('538', '5', '566');
INSERT INTO `comment_first_level_describe` VALUES ('539', '8', '566');
INSERT INTO `comment_first_level_describe` VALUES ('540', '4', '568');
INSERT INTO `comment_first_level_describe` VALUES ('541', '8', '568');
INSERT INTO `comment_first_level_describe` VALUES ('542', '8', '569');
INSERT INTO `comment_first_level_describe` VALUES ('543', '4', '570');
INSERT INTO `comment_first_level_describe` VALUES ('544', '8', '570');
INSERT INTO `comment_first_level_describe` VALUES ('545', '4', '571');
INSERT INTO `comment_first_level_describe` VALUES ('546', '8', '571');
INSERT INTO `comment_first_level_describe` VALUES ('547', '4', '572');
INSERT INTO `comment_first_level_describe` VALUES ('548', '8', '572');
INSERT INTO `comment_first_level_describe` VALUES ('549', '4', '573');
INSERT INTO `comment_first_level_describe` VALUES ('550', '8', '573');
INSERT INTO `comment_first_level_describe` VALUES ('551', '8', '576');
INSERT INTO `comment_first_level_describe` VALUES ('552', '3', '579');
INSERT INTO `comment_first_level_describe` VALUES ('553', '8', '579');
INSERT INTO `comment_first_level_describe` VALUES ('554', '7', '580');
INSERT INTO `comment_first_level_describe` VALUES ('555', '8', '580');
INSERT INTO `comment_first_level_describe` VALUES ('556', '4', '584');
INSERT INTO `comment_first_level_describe` VALUES ('557', '7', '584');
INSERT INTO `comment_first_level_describe` VALUES ('558', '4', '585');
INSERT INTO `comment_first_level_describe` VALUES ('559', '8', '585');
INSERT INTO `comment_first_level_describe` VALUES ('560', '4', '587');
INSERT INTO `comment_first_level_describe` VALUES ('561', '8', '587');
INSERT INTO `comment_first_level_describe` VALUES ('562', '4', '588');
INSERT INTO `comment_first_level_describe` VALUES ('563', '8', '588');
INSERT INTO `comment_first_level_describe` VALUES ('564', '4', '589');
INSERT INTO `comment_first_level_describe` VALUES ('565', '8', '589');
INSERT INTO `comment_first_level_describe` VALUES ('566', '4', '590');
INSERT INTO `comment_first_level_describe` VALUES ('567', '8', '590');
INSERT INTO `comment_first_level_describe` VALUES ('568', '4', '591');
INSERT INTO `comment_first_level_describe` VALUES ('569', '8', '591');
INSERT INTO `comment_first_level_describe` VALUES ('570', '4', '592');
INSERT INTO `comment_first_level_describe` VALUES ('571', '5', '593');
INSERT INTO `comment_first_level_describe` VALUES ('572', '7', '593');
INSERT INTO `comment_first_level_describe` VALUES ('573', '4', '594');
INSERT INTO `comment_first_level_describe` VALUES ('574', '5', '594');
INSERT INTO `comment_first_level_describe` VALUES ('575', '6', '594');
INSERT INTO `comment_first_level_describe` VALUES ('576', '3', '595');
INSERT INTO `comment_first_level_describe` VALUES ('577', '5', '595');
INSERT INTO `comment_first_level_describe` VALUES ('578', '3', '596');
INSERT INTO `comment_first_level_describe` VALUES ('579', '3', '597');
INSERT INTO `comment_first_level_describe` VALUES ('580', '4', '598');
INSERT INTO `comment_first_level_describe` VALUES ('581', '8', '598');
INSERT INTO `comment_first_level_describe` VALUES ('582', '4', '599');
INSERT INTO `comment_first_level_describe` VALUES ('583', '8', '599');
INSERT INTO `comment_first_level_describe` VALUES ('584', '4', '600');
INSERT INTO `comment_first_level_describe` VALUES ('585', '8', '600');
INSERT INTO `comment_first_level_describe` VALUES ('586', '4', '601');
INSERT INTO `comment_first_level_describe` VALUES ('587', '8', '601');
INSERT INTO `comment_first_level_describe` VALUES ('588', '4', '602');
INSERT INTO `comment_first_level_describe` VALUES ('589', '5', '603');
INSERT INTO `comment_first_level_describe` VALUES ('590', '4', '604');
INSERT INTO `comment_first_level_describe` VALUES ('591', '8', '604');
INSERT INTO `comment_first_level_describe` VALUES ('592', '4', '605');
INSERT INTO `comment_first_level_describe` VALUES ('593', '8', '605');
INSERT INTO `comment_first_level_describe` VALUES ('594', '5', '606');
INSERT INTO `comment_first_level_describe` VALUES ('595', '4', '607');
INSERT INTO `comment_first_level_describe` VALUES ('596', '8', '607');
INSERT INTO `comment_first_level_describe` VALUES ('597', '4', '608');
INSERT INTO `comment_first_level_describe` VALUES ('598', '8', '608');
INSERT INTO `comment_first_level_describe` VALUES ('599', '8', '609');
INSERT INTO `comment_first_level_describe` VALUES ('600', '4', '610');
INSERT INTO `comment_first_level_describe` VALUES ('601', '8', '610');
INSERT INTO `comment_first_level_describe` VALUES ('602', '4', '611');
INSERT INTO `comment_first_level_describe` VALUES ('603', '8', '611');
INSERT INTO `comment_first_level_describe` VALUES ('604', '4', '612');
INSERT INTO `comment_first_level_describe` VALUES ('605', '4', '613');
INSERT INTO `comment_first_level_describe` VALUES ('606', '8', '613');
INSERT INTO `comment_first_level_describe` VALUES ('607', '4', '614');
INSERT INTO `comment_first_level_describe` VALUES ('608', '8', '614');
INSERT INTO `comment_first_level_describe` VALUES ('609', '8', '615');
INSERT INTO `comment_first_level_describe` VALUES ('610', '7', '616');
INSERT INTO `comment_first_level_describe` VALUES ('611', '3', '617');
INSERT INTO `comment_first_level_describe` VALUES ('612', '7', '617');
INSERT INTO `comment_first_level_describe` VALUES ('613', '4', '618');
INSERT INTO `comment_first_level_describe` VALUES ('614', '5', '619');
INSERT INTO `comment_first_level_describe` VALUES ('615', '5', '624');
INSERT INTO `comment_first_level_describe` VALUES ('616', '4', '625');
INSERT INTO `comment_first_level_describe` VALUES ('617', '4', '627');
INSERT INTO `comment_first_level_describe` VALUES ('618', '4', '631');
INSERT INTO `comment_first_level_describe` VALUES ('619', '5', '631');
INSERT INTO `comment_first_level_describe` VALUES ('620', '8', '631');
INSERT INTO `comment_first_level_describe` VALUES ('621', '4', '632');
INSERT INTO `comment_first_level_describe` VALUES ('622', '8', '632');
INSERT INTO `comment_first_level_describe` VALUES ('623', '4', '633');
INSERT INTO `comment_first_level_describe` VALUES ('624', '8', '633');

-- ----------------------------
-- Table structure for comment_praise
-- ----------------------------
DROP TABLE IF EXISTS `comment_praise`;
CREATE TABLE `comment_praise` (
  `comment_praise_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `comment_first_level_id` int(11) NOT NULL COMMENT '1级评论id',
  `comment_praise_status` tinyint(2) DEFAULT '0' COMMENT '是否取消点赞 0=已点赞 1=已取消点赞',
  PRIMARY KEY (`comment_praise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评论点赞记录表';

-- ----------------------------
-- Records of comment_praise
-- ----------------------------
INSERT INTO `comment_praise` VALUES ('49', '59', '564', '1');
INSERT INTO `comment_praise` VALUES ('50', '59', '554', '1');
INSERT INTO `comment_praise` VALUES ('51', '59', '563', '1');
INSERT INTO `comment_praise` VALUES ('52', '59', '553', '1');
INSERT INTO `comment_praise` VALUES ('53', '59', '552', '0');
INSERT INTO `comment_praise` VALUES ('54', '59', '551', '0');
INSERT INTO `comment_praise` VALUES ('55', '59', '550', '0');
INSERT INTO `comment_praise` VALUES ('56', '59', '549', '0');
INSERT INTO `comment_praise` VALUES ('57', '59', '548', '0');
INSERT INTO `comment_praise` VALUES ('58', '59', '546', '0');
INSERT INTO `comment_praise` VALUES ('59', '59', '510', '0');
INSERT INTO `comment_praise` VALUES ('60', '59', '590', '1');
INSERT INTO `comment_praise` VALUES ('61', '51', '593', '1');
INSERT INTO `comment_praise` VALUES ('62', '59', '607', '1');

-- ----------------------------
-- Table structure for comment_second_level
-- ----------------------------
DROP TABLE IF EXISTS `comment_second_level`;
CREATE TABLE `comment_second_level` (
  `comment_second_level_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(20) NOT NULL COMMENT '用户id',
  `comment_detail` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '评论详情',
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名0=否 1=是',
  `comment_first_level_id` int(11) NOT NULL COMMENT '一级评论id',
  PRIMARY KEY (`comment_second_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='二级评论';

-- ----------------------------
-- Records of comment_second_level
-- ----------------------------
INSERT INTO `comment_second_level` VALUES ('8', '59', 'this is test', '2018-05-17 15:46:31', '0', '564');
INSERT INTO `comment_second_level` VALUES ('9', '59', '家就是的方法', '2018-05-17 16:00:09', '0', '564');
INSERT INTO `comment_second_level` VALUES ('10', '59', '注入和速度发到付', '2018-05-17 16:00:37', '0', '564');
INSERT INTO `comment_second_level` VALUES ('11', '59', '啦啦啦', '2018-05-17 16:01:19', '0', '564');
INSERT INTO `comment_second_level` VALUES ('12', '59', '这是最终一次测试', '2018-05-17 16:02:19', '0', '564');
INSERT INTO `comment_second_level` VALUES ('13', '59', '你看你看你看', '2018-05-17 16:02:32', '0', '554');
INSERT INTO `comment_second_level` VALUES ('14', '59', '这是测试', '2018-05-17 16:04:45', '0', '554');
INSERT INTO `comment_second_level` VALUES ('15', '59', '你看你看', '2018-05-17 16:04:52', '0', '563');
INSERT INTO `comment_second_level` VALUES ('16', '59', '这是侄儿', '2018-05-17 16:26:48', '0', '554');
INSERT INTO `comment_second_level` VALUES ('17', '59', '提啥', '2018-05-17 16:26:53', '0', '554');
INSERT INTO `comment_second_level` VALUES ('18', '60', '在咯啦咯啦咯', '2018-05-17 16:30:20', '0', '564');
INSERT INTO `comment_second_level` VALUES ('19', '60', '哦milk图', '2018-05-17 16:30:35', '0', '563');
INSERT INTO `comment_second_level` VALUES ('20', '51', '啊啊啊啊', '2018-05-18 12:28:48', '0', '564');
INSERT INTO `comment_second_level` VALUES ('21', '51', '关于韩国风', '2018-05-18 12:29:06', '0', '554');
INSERT INTO `comment_second_level` VALUES ('22', '51', '冬天和火锅', '2018-05-18 12:29:13', '0', '563');
INSERT INTO `comment_second_level` VALUES ('23', '51', '发个呵呵', '2018-05-18 12:29:22', '0', '553');
INSERT INTO `comment_second_level` VALUES ('24', '59', '你看，我在呢', '2018-05-18 12:31:58', '0', '564');
INSERT INTO `comment_second_level` VALUES ('25', '59', '这是回复', '2018-05-21 12:32:31', '0', '548');
INSERT INTO `comment_second_level` VALUES ('26', '64', '墨迹啦咯下午', '2018-05-29 09:25:24', '0', '593');
INSERT INTO `comment_second_level` VALUES ('27', '59', '七龙珠', '2018-05-29 09:26:38', '0', '593');
INSERT INTO `comment_second_level` VALUES ('28', '64', '哦哦哦', '2018-05-29 09:26:48', '0', '593');
INSERT INTO `comment_second_level` VALUES ('29', '59', '三五天', '2018-05-29 09:26:58', '0', '593');
INSERT INTO `comment_second_level` VALUES ('30', '51', '混合机', '2018-05-29 09:27:05', '0', '593');
INSERT INTO `comment_second_level` VALUES ('31', '51', '混合机家', '2018-05-29 09:27:10', '0', '593');
INSERT INTO `comment_second_level` VALUES ('32', '51', '哈哈哈', '2018-05-29 09:27:44', '0', '587');
INSERT INTO `comment_second_level` VALUES ('33', '59', '这是滴滴', '2018-05-29 10:18:31', '0', '595');
INSERT INTO `comment_second_level` VALUES ('34', '59', '同学', '2018-05-29 14:14:22', '0', '625');
INSERT INTO `comment_second_level` VALUES ('35', '64', '胡永恒测试', '2018-05-31 09:41:34', '0', '554');
INSERT INTO `comment_second_level` VALUES ('36', '64', '胡永恒', '2018-05-31 09:42:19', '0', '564');

-- ----------------------------
-- Table structure for condiment
-- ----------------------------
DROP TABLE IF EXISTS `condiment`;
CREATE TABLE `condiment` (
  `condiment_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '调料包id',
  `condiment_name` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '调料包名称',
  `condiment_status` int(2) NOT NULL COMMENT '调料包状态 0、未上架，1、上架中，2、折扣中，3、已售完',
  `condiment_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '调料包价格',
  PRIMARY KEY (`condiment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of condiment
-- ----------------------------
INSERT INTO `condiment` VALUES ('1', '老干妈', '1', '0.00');
INSERT INTO `condiment` VALUES ('2', '辣椒', '1', '0.00');
INSERT INTO `condiment` VALUES ('3', '番茄酱', '1', '0.00');
INSERT INTO `condiment` VALUES ('4', '牛肉酱', '1', '0.00');
INSERT INTO `condiment` VALUES ('5', '盐', '1', '0.00');
INSERT INTO `condiment` VALUES ('6', '味精', '1', '0.00');
INSERT INTO `condiment` VALUES ('7', '风味辣酱', '1', '0.00');
INSERT INTO `condiment` VALUES ('8', '老陈醋', '1', '0.00');
INSERT INTO `condiment` VALUES ('9', '酱油', '1', '0.00');
INSERT INTO `condiment` VALUES ('10', '白糖', '1', '0.00');
INSERT INTO `condiment` VALUES ('11', '油焖香菇', '1', '0.00');
INSERT INTO `condiment` VALUES ('12', '沙拉酱', '1', '0.00');
INSERT INTO `condiment` VALUES ('13', '黑椒粉', '1', '0.00');
INSERT INTO `condiment` VALUES ('14', '豆腐乳', '1', '0.00');
INSERT INTO `condiment` VALUES ('15', '咖喱', '1', '0.00');
INSERT INTO `condiment` VALUES ('16', '芝麻酱', '1', '0.00');
INSERT INTO `condiment` VALUES ('17', '蚝油', '1', '0.00');
INSERT INTO `condiment` VALUES ('18', '剁椒', '1', '0.00');
INSERT INTO `condiment` VALUES ('19', '孜然', '1', '0.00');
INSERT INTO `condiment` VALUES ('20', '麻椒', '1', '0.00');

-- ----------------------------
-- Table structure for condiment_box_lunch
-- ----------------------------
DROP TABLE IF EXISTS `condiment_box_lunch`;
CREATE TABLE `condiment_box_lunch` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `condiment_id` int(20) NOT NULL COMMENT '调料包id',
  `box_lunch_id` int(20) NOT NULL COMMENT '盒饭id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of condiment_box_lunch
-- ----------------------------
INSERT INTO `condiment_box_lunch` VALUES ('1', '1', '2');
INSERT INTO `condiment_box_lunch` VALUES ('2', '2', '2');
INSERT INTO `condiment_box_lunch` VALUES ('3', '3', '5');
INSERT INTO `condiment_box_lunch` VALUES ('4', '4', '5');

-- ----------------------------
-- Table structure for date_box_lunch
-- ----------------------------
DROP TABLE IF EXISTS `date_box_lunch`;
CREATE TABLE `date_box_lunch` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `date_box_lunch_id` int(20) NOT NULL DEFAULT '0' COMMENT '盒饭id',
  `date_timestamp` bigint(20) NOT NULL DEFAULT '0' COMMENT '日期时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of date_box_lunch
-- ----------------------------
INSERT INTO `date_box_lunch` VALUES ('1', '2', '1528214400000');
INSERT INTO `date_box_lunch` VALUES ('2', '3', '1528214400000');
INSERT INTO `date_box_lunch` VALUES ('3', '2', '1528214400000');
INSERT INTO `date_box_lunch` VALUES ('4', '3', '1528214400000');
INSERT INTO `date_box_lunch` VALUES ('5', '5', '1528214400000');
INSERT INTO `date_box_lunch` VALUES ('6', '1', '1528214400000');
INSERT INTO `date_box_lunch` VALUES ('7', '1', '1525968000000');
INSERT INTO `date_box_lunch` VALUES ('8', '4', '1525881600000');
INSERT INTO `date_box_lunch` VALUES ('9', '4', '1525968000000');
INSERT INTO `date_box_lunch` VALUES ('10', '5', '1525968000000');
INSERT INTO `date_box_lunch` VALUES ('11', '2', '1527523200000');
INSERT INTO `date_box_lunch` VALUES ('12', '3', '1527523200000');
INSERT INTO `date_box_lunch` VALUES ('13', '4', '1527523200000');
INSERT INTO `date_box_lunch` VALUES ('14', '5', '1527782400000');
INSERT INTO `date_box_lunch` VALUES ('15', '6', '1527782400000');

-- ----------------------------
-- Table structure for district
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `district_name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '区',
  `city_id` int(11) NOT NULL COMMENT '市id',
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('1', '西湖区', '1');
INSERT INTO `district` VALUES ('2', '萧山区', '1');
INSERT INTO `district` VALUES ('3', '嘉定区', '2');
INSERT INTO `district` VALUES ('4', '宝山区', '2');
INSERT INTO `district` VALUES ('5', '下城区', '1');
INSERT INTO `district` VALUES ('6', '上城区', '1');
INSERT INTO `district` VALUES ('7', '拱墅区', '1');
INSERT INTO `district` VALUES ('8', '滨江区', '1');
INSERT INTO `district` VALUES ('9', '江干区', '1');
INSERT INTO `district` VALUES ('10', '朝阳区', '17');
INSERT INTO `district` VALUES ('11', '朝阳区', '13');
INSERT INTO `district` VALUES ('12', '朝阳区', '13');
INSERT INTO `district` VALUES ('13', '朝阳区', '13');
INSERT INTO `district` VALUES ('14', '朝阳区', '13');
INSERT INTO `district` VALUES ('15', '余杭区', '1');
INSERT INTO `district` VALUES ('16', '富阳区', '1');
INSERT INTO `district` VALUES ('17', '朝阳区', '13');
INSERT INTO `district` VALUES ('18', '朝阳区', '13');
INSERT INTO `district` VALUES ('19', '朝阳区', '13');
INSERT INTO `district` VALUES ('20', '朝阳区', '13');
INSERT INTO `district` VALUES ('21', '朝阳区', '13');
INSERT INTO `district` VALUES ('22', '朝阳区', '13');

-- ----------------------------
-- Table structure for food_praise
-- ----------------------------
DROP TABLE IF EXISTS `food_praise`;
CREATE TABLE `food_praise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `food_id` int(11) NOT NULL COMMENT '食品id',
  `food_praise_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否取消点赞 0=已点赞 1=已取消点赞',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='食品点赞记录表';

-- ----------------------------
-- Records of food_praise
-- ----------------------------
INSERT INTO `food_praise` VALUES ('49', '59', '564', '1');
INSERT INTO `food_praise` VALUES ('50', '59', '554', '1');
INSERT INTO `food_praise` VALUES ('51', '59', '563', '1');
INSERT INTO `food_praise` VALUES ('52', '59', '553', '1');
INSERT INTO `food_praise` VALUES ('53', '59', '552', '0');
INSERT INTO `food_praise` VALUES ('54', '59', '551', '0');
INSERT INTO `food_praise` VALUES ('55', '59', '550', '0');
INSERT INTO `food_praise` VALUES ('56', '59', '549', '0');
INSERT INTO `food_praise` VALUES ('57', '59', '548', '0');
INSERT INTO `food_praise` VALUES ('58', '59', '546', '0');
INSERT INTO `food_praise` VALUES ('59', '59', '510', '0');

-- ----------------------------
-- Table structure for food_types
-- ----------------------------
DROP TABLE IF EXISTS `food_types`;
CREATE TABLE `food_types` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '食品类型id',
  `category_name` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '食品类型名称',
  `category_desc` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '食品类型描述',
  `category_classify` int(2) NOT NULL COMMENT '食品类型分类 1 必点 2 选点',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of food_types
-- ----------------------------
INSERT INTO `food_types` VALUES ('1', '主菜', '主菜', '1');
INSERT INTO `food_types` VALUES ('2', '辅菜', '辅菜', '1');
INSERT INTO `food_types` VALUES ('3', '主食', '米饭', '1');
INSERT INTO `food_types` VALUES ('4', '配汤', '配汤', '2');
INSERT INTO `food_types` VALUES ('5', '水果', '水果', '2');
INSERT INTO `food_types` VALUES ('6', '小菜', '小菜', '1');
INSERT INTO `food_types` VALUES ('7', '饮料', '饮料', '2');

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods` (
  `food_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '食品id',
  `category_id` int(10) NOT NULL COMMENT '食品类型id',
  `food_name` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '食品名称',
  `food_price` decimal(10,2) NOT NULL COMMENT '食品价格',
  `food_sale_price` decimal(10,2) NOT NULL COMMENT '食品折扣价',
  `food_desc` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '食品描述',
  `food_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '食品创建时间',
  `food_update_time` timestamp NOT NULL DEFAULT '2018-05-28 16:56:38' ON UPDATE CURRENT_TIMESTAMP COMMENT '食品信息更新时间',
  `food_status` int(2) NOT NULL DEFAULT '0' COMMENT '食品状态：0、未上架，1、上架中，2、折扣中，3、已售完 99、已作废',
  `food_like_number` int(10) NOT NULL DEFAULT '0' COMMENT '食品点赞数量',
  `food_sold_number` int(10) NOT NULL DEFAULT '0' COMMENT '食品已卖数量',
  `food_images_url` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '食品图片url',
  `food_detail` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '食品详情图片',
  `food_remain_number` int(10) NOT NULL DEFAULT '0' COMMENT '食品库存',
  `food_surface_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '食品包装价格',
  PRIMARY KEY (`food_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES ('1', '1', '台湾卤肉', '17.00', '14.00', '好吃', '2018-06-05 14:20:35', '2018-06-05 14:20:35', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '热卖', '0', '0.00');
INSERT INTO `foods` VALUES ('2', '1', '红烧鸡腿', '10.20', '8.20', '好吃的一批', '2018-06-05 14:20:40', '2018-06-05 14:20:40', '1', '100', '50', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '这是爆款啊', '102', '0.00');
INSERT INTO `foods` VALUES ('3', '1', '鱼排', '15.00', '13.50', '还行吧', '2018-06-05 14:20:43', '2018-06-05 14:20:43', '1', '1001', '30', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '好东西啊', '105', '10.00');
INSERT INTO `foods` VALUES ('4', '1', '啤酒鸭', '7.00', '6.50', '时令菜品', '2018-06-05 14:20:45', '2018-06-05 14:20:45', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '大众', '0', '0.00');
INSERT INTO `foods` VALUES ('5', '1', '红焖鲤鱼', '13.00', '11.80', '爆销', '2018-06-05 14:20:48', '2018-06-05 14:20:48', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '', '0', '0.00');
INSERT INTO `foods` VALUES ('6', '2', '肉饼蒸蛋', '9.00', '7.00', '蛋类食物', '2018-06-05 14:20:50', '2018-06-05 14:20:50', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '补充能量', '0', '0.00');
INSERT INTO `foods` VALUES ('7', '2', '蜂蜜烤鸡翅', '5.00', '4.00', '烧烤饮食', '2018-06-05 14:20:53', '2018-06-05 14:20:53', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '烤肉', '0', '0.00');
INSERT INTO `foods` VALUES ('8', '2', '杭州酱鸭', '6.00', '5.00', '特产', '2018-06-05 14:20:55', '2018-06-05 14:20:55', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '标新离异', '0', '0.00');
INSERT INTO `foods` VALUES ('9', '4', '椒盐几块', '8.00', '6.00', '居家必备', '2018-06-05 14:20:58', '2018-06-05 14:20:58', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '来自湘湖的水鸭', '0', '0.00');
INSERT INTO `foods` VALUES ('10', '2', '咖喱牛肉', '8.00', '5.00', '主食菜品', '2018-06-05 14:21:00', '2018-06-05 14:21:00', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '', '0', '0.00');
INSERT INTO `foods` VALUES ('11', '3', '米饭', '1.00', '0.50', '大白米饭', '2018-06-05 14:20:09', '2018-06-05 14:20:09', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '冬天的滋补圣品', '0', '0.00');
INSERT INTO `foods` VALUES ('12', '3', '红烧牛蛙', '11.00', '9.00', '水产品', '2018-06-05 14:21:03', '2018-06-05 14:21:03', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '', '0', '0.00');
INSERT INTO `foods` VALUES ('13', '3', '香菇滑鸡', '5.00', '4.00', '家常菜', '2018-06-05 14:21:06', '2018-06-05 14:21:06', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '儿时的记忆', '0', '0.00');
INSERT INTO `foods` VALUES ('14', '3', '东坡肉', '7.00', '6.00', '千年传承', '2018-06-05 14:21:08', '2018-06-05 14:21:08', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '传统名菜', '0', '0.00');
INSERT INTO `foods` VALUES ('15', '6', '三杯鸡', '8.00', '7.00', '特色菜品', '2018-06-05 14:21:11', '2018-06-05 14:21:11', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '', '0', '0.00');
INSERT INTO `foods` VALUES ('18', '5', '苹果', '5.00', '4.00', '苹果', '2018-06-05 14:20:13', '2018-06-05 14:20:13', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '0', '0.00');
INSERT INTO `foods` VALUES ('19', '7', '冰红茶', '4.00', '3.00', '冰红茶', '2018-06-05 14:20:15', '2018-06-05 14:20:15', '1', '0', '0', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '0', '0.00');

-- ----------------------------
-- Table structure for goods_describe
-- ----------------------------
DROP TABLE IF EXISTS `goods_describe`;
CREATE TABLE `goods_describe` (
  `goods_describe_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `describe_name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '名称',
  PRIMARY KEY (`goods_describe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品描述表';

-- ----------------------------
-- Records of goods_describe
-- ----------------------------
INSERT INTO `goods_describe` VALUES ('3', '分量足');
INSERT INTO `goods_describe` VALUES ('4', '味道赞');
INSERT INTO `goods_describe` VALUES ('5', '物美价廉');
INSERT INTO `goods_describe` VALUES ('6', '推荐');
INSERT INTO `goods_describe` VALUES ('7', '包装赞');
INSERT INTO `goods_describe` VALUES ('8', '服务好');

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `location_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '位置id',
  `location_building` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '大厦',
  `address_detail` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '详细地址',
  `location_longitude` decimal(15,6) NOT NULL COMMENT '经度',
  `location_latitude` decimal(15,6) NOT NULL COMMENT '纬度',
  `district_id` int(11) NOT NULL COMMENT '区id',
  `location_state` tinyint(2) DEFAULT NULL COMMENT '状态0=禁用 1=启用 99=作废',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of locations
-- ----------------------------
INSERT INTO `locations` VALUES ('1', '宝龙城市广场一楼', '宝龙路231号', '0.000000', '0.000000', '1', '1');
INSERT INTO `locations` VALUES ('2', '宝龙城市广场二楼', '宝龙路231号', '0.000000', '0.000000', '1', '1');
INSERT INTO `locations` VALUES ('3', '金城广场一楼', '金城路58号', '0.000000', '0.000000', '2', '1');
INSERT INTO `locations` VALUES ('4', '嘉定区某某大厦2楼', '某某路21号', '0.000000', '0.000000', '3', '1');
INSERT INTO `locations` VALUES ('5', '宝山区某某大厦3楼', '某某路38号', '0.000000', '0.000000', '4', '1');
INSERT INTO `locations` VALUES ('11', '王府井大厦', '1号写字楼', '0.000000', '0.000000', '10', '1');
INSERT INTO `locations` VALUES ('12', '金沙湖', '天街购物城', '1005.335000', '1006.222000', '13', '1');
INSERT INTO `locations` VALUES ('13', '金沙湖', '天街购物城', '1005.335000', '1006.222000', '13', '1');
INSERT INTO `locations` VALUES ('14', '金沙湖', '天街购物城', '1005.335000', '1006.222000', '13', '1');
INSERT INTO `locations` VALUES ('15', '金沙湖', '天街购物城', '1005.335000', '1006.222000', '13', '1');
INSERT INTO `locations` VALUES ('16', '金沙湖', '天街购物城', '1005.335000', '1006.222000', '13', '1');
INSERT INTO `locations` VALUES ('17', '金沙湖', '天街购物城', '1005.335000', '1006.222000', '13', '1');
INSERT INTO `locations` VALUES ('18', '金沙湖', '天街购物城', '1005.335000', '1006.222000', '13', '1');
INSERT INTO `locations` VALUES ('19', '金沙湖', '天街购物城', '1005.335000', '1006.222000', '13', '1');
INSERT INTO `locations` VALUES ('20', '金沙湖', '天街购物城', '1005.335000', '1006.222000', '13', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `order_status` int(10) NOT NULL DEFAULT '1' COMMENT '订单状态:1、待配送；2、备货中；3、配送中、4、待评价：5、已完成',
  `order_total_price` decimal(20,0) NOT NULL DEFAULT '0' COMMENT '订单总价',
  `order_deal_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '订单成交价格',
  `address_id` int(20) NOT NULL DEFAULT '0' COMMENT '订单地址id',
  `order_send_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '订单配送费',
  `order_surface_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '订单包装费',
  `red_packet_id` int(20) NOT NULL DEFAULT '0' COMMENT '红包id',
  `order_pay_type` int(10) NOT NULL DEFAULT '0' COMMENT '订单支付类型：0、微信支付；1、支付宝支付；',
  `order_number` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_type` int(2) NOT NULL DEFAULT '0' COMMENT '订单类型：0个人点餐，1自助点餐',
  `order_send_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单配送时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('58', '33', '2018-05-07 12:41:49', '1', '0', '0.00', '0', '0.00', '0.00', '0', '0', '77777777777777', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('66', '59', '2018-05-07 14:45:39', '1', '99999999', '99999999.00', '18', '99999999.00', '99999999.00', '1', '0', '20180507144538913', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('67', '59', '2018-05-07 14:45:43', '1', '99999999', '99999999.00', '0', '99999999.00', '99999999.00', '0', '0', '88888888888887', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('71', '59', '2018-05-09 12:58:11', '1', '99999999', '99999999.00', '1', '99999999.00', '99999999.00', '1', '0', '20180509125810953', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('72', '59', '2018-05-09 13:29:39', '1', '99999999', '99999999.00', '9', '99999999.00', '99999999.00', '0', '0', '20180509132938919', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('73', '59', '2018-05-09 13:35:11', '1', '99999999', '99999999.00', '9', '99999999.00', '99999999.00', '0', '0', '20180509133511036', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('74', '59', '2018-05-09 13:41:40', '1', '99999999', '99999999.00', '9', '99999999.00', '99999999.00', '0', '0', '20180509134139639', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('75', '59', '2018-05-09 13:47:35', '1', '99999999', '99999999.00', '9', '99999999.00', '99999999.00', '0', '0', '20180509134734849', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('76', '59', '2018-05-09 14:48:14', '1', '99999999', '99999999.00', '9', '99999999.00', '99999999.00', '0', '0', '20180509144813732', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('81', '59', '2018-05-14 12:50:04', '1', '99999999', '99999999.00', '0', '99999999.00', '99999999.00', '0', '0', '20180514125004032', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('85', '59', '2018-05-17 20:23:17', '1', '0', '999.00', '0', '25.00', '25.00', '0', '0', '20180517202317940', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('86', '59', '2018-05-17 20:23:49', '1', '0', '999.00', '0', '25.00', '25.00', '0', '0', '20180517202349060', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('87', '59', '2018-05-17 21:22:19', '1', '0', '999.00', '0', '25.00', '25.00', '0', '0', '20180517212219298', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('88', '59', '2018-05-17 21:51:19', '1', '0', '999.00', '0', '25.00', '25.00', '0', '0', '20180517215119004', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('89', '59', '2018-05-17 21:57:30', '1', '0', '999.00', '0', '25.00', '25.00', '0', '0', '20180517215730770', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('90', '59', '2018-05-17 21:58:44', '1', '0', '999.00', '0', '25.00', '25.00', '0', '0', '20180517215844466', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('92', '59', '2018-05-17 22:05:49', '1', '0', '999.00', '0', '25.00', '25.00', '0', '0', '20180517220549898', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('93', '59', '2018-05-17 22:06:18', '1', '0', '999.00', '0', '25.00', '25.00', '0', '0', '20180517220618294', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('94', '59', '2018-05-21 20:38:04', '1', '0', '999.00', '46', '25.00', '25.00', '556', '0', '20180521203804106', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('145', '62', '2018-05-22 10:47:49', '1', '122', '0.00', '46', '0.00', '0.00', '556', '0', '1000000770238293', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('146', '62', '2018-05-22 10:47:49', '1', '122', '0.00', '46', '0.00', '0.00', '556', '0', '1000000346192354', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('147', '62', '2018-05-22 11:03:09', '1', '122', '0.00', '46', '0.00', '0.00', '0', '0', '1000000622941230', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('148', '62', '2018-05-22 11:03:09', '1', '122', '0.00', '46', '0.00', '0.00', '556', '0', '1000001833176354', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('149', '60', '2018-05-24 09:55:10', '1', '5', '0.00', '1', '0.00', '0.00', '0', '0', '1000000478732951', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('150', '60', '2018-05-24 10:55:06', '2', '661', '0.00', '56', '0.00', '0.00', '0', '0', '1000000948916517', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('151', '60', '2018-05-24 11:10:26', '3', '661', '0.00', '56', '0.00', '0.00', '0', '0', '1000001761370502', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('152', '60', '2018-05-24 12:30:28', '4', '661', '0.00', '56', '0.00', '0.00', '0', '0', '1000001343960503', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('155', '59', '2018-05-24 13:15:43', '1', '122', '0.00', '46', '0.00', '0.00', '0', '0', '1000001579413867', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('156', '59', '2018-05-24 13:15:43', '1', '122', '0.00', '46', '0.00', '0.00', '0', '0', '1000000414393359', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('157', '59', '2018-05-24 13:16:43', '1', '122', '0.00', '46', '0.00', '0.00', '0', '0', '1000001943241318', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('158', '59', '2018-05-24 13:16:43', '1', '122', '0.00', '46', '0.00', '0.00', '0', '0', '1000000934911467', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('179', '59', '2018-05-24 13:39:47', '1', '122', '0.00', '46', '0.00', '0.00', '0', '0', '1000001133439867', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('180', '59', '2018-05-24 13:39:47', '1', '122', '0.00', '46', '0.00', '0.00', '0', '0', '1000001534464108', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('181', '60', '2018-05-24 14:03:46', '5', '13', '0.00', '56', '0.00', '0.00', '0', '0', '1000001006635563', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('182', '60', '2018-05-24 14:14:31', '1', '108', '0.00', '56', '0.00', '0.00', '0', '0', '1000001510478221', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('183', '60', '2018-05-24 14:15:58', '1', '108', '0.00', '56', '0.00', '0.00', '0', '0', '1000001484575333', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('184', '60', '2018-05-24 14:19:44', '1', '108', '0.00', '56', '0.00', '0.00', '0', '0', '1000000647707083', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('185', '60', '2018-05-24 14:19:44', '1', '7', '0.00', '56', '0.00', '0.00', '0', '0', '1000000038437208', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('186', '60', '2018-05-24 14:29:04', '1', '108', '0.00', '56', '0.00', '0.00', '0', '0', '1000001482832238', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('187', '60', '2018-05-24 14:29:04', '1', '7', '0.00', '56', '0.00', '0.00', '0', '0', '1000001538679258', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('188', '60', '2018-05-24 14:29:31', '1', '108', '0.00', '56', '0.00', '0.00', '0', '0', '1000000640428882', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('189', '60', '2018-05-24 14:29:31', '1', '7', '0.00', '56', '0.00', '0.00', '0', '0', '1000000322681935', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('190', '60', '2018-05-24 14:30:08', '1', '108', '0.00', '56', '0.00', '0.00', '0', '0', '1000000425763645', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('191', '60', '2018-05-24 14:30:08', '1', '7', '0.00', '56', '0.00', '0.00', '0', '0', '1000001518065683', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('192', '60', '2018-05-24 14:31:04', '1', '108', '0.00', '56', '0.00', '0.00', '0', '0', '1000000844571475', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('193', '60', '2018-05-24 14:31:04', '1', '7', '0.00', '56', '0.00', '0.00', '0', '0', '1000000323078264', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('194', '60', '2018-05-24 14:32:00', '1', '108', '0.00', '56', '0.00', '0.00', '0', '0', '1000001289840757', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('195', '60', '2018-05-24 14:32:00', '1', '7', '0.00', '56', '0.00', '0.00', '0', '0', '1000001595551392', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('196', '60', '2018-05-24 14:44:26', '1', '108', '0.00', '56', '0.00', '0.00', '0', '0', '1000001656581083', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('197', '60', '2018-05-24 14:44:26', '1', '7', '0.00', '56', '0.00', '0.00', '0', '0', '1000000217097409', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('198', '60', '2018-05-24 16:11:39', '1', '108', '0.00', '56', '0.00', '0.00', '0', '0', '1000000580045441', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('199', '60', '2018-05-24 16:16:17', '1', '90', '0.00', '56', '0.00', '0.00', '0', '0', '1000001532666020', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('200', '51', '2018-05-25 09:30:17', '1', '13', '0.00', '39', '0.00', '0.00', '0', '0', '1000000071020077', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('201', '51', '2018-05-25 09:30:40', '1', '13', '0.00', '39', '0.00', '0.00', '0', '0', '1000002015749209', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('202', '60', '2018-05-25 09:59:56', '1', '20', '0.00', '56', '0.00', '0.00', '0', '0', '1000001159380027', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('203', '60', '2018-05-25 10:01:57', '1', '20', '0.00', '57', '0.00', '0.00', '0', '0', '1000000340859483', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('204', '60', '2018-05-25 10:18:19', '1', '319', '0.00', '57', '0.00', '0.00', '0', '0', '1000000093408973', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('205', '60', '2018-05-25 10:18:43', '1', '319', '0.00', '57', '0.00', '0.00', '0', '0', '1000001403912584', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('206', '60', '2018-05-25 10:25:29', '1', '319', '0.00', '57', '0.00', '0.00', '0', '0', '1000002043706663', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('207', '51', '2018-05-25 10:31:40', '2', '8', '0.00', '39', '0.00', '0.00', '0', '0', '1000000724374913', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('208', '60', '2018-05-25 10:41:47', '1', '324', '0.00', '57', '0.00', '0.00', '0', '0', '1000000639093086', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('209', '51', '2018-05-25 10:43:56', '3', '7', '0.00', '39', '0.00', '0.00', '0', '0', '1000001880485185', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('210', '60', '2018-05-25 11:11:35', '1', '95', '0.00', '57', '0.00', '0.00', '0', '0', '1000000145717414', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('211', '60', '2018-05-25 11:11:35', '1', '26', '0.00', '57', '0.00', '0.00', '0', '0', '1000000783963000', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('212', '60', '2018-05-25 11:14:37', '1', '95', '0.00', '57', '0.00', '0.00', '0', '0', '1000000003186072', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('213', '60', '2018-05-25 11:21:28', '1', '95', '0.00', '57', '0.00', '0.00', '0', '0', '1000001640748639', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('214', '60', '2018-05-25 11:24:38', '1', '95', '0.00', '57', '0.00', '0.00', '0', '0', '1000000323039094', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('215', '51', '2018-05-25 12:33:59', '4', '90', '0.00', '39', '0.00', '0.00', '0', '0', '1000001454929032', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('216', '51', '2018-05-25 12:48:48', '5', '97', '0.00', '39', '0.00', '0.00', '0', '0', '1000001070180709', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('217', '51', '2018-05-25 13:45:25', '1', '101', '0.00', '39', '0.00', '0.00', '0', '0', '1000001119894998', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('218', '51', '2018-05-25 14:09:30', '2', '108', '0.00', '41', '0.00', '0.00', '0', '0', '1000001179613981', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('219', '51', '2018-05-25 14:10:43', '3', '108', '0.00', '40', '0.00', '0.00', '0', '0', '1000001783472095', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('220', '60', '2018-05-25 14:17:34', '1', '136', '0.00', '57', '0.00', '0.00', '0', '0', '1000001505206562', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('221', '51', '2018-05-25 14:24:59', '4', '108', '0.00', '39', '0.00', '0.00', '0', '0', '1000000172474517', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('222', '51', '2018-05-25 14:25:16', '5', '108', '0.00', '62', '0.00', '0.00', '0', '0', '1000001790619775', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('223', '51', '2018-05-25 14:30:32', '1', '108', '0.00', '39', '0.00', '0.00', '0', '0', '1000000285242914', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('224', '60', '2018-05-25 14:58:16', '1', '13', '0.00', '57', '0.00', '0.00', '0', '0', '1000001803633300', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('225', '60', '2018-05-25 14:58:16', '1', '136', '0.00', '57', '0.00', '0.00', '0', '0', '1000001356603500', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('226', '60', '2018-05-25 15:05:46', '1', '13', '0.00', '57', '0.00', '0.00', '0', '0', '1000001717630850', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('227', '60', '2018-05-25 15:05:46', '1', '136', '0.00', '57', '0.00', '0.00', '0', '0', '1000001361777880', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('230', '64', '2018-05-28 13:25:10', '1', '7', '0.00', '64', '0.00', '0.00', '0', '0', '1000000168078145', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('231', '64', '2018-05-28 13:25:29', '1', '7', '0.00', '64', '0.00', '0.00', '0', '0', '1000001158419165', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('233', '59', '2018-05-28 16:38:18', '1', '63', '0.00', '18', '0.00', '0.00', '0', '0', '1000001268357198', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('234', '59', '2018-05-28 16:40:19', '1', '49', '0.00', '18', '0.00', '0.00', '0', '0', '1000000942458104', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('235', '51', '2018-05-29 09:50:41', '1', '80', '0.00', '41', '0.00', '0.00', '0', '0', '1000001900532898', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('250', '59', '2018-05-29 09:58:26', '1', '73', '0.00', '19', '0.00', '0.00', '0', '0', '1000000343867193', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('251', '51', '2018-05-29 09:58:46', '1', '80', '0.00', '39', '0.00', '0.00', '0', '0', '1000001303305399', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('252', '64', '2018-05-29 09:58:53', '1', '99', '0.00', '64', '0.00', '0.00', '0', '0', '1000000241579893', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('253', '51', '2018-05-29 10:00:47', '1', '80', '0.00', '39', '0.00', '0.00', '0', '0', '1000000388949780', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('260', '59', '2018-05-29 10:02:23', '1', '73', '0.00', '20', '0.00', '0.00', '0', '0', '1000000721119164', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('261', '64', '2018-05-29 10:02:25', '1', '99', '0.00', '64', '0.00', '0.00', '0', '0', '1000000057359447', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('262', '51', '2018-05-29 10:02:31', '1', '80', '0.00', '39', '0.00', '0.00', '0', '0', '1000000671614117', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('263', '51', '2018-05-29 10:03:07', '1', '80', '0.00', '39', '0.00', '0.00', '0', '0', '1000001032491293', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('270', '60', '2018-05-29 10:14:51', '1', '122', '0.00', '45', '0.00', '0.00', '0', '0', '1000000019379150', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('271', '60', '2018-05-29 10:14:51', '1', '122', '0.00', '45', '0.00', '0.00', '0', '0', '1000001219100001', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('272', '60', '2018-05-29 10:17:56', '1', '122', '0.00', '45', '0.00', '0.00', '0', '0', '1000000316984149', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('273', '60', '2018-05-29 10:17:56', '1', '122', '0.00', '45', '0.00', '0.00', '0', '0', '1000000516791463', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('274', '64', '2018-05-29 12:44:48', '1', '8', '0.00', '64', '0.00', '0.00', '0', '0', '1000002113117275', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('275', '59', '2018-05-29 13:19:43', '1', '74', '0.00', '20', '0.00', '0.00', '0', '0', '1000000877672442', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('276', '60', '2018-05-29 13:34:54', '1', '122', '0.00', '45', '0.00', '122.00', '0', '0', '1000001735875774', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('277', '60', '2018-05-29 13:34:54', '1', '122', '0.00', '45', '0.00', '122.00', '0', '0', '1000000843812462', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('278', '60', '2018-05-29 13:38:40', '1', '122', '0.00', '45', '0.00', '122.00', '0', '0', '1000000336014073', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('279', '60', '2018-05-29 13:38:40', '1', '122', '0.00', '45', '0.00', '122.00', '0', '0', '1000000794002844', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('280', '59', '2018-05-31 13:32:51', '1', '51', '0.00', '20', '0.00', '0.00', '0', '0', '1000001972589084', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('281', '64', '2018-05-31 14:30:58', '1', '65', '0.00', '64', '0.00', '0.00', '0', '0', '1000000839045611', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('282', '64', '2018-05-31 14:43:45', '1', '55', '0.00', '64', '0.00', '0.00', '0', '0', '1000000202338532', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('283', '61', '2018-05-31 14:44:11', '1', '74', '0.00', '73', '0.00', '25.00', '0', '0', '1000000420557783', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('284', '61', '2018-05-31 15:16:13', '1', '68', '0.00', '73', '0.00', '25.00', '0', '0', '1000000798297841', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('285', '60', '2018-05-31 15:48:26', '1', '90', '0.00', '65', '0.00', '0.00', '0', '0', '1000001784675435', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('286', '59', '2018-06-01 11:03:11', '1', '122', '0.00', '45', '0.00', '122.00', '0', '0', '1000002131555850', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('287', '59', '2018-06-01 11:03:11', '1', '122', '0.00', '45', '0.00', '122.00', '0', '0', '1000001965483795', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('288', '51', '2018-06-01 11:23:23', '1', '13', '0.00', '42', '0.00', '5.00', '0', '0', '1000000294620996', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('289', '59', '2018-06-04 09:23:58', '1', '50', '0.00', '20', '0.00', '25.00', '0', '0', '1000001787076461', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('290', '59', '2018-06-04 09:28:04', '1', '67', '0.00', '19', '0.00', '25.00', '0', '0', '1000000075495979', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('291', '59', '2018-06-04 10:06:52', '1', '44', '0.00', '20', '0.00', '25.00', '0', '0', '1000000591257873', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('292', '64', '2018-06-04 11:06:49', '0', '50', '0.00', '64', '0.00', '25.00', '0', '0', '1000001449615289', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('293', '59', '2018-06-04 13:18:48', '0', '55', '0.00', '19', '0.00', '25.00', '0', '0', '1000000413795926', '1', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('294', '59', '2018-06-04 14:12:18', '0', '122', '0.00', '46', '0.00', '122.00', '0', '0', '1000002033767448', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('295', '59', '2018-06-04 14:12:18', '0', '122', '0.00', '46', '0.00', '122.00', '0', '0', '1000002045772805', '0', '2018-06-04 14:19:18');
INSERT INTO `orders` VALUES ('296', '59', '2018-06-04 14:31:09', '1', '51', '0.00', '19', '0.00', '25.00', '0', '0', '1000001141008476', '1', '2018-06-04 14:31:09');
INSERT INTO `orders` VALUES ('297', '59', '2018-06-05 11:32:29', '1', '66', '0.00', '20', '0.00', '25.00', '0', '0', '1000001621652009', '1', '2018-06-05 11:32:29');
INSERT INTO `orders` VALUES ('298', '61', '2018-06-08 11:30:09', '1', '83', '0.00', '73', '0.00', '25.00', '0', '0', '1000000405482729', '1', '2018-06-08 11:30:09');

-- ----------------------------
-- Table structure for orders_box_lunch
-- ----------------------------
DROP TABLE IF EXISTS `orders_box_lunch`;
CREATE TABLE `orders_box_lunch` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int(20) NOT NULL DEFAULT '0' COMMENT '订单id',
  `box_lunch_id` int(20) NOT NULL DEFAULT '0' COMMENT '盒饭id',
  `box_lunch_number` int(10) NOT NULL DEFAULT '0' COMMENT '盒饭数量',
  `box_lunch_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '盒饭单价',
  `box_lunch_type` int(2) NOT NULL DEFAULT '0' COMMENT '购物车类型,0:个人点餐,1:自助点餐',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品sku的Id',
  `sku_name` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '盒饭sku名称',
  `box_lunch_date` bigint(20) NOT NULL DEFAULT '0' COMMENT '订购那一天的盒饭',
  `box_lunch_sale_price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '盒饭折扣价',
  `condiment_id` int(20) NOT NULL DEFAULT '0' COMMENT '盒饭调料id',
  `condiment_name` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '调料包名称',
  `comment_status` int(10) DEFAULT '0' COMMENT '盒饭评论状态0=未评论 1=已评论',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orders_box_lunch
-- ----------------------------
INSERT INTO `orders_box_lunch` VALUES ('67', '66', '3', '0', '0.00', '0', '5', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('68', '66', '3', '66', '0.00', '0', '10', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('69', '67', '1', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('70', '67', '3', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('71', '68', '1', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('72', '68', '3', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('73', '66', '3', '5', '0.00', '0', '667', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('74', '66', '2', '3', '0.00', '0', '6', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('75', '66', '2', '9', '0.00', '0', '668', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('76', '66', '1', '5', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('83', '71', '1', '0', '0.00', '0', '4', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('84', '71', '4', '0', '0.00', '0', '8', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('85', '71', '5', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('86', '72', '1', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('87', '72', '3', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('88', '72', '5', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('89', '73', '1', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('90', '73', '3', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('91', '73', '5', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('92', '74', '1', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('93', '74', '3', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('94', '74', '5', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('95', '75', '1', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('96', '75', '3', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('97', '75', '5', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('98', '76', '1', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('99', '76', '3', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('100', '76', '5', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('101', '76', '6', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('102', '77', '1', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('103', '77', '3', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('104', '77', '5', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('105', '77', '6', '0', '0.00', '0', '0', '', '20180514103956', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('106', '81', '1', '0', '0.00', '0', '0', '', '20180514125004', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('107', '81', '3', '0', '0.00', '0', '0', '', '20180514125004', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('130', '133', '3', '3', '0.00', '0', '5', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('131', '133', '3', '3', '0.00', '0', '10', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('132', '134', '4', '3', '0.00', '0', '0', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('133', '134', '3', '3', '0.00', '0', '666', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('134', '137', '3', '3', '0.00', '0', '5', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('135', '137', '3', '3', '0.00', '0', '10', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('136', '138', '4', '3', '0.00', '0', '0', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('137', '138', '3', '3', '0.00', '0', '666', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('138', '145', '3', '3', '0.00', '0', '5', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('139', '145', '3', '3', '0.00', '0', '10', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('140', '146', '4', '3', '0.00', '0', '0', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('141', '146', '3', '3', '0.00', '0', '666', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('142', '149', '2', '1', '0.00', '0', '6', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('143', '150', '4', '7', '0.00', '0', '4', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('144', '150', '2', '2', '0.00', '0', '6', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('145', '150', '2', '4', '0.00', '0', '668', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('146', '151', '4', '7', '0.00', '0', '4', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('147', '151', '2', '2', '0.00', '0', '6', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('148', '151', '2', '4', '0.00', '0', '668', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('149', '152', '4', '7', '0.00', '0', '4', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('150', '152', '2', '2', '0.00', '0', '6', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('151', '152', '2', '4', '0.00', '0', '668', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('152', '155', '3', '3', '0.00', '0', '5', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('153', '155', '3', '3', '0.00', '0', '10', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('154', '156', '4', '3', '0.00', '0', '0', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('155', '156', '3', '3', '0.00', '0', '666', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('156', '157', '3', '3', '0.00', '0', '5', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('157', '157', '3', '3', '0.00', '0', '10', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('158', '158', '4', '3', '0.00', '0', '0', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('159', '158', '3', '3', '0.00', '0', '666', '', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('160', '179', '3', '3', '0.00', '0', '5', '大餐', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('161', '179', '3', '3', '0.00', '0', '10', '大餐', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('162', '180', '4', '3', '0.00', '0', '0', '', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('163', '180', '3', '3', '0.00', '0', '666', '大餐', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('164', '181', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('165', '182', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('166', '182', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('167', '182', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('168', '183', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('169', '183', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('170', '183', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('171', '184', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('172', '184', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('173', '184', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('174', '185', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('175', '186', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('176', '186', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('177', '186', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('178', '187', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('179', '188', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('180', '188', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('181', '188', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('182', '189', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('183', '190', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('184', '190', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('185', '190', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('186', '191', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('187', '192', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('188', '192', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('189', '192', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('190', '193', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('191', '194', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('192', '194', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('193', '194', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('194', '195', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('195', '196', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('196', '196', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('197', '196', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('198', '197', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('199', '198', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('200', '198', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('201', '198', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('202', '199', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('203', '200', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('204', '201', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('205', '202', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('206', '202', '3', '2', '0.00', '0', '666', '白银套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('207', '203', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('208', '203', '3', '2', '0.00', '0', '666', '白银套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('209', '204', '5', '5', '0.00', '0', '3', '美白套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('210', '204', '1', '5', '0.00', '0', '7', '亲民套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('211', '204', '3', '18', '0.00', '0', '10', '大餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('212', '205', '5', '5', '0.00', '0', '3', '美白套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('213', '205', '1', '5', '0.00', '0', '7', '亲民套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('214', '205', '3', '18', '0.00', '0', '10', '大餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('215', '206', '5', '5', '0.00', '0', '3', '美白套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('216', '206', '1', '5', '0.00', '0', '7', '亲民套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('217', '206', '3', '18', '0.00', '0', '10', '大餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('218', '207', '3', '1', '0.00', '0', '5', '黄金套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('219', '208', '5', '5', '0.00', '0', '3', '美白套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('220', '208', '1', '5', '0.00', '0', '7', '亲民套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('221', '208', '3', '18', '0.00', '0', '10', '大餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('222', '208', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('223', '209', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('224', '210', '5', '4', '0.00', '0', '3', '美白套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('225', '210', '1', '6', '0.00', '0', '7', '亲民套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('226', '211', '2', '4', '0.00', '0', '6', '白银套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('227', '212', '5', '4', '0.00', '0', '3', '美白套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('228', '212', '1', '6', '0.00', '0', '7', '亲民套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('229', '213', '5', '4', '0.00', '0', '3', '美白套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('230', '213', '1', '6', '0.00', '0', '7', '亲民套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('231', '214', '5', '4', '0.00', '0', '3', '美白套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('232', '214', '1', '6', '0.00', '0', '7', '亲民套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('233', '215', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('234', '216', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('235', '216', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('236', '217', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('237', '217', '2', '1', '0.00', '0', '6', '白银套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('238', '217', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('239', '218', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('240', '218', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('241', '218', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('242', '219', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('243', '219', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('244', '219', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('245', '220', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('246', '220', '2', '7', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('247', '221', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('248', '221', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('249', '221', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('250', '222', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('251', '222', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('252', '222', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('253', '223', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('254', '223', '2', '2', '0.00', '0', '6', '白银套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('255', '223', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('256', '224', '5', '1', '0.00', '0', '3', '美白套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('257', '224', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('258', '225', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('259', '225', '2', '7', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('260', '226', '5', '1', '0.00', '0', '3', '美白套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('261', '226', '2', '1', '0.00', '0', '668', '黄金套餐', '0', '0', '2', '辣椒', '0');
INSERT INTO `orders_box_lunch` VALUES ('262', '227', '4', '1', '0.00', '0', '4', '4', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('263', '227', '2', '7', '0.00', '0', '6', '白银套餐', '0', '0', '1', '老干妈', '0');
INSERT INTO `orders_box_lunch` VALUES ('321', '270', '3', '3', '0.00', '0', '5', '大餐', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('322', '270', '3', '3', '0.00', '0', '10', '大餐', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('323', '271', '4', '3', '0.00', '0', '0', '', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('324', '271', '3', '3', '0.00', '0', '666', '大餐', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('325', '272', '3', '3', '0.00', '0', '5', '大餐', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('326', '272', '3', '3', '0.00', '0', '10', '大餐', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('327', '273', '4', '3', '0.00', '0', '0', '', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('328', '273', '3', '3', '0.00', '0', '666', '大餐', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('329', '274', '3', '1', '0.00', '0', '5', '黄金套餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('330', '288', '3', '1', '0.00', '0', '10', '大餐', '0', '0', '0', '', '0');
INSERT INTO `orders_box_lunch` VALUES ('331', '294', '3', '3', '0.00', '0', '5', '大餐', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('332', '294', '3', '3', '0.00', '0', '10', '大餐', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('333', '295', '4', '3', '0.00', '0', '0', '', '0', '0', '1', '芝麻酱', '0');
INSERT INTO `orders_box_lunch` VALUES ('334', '295', '3', '3', '0.00', '0', '666', '大餐', '0', '0', '1', '芝麻酱', '0');

-- ----------------------------
-- Table structure for orders_self_box_lunch
-- ----------------------------
DROP TABLE IF EXISTS `orders_self_box_lunch`;
CREATE TABLE `orders_self_box_lunch` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int(20) NOT NULL DEFAULT '0' COMMENT '订单id',
  `box_lunch_id` int(20) NOT NULL DEFAULT '0' COMMENT '盒饭id',
  `box_lunch_number` int(10) NOT NULL DEFAULT '0' COMMENT '盒饭数量',
  `box_lunch_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '盒饭单价',
  `box_lunch_date` bigint(20) NOT NULL DEFAULT '0' COMMENT '订购那一天的盒饭',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `self_order_detail` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orders_self_box_lunch
-- ----------------------------
INSERT INTO `orders_self_box_lunch` VALUES ('137', '147', '101', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('138', '147', '2', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('139', '148', '101', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('140', '148', '102', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('141', '230', '2', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('142', '231', '2', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('143', '233', '217', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('144', '234', '218', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('145', '235', '227', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('146', '250', '224', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('147', '251', '227', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('148', '252', '226', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('149', '253', '227', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('150', '260', '231', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('151', '261', '226', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('152', '262', '227', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('153', '263', '227', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('154', '275', '234', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('155', '276', '1', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('156', '276', '2', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('157', '277', '2', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('158', '277', '3', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('159', '278', '1', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('160', '278', '2', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('161', '279', '2', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('162', '279', '3', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('163', '280', '246', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('164', '281', '247', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('165', '282', '254', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('166', '283', '252', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('167', '284', '255', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('168', '285', '256', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('169', '286', '1', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('170', '286', '2', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('171', '287', '2', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('172', '287', '3', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('173', '289', '263', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('174', '290', '264', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('175', '291', '265', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('176', '292', '267', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('177', '293', '278', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('178', '296', '283', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('179', '297', '284', '0', '0.00', '0');
INSERT INTO `orders_self_box_lunch` VALUES ('180', '298', '287', '0', '0.00', '0');

-- ----------------------------
-- Table structure for orders_status_times
-- ----------------------------
DROP TABLE IF EXISTS `orders_status_times`;
CREATE TABLE `orders_status_times` (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int(20) NOT NULL DEFAULT '0' COMMENT '订单id',
  `status_value` int(20) NOT NULL DEFAULT '0' COMMENT '订单状态:-1、预计送达时间；2、未配送',
  `order_status_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单状态时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orders_status_times
-- ----------------------------

-- ----------------------------
-- Table structure for red_packet_share_records
-- ----------------------------
DROP TABLE IF EXISTS `red_packet_share_records`;
CREATE TABLE `red_packet_share_records` (
  `sharing_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `sharing_record_date` date NOT NULL COMMENT '分享时间',
  `sharing_record` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '分享记录标识(根据时间联合判断是否是首次分享)',
  `sharing_record_type` tinyint(2) NOT NULL COMMENT '分享类型1=小程序分享得红包 2=红包分享得红包',
  PRIMARY KEY (`sharing_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分享记录表';

-- ----------------------------
-- Records of red_packet_share_records
-- ----------------------------
INSERT INTO `red_packet_share_records` VALUES ('30', '59', '2018-05-21', '1', '1');

-- ----------------------------
-- Table structure for red_packet_user
-- ----------------------------
DROP TABLE IF EXISTS `red_packet_user`;
CREATE TABLE `red_packet_user` (
  `red_packet_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `red_packet_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '红包金额',
  `red_packet_get_time` date NOT NULL COMMENT '红包获取时间',
  `red_packet_is_expired` int(10) NOT NULL DEFAULT '0' COMMENT '红包是否过期：0未过期，1已过期',
  `red_packet_is_used` int(10) NOT NULL DEFAULT '0' COMMENT '红包是否使用：0未使用，1已使用',
  `red_packet_type` tinyint(2) DEFAULT NULL COMMENT '红包类型1=评论 2=点赞 3=分享小程序',
  PRIMARY KEY (`red_packet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of red_packet_user
-- ----------------------------
INSERT INTO `red_packet_user` VALUES ('522', '60', '4.12', '2018-04-18', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('523', '60', '4.30', '2018-05-01', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('524', '60', '4.79', '2018-04-01', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('525', '60', '3.05', '2018-04-30', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('526', '60', '3.56', '2018-03-31', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('527', '60', '1.80', '2018-05-18', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('528', '60', '4.80', '2018-05-18', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('529', '60', '3.82', '2018-05-18', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('530', '60', '2.46', '2018-05-18', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('531', '60', '2.78', '2018-05-18', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('532', '60', '3.94', '2018-05-18', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('533', '60', '4.02', '2018-05-18', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('534', '60', '1.86', '2018-05-18', '1', '0', '2');
INSERT INTO `red_packet_user` VALUES ('535', '60', '4.57', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('536', '60', '6.55', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('537', '60', '3.14', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('538', '60', '3.28', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('539', '60', '2.72', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('540', '60', '5.88', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('541', '60', '2.91', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('542', '60', '2.47', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('543', '60', '2.52', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('544', '60', '2.54', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('545', '60', '2.95', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('546', '60', '2.62', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('547', '60', '5.53', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('548', '60', '2.84', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('549', '60', '5.66', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('550', '60', '3.75', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('551', '60', '1.89', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('552', '60', '5.81', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('553', '60', '2.81', '2018-05-21', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('554', '60', '3.90', '2018-05-22', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('555', '60', '5.33', '2018-05-22', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('556', '60', '1.92', '2018-05-22', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('557', '59', '4.77', '2018-05-25', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('558', '59', '3.92', '2018-05-25', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('559', '59', '6.63', '2018-05-25', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('560', '60', '3.06', '2018-05-25', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('561', '59', '6.39', '2018-05-25', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('562', '59', '5.83', '2018-05-25', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('563', '51', '3.32', '2018-05-28', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('564', '51', '4.03', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('565', '59', '2.52', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('566', '64', '5.52', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('567', '64', '4.96', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('568', '59', '3.00', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('569', '59', '3.58', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('570', '59', '2.08', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('571', '59', '3.47', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('572', '59', '4.35', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('573', '59', '3.41', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('574', '59', '1.95', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('575', '59', '6.42', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('576', '59', '5.77', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('577', '59', '3.15', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('578', '59', '4.02', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('579', '59', '6.09', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('580', '59', '5.91', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('581', '59', '2.37', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('582', '51', '6.50', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('583', '59', '2.73', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('584', '51', '1.70', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('585', '59', '2.82', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('586', '59', '2.04', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('587', '51', '2.13', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('588', '59', '4.71', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('589', '51', '3.68', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('590', '59', '1.93', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('591', '59', '5.30', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('592', '59', '5.64', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('593', '59', '5.92', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('594', '51', '2.59', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('595', '64', '5.76', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('596', '64', '5.15', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('597', '65', '2.55', '2018-05-29', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('598', '64', '3.89', '2018-05-31', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('599', '64', '4.70', '2018-05-31', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('600', '64', '3.23', '2018-05-31', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('601', '59', '2.47', '2018-06-04', '1', '0', '1');
INSERT INTO `red_packet_user` VALUES ('602', '59', '6.44', '2018-06-05', '0', '0', '1');
INSERT INTO `red_packet_user` VALUES ('603', '59', '2.00', '2018-06-05', '0', '0', '1');

-- ----------------------------
-- Table structure for self_box_lunch
-- ----------------------------
DROP TABLE IF EXISTS `self_box_lunch`;
CREATE TABLE `self_box_lunch` (
  `self_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自主点餐id',
  `user_id` int(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `box_lunch_number` int(20) NOT NULL DEFAULT '0' COMMENT '盒饭数量',
  `box_lunch_date` bigint(20) NOT NULL DEFAULT '0' COMMENT '盒饭订购日期',
  `box_lunch_price` decimal(10,2) DEFAULT NULL COMMENT '一份自助点餐盒饭的原价格',
  `box_lunch_sale_price` decimal(10,2) DEFAULT NULL COMMENT '一份自助点餐盒饭的折扣价',
  PRIMARY KEY (`self_id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='自助点餐购物车表';

-- ----------------------------
-- Records of self_box_lunch
-- ----------------------------
INSERT INTO `self_box_lunch` VALUES ('101', '59', '1', '1529981600000', '15.00', '13.50');
INSERT INTO `self_box_lunch` VALUES ('102', '59', '1', '1527264000000', '55.00', '46.00');
INSERT INTO `self_box_lunch` VALUES ('103', '59', '1', '1527264000000', '48.00', '39.50');
INSERT INTO `self_box_lunch` VALUES ('104', '59', '1', '1527264000000', '44.00', '36.50');
INSERT INTO `self_box_lunch` VALUES ('105', '59', '1', '1527264000000', '44.00', '36.50');
INSERT INTO `self_box_lunch` VALUES ('106', '59', '1', '1527264000000', '44.00', '36.50');
INSERT INTO `self_box_lunch` VALUES ('107', '59', '1', '1527474937000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('108', '59', '1', '1527474937000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('109', '59', '1', '1527474937000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('110', '59', '1', '1527474937000', '32.00', '26.50');
INSERT INTO `self_box_lunch` VALUES ('111', '59', '1', '1527264000000', '32.00', '26.50');
INSERT INTO `self_box_lunch` VALUES ('112', '59', '1', '1527264000000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('113', '59', '1', '1527264000000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('114', '59', '1', '1527264000000', '53.00', '45.00');
INSERT INTO `self_box_lunch` VALUES ('115', '59', '1', '1527264000000', '42.00', '34.50');
INSERT INTO `self_box_lunch` VALUES ('116', '59', '1', '1527264000000', '42.00', '34.50');
INSERT INTO `self_box_lunch` VALUES ('117', '59', '1', '1527264000000', '42.00', '34.50');
INSERT INTO `self_box_lunch` VALUES ('118', '59', '1', '1527264000000', '42.00', '34.50');
INSERT INTO `self_box_lunch` VALUES ('119', '59', '1', '1527436800000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('120', '59', '1', '1527436800000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('121', '59', '1', '1527264000000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('122', '59', '1', '1527264000000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('123', '59', '1', '1527264000000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('124', '59', '1', '1527350400000', '30.00', '24.50');
INSERT INTO `self_box_lunch` VALUES ('125', '59', '1', '1527264000000', '53.00', '45.00');
INSERT INTO `self_box_lunch` VALUES ('126', '59', '1', '1527264000000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('127', '59', '1', '1527264000000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('128', '59', '1', '1527264000000', '30.00', '24.50');
INSERT INTO `self_box_lunch` VALUES ('129', '59', '1', '1527264000000', '68.00', '58.50');
INSERT INTO `self_box_lunch` VALUES ('130', '59', '1', '1527350400000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('131', '59', '1', '1527264000000', '68.00', '58.50');
INSERT INTO `self_box_lunch` VALUES ('132', '59', '1', '1527350400000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('133', '59', '1', '1527350400000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('134', '59', '1', '1527350400000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('135', '59', '1', '1527350400000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('136', '59', '1', '1527350400000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('137', '59', '1', '1527436800000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('138', '59', '1', '1527264000000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('139', '59', '1', '1527264000000', '30.00', '24.50');
INSERT INTO `self_box_lunch` VALUES ('140', '59', '1', '1527264000000', '27.00', '23.50');
INSERT INTO `self_box_lunch` VALUES ('141', '59', '1', '1527264000000', '29.00', '25.50');
INSERT INTO `self_box_lunch` VALUES ('142', '59', '1', '1527350400000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('143', '59', '1', '1527264000000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('144', '59', '1', '1527264000000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('145', '59', '1', '1527264000000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('146', '59', '1', '1527350400000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('147', '59', '1', '1527264000000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('148', '59', '1', '1527350400000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('149', '59', '1', '1527436800000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('150', '59', '1', '1527264000000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('151', '59', '1', '1527264000000', '66.00', '55.00');
INSERT INTO `self_box_lunch` VALUES ('152', '60', '1', '1529981600000', '27.00', '21.50');
INSERT INTO `self_box_lunch` VALUES ('153', '60', '1', '1529981600000', '27.00', '21.50');
INSERT INTO `self_box_lunch` VALUES ('154', '60', '1', '1529981600000', '27.00', '21.50');
INSERT INTO `self_box_lunch` VALUES ('155', '60', '1', '1529981600000', '27.00', '21.50');
INSERT INTO `self_box_lunch` VALUES ('156', '60', '1', '1529981600000', '27.00', '21.50');
INSERT INTO `self_box_lunch` VALUES ('157', '60', '1', '1529981600000', '27.00', '21.50');
INSERT INTO `self_box_lunch` VALUES ('158', '60', '1', '1529981600000', '27.00', '21.50');
INSERT INTO `self_box_lunch` VALUES ('159', '60', '1', '1529981600000', '27.00', '21.50');
INSERT INTO `self_box_lunch` VALUES ('160', '60', '1', '1529981600000', '27.00', '21.50');
INSERT INTO `self_box_lunch` VALUES ('161', '59', '1', '1527264000000', '35.00', '30.50');
INSERT INTO `self_box_lunch` VALUES ('162', '59', '1', '1527523200000', '53.00', '45.00');
INSERT INTO `self_box_lunch` VALUES ('163', '59', '1', '1527523200000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('164', '59', '1', '1527523200000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('165', '59', '1', '1527523200000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('166', '60', '1', '1527609600000', '42.00', '33.50');
INSERT INTO `self_box_lunch` VALUES ('167', '59', '1', '1527523200000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('168', '59', '1', '1527523200000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('169', '59', '1', '1527523200000', '36.00', '30.50');
INSERT INTO `self_box_lunch` VALUES ('170', '59', '1', '1527523200000', '42.00', '35.00');
INSERT INTO `self_box_lunch` VALUES ('171', '59', '1', '1527523200000', '32.00', '27.50');
INSERT INTO `self_box_lunch` VALUES ('172', '59', '1', '1527609600000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('173', '59', '1', '1527523200000', '42.00', '35.00');
INSERT INTO `self_box_lunch` VALUES ('174', '59', '1', '1527523200000', '34.00', '28.00');
INSERT INTO `self_box_lunch` VALUES ('175', '59', '1', '1527523200000', '48.00', '41.00');
INSERT INTO `self_box_lunch` VALUES ('176', '59', '1', '1527523200000', '76.00', '63.00');
INSERT INTO `self_box_lunch` VALUES ('177', '59', '1', '1527523200000', '76.00', '63.00');
INSERT INTO `self_box_lunch` VALUES ('178', '59', '1', '1527523200000', '28.00', '24.50');
INSERT INTO `self_box_lunch` VALUES ('179', '59', '1', '1527523200000', '43.00', '37.00');
INSERT INTO `self_box_lunch` VALUES ('180', '59', '1', '1527523200000', '72.00', '59.00');
INSERT INTO `self_box_lunch` VALUES ('181', '64', '1', '1527609600000', '40.00', '35.10');
INSERT INTO `self_box_lunch` VALUES ('182', '64', '1', '1527609600000', '40.00', '35.10');
INSERT INTO `self_box_lunch` VALUES ('183', '65', '1', '1527609600000', '35.00', '31.00');
INSERT INTO `self_box_lunch` VALUES ('184', '64', '1', '1527609600000', '57.00', '49.90');
INSERT INTO `self_box_lunch` VALUES ('185', '59', '1', '1527523200000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('186', '59', '1', '1527523200000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('187', '59', '1', '1527523200000', '35.00', '31.00');
INSERT INTO `self_box_lunch` VALUES ('188', '59', '1', '1527609600000', '36.00', '32.00');
INSERT INTO `self_box_lunch` VALUES ('189', '59', '1', '1527523200000', '59.00', '49.00');
INSERT INTO `self_box_lunch` VALUES ('190', '59', '1', '1527609600000', '35.00', '31.00');
INSERT INTO `self_box_lunch` VALUES ('191', '59', '1', '1527523200000', '35.00', '31.00');
INSERT INTO `self_box_lunch` VALUES ('192', '59', '1', '1527523200000', '35.00', '31.00');
INSERT INTO `self_box_lunch` VALUES ('193', '59', '1', '1527609600000', '59.00', '49.00');
INSERT INTO `self_box_lunch` VALUES ('194', '59', '1', '1527609600000', '76.00', '63.00');
INSERT INTO `self_box_lunch` VALUES ('195', '59', '1', '1527609600000', '59.00', '49.00');
INSERT INTO `self_box_lunch` VALUES ('196', '59', '1', '1527609600000', '37.00', '32.00');
INSERT INTO `self_box_lunch` VALUES ('197', '59', '1', '1527696000000', '35.00', '31.00');
INSERT INTO `self_box_lunch` VALUES ('198', '59', '1', '1527609600000', '48.20', '40.20');
INSERT INTO `self_box_lunch` VALUES ('199', '59', '1', '1527609600000', '48.20', '40.20');
INSERT INTO `self_box_lunch` VALUES ('200', '59', '1', '1527609600000', '48.20', '40.20');
INSERT INTO `self_box_lunch` VALUES ('201', '59', '1', '1527609600000', '48.20', '40.20');
INSERT INTO `self_box_lunch` VALUES ('202', '59', '1', '1527523200000', '53.00', '44.00');
INSERT INTO `self_box_lunch` VALUES ('203', '59', '1', '1527609600000', '45.00', '37.00');
INSERT INTO `self_box_lunch` VALUES ('204', '59', '1', '1527609600000', '45.00', '37.00');
INSERT INTO `self_box_lunch` VALUES ('205', '59', '1', '1527609600000', '35.00', '30.50');
INSERT INTO `self_box_lunch` VALUES ('206', '59', '1', '1527523200000', '35.00', '30.50');
INSERT INTO `self_box_lunch` VALUES ('207', '51', '1', '1527523200000', '35.00', '30.50');
INSERT INTO `self_box_lunch` VALUES ('208', '59', '1', '1527609600000', '27.00', '23.50');
INSERT INTO `self_box_lunch` VALUES ('209', '59', '1', '1527609600000', '43.00', '37.50');
INSERT INTO `self_box_lunch` VALUES ('210', '59', '1', '1527609600000', '43.00', '37.50');
INSERT INTO `self_box_lunch` VALUES ('211', '59', '1', '1527523200000', '35.00', '30.50');
INSERT INTO `self_box_lunch` VALUES ('212', '59', '1', '1527609600000', '27.00', '23.50');
INSERT INTO `self_box_lunch` VALUES ('213', '59', '1', '1527609600000', '27.00', '23.50');
INSERT INTO `self_box_lunch` VALUES ('214', '59', '1', '1527523200000', '32.00', '26.50');
INSERT INTO `self_box_lunch` VALUES ('215', '59', '1', '1527523200000', '38.00', '33.00');
INSERT INTO `self_box_lunch` VALUES ('216', '59', '1', '1527609600000', '40.00', '33.50');
INSERT INTO `self_box_lunch` VALUES ('217', '59', '1', '1527609600000', '43.00', '37.50');
INSERT INTO `self_box_lunch` VALUES ('218', '59', '1', '1527523200000', '27.00', '23.50');
INSERT INTO `self_box_lunch` VALUES ('221', '59', '1', '1527696000000', '58.00', '48.00');
INSERT INTO `self_box_lunch` VALUES ('222', '64', '1', '1527609600000', '55.00', '46.00');
INSERT INTO `self_box_lunch` VALUES ('223', '51', '1', '1527523200000', '45.00', '37.50');
INSERT INTO `self_box_lunch` VALUES ('224', '59', '1', '1527696000000', '58.00', '48.00');
INSERT INTO `self_box_lunch` VALUES ('225', '51', '1', '1527523200000', '45.00', '37.50');
INSERT INTO `self_box_lunch` VALUES ('226', '64', '1', '1527609600000', '87.00', '74.00');
INSERT INTO `self_box_lunch` VALUES ('227', '51', '1', '1527523200000', '55.00', '45.00');
INSERT INTO `self_box_lunch` VALUES ('228', '59', '1', '1527696000000', '58.00', '48.00');
INSERT INTO `self_box_lunch` VALUES ('229', '59', '1', '1527696000000', '58.00', '48.00');
INSERT INTO `self_box_lunch` VALUES ('230', '59', '1', '1527696000000', '58.00', '48.00');
INSERT INTO `self_box_lunch` VALUES ('231', '59', '1', '1527696000000', '58.00', '48.00');
INSERT INTO `self_box_lunch` VALUES ('234', '59', '1', '1528041600000', '57.00', '48.80');
INSERT INTO `self_box_lunch` VALUES ('235', '64', '1', '1527696000000', '42.00', '36.50');
INSERT INTO `self_box_lunch` VALUES ('236', '59', '1', '1527782400000', '54.00', '44.50');
INSERT INTO `self_box_lunch` VALUES ('237', '59', '1', '1527782400000', '54.00', '44.50');
INSERT INTO `self_box_lunch` VALUES ('238', '59', '1', '1527782400000', '54.00', '44.50');
INSERT INTO `self_box_lunch` VALUES ('239', '59', '1', '1527782400000', '29.00', '24.00');
INSERT INTO `self_box_lunch` VALUES ('240', '59', '1', '1527782400000', '45.00', '38.00');
INSERT INTO `self_box_lunch` VALUES ('241', '59', '1', '1527782400000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('242', '59', '1', '1527782400000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('243', '59', '1', '1527782400000', '43.00', '36.50');
INSERT INTO `self_box_lunch` VALUES ('244', '59', '1', '1527782400000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('245', '59', '1', '1527782400000', '45.00', '37.00');
INSERT INTO `self_box_lunch` VALUES ('246', '59', '1', '1527782400000', '32.20', '26.20');
INSERT INTO `self_box_lunch` VALUES ('247', '64', '1', '1527782400000', '47.00', '39.50');
INSERT INTO `self_box_lunch` VALUES ('248', '64', '1', '1527782400000', '55.00', '46.50');
INSERT INTO `self_box_lunch` VALUES ('249', '59', '1', '1527782400000', '42.00', '35.00');
INSERT INTO `self_box_lunch` VALUES ('250', '59', '1', '1527782400000', '42.00', '35.00');
INSERT INTO `self_box_lunch` VALUES ('251', '59', '1', '1527955200000', '42.00', '35.00');
INSERT INTO `self_box_lunch` VALUES ('252', '61', '1', '1527782400000', '60.00', '49.00');
INSERT INTO `self_box_lunch` VALUES ('253', '59', '1', '1527782400000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('254', '64', '1', '1527782400000', '35.00', '29.80');
INSERT INTO `self_box_lunch` VALUES ('255', '61', '1', '1527782400000', '53.20', '43.20');
INSERT INTO `self_box_lunch` VALUES ('256', '60', '1', '1527782400000', '78.20', '65.20');
INSERT INTO `self_box_lunch` VALUES ('257', '59', '1', '1527868800000', '21.00', '18.00');
INSERT INTO `self_box_lunch` VALUES ('258', '61', '1', '1527868800000', '54.00', '44.50');
INSERT INTO `self_box_lunch` VALUES ('259', '64', '1', '1527868800000', '64.00', '53.50');
INSERT INTO `self_box_lunch` VALUES ('260', '64', '1', '1527868800000', '64.00', '53.50');
INSERT INTO `self_box_lunch` VALUES ('261', '61', '1', '1527868800000', '54.00', '44.50');
INSERT INTO `self_box_lunch` VALUES ('262', '61', '1', '1527868800000', '54.00', '44.50');
INSERT INTO `self_box_lunch` VALUES ('263', '59', '1', '1528214400000', '30.00', '25.00');
INSERT INTO `self_box_lunch` VALUES ('264', '59', '1', '1528128000000', '52.00', '42.00');
INSERT INTO `self_box_lunch` VALUES ('265', '59', '1', '1528214400000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('266', '64', '1', '1528214400000', '29.00', '25.00');
INSERT INTO `self_box_lunch` VALUES ('267', '64', '1', '1528214400000', '29.00', '25.00');
INSERT INTO `self_box_lunch` VALUES ('268', '64', '1', '1528214400000', '29.00', '25.00');
INSERT INTO `self_box_lunch` VALUES ('269', '64', '1', '1528214400000', '29.00', '25.00');
INSERT INTO `self_box_lunch` VALUES ('270', '59', '1', '1528128000000', '38.00', '31.50');
INSERT INTO `self_box_lunch` VALUES ('271', '64', '1', '1528214400000', '45.00', '38.50');
INSERT INTO `self_box_lunch` VALUES ('272', '64', '1', '1528214400000', '45.00', '38.50');
INSERT INTO `self_box_lunch` VALUES ('273', '64', '1', '1528214400000', '36.00', '30.00');
INSERT INTO `self_box_lunch` VALUES ('274', '59', '1', '1528128000000', '35.00', '30.50');
INSERT INTO `self_box_lunch` VALUES ('275', '64', '1', '1528214400000', '34.00', '27.80');
INSERT INTO `self_box_lunch` VALUES ('276', '59', '1', '1528128000000', '35.00', '30.50');
INSERT INTO `self_box_lunch` VALUES ('277', '59', '1', '1528300800000', '22.00', '19.00');
INSERT INTO `self_box_lunch` VALUES ('278', '59', '1', '1528214400000', '36.00', '30.00');
INSERT INTO `self_box_lunch` VALUES ('279', '64', '1', '1528214400000', '33.00', '28.00');
INSERT INTO `self_box_lunch` VALUES ('280', '59', '1', '1528128000000', '42.00', '35.00');
INSERT INTO `self_box_lunch` VALUES ('281', '59', '1', '1528128000000', '42.00', '35.00');
INSERT INTO `self_box_lunch` VALUES ('282', '59', '1', '1528214400000', '42.00', '35.00');
INSERT INTO `self_box_lunch` VALUES ('283', '59', '1', '1528128000000', '32.20', '26.20');
INSERT INTO `self_box_lunch` VALUES ('284', '59', '1', '1528214400000', '48.00', '40.50');
INSERT INTO `self_box_lunch` VALUES ('285', '59', '1', '1528214400000', '30.00', '25.00');
INSERT INTO `self_box_lunch` VALUES ('287', '61', '1', '1528473600000', '68.00', '57.50');

-- ----------------------------
-- Table structure for self_box_lunch_detail
-- ----------------------------
DROP TABLE IF EXISTS `self_box_lunch_detail`;
CREATE TABLE `self_box_lunch_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `self_id` int(20) NOT NULL,
  `food_id` int(20) NOT NULL,
  `food_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `food_number` int(20) DEFAULT NULL,
  `food_sale_price` decimal(10,2) DEFAULT NULL,
  `food_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `food_images_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `food_price` decimal(10,2) DEFAULT NULL,
  `comment_status` int(10) DEFAULT '0' COMMENT '盒饭评论状态0=未评论 1=已评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=927 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of self_box_lunch_detail
-- ----------------------------
INSERT INTO `self_box_lunch_detail` VALUES ('507', '199', '2', '红烧鸡腿222', '1', '8.20', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '10.20', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('508', '199', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('509', '199', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('510', '199', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('511', '200', '2', '红烧鸡腿222', '1', '8.20', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '10.20', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('512', '200', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('513', '200', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('514', '200', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('515', '201', '2', '红烧鸡腿222', '1', '8.20', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '10.20', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('516', '201', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('517', '201', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('518', '201', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('519', '202', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('520', '202', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('521', '202', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('522', '202', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('523', '203', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('524', '203', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('525', '203', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('526', '203', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('527', '204', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('528', '204', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('529', '204', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('530', '204', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('531', '205', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('532', '205', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('533', '205', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('534', '205', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('535', '206', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('536', '206', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('537', '206', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('538', '206', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('539', '207', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('540', '207', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('541', '207', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('542', '207', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('543', '208', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('544', '208', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('545', '208', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('546', '208', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('547', '209', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('548', '209', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('549', '209', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('550', '209', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('551', '210', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('552', '210', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('553', '210', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('554', '210', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('555', '211', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('556', '211', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('557', '211', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('558', '211', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('559', '212', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('560', '212', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('561', '212', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('562', '212', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('563', '213', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('564', '213', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('565', '213', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('566', '213', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('567', '214', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('568', '214', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('569', '214', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('570', '214', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('571', '215', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('572', '215', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('573', '215', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('574', '215', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('575', '216', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('576', '216', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('577', '216', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('578', '216', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('579', '217', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('580', '217', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('581', '217', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('582', '217', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('583', '218', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('584', '218', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('585', '218', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('586', '218', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('587', '26', '1', '台湾卤肉111', '1', '17.00', '主菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('588', '26', '3', '鱼排333', '1', '11.00', '辅菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('589', '26', '6', '肉饼蒸蛋666', '1', '11.00', '小菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('590', '26', '1', '台湾卤肉111', '1', '17.00', '主菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('591', '26', '3', '鱼排333', '1', '11.00', '辅菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('592', '26', '6', '肉饼蒸蛋666', '1', '11.00', '小菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('593', '221', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('594', '221', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('595', '221', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('596', '221', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('597', '221', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('598', '221', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('599', '221', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('600', '222', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('601', '222', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('602', '222', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('603', '222', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('604', '222', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('605', '222', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('606', '222', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('607', '223', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('608', '223', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('609', '223', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('610', '223', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('611', '223', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('612', '223', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('613', '223', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('614', '224', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('615', '224', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('616', '224', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('617', '224', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('618', '224', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('619', '224', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('620', '224', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('621', '225', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('622', '225', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('623', '225', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('624', '225', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('625', '225', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('626', '225', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('627', '225', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('628', '226', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('629', '226', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('630', '226', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('631', '226', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('632', '226', '15', '三杯鸡128', '7', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('633', '226', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('634', '226', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('635', '227', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('636', '227', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('637', '227', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('638', '227', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('639', '227', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('640', '227', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('641', '227', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('642', '228', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('643', '228', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('644', '228', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('645', '228', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('646', '228', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('647', '228', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('648', '228', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('649', '229', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('650', '229', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('651', '229', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('652', '229', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('653', '229', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('654', '229', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('655', '229', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('656', '230', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('657', '230', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('658', '230', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('659', '230', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('660', '230', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('661', '230', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('662', '230', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('663', '231', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('664', '231', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('665', '231', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('666', '231', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('667', '231', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('668', '231', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('669', '231', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('670', '26', '1', '台湾卤肉111', '1', '17.00', '主菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('671', '26', '3', '鱼排333', '1', '11.00', '辅菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('672', '26', '6', '肉饼蒸蛋666', '1', '11.00', '小菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('673', '26', '1', '台湾卤肉111', '1', '17.00', '主菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('674', '26', '3', '鱼排333', '1', '11.00', '辅菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('675', '26', '6', '肉饼蒸蛋666', '1', '11.00', '小菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('676', '234', '5', '红焖鲤鱼555', '1', '11.80', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '13.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('677', '234', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('678', '234', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('679', '234', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('680', '235', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('681', '235', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('682', '235', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('683', '235', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('684', '236', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('685', '236', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('686', '236', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('687', '236', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('688', '236', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('689', '236', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('690', '236', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('691', '237', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('692', '237', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('693', '237', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('694', '237', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('695', '237', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('696', '237', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('697', '237', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('698', '238', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('699', '238', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('700', '238', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('701', '238', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('702', '238', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('703', '238', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('704', '238', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('705', '239', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('706', '239', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('707', '239', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('708', '239', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('709', '239', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('710', '240', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('711', '240', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('712', '240', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('713', '240', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('714', '240', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('715', '241', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('716', '241', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('717', '241', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('718', '241', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('719', '242', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('720', '242', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('721', '242', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('722', '242', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('723', '243', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('724', '243', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('725', '243', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('726', '243', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('727', '244', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('728', '244', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('729', '244', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('730', '244', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('731', '245', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('732', '245', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('733', '245', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('734', '245', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('735', '246', '2', '红烧鸡腿222', '1', '8.20', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '10.20', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('736', '246', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('737', '246', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('738', '246', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('739', '247', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('740', '247', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('741', '247', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('742', '247', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('743', '247', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('744', '248', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('745', '248', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('746', '248', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('747', '248', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('748', '248', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('749', '249', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('750', '249', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('751', '249', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('752', '249', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('753', '250', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('754', '250', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('755', '250', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('756', '250', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('757', '251', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('758', '251', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('759', '251', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('760', '251', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('761', '252', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('762', '252', '10', '咖喱牛肉123', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('763', '252', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('764', '252', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('765', '253', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('766', '253', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('767', '253', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('768', '253', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('769', '254', '5', '红焖鲤鱼555', '1', '11.80', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '13.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('770', '254', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('771', '254', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('772', '254', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('773', '255', '2', '红烧鸡腿222', '1', '8.20', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '10.20', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('774', '255', '10', '咖喱牛肉123', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('775', '255', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('776', '255', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('777', '256', '2', '红烧鸡腿222', '1', '8.20', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '10.20', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('778', '256', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('779', '256', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('780', '256', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('781', '256', '15', '三杯鸡128', '5', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('782', '256', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('783', '256', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('784', '257', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('785', '257', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('786', '257', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('787', '257', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('788', '258', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('789', '258', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('790', '258', '10', '咖喱牛肉123', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('791', '258', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('792', '258', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('793', '259', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('794', '259', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('795', '259', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('796', '259', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('797', '259', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('798', '259', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('799', '259', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('800', '260', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('801', '260', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('802', '260', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('803', '260', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('804', '260', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('805', '260', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('806', '260', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '4.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('807', '261', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('808', '261', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('809', '261', '10', '咖喱牛肉123', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('810', '261', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('811', '261', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('812', '262', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('813', '262', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('814', '262', '10', '咖喱牛肉123', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('815', '262', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('816', '262', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('817', '263', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('818', '263', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('819', '263', '9', '椒盐几块999', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('820', '263', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('821', '263', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('822', '264', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('823', '264', '10', '咖喱牛肉123', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('824', '264', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('825', '264', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('826', '26', '1', '台湾卤肉111', '1', '17.00', '主菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('827', '26', '3', '鱼排333', '1', '11.00', '辅菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('828', '26', '6', '肉饼蒸蛋666', '1', '11.00', '小菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('829', '26', '1', '台湾卤肉111', '1', '17.00', '主菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('830', '26', '3', '鱼排333', '1', '11.00', '辅菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('831', '26', '6', '肉饼蒸蛋666', '1', '11.00', '小菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('832', '265', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('833', '265', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('834', '265', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('835', '265', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('836', '266', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('837', '266', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('838', '266', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('839', '266', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('840', '267', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('841', '267', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('842', '267', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('843', '267', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('844', '268', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('845', '268', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('846', '268', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('847', '268', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('848', '269', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('849', '269', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('850', '269', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('851', '269', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('852', '270', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('853', '270', '10', '咖喱牛肉123', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('854', '270', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('855', '270', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('856', '271', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('857', '271', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('858', '271', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('859', '271', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('860', '272', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('861', '272', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('862', '272', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('863', '272', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('864', '273', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('865', '273', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('866', '273', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('867', '273', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('868', '274', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('869', '274', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('870', '274', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('871', '274', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('872', '275', '5', '红焖鲤鱼555', '1', '11.80', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '13.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('873', '275', '10', '咖喱牛肉123', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('874', '275', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('875', '275', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('876', '276', '3', '鱼排333', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('877', '276', '7', '蜂蜜烤鸡翅777', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('878', '276', '14', '东坡肉127', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('879', '276', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('880', '277', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('881', '277', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('882', '277', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('883', '277', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('884', '278', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('885', '278', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('886', '278', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('887', '278', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('888', '279', '4', '啤酒鸭444', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('889', '279', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('890', '279', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('891', '279', '15', '三杯鸡128', '2', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('892', '280', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('893', '280', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('894', '280', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('895', '280', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('896', '281', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('897', '281', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('898', '281', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('899', '281', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('900', '282', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('901', '282', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('902', '282', '12', '红烧牛蛙125', '1', '9.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '11.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('903', '282', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('904', '283', '2', '红烧鸡腿222', '1', '8.20', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '10.20', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('905', '283', '6', '肉饼蒸蛋666', '1', '7.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '9.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('906', '283', '13', '香菇滑鸡126', '1', '4.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('907', '283', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('908', '284', '1', '台湾卤肉111', '1', '14.00', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '17.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('909', '284', '8', '杭州酱鸭888', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('910', '284', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp_9754cf3505eb714a733e0aa7fea537fc.jpg', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('911', '284', '15', '三杯鸡128', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp_5d4c852fba225b0bf323220a1214ca2813737489589a31af.jpg', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('912', '285', '4', '啤酒鸭', '1', '6.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('913', '285', '8', '杭州酱鸭', '1', '5.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '6.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('914', '285', '9', '椒盐几块', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('915', '285', '11', '米饭', '1', '0.50', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '1.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('916', '285', '15', '三杯鸡128', '1', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('917', '26', '1', '台湾卤肉111', '1', '17.00', '主菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('918', '26', '3', '鱼排333', '1', '11.00', '辅菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('919', '26', '6', '肉饼蒸蛋666', '1', '11.00', '小菜', 'http://xxx.jpg', null, '0');
INSERT INTO `self_box_lunch_detail` VALUES ('920', '287', '3', '鱼排', '1', '13.50', '主菜', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '15.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('921', '287', '7', '蜂蜜烤鸡翅', '1', '4.00', '辅菜', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('922', '287', '9', '椒盐几块', '1', '6.00', '配汤', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('923', '287', '14', '东坡肉', '1', '6.00', '主食', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '7.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('924', '287', '15', '三杯鸡', '3', '7.00', '小菜', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '8.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('925', '287', '18', '苹果', '1', '4.00', '水果', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '5.00', '0');
INSERT INTO `self_box_lunch_detail` VALUES ('926', '287', '19', '冰红茶', '1', '3.00', '饮料', 'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs29e6Jy8xKAbj61W9Rh_l2U.Rg4OBO9YSgpz3b42fb766a482d217ec9e0a70a014124.png', '4.00', '0');

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `shop_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `shop_name` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_city` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '店铺城市',
  `red_packet_rule` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '店铺红包规则',
  `shop_discount_deadline` bigint(20) NOT NULL COMMENT '优惠截止时间',
  `shop_discount_desc` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '优惠描述',
  `shop_buy_deadline` bigint(20) NOT NULL COMMENT '下单截止时间',
  `shop_self_surface_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商铺自助点餐包装费',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('1', '杭州大江东中央厨房', '杭州', '叠加使用', '32400000', '开店优惠', '36000000', '25.00');

-- ----------------------------
-- Table structure for u_permission
-- ----------------------------
DROP TABLE IF EXISTS `u_permission`;
CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '接口地址',
  `permission_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_permission
-- ----------------------------
INSERT INTO `u_permission` VALUES ('1', '/user/login', '用户登陆');
INSERT INTO `u_permission` VALUES ('2', '/user/showUser', '用户展示接口');

-- ----------------------------
-- Table structure for u_role
-- ----------------------------
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '角色名称',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_role
-- ----------------------------
INSERT INTO `u_role` VALUES ('1', '超级管理员', '1');
INSERT INTO `u_role` VALUES ('2', '项目经理', '2');

-- ----------------------------
-- Table structure for u_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `u_role_permission`;
CREATE TABLE `u_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户姓名',
  `user_nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户密码',
  `user_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户手机号',
  `user_avatar_url` varchar(1550) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '微信头像图片url',
  `user_sex` int(1) NOT NULL DEFAULT '0' COMMENT '用户性别 0:未知 1:男性 2:女性',
  `user_age` int(10) NOT NULL DEFAULT '0' COMMENT '用户年龄',
  `user_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `user_status` int(1) NOT NULL DEFAULT '0' COMMENT '用户状态:待设计',
  `user_last_login_time` timestamp NOT NULL DEFAULT '2018-05-28 16:56:38' ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间',
  `user_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户登陆token',
  `user_wx_openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户微信openid',
  `user_wx_session_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '微信会话密钥',
  `shop_id` int(20) NOT NULL DEFAULT '1' COMMENT '店铺id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('51', '张嘉璐', 'zhangjialu', '', '', 'http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=%E5%A4%B4%E5%83%8F&hs=0&pn=12&spn=0&di=155971080100&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=2367082103%2C670880952&os=1399163382%2C1218562443&simid=3502924248%2C328424039&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=head&bdtype=0&oriquery=%E5%A4%B4%E5%83%8F&objurl=http%3A%2F%2Fp1.qqyou.com%2Ftouxiang%2FUploadPic%2F2014-7%2F3%2F2014070318131624354.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3Bqqy57_z%26e3Bv54AzdH3Fp57xtwg2AzdH3Ffi5oAzdH3Fdd8l88_z%26e3Bip4s&gsm=0&islist=&querylist=', '0', '0', '2018-05-10 12:10:35', '0', '2018-06-05 12:30:51', '1UmvoDanevSPicCPaQf25x9SJsY1rMjmX3e91jEYL2rfo0UIrJK6Mw==', 'ooa8n45jJnEgOa_MB8b2I0AgOpR8', '', '1');
INSERT INTO `u_user` VALUES ('59', '郝柳婷', 'Fay', '', '', 'http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=%E5%A4%B4%E5%83%8F&hs=0&pn=12&spn=0&di=155971080100&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=2367082103%2C670880952&os=1399163382%2C1218562443&simid=3502924248%2C328424039&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=head&bdtype=0&oriquery=%E5%A4%B4%E5%83%8F&objurl=http%3A%2F%2Fp1.qqyou.com%2Ftouxiang%2FUploadPic%2F2014-7%2F3%2F2014070318131624354.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3Bqqy57_z%26e3Bv54AzdH3Fp57xtwg2AzdH3Ffi5oAzdH3Fdd8l88_z%26e3Bip4s&gsm=0&islist=&querylist=', '1', '0', '2018-05-10 12:32:59', '0', '2018-06-08 03:17:44', 'dyHVSxMEuEOQvUqYi9oDU0Ap5vm1xlZ9jq/vDvO+3TLfo0UIrJK6Mw==', 'ooa8n45ujnDgQpv_v4oaacA3QJT8', '', '1');
INSERT INTO `u_user` VALUES ('60', '陆月炎', 'lyy', '', '', 'http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=%E5%A4%B4%E5%83%8F&hs=0&pn=12&spn=0&di=155971080100&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=2367082103%2C670880952&os=1399163382%2C1218562443&simid=3502924248%2C328424039&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=head&bdtype=0&oriquery=%E5%A4%B4%E5%83%8F&objurl=http%3A%2F%2Fp1.qqyou.com%2Ftouxiang%2FUploadPic%2F2014-7%2F3%2F2014070318131624354.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3Bqqy57_z%26e3Bv54AzdH3Fp57xtwg2AzdH3Ffi5oAzdH3Fdd8l88_z%26e3Bip4s&gsm=0&islist=&querylist=', '1', '0', '2018-05-10 12:39:20', '0', '2018-05-31 15:41:16', 'FgpcnXpw9SRC9HzOzJwiIbyCHlW7v601UNGav/TEO/RPwKmMMrrQUQ==', 'ooa8n48gNM-IDeIoyUPhqx5VuMEc', '', '1');
INSERT INTO `u_user` VALUES ('61', '何忠', 'hlt', '', '', 'http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=%E5%A4%B4%E5%83%8F&hs=0&pn=12&spn=0&di=155971080100&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=2367082103%2C670880952&os=1399163382%2C1218562443&simid=3502924248%2C328424039&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=head&bdtype=0&oriquery=%E5%A4%B4%E5%83%8F&objurl=http%3A%2F%2Fp1.qqyou.com%2Ftouxiang%2FUploadPic%2F2014-7%2F3%2F2014070318131624354.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3Bqqy57_z%26e3Bv54AzdH3Fp57xtwg2AzdH3Ffi5oAzdH3Fdd8l88_z%26e3Bip4s&gsm=0&islist=&querylist=', '0', '0', '2018-05-16 15:06:35', '0', '2018-06-08 03:22:38', 'SeZ8SwzT4nmKbDFjWyHD1XRkO1ISbdVXCYt3g6rMzpJ4dX8eRsq/Lw==', 'ooa8n4z4gKoz_hZgrFh-guzL_Se0', '', '1');
INSERT INTO `u_user` VALUES ('62', '靳楠楠', '雷神vs钢铁侠', '', '', '', '0', '0', '2018-05-18 13:50:48', '0', '2018-05-22 14:15:19', '8F+IWXOCMefQgNiLjSdyPh313p3BkEpo', 'qqqqqqqqqqqqqqqqq', '', '1');
INSERT INTO `u_user` VALUES ('63', '', 'hlt', '', '', '', '0', '0', '2018-05-24 12:51:34', '0', '2018-05-28 10:50:04', 'jgxkk7vlOTT1KYSIA10uIR2IebptQ1wIMQkQ2B+IQ2SFWKVNRlYFlw==', 'ooa8n4773wFh5y95Ik1weKASp7CQ', '', '1');
INSERT INTO `u_user` VALUES ('64', '', '', '', '', '', '0', '0', '2018-05-28 11:02:16', '0', '2018-06-04 13:15:43', 'i/8lMxxRgyFRmnJEdnMU4xfaBQta+pBv/fIrgFDsKI94dX8eRsq/Lw==', 'ooa8n45Paze82TwjDg4AZ4sFopj0', '', '1');
INSERT INTO `u_user` VALUES ('65', '', '', '', '', '', '0', '0', '2018-05-28 13:17:02', '0', '2018-05-31 14:39:53', 'tsc89H8ZFxCF/x383hm0NG6/nshWIlDMrZRGDu+vBvnaNdntfEz2Kg==', 'ooa8n4xzEYuECRw7_kffsEeOoQPw', '', '1');

-- ----------------------------
-- Table structure for u_user_role
-- ----------------------------
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of u_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for user_advise
-- ----------------------------
DROP TABLE IF EXISTS `user_advise`;
CREATE TABLE `user_advise` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '自增的主键',
  `user_id` int(20) NOT NULL COMMENT '提交反馈建议的用户id',
  `content` longtext CHARACTER SET utf8 NOT NULL COMMENT '用户提交的建议内容',
  `advise_put_time` timestamp NOT NULL DEFAULT '2018-05-28 16:56:38' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_advise
-- ----------------------------
INSERT INTO `user_advise` VALUES ('2', '3', '饭好吃', '2018-05-11 12:43:06');
INSERT INTO `user_advise` VALUES ('3', '3', '发大水发是的范德萨打算发发发送到阿大声道发送到发送到打算第三方阿发打算阿斯蒂芬发多少发多少发多少地方撒发多少发大水发送达送达发的孙菲菲爱迪生发多少防守打法发送到大大师傅送达防守打法会激发大家adskjkjklklj dsk的数据库框架的萨科技发达范德萨发肯定是开发家科技的愤怒的哈佛大开发大赛开始的反抗级大师框架咖啡色的发年货大开发加快了开发爱空间的的司法会计肯定撒绝对是咖科技送达方可框架', '2018-05-10 12:53:33');
INSERT INTO `user_advise` VALUES ('4', '3', '算发送到发啊打算阿发大多数发多少否爱迪生发多少大方的阿道夫阿达的发放日天气而我热饭法人额嘎嘎大厦十多个阿发噶打算俺的沙发打的方式发放爱迪生发放多少防守打法爱迪生发大水俺的沙发', '2018-05-11 14:14:16');
INSERT INTO `user_advise` VALUES ('5', '3', '算发送到发啊打算阿发大多数发多少否爱迪生发多少大方的阿道夫阿达的发放日天气而我热饭法人额嘎嘎大厦十多个阿发噶打算俺的沙发打的方式发放爱迪生发放多少防守打法爱迪生发大水俺的沙发', '2018-05-11 14:17:29');
INSERT INTO `user_advise` VALUES ('6', '4', '算发送到发啊打算阿发大多数发多少否爱迪生发多少大方的阿道夫阿达的发放日天气而我热饭法人额嘎嘎大厦十多个阿发噶打算俺的沙发打的方式发放爱迪生发放多少防守打法爱迪生发大水俺的沙发', '2018-05-11 14:30:41');
INSERT INTO `user_advise` VALUES ('7', '4', '算发送到发啊打算阿发大多数发多少否爱迪生发多少大方的阿道夫阿达的发放日天气而我热饭法人额嘎嘎大厦十多个阿发噶打算俺的沙发打的方式发放爱迪生发放多少防守打法爱迪生发大水俺的沙发', '2018-05-11 14:31:32');
INSERT INTO `user_advise` VALUES ('8', '4', '算发送到发啊打算阿发大多数发多少否爱迪生发多少大方的阿道夫阿达的发放日天气而我热饭法人额嘎嘎大厦十多个阿发噶打算俺的沙发打的方式发放爱迪生发放多少防守打法爱迪生发大水俺的沙发', '2018-05-11 14:31:32');
INSERT INTO `user_advise` VALUES ('9', '5', '112发大水发', '2018-05-11 15:12:07');
INSERT INTO `user_advise` VALUES ('10', '5', '112发大水发', '2018-05-11 15:14:47');
INSERT INTO `user_advise` VALUES ('11', '5', '112发大水发', '2018-05-11 15:15:30');
INSERT INTO `user_advise` VALUES ('12', '6', 'dasf asd afds', '2018-05-11 15:46:24');
INSERT INTO `user_advise` VALUES ('13', '6', '1', '2018-05-11 15:46:40');
INSERT INTO `user_advise` VALUES ('14', '59', 'hahahahahaha', '2018-05-11 15:54:21');
INSERT INTO `user_advise` VALUES ('15', '60', 'eee', '2018-05-11 15:58:18');
INSERT INTO `user_advise` VALUES ('24', '60', '凤飞飞', '2018-05-14 10:55:53');
INSERT INTO `user_advise` VALUES ('25', '60', '飞飞飞', '2018-05-14 10:58:20');
INSERT INTO `user_advise` VALUES ('26', '60', 'aaaa', '2018-05-14 10:58:43');
INSERT INTO `user_advise` VALUES ('27', '60', 'dddd', '2018-05-25 15:37:52');
INSERT INTO `user_advise` VALUES ('28', '60', 'sss风飞沙地方底色', '2018-05-25 15:39:20');
INSERT INTO `user_advise` VALUES ('29', '60', 'lyyyuuuuuuuuuuuuu', '2018-05-25 15:40:08');
INSERT INTO `user_advise` VALUES ('30', '61', 'afsd fads afd', '2018-06-08 11:31:20');

-- ----------------------------
-- View structure for address_whole
-- ----------------------------
DROP VIEW IF EXISTS `address_whole`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `address_whole` AS select `a`.`address_id` AS `address_id`,`a`.`address_name` AS `address_name`,`a`.`address_phone` AS `address_phone`,`b`.`location_building` AS `location_building`,`b`.`address_detail` AS `address_detail`,`c`.`district_name` AS `district_name`,`d`.`city_name` AS `city_name`,`a`.`address_default` AS `address_default`,`a`.`user_id` AS `user_id`,`e`.`user_sex` AS `user_sex` from ((((`addresses` `a` join `locations` `b`) join `district` `c`) join `city` `d`) join `u_user` `e`) where ((`b`.`location_id` = `a`.`location_id`) and (`c`.`district_id` = `b`.`district_id`) and (`d`.`city_id` = `c`.`city_id`) and (`e`.`user_id` = `a`.`user_id`)) ;

-- ----------------------------
-- View structure for orders_list
-- ----------------------------
DROP VIEW IF EXISTS `orders_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_list` AS select `a`.`order_id` AS `order_id`,`a`.`order_create_time` AS `order_create_time`,`a`.`order_status` AS `order_status`,`a`.`order_type` AS `order_type`,`c`.`box_lunch_number` AS `box_lunch_number`,`c`.`box_lunch_date` AS `box_lunch_date`,`b`.`box_lunch_id` AS `box_lunch_name`,`b`.`box_lunch_price` AS `box_lunch_price`,`c`.`self_id` AS `sku_id`,`b`.`id` AS `sku_name`,`d`.`food_name` AS `food_name` from ((((`orders` `a` left join `orders_self_box_lunch` `b` on((`b`.`order_id` = `a`.`order_id`))) left join `self_box_lunch` `c` on((`c`.`self_id` = `b`.`box_lunch_id`))) left join `self_box_lunch_detail` `d` on((`d`.`self_id` = `c`.`self_id`))) left join `foods` `e` on((`e`.`food_id` = `d`.`food_id`))) where (`a`.`order_type` = 1) union select `a`.`order_id` AS `order_id`,`a`.`order_create_time` AS `order_create_time`,`a`.`order_status` AS `order_status`,`a`.`order_type` AS `order_type`,`b`.`box_lunch_number` AS `box_lunch_number`,`b`.`box_lunch_date` AS `box_lunch_date`,`c`.`box_lunch_name` AS `box_lunch_name`,`b`.`box_lunch_price` AS `box_lunch_price`,`b`.`sku_id` AS `sku_id`,`d`.`sku_name` AS `sku_name`,`b`.`id` AS `food_name` from (((`orders` `a` left join `orders_box_lunch` `b` on((`b`.`order_id` = `a`.`order_id`))) left join `box_lunch_sku` `d` on((`d`.`sku_id` = `b`.`sku_id`))) left join `box_lunch` `c` on((`c`.`box_lunch_id` = `d`.`box_lunch_id`))) where (`a`.`order_type` = 0) ;

-- ----------------------------
-- View structure for person_box_lunch
-- ----------------------------
DROP VIEW IF EXISTS `person_box_lunch`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `person_box_lunch` AS select `b`.`date_timestamp` AS `date_timestamp`,`a`.`box_lunch_id` AS `box_lunch_id`,`a`.`category_id` AS `category_id`,`d`.`category_name` AS `category_name`,`a`.`box_lunch_name` AS `box_lunch_name`,`a`.`box_lunch_price` AS `box_lunch_price`,`a`.`box_lunch_sale_price` AS `box_lunch_sale_price`,`a`.`box_lunch_desc` AS `box_lunch_desc`,`a`.`box_lunch_status` AS `box_lunch_status`,`a`.`box_lunch_like_number` AS `box_lunch_like_number`,`a`.`box_lunch_sold_number` AS `box_lunch_sold_number`,`a`.`box_lunch_images_url` AS `box_lunch_images_url`,`a`.`default_sku_id` AS `default_sku_id`,`a`.`box_lunch_remain_number` AS `box_lunch_remain_number`,`c`.`box_lunch_id` AS `s_box_lunch_id`,`c`.`sku_id` AS `sku_id`,`c`.`sku_name` AS `sku_name`,`c`.`sku_price` AS `sku_price`,`c`.`sku_sale_price` AS `sku_sale_price`,`c`.`sku_status` AS `sku_status` from (((`box_lunch` `a` join `date_box_lunch` `b` on((`a`.`box_lunch_id` = `b`.`date_box_lunch_id`))) join `box_lunch_sku` `c` on((`c`.`box_lunch_id` = `a`.`box_lunch_id`))) join `box_lunch_types` `d` on((`d`.`category_id` = `a`.`category_id`))) ;

-- ----------------------------
-- View structure for person_cart
-- ----------------------------
DROP VIEW IF EXISTS `person_cart`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `person_cart` AS select `a`.`user_id` AS `user_id`,`a`.`box_lunch_number` AS `box_lunch_number`,`a`.`condiment_id` AS `condiment_id`,`a`.`condiment_name` AS `condiment_name`,`a`.`box_lunch_date` AS `box_lunch_date`,`a`.`sku_id` AS `sku_id`,`b`.`sku_name` AS `sku_name`,`b`.`sku_price` AS `box_lunch_price`,`b`.`sku_sale_price` AS `box_lunch_sale_price`,`b`.`sku_surface_price` AS `box_lunch_surface_price`,`b`.`sku_status` AS `box_lunch_status`,`c`.`box_lunch_id` AS `box_lunch_id`,`c`.`box_lunch_name` AS `box_lunch_name`,`c`.`default_sku_id` AS `default_sku_id` from ((`cart_personal` `a` join `box_lunch_sku` `b`) join `box_lunch` `c`) where ((`a`.`sku_id` > 0) and (`b`.`sku_id` = `a`.`sku_id`) and (`c`.`box_lunch_id` = `b`.`box_lunch_id`)) union select `a`.`user_id` AS `user_id`,`a`.`box_lunch_number` AS `box_lunch_number`,`a`.`condiment_id` AS `condiment_id`,`a`.`condiment_name` AS `condiment_name`,`a`.`box_lunch_date` AS `box_lunch_date`,`b`.`box_lunch_id` AS `sku_id`,`b`.`box_lunch_id` AS `sku_name`,`b`.`box_lunch_price` AS `box_lunch_price`,`b`.`box_lunch_sale_price` AS `box_lunch_sale_price`,`b`.`box_lunch_surface_price` AS `box_lunch_surface_price`,`b`.`box_lunch_status` AS `box_lunch_status`,`b`.`box_lunch_id` AS `box_lunch_id`,`b`.`box_lunch_name` AS `box_lunch_name`,`b`.`default_sku_id` AS `default_sku_id` from (`cart_personal` `a` join `box_lunch` `b`) where ((`b`.`box_lunch_id` = `a`.`box_lunch_id`) and (`b`.`default_sku_id` = 0)) ;

-- ----------------------------
-- View structure for sku_box_lunch
-- ----------------------------
DROP VIEW IF EXISTS `sku_box_lunch`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sku_box_lunch` AS select `a`.`box_lunch_id` AS `box_lunch_id`,`a`.`box_lunch_name` AS `box_lunch_name`,`a`.`default_sku_id` AS `default_sku_id`,`b`.`sku_id` AS `sku_id` from (`box_lunch` `a` join `box_lunch_sku` `b`) where ((`a`.`default_sku_id` > 0) and (`a`.`box_lunch_id` = `b`.`box_lunch_id`)) union select `box_lunch`.`box_lunch_id` AS `box_lunch_id`,`box_lunch`.`box_lunch_name` AS `box_lunch_name`,`box_lunch`.`default_sku_id` AS `default_sku_id`,`box_lunch`.`box_lunch_id` AS `box_lunch_id` from `box_lunch` where (`box_lunch`.`default_sku_id` = 0) ;

-- ----------------------------
-- Event structure for update_red_packet_user
-- ----------------------------
DROP EVENT IF EXISTS `update_red_packet_user`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` EVENT `update_red_packet_user` ON SCHEDULE EVERY 1 DAY STARTS '2018-06-03 23:59:59' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	UPDATE `red_packet_user` SET red_packet_is_expired = 1 WHERE red_packet_id IN (
	SELECT s.* FROM (
		SELECT red_packet_id FROM `red_packet_user` WHERE red_packet_is_expired = 0 AND  DATE_FORMAT(red_packet_get_time,'%Y%m') < DATE_FORMAT(NOW(),'%Y%m')
	) s
	);
	END
;;
DELIMITER ;
