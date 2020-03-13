/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2020-03-13 18:39:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(11) DEFAULT NULL,
  `admin_password` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'hyk', '123');

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_title` varchar(255) DEFAULT NULL,
  `blog_content` varchar(10000) DEFAULT NULL,
  `blog_type` varchar(255) DEFAULT NULL,
  `blog_status` int(11) DEFAULT '0',
  `img_url` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`blog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '这是一个测试！！！', '这是测试内容哦.0.0', 'C++', '1', 'http://image-hyk.test.upcdn.net/8adf7c63-1e04-4f4e-9ef1-5e3c3a81e5bb.png', '2020-02-01 16:43:04', '2020-03-12 22:29:41');
INSERT INTO `blog` VALUES ('2', '这是一个测试QAQ', '挖掘机副系点什么,红的,俩', 'Jquery', '0', 'http://image-hyk.test.upcdn.net/9419a965-5a6e-4936-a64e-519f2bf1fc3d.jpg', '2020-02-01 17:43:03', '2020-03-13 00:05:51');
INSERT INTO `blog` VALUES ('3', 'Vue2.0+ElementUI+PageHelper实现的表格分页', 'Vue2.0+ElementUI+PageHelper实现的表格分页。前言,最近做了一些前端的项目，要对表格进行一些分页显示。表格分页的方法有很多，从宏观上来说分为物理分页和逻辑分页，由于逻辑分页（即前端分页）的做法是将数据全部缓存，然后分页显示，这样在数据量较大的时候会对浏览器的速度产生影响，所以考虑之后我使用了后端分页，后端分页的特点是对当前页的数据进行请求，每次当页码变化或者每页数据量变化的时候，就重新发一次请求。这里所用到的技术主要有以下几种：\r\n\r\nSpring,SpringMVC,Mybatis,VueJS 2.0,ElementUI', 'Vue', '0', '', '2020-02-06 19:17:48', '2020-03-12 22:38:05');
INSERT INTO `blog` VALUES ('4', '分页介绍与逻辑', '由于当前开发的需求当中各种管理平台的增多，各种各样的列表需求逐渐增多，而往往数据量有很多，很难实现也没有必要将所有的数据都罗列到一个前端页面上，用户用不到，也很浪费资源。所以我们有了分页的需求，将数据分页显示。\r\n现在有1000条文章的数据需要展示在我们的计算机上。', 'Vue', '0', null, '2020-02-06 19:21:40', '2020-02-22 21:14:56');
INSERT INTO `blog` VALUES ('5', '凑不出了', '惺惺相惜先惺惺惜惺惺惺惺惜惺惺详细信息显示', 'Java', '0', null, '2020-02-06 19:22:19', '2020-02-06 19:22:19');
INSERT INTO `blog` VALUES ('6', '这是分页的测试', '韩寒和韩红画画，韩寒画黄昏，韩红画花花，韩寒恨韩红画花花，韩红喊话韩寒：“花花很好，韩寒很坏。”韩寒吼韩红：“黄昏红红火火很好画。”韩寒毁韩红画，韩红呵呵韩寒，韩寒慌，韩寒好悔恨，好后悔，韩寒画花花哄韩红，韩红哼哼，韩寒和韩红和好，韩寒哈哈。', 'Java', '1', null, '2020-02-06 19:22:59', '2020-03-09 16:53:14');
INSERT INTO `blog` VALUES ('7', 'jQuery', 'jQuery是一个快速、简洁的JavaScript框架，是继Prototype之后又一个优秀的JavaScript代码库（或JavaScript框架）。jQuery设计的宗旨是“write Less，Do More”，即倡导写更少的代码，做更多的事情。它封装JavaScript常用的功能代码，提供一种简便的JavaScript设计模式，优化HTML文档操作、事件处理、动画设计和Ajax交互。\r\njQuery的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口；具有高效灵活的css选择器，并且可对CSS选择器进行扩展；拥有便捷的插件扩展机制和丰富的插件。jQuery兼容各种主流浏览器，如IE 6.0+、FF 1.5+、Safari 2.0+、Opera 9.0+等。', 'Jquery', '0', null, '2020-03-10 20:22:39', '2020-03-10 20:24:42');
INSERT INTO `blog` VALUES ('8', 'jQuery语言特点', '快速获取文档元素\r\njQuery的选择机制构建于Css的选择器，它提供了快速查询DOM文档中元素的能力，而且大大强化了JavaScript中获取页面元素的方式。\r\n提供漂亮的页面动态效果\r\njQuery中内置了一系列的动画效果，可以开发出非常漂亮的网页，许多网站都使用jQuery的内置的效果，比如淡入淡出、元素移除等动态特效。\r\n创建AJAX无刷新网页\r\nAJAX是异步的JavaScript和XML的简称，可以开发出非常灵敏无刷新的网页，特别是开发服务器端网页时，比如PHP网站，需要往返地与服务器通信，如果不使用AJAX，每次数据更新不得不重新刷新网页，而使用AJAX特效后，可以对页面进行局部刷新，提供动态的效果。', 'Jquery', '0', null, '2020-03-10 20:26:21', '2020-03-10 20:29:48');
INSERT INTO `blog` VALUES ('9', 'C++', 'C++是C语言的继承，它既可以进行C语言的过程化程序设计，又可以进行以抽象数据类型为特点的基于对象的程序设计，还可以进行以继承和多态为特点的面向对象的程序设计。C++擅长面向对象程序设计的同时，还可以进行基于过程的程序设计，因而C++就适应的问题规模而论，大小由之。', 'C++', '0', null, '2020-03-10 20:52:58', '2020-03-10 20:53:40');
INSERT INTO `blog` VALUES ('10', '这是一个测试,测试保存', 'Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程', 'Java', '0', null, '2020-03-10 21:06:29', '2020-03-10 21:06:29');
INSERT INTO `blog` VALUES ('11', 'Java百科', '20世纪90年代，硬件领域出现了单片式计算机系统，这种价格低廉的系统一出现就立即引起了自动控制领域人员的注意，因为使用它可以大幅度提升消费类电子产品（如电视机顶盒、面包烤箱、移动电话等）的智能化程度。Sun公司为了抢占市场先机，在1991年成立了一个称为Green的项目小组，帕特里克、詹姆斯·高斯林、麦克·舍林丹和其他几个工程师一起组成的工作小组在加利福尼亚州门洛帕克市沙丘路的一个小工作室里面研究开发新技术，专攻计算机在家电产品上的嵌入式应用。', 'Java', '0', null, '2020-03-10 21:39:53', '2020-03-10 21:39:53');
INSERT INTO `blog` VALUES ('12', 'C++', 'C++', 'C++', '1', null, '2020-03-12 20:25:24', '2020-03-12 20:25:32');
INSERT INTO `blog` VALUES ('13', 'C++', 'C++语言的程序因为要体现高性能，所以都是编译型的。但其开发环境，为了方便测试，将调试环境做成解释型的。即开发过程中，以解释型的逐条语句执行方式来进行调试，以编译型的脱离开发环境而启动运行的方式来生成程序最终的执行代码。\r\n生成程序是指将源码（C++语句）转换成一个可以运行的应用程序的过程。如果程序的编写是正确的，那么通常只需按一个功能键，即可搞定这个过程。该过程实际上分成两个步骤。\r\n第一步是对程序进行编译，这需要用到编译器（compiler）。编译器将C++语句转换成机器码(也称为目标码)；如果这个步骤成功，下一步就是对程序进行链接，这需要用到链接器（linker）。链接器将编译获得机器码与C++库中的代码进行合并。C++库包含了执行某些常见任务的函数（“函数”是子程序的另一种称呼）。例如，一个C++库中包含标准的平方根函数sqrt，所以不必亲自计算平方根。C++库中还包含一些子程序，它们把数据发送到显示器，并知道如何读写硬盘上的数据文件。', 'C++', '0', null, '2020-03-12 20:58:54', '2020-03-12 20:58:54');
INSERT INTO `blog` VALUES ('14', 'C++', 'aaaaaaaaa', 'C++', '0', null, '2020-03-12 21:57:49', '2020-03-12 21:57:49');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `comment_text` varchar(255) DEFAULT NULL,
  `user_name` varchar(11) DEFAULT NULL,
  `user_email` varchar(48) DEFAULT NULL,
  `comment_status` int(11) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '0', '这是测试,test', '博主', '111@qq.com', '1', '2020-02-11 19:56:43', '2020-02-15 21:05:29');
INSERT INTO `comment` VALUES ('2', '1', '0', '这是测试，我们来看看', '博主', '111@qq.com', '1', '2020-02-11 19:58:40', '2020-02-15 21:05:30');
INSERT INTO `comment` VALUES ('3', '1', '0', '这是测试，我们来see，see', '博主', '111@qq.com', '1', '2020-02-11 20:02:28', '2020-02-15 21:05:30');
INSERT INTO `comment` VALUES ('4', '1', '0', '111111', '111', '9999@qq.com', '1', '2020-02-11 20:12:52', '2020-02-15 21:05:31');
INSERT INTO `comment` VALUES ('5', '1', '0', 'test.test', '1', 'qq@qq.com', '1', '2020-02-11 20:37:47', '2020-02-15 21:05:31');
INSERT INTO `comment` VALUES ('6', '1', '0', 'test.test1111', '1', 'qq@qq.com', '1', '2020-02-11 20:37:47', '2020-02-15 21:05:32');
INSERT INTO `comment` VALUES ('7', '1', '0', 'test.test22222', '1', 'qq@qq.com', '1', '2020-02-11 20:37:47', '2020-02-15 21:05:33');
INSERT INTO `comment` VALUES ('8', '1', '0', 'test.test3333', '1', 'qq@qq.com', '1', '2020-02-11 20:37:47', '2020-02-15 21:05:52');
INSERT INTO `comment` VALUES ('9', '1', '0', 'test.test444', '1', 'qq@qq.com', '1', '2020-02-11 20:38:32', '2020-02-15 21:05:53');
INSERT INTO `comment` VALUES ('10', '1', '0', 'test.test111451', '1', 'qq@qq.com', '1', '2020-02-11 20:38:50', '2020-02-15 21:05:54');
INSERT INTO `comment` VALUES ('11', '1', '0', 'test.test', '1', '969@qq.com', '1', '2020-02-11 20:41:03', '2020-02-15 21:05:55');
INSERT INTO `comment` VALUES ('12', '1', '0', 'test.test', '1', '8633qq@qq.com', '0', '2020-02-11 20:41:27', '2020-02-11 20:41:27');
INSERT INTO `comment` VALUES ('13', '1', '0', 'bang!!!!!!!', 'hyk727', 'hyk727@163.com', '0', '2020-02-11 21:03:44', '2020-02-11 21:03:44');
INSERT INTO `comment` VALUES ('14', '1', '0', 'tataatatatat', 'hyk727', 'hyk727@163.com', '0', '2020-02-11 21:05:51', '2020-02-11 21:06:44');
INSERT INTO `comment` VALUES ('15', '1', '0', '存进去了，存进去了吗', '博主', 'xixixixi@163.com', '0', '2020-02-11 21:06:33', '2020-02-11 21:13:26');
INSERT INTO `comment` VALUES ('16', '1', '0', 'hyk--727,hyk--727', 'hyk--727', 'hyk727@163.com', '0', '2020-02-11 21:12:47', '2020-02-11 21:12:47');
INSERT INTO `comment` VALUES ('17', '1', '0', '1111，测试的名字', '测试的名字', 'qq@qq.com', '0', '2020-02-13 21:10:16', '2020-02-13 21:10:16');
INSERT INTO `comment` VALUES ('18', '1', '0', '测试测试,这是一次测试', '测试测试', '1111@qq.com', '0', '2020-02-13 21:13:13', '2020-02-13 21:13:13');
INSERT INTO `comment` VALUES ('19', '1', '0', '测试测试,这是一次测试', '赵瑞峰', '1111@qq.com', '0', '2020-02-13 21:13:42', '2020-02-13 21:13:42');
INSERT INTO `comment` VALUES ('20', '1', '0', '测试，测试，不知道第几次了', '赵瑞峰', '1111@qq.com', '0', '2020-02-13 21:20:14', '2020-02-13 21:20:14');
INSERT INTO `comment` VALUES ('21', '2', '0', '1111@qq.com,博主的邮箱', '博主', '1111@qq.com', '0', '2020-02-15 20:35:10', '2020-02-15 20:35:10');
INSERT INTO `comment` VALUES ('22', '2', '0', '博主,的清楚点的测试', '博主', '1111111@qq.com', '0', '2020-02-15 20:41:39', '2020-02-15 20:41:39');
INSERT INTO `comment` VALUES ('23', '2', '0', '9999@qq.com', '博主', '9999@qq.com', '0', '2020-02-15 20:46:01', '2020-02-15 20:46:01');
INSERT INTO `comment` VALUES ('24', '2', '0', 'test,test', 'test,test', '4606587333@qq.com', '0', '2020-02-15 20:52:22', '2020-02-15 20:52:22');
INSERT INTO `comment` VALUES ('25', '2', '0', 'test,test,test', '111', '222@qq.com', '0', '2020-02-15 20:55:20', '2020-02-15 20:55:20');
INSERT INTO `comment` VALUES ('26', '2', '0', '996.996.996', 'bozhu', 'bozhu@996.com', '0', '2020-02-15 21:15:35', '2020-02-15 21:15:35');
INSERT INTO `comment` VALUES ('27', '2', '0', '7788.9966', '博主', '99996@163.com', '0', '2020-02-15 21:20:20', '2020-02-15 21:20:20');
INSERT INTO `comment` VALUES ('28', '2', '0', '7788.9966', '博主 123', '99996@163.com', '0', '2020-02-15 21:22:57', '2020-02-15 21:22:57');
INSERT INTO `comment` VALUES ('29', '1', '0', '这是modal的一次测试', '博主 123', '99996@163.com', '0', '2020-02-19 20:59:12', '2020-02-19 20:59:12');
INSERT INTO `comment` VALUES ('30', '1', '0', '这是modal的第二次测试', '博主 123', '99996@163.com', '0', '2020-02-19 21:30:13', '2020-02-19 21:30:13');
INSERT INTO `comment` VALUES ('31', '2', '0', '996-----699', '博主 123', '99996@163.com', '0', '2020-02-19 21:32:12', '2020-02-19 21:32:12');
INSERT INTO `comment` VALUES ('32', '2', '0', '996-----699，0.0\n。。。。', '博主 123', '99996@163.com', '0', '2020-02-19 21:32:30', '2020-02-19 21:32:30');
INSERT INTO `comment` VALUES ('33', '3', '0', '我学习到了。', '博主 123', '99996@163.com', '0', '2020-02-19 21:33:22', '2020-02-19 21:33:22');
INSERT INTO `comment` VALUES ('34', '3', '0', '11111111111111', '博主 123', '99996@163.com', '0', '2020-02-19 21:42:05', '2020-02-19 21:42:05');
INSERT INTO `comment` VALUES ('35', '5', '0', '丙烯醯，拼多多。', '博主 123', '99996@163.com', '0', '2020-02-19 21:47:00', '2020-02-19 21:47:00');
INSERT INTO `comment` VALUES ('36', '5', '35', '剁剁剁，买买买', '博主 123', '99996@163.com', '0', '2020-02-19 21:47:13', '2020-02-19 21:47:13');
INSERT INTO `comment` VALUES ('37', '5', '36', '这是三次评论的测试', '博主 123', '99996@163.com', '0', '2020-02-20 21:47:09', '2020-02-20 21:47:09');
INSERT INTO `comment` VALUES ('38', '5', '35', '再一次的测试，不要出事情呀', '博主 123', '99996@163.com', '0', '2020-02-20 21:47:40', '2020-02-20 21:47:40');
INSERT INTO `comment` VALUES ('39', '3', '0', '123456789，123456789，123456789，123456789，123456789，123456789，123456789，123456789.123456789', '博主 123', '99996@163.com', '0', '2020-03-01 20:51:37', '2020-03-01 20:51:37');
INSERT INTO `comment` VALUES ('40', '3', '0', 'vue真棒', '博主 123', '99996@163.com', '0', '2020-03-03 22:02:14', '2020-03-03 22:02:14');
INSERT INTO `comment` VALUES ('41', '3', '0', 'vue蛮好用的呢~~~', '博主', '99996@163.com', '0', '2020-03-03 22:03:27', '2020-03-03 22:03:27');
