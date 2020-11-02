/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50731
Source Host           : localhost:3306
Source Database       : userlist

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2020-10-11 16:52:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userPwd` varchar(255) NOT NULL,
  `jurisdiction` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'admin', '管理员', null, null, null);
INSERT INTO `tb_user` VALUES ('2', 'Alex', 'admin', '用户', null, null, null);
INSERT INTO `tb_user` VALUES ('15', 'zhangsan', '123456', '用户', 'zhangsan', '天津和平区', '1234567@163.com');
INSERT INTO `tb_user` VALUES ('16', 'aaa', '123456', null, 'aaa', '内蒙古乌海', 'aaa');

-- ----------------------------
-- Table structure for t_downloadlist
-- ----------------------------
DROP TABLE IF EXISTS `t_downloadlist`;
CREATE TABLE `t_downloadlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `size` mediumtext,
  `start` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_downloadlist
-- ----------------------------
INSERT INTO `t_downloadlist` VALUES ('1', '武汉纺织大学2020年专升本新生健康承诺书', 'WEB-INF/武汉纺织大学2020年专升本新生健康承诺书.doc', '  “我的健康承诺”要求员工从自身的角度出发，以自己每天实际工作和生活的具体环境为基础， 在以下四个方面进行承诺。承诺的内容要求具体，有针对性：避免泛泛而谈，承诺的内容和每天的具体工作内容要息息相关，和员工每天实际经历的实际状况紧密相连，具体要到“我应该做到什么”和“我绝不做什么”的程度：', '41.0 KB', '4', 'ImgSource/logo.png', null);
INSERT INTO `t_downloadlist` VALUES ('2', '武汉纺织大学2020-2021学年教学校历', 'WEB-INF/武汉纺织大学2020-2021学年教学校历.xlsx', '学籍是指一个学生属于某学校的一种法律上的身份或者资格，登记学生姓名的册子，专指作为某校学生的资格。2013年9月1日起，全国已经初步建立了小中大学籍的信息管理系统', '25.6 KB', '5', 'ImgSource/logo.png', null);
INSERT INTO `t_downloadlist` VALUES ('3', '专升本调查表', 'WEB-INF/专升本调查表.doc', '专升本考试是指专科层次学生进入本科层次阶段学习的选拔考试，是中国大陆教育体制大专层次学生升入本科院校的考试制度。专升本分为两种类型。一类是普通高等学校的普通高等教育的专升本（普通全日制本科），考试对象仅限于各省和各直辖市的普通高等学校的普通全日制专科应届毕业生。另一类是报名参加成人高考的成人高等学校（脱产）', '17KB', '2', 'ImgSource/logo.png', null);
