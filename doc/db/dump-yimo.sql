-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: yimo
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_no` int(11) DEFAULT NULL COMMENT '排序',
  `status` varchar(5) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='部门管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,'深圳市一墨科技有限公司',1,'1'),(2,1,'科技部',2,'1'),(4,1,'审批部',4,'1'),(5,1,'业务部',3,'1');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `dict_type` varchar(50) NOT NULL DEFAULT '' COMMENT '字典类型',
  `dict_describe` varchar(50) DEFAULT NULL COMMENT '字典描述',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `create_user_id` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典目标表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES ('OnlineStatus','在线状态',1,NULL,NULL,NULL),('Sex','性别',1,NULL,NULL,NULL),('Status','状态',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_type` varchar(20) NOT NULL COMMENT '字典类型',
  `dict_no` varchar(50) NOT NULL COMMENT '字典编码',
  `dict_name` varchar(100) DEFAULT NULL COMMENT '字典含义',
  `dict_describe` varchar(50) DEFAULT NULL COMMENT '字典描述',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `create_user_id` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_type`,`dict_no`),
  CONSTRAINT `sys_dict_data_sys_dict_fk` FOREIGN KEY (`dict_type`) REFERENCES `sys_dict` (`dict_type`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES ('OnlineStatus','off_line','下线',NULL,1,NULL,NULL,NULL),('OnlineStatus','on_line','在线',NULL,1,NULL,NULL,NULL),('Sex','1','男',NULL,1,NULL,NULL,NULL),('Sex','2','女',NULL,1,NULL,NULL,NULL),('Status','1','正常',NULL,1,NULL,NULL,NULL),('Status','2','失效',NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation_type` varchar(50) DEFAULT NULL COMMENT '用户操作类型',
  `time` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `url` varchar(200) DEFAULT NULL COMMENT '操作url',
  `describe` varchar(100) DEFAULT NULL COMMENT '日志描述',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=924 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (703,1,'沙漠骆驼','LOGIN',43,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:17:47','http://localhost/YiMo/login','认证操作','用户认证'),(704,1,'沙漠骆驼','LOGIN',50832,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:23:31','http://localhost/YiMo/login','认证操作','用户认证'),(705,1,'沙漠骆驼','LOGIN',34418,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:30:45','http://localhost/YiMo/login','认证操作','用户认证'),(706,1,'沙漠骆驼','LOGIN',17409,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:40:40','http://localhost/YiMo/login','认证操作','用户认证'),(707,1,'沙漠骆驼','LOGIN',9437,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:42:52','http://localhost/YiMo/login','认证操作','用户认证'),(708,1,'沙漠骆驼','QUERY',145,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:43:59','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(709,1,'沙漠骆驼','QUERY',34,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:44:02','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(710,1,'沙漠骆驼','LOGIN',10298,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:45:16','http://localhost/YiMo/login','认证操作','用户认证'),(711,1,'沙漠骆驼','LOGIN',9770,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:45:16','http://localhost/YiMo/login','认证操作','用户认证'),(712,1,'沙漠骆驼','LOGIN',4999,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:50:35','http://localhost/YiMo/login','认证操作','用户认证'),(713,1,'沙漠骆驼','QUERY',83,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:52:52','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(714,1,'沙漠骆驼','LOGIN',3318,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:54:58','http://localhost/YiMo/login','认证操作','用户认证'),(715,1,'沙漠骆驼','LOGIN',2319,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:58:39','http://localhost/YiMo/login','认证操作','用户认证'),(716,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:58:46','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(717,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:59:26','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(718,1,'沙漠骆驼','QUERY',41,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:59:31','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(719,1,'沙漠骆驼','LOGIN',1695,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:00:24','http://localhost/YiMo/login','认证操作','用户认证'),(720,1,'沙漠骆驼','LOGIN',57,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:01:25','http://localhost/YiMo/login','认证操作','用户认证'),(721,NULL,NULL,'LOGOUT',3,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:01:53','http://localhost/YiMo/logout','系统退出','用户认证'),(722,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:02:10','http://localhost/YiMo/login','认证操作','用户认证'),(723,NULL,NULL,'LOGOUT',95,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:02:31','http://localhost/YiMo/logout','系统退出','用户认证'),(724,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:02:46','http://localhost/YiMo/login','认证操作','用户认证'),(725,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:03:47','http://localhost/YiMo/login','认证操作','用户认证'),(726,NULL,NULL,'LOGOUT',1,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:04:15','http://localhost/YiMo/logout','系统退出','用户认证'),(727,1,'沙漠骆驼','LOGIN',73,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:06:33','http://localhost/YiMo/login','认证操作','用户认证'),(728,NULL,NULL,'LOGOUT',53,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:06:37','http://localhost/YiMo/logout','系统退出','用户认证'),(729,1,'沙漠骆驼','LOGIN',70,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:09:51','http://localhost/YiMo/login','认证操作','用户认证'),(730,NULL,NULL,'LOGOUT',2,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:10:11','http://localhost/YiMo/logout','系统退出','用户认证'),(731,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:10:57','http://localhost/YiMo/login','认证操作','用户认证'),(732,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:12:32','http://localhost/YiMo/login','认证操作','用户认证'),(733,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:12:37','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(734,NULL,NULL,'LOGOUT',74,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:12:42','http://localhost/YiMo/logout','系统退出','用户认证'),(735,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:12:59','http://localhost/YiMo/login','认证操作','用户认证'),(736,1,'沙漠骆驼','LOGIN',50,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:14:31','http://localhost/YiMo/login','认证操作','用户认证'),(737,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:14:37','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(738,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:14:54','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(739,NULL,NULL,'LOGOUT',3,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:14:55','http://localhost/YiMo/logout','系统退出','用户认证'),(740,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:14:57','http://localhost/YiMo/login','认证操作','用户认证'),(741,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:00','http://localhost/YiMo/login','认证操作','用户认证'),(742,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:04','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(743,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:29','http://localhost/YiMo/login','认证操作','用户认证'),(744,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:35','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(745,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:56','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(746,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:58','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(747,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:16:00','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(748,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:16:04','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(749,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:16:40','http://localhost/YiMo/login','认证操作','用户认证'),(750,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:16:44','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(751,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:17:02','http://localhost/YiMo/login','认证操作','用户认证'),(752,1,'沙漠骆驼','LOGIN',263,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:05:09','http://localhost/YiMo/login','认证操作','用户认证'),(753,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:07:32','http://localhost/YiMo/login','认证操作','用户认证'),(754,1,'沙漠骆驼','QUERY',92,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:07:41','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(755,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:08:00','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(756,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:08:02','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(757,1,'沙漠骆驼','LOGIN',40,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:09:34','http://localhost/YiMo/login','认证操作','用户认证'),(758,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:09:41','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(759,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:09:46','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(760,NULL,NULL,'LOGOUT',17,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:11:34','http://localhost/YiMo/logout','系统退出','用户认证'),(761,1,'沙漠骆驼','LOGIN',19,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:11:36','http://localhost/YiMo/login','认证操作','用户认证'),(762,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:11:43','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(763,1,'沙漠骆驼','LOGIN',49,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:14:22','http://localhost/YiMo/login','认证操作','用户认证'),(764,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:14:26','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(765,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:14:55','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(766,NULL,NULL,'LOGOUT',95,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:14:57','http://localhost/YiMo/logout','系统退出','用户认证'),(767,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:14:59','http://localhost/YiMo/login','认证操作','用户认证'),(768,NULL,NULL,'LOGOUT',2,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:15:19','http://localhost/YiMo/logout','系统退出','用户认证'),(769,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:15:29','http://localhost/YiMo/login','认证操作','用户认证'),(770,1,'沙漠骆驼','LOGIN',384,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:21:59','http://localhost/YiMo/login','认证操作','用户认证'),(771,1,'沙漠骆驼','QUERY',74,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:22:03','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(772,1,'沙漠骆驼','LOGIN',37,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:53:56','http://localhost/YiMo/login','认证操作','用户认证'),(773,1,'沙漠骆驼','LOGIN',28,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:57:53','http://localhost/YiMo/login','认证操作','用户认证'),(774,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:58:16','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(775,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:58:20','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(776,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:58:24','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(777,1,'沙漠骆驼','FORCE',64,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:58:32','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(778,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:58:32','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(779,1,'沙漠骆驼','LOGIN',48,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:06:40','http://localhost/YiMo/login','认证操作','用户认证'),(780,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:06:46','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(781,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:00','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(782,NULL,NULL,'LOGOUT',64,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:01','http://localhost/YiMo/logout','系统退出','用户认证'),(783,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:02','http://localhost/YiMo/login','认证操作','用户认证'),(784,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:06','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(785,NULL,NULL,'LOGOUT',75,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:14','http://localhost/YiMo/logout','系统退出','用户认证'),(786,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:16','http://localhost/YiMo/login','认证操作','用户认证'),(787,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:19','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(788,1,'沙漠骆驼','FORCE',249,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:25','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(789,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:25','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(790,1,'沙漠骆驼','QUERY',29,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:33','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(791,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:40','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(792,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:48','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(793,NULL,NULL,'LOGOUT',92,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:08:02','http://localhost/YiMo/logout','系统退出','用户认证'),(794,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:08:03','http://localhost/YiMo/login','认证操作','用户认证'),(795,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:08:07','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(796,1,'沙漠骆驼','LOGIN',279,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:10:48','http://localhost/YiMo/login','认证操作','用户认证'),(797,1,'沙漠骆驼','LOGIN',39,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:34','http://localhost/YiMo/login','认证操作','用户认证'),(798,1,'沙漠骆驼','QUERY',57,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:37','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(799,1,'沙漠骆驼','FORCE',83,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:43','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(800,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:43','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(801,1,'沙漠骆驼','FORCE',61,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:46','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(802,1,'沙漠骆驼','QUERY',35,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:46','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(803,1,'沙漠骆驼','FORCE',100,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:49','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(804,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:53','http://localhost/YiMo/login','认证操作','用户认证'),(805,1,'沙漠骆驼','LOGIN',278,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:39:29','http://localhost/YiMo/login','认证操作','用户认证'),(806,1,'沙漠骆驼','LOGIN',336,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:58:58','http://localhost/YiMo/login','认证操作','用户认证'),(807,1,'沙漠骆驼','QUERY',89,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:59:02','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(808,1,'沙漠骆驼','FORCE',68,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:59:06','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(809,1,'沙漠骆驼','QUERY',29,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:59:06','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(810,1,'沙漠骆驼','FORCE',64,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:59:09','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(811,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:59:14','http://localhost/YiMo/login','认证操作','用户认证'),(812,1,'沙漠骆驼','LOGIN',43,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:01:48','http://localhost/YiMo/login','认证操作','用户认证'),(813,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:01:51','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(814,1,'沙漠骆驼','FORCE',63,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:01:55','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(815,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:02:02','http://localhost/YiMo/login','认证操作','用户认证'),(816,1,'沙漠骆驼','LOGIN',278,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:04:50','http://localhost/YiMo/login','认证操作','用户认证'),(817,1,'沙漠骆驼','QUERY',75,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:04:54','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(818,1,'沙漠骆驼','LOGIN',319,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:06:44','http://localhost/YiMo/login','认证操作','用户认证'),(819,1,'沙漠骆驼','QUERY',80,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:06:47','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(820,NULL,NULL,'FORCE',36737,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:06:52','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(821,1,'沙漠骆驼','LOGIN',51,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:18','http://localhost/YiMo/login','认证操作','用户认证'),(822,1,'沙漠骆驼','QUERY',34,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:21','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(823,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:24','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(824,1,'沙漠骆驼','QUERY',27,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:25','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(825,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:28','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(826,NULL,NULL,'LOGOUT',10,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:39','http://localhost/YiMo/logout','系统退出','用户认证'),(827,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:41','http://localhost/YiMo/login','认证操作','用户认证'),(828,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:44','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(829,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:46','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(830,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:48','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(831,NULL,NULL,'FORCE',98,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:50','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(832,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:10:11','http://localhost/YiMo/login','认证操作','用户认证'),(833,1,'沙漠骆驼','LOGIN',314,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:20:43','http://localhost/YiMo/login','认证操作','用户认证'),(834,1,'沙漠骆驼','QUERY',91,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:20:47','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(835,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:20:50','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(836,NULL,NULL,'FORCE',169135,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:20:53','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(837,1,'沙漠骆驼','LOGIN',18,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:23:50','http://localhost/YiMo/login','认证操作','用户认证'),(838,NULL,NULL,'LOGOUT',55,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:23:52','http://localhost/YiMo/logout','系统退出','用户认证'),(839,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:23:54','http://localhost/YiMo/login','认证操作','用户认证'),(840,1,'沙漠骆驼','LOGIN',398,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:27:39','http://localhost/YiMo/login','认证操作','用户认证'),(841,NULL,NULL,'LOGOUT',53,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:27:42','http://localhost/YiMo/logout','系统退出','用户认证'),(842,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:28:14','http://localhost/YiMo/login','认证操作','用户认证'),(843,NULL,NULL,'LOGOUT',340428,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:28:17','http://localhost/YiMo/logout','系统退出','用户认证'),(844,1,'沙漠骆驼','LOGIN',16,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:34:04','http://localhost/YiMo/login','认证操作','用户认证'),(845,1,'沙漠骆驼','LOGIN',322,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:36:32','http://localhost/YiMo/login','认证操作','用户认证'),(846,NULL,NULL,'LOGOUT',67,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:36:36','http://localhost/YiMo/logout','系统退出','用户认证'),(847,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:36:53','http://localhost/YiMo/login','认证操作','用户认证'),(848,1,'沙漠骆驼','QUERY',54,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:36:56','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(849,NULL,NULL,'FORCE',67,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:30','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(850,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:41','http://localhost/YiMo/login','认证操作','用户认证'),(851,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:44','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(852,NULL,NULL,'FORCE',132,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:49','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(853,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:53','http://localhost/YiMo/login','认证操作','用户认证'),(854,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:56','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(855,NULL,NULL,'FORCE',100,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:38:04','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(856,1,'沙漠骆驼','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:38:27','http://localhost/YiMo/login','认证操作','用户认证'),(857,NULL,NULL,'LOGOUT',129,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:38:51','http://localhost/YiMo/logout','系统退出','用户认证'),(858,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:02','http://localhost/YiMo/login','认证操作','用户认证'),(859,NULL,NULL,'LOGOUT',125,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:12','http://localhost/YiMo/logout','系统退出','用户认证'),(860,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:18','http://localhost/YiMo/login','认证操作','用户认证'),(861,NULL,NULL,'LOGOUT',67,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:25','http://localhost/YiMo/logout','系统退出','用户认证'),(862,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:26','http://localhost/YiMo/login','认证操作','用户认证'),(863,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:32','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(864,1,'沙漠骆驼','LOGIN',32,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:45:44','http://localhost/YiMo/login','认证操作','用户认证'),(865,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:45:47','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(866,1,'沙漠骆驼','LOGIN',70,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:03:01','http://localhost/YiMo/login','认证操作','用户认证'),(867,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:03:05','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(868,1,'沙漠骆驼','QUERY',43,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:03:10','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(869,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:04:01','http://localhost/YiMo/login','认证操作','用户认证'),(870,1,'沙漠骆驼','LOGIN',49,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:06:04','http://localhost/YiMo/login','认证操作','用户认证'),(871,NULL,NULL,'LOGOUT',3,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:06:46','http://localhost/YiMo/logout','系统退出','用户认证'),(872,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:07:03','http://localhost/YiMo/login','认证操作','用户认证'),(873,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:07:06','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(874,1,'沙漠骆驼','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:07:10','http://localhost/YiMo/login','认证操作','用户认证'),(875,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:02','http://localhost/YiMo/login','认证操作','用户认证'),(876,1,'沙漠骆驼','QUERY',31,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:05','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(877,1,'沙漠骆驼','QUERY',27,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:55','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(878,1,'沙漠骆驼','QUERY',60,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:57','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(879,1,'沙漠骆驼','QUERY',20,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:58','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(880,1,'沙漠骆驼','QUERY',24,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:59','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(881,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:59','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(882,1,'沙漠骆驼','QUERY',25,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:00','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(883,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:01','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(884,1,'沙漠骆驼','QUERY',22,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:03','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(885,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:10','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(886,1,'沙漠骆驼','QUERY',22,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:18','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(887,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:23','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(888,1,'沙漠骆驼','QUERY',26,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:28','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(889,2,'测试用户','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:45','http://localhost/YiMo/login','认证操作','用户认证'),(890,2,'测试用户','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:50','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(891,2,'测试用户','FORCE',2,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:54','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(892,2,'测试用户','QUERY',8,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:54','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(893,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:10:22','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(894,1,'沙漠骆驼','LOGIN',288,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:12:53','http://localhost/YiMo/login','认证操作','用户认证'),(895,2,'测试用户','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:01','http://localhost/YiMo/login','认证操作','用户认证'),(896,2,'测试用户','QUERY',57,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:05','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(897,2,'测试用户','FORCE',3,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:15','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(898,2,'测试用户','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:15','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(899,2,'测试用户','QUERY',26,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:18','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(900,2,'测试用户','QUERY',18,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:19','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(901,2,'测试用户','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:21','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(902,2,'测试用户','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:23','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(903,2,'测试用户','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:24','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(904,2,'测试用户','QUERY',19,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:27','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(905,2,'测试用户','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:28','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(906,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:38','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(907,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:47','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(908,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:49','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(909,1,'沙漠骆驼','LOGIN',35,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:17','http://localhost/YiMo/login','认证操作','用户认证'),(910,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:21','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(911,2,'测试用户','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:29','http://localhost/YiMo/login','认证操作','用户认证'),(912,2,'测试用户','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:33','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(913,2,'测试用户','FORCE',4,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:41','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(914,2,'测试用户','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:41','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(915,2,'测试用户','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:43','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(916,1,'沙漠骆驼','LOGIN',346,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:33','http://localhost/YiMo/login','认证操作','用户认证'),(917,1,'沙漠骆驼','QUERY',69,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:36','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(918,1,'沙漠骆驼','LOGIN',15,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:40','http://localhost/YiMo/login','认证操作','用户认证'),(919,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:43','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(920,2,'测试用户','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:54','http://localhost/YiMo/login','认证操作','用户认证'),(921,2,'测试用户','QUERY',21,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:57','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(922,2,'测试用户','FORCE',143,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:31:02','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(923,2,'测试用户','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:31:02','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_no` int(11) DEFAULT NULL COMMENT '排序号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` varchar(1) DEFAULT NULL COMMENT '菜单状态',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'系统管理','','',0,'fa fa-gears',0,'2017-08-09 22:49:47','2019-03-01 18:06:09','1'),(2,1,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',3,'2017-08-09 22:55:15',NULL,'1'),(3,1,'部门管理','sys/dept/','sys:dept:dept',1,'fa fa-group',4,'2017-08-09 22:55:15',NULL,'1'),(4,1,'用户管理','sys/user/','sys:user:user',1,'fa fa-user',1,'2017-08-10 14:12:11',NULL,'1'),(5,1,'角色管理','sys/role','sys:role:role',1,'fa fa-user-secret',2,'2017-08-10 14:13:19',NULL,'1'),(6,4,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(7,4,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(8,4,'删除','','sys:user:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(9,4,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(10,4,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(11,2,'新增','sys/menu/','sys:menu:add',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(12,2,'编辑','sys/menu/','sys:menu:edit',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(13,2,'删除','sys/menu/','sys:menu:remove',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(17,5,'编辑','','sys:role:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(18,5,'删除','','sys:role:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(25,3,'新增','','sys:dept:add',2,'',NULL,NULL,NULL,'1'),(26,3,'编辑','','sys:dept:edit',2,'',NULL,NULL,NULL,'1'),(32,3,'删除','','sys:dept:remove',2,'',NULL,NULL,NULL,'1'),(37,0,'系统工具','','',0,'fa fa-cog fa-spin',NULL,'2019-03-01 14:16:05','2019-03-18 16:04:01','1'),(38,37,'自动生成代码','generator','sys:generator:generator',1,'fa fa-anchor ',NULL,'2019-03-01 14:22:52','2019-03-11 17:58:09','1'),(39,0,'系统监控','','',0,'fa fa-tachometer',3,'2019-03-01 18:09:57',NULL,'1'),(40,39,'系统日志','sys/log','sys:log:log',1,'fa fa-file-archive-o',NULL,'2019-03-01 18:11:48',NULL,'1'),(41,5,'新增','','sys:role:add',2,'',NULL,'2019-03-05 11:53:48',NULL,'1'),(42,1,'数据字典','sys/dict','sys:dict:dict',1,'fa fa-book',NULL,'2019-03-07 17:26:16','2019-03-07 17:27:14','1'),(43,42,'新增','','sys:dict:add',2,'',NULL,'2019-03-07 17:35:45',NULL,'1'),(44,42,'编辑','','sys:dict:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(45,42,'删除','','sys:dict:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(46,1,'数据字典数据','','sys:dictData',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(47,46,'编辑字典数据','','sys:dictData:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(48,46,'新增字典数据','','sys:dictData:add',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(49,46,'删除字典数据','','sys:dictData:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(50,39,'在线用户','sys/userOnline','sys:userOnline:userOnline',1,'fa fa-user',NULL,'2019-03-18 15:16:35','2019-03-18 15:21:51','1'),(51,50,'强制提出','','sys:userOnline:kickout',2,'',NULL,'2019-03-18 15:29:08',NULL,'1');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` varchar(100) DEFAULT NULL COMMENT '角色状态',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','superAdmin','',NULL,NULL,'2019-03-18 15:19:20','1'),(2,'用户管理员','userAdmin','用于管理用户信息',NULL,NULL,NULL,'1'),(3,'系统运维员','operations','',NULL,NULL,'2019-03-05 12:04:14','1');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `sys_role_menu_sys_role_fk` (`role_id`),
  KEY `sys_role_menu_sys_menu_fk` (`menu_id`),
  CONSTRAINT `sys_role_menu_sys_menu_fk` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`),
  CONSTRAINT `sys_role_menu_sys_role_fk` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (57,2,4),(58,2,6),(59,2,7),(60,2,8),(61,2,9),(62,2,10),(63,2,1),(222,3,40),(223,3,39),(302,1,1),(303,1,2),(304,1,3),(305,1,4),(306,1,5),(307,1,6),(308,1,7),(309,1,8),(310,1,9),(311,1,10),(312,1,11),(313,1,12),(314,1,13),(315,1,17),(316,1,18),(317,1,25),(318,1,26),(319,1,32),(320,1,37),(321,1,38),(322,1,39),(323,1,40),(324,1,41),(325,1,42),(326,1,43),(327,1,44),(328,1,45),(329,1,46),(330,1,47),(331,1,48),(332,1,49),(333,1,50);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL COMMENT '昵称',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `email` varchar(80) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建用户id',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(20) DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(3) DEFAULT NULL COMMENT '性别',
  `birth` varchar(10) DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`),
  KEY `sys_user_sys_dept_fk` (`dept_id`),
  CONSTRAINT `sys_user_sys_dept_fk` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'tayle','沙漠骆驼','a91f1e137d8d6d94fd865266a664948c',2,'123@qq.com','13112344321',1,NULL,'','2019-03-01 14:21:13',1,'',NULL,'','','','',''),(2,'test','测试用户','a5cfa42781cb8660b198daceaea34167',2,'test@aa.com','13112344321',1,1,'2019-03-19 19:08:49','2019-03-19 19:09:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '登录账号',
  `user_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门名称',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `ip` varchar(50) DEFAULT NULL COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `begin_time` datetime DEFAULT NULL COMMENT 'session创建时间',
  `end_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `out_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
INSERT INTO `sys_user_online` VALUES ('5580c692-c813-417e-9cb7-27463c12cbcf',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-19 19:30:39',NULL,NULL),('609bf788-f43a-447e-a11f-ca0e284c9e6a',2,'test',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','on_line','2019-03-19 19:12:58',NULL,NULL),('70ec8fbc-6e47-48d1-84b2-e41ad748f249',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-19 19:30:30',NULL,NULL),('ce99f134-9a65-4407-bccd-bca811883e9a',2,'test',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','on_line','2019-03-19 19:21:27',NULL,NULL),('e32256d7-e1bb-422f-bdbb-01848efffd8d',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','on_line','2019-03-19 19:20:56',NULL,NULL),('e88973d5-4a1a-492a-bef7-b7444ec32d3a',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','on_line','2019-03-19 19:12:50',NULL,NULL),('e93c8326-6735-4457-b1ba-5abf76e346f2',2,'test',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','on_line','2019-03-19 19:30:50',NULL,NULL);
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  KEY `sys_user_role_sys_role_fk` (`role_id`),
  KEY `sys_user_role_sys_user_fk` (`user_id`),
  CONSTRAINT `sys_user_role_sys_role_fk` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_user_role_sys_user_fk` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (38,1,1),(43,1,1),(44,2,1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'yimo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19 19:31:34
