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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='部门管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,'深圳市一墨科技有限公司',1,'1'),(2,1,'科技部',2,'1'),(4,1,'审批部',4,'1');
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
INSERT INTO `sys_dict` VALUES ('Sex','性别',1,NULL,NULL,NULL);
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
INSERT INTO `sys_dict_data` VALUES ('Sex','1','男',NULL,1,NULL,NULL,NULL),('Sex','2','女',NULL,1,NULL,NULL,NULL);
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
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,1,'沙漠骆驼','http://localhost/YiMo/login',0,'POST','http://localhost/YiMo/login','0:0:0:0:0:0:0:1','2019-03-01 18:53:49'),(2,1,'沙漠骆驼','http://localhost/YiMo/sys/menu/list',0,'GET','http://localhost/YiMo/sys/menu/list','0:0:0:0:0:0:0:1','2019-03-01 18:54:03'),(3,NULL,NULL,'系统登陆,,LOGIN',6,'GET','[]','0:0:0:0:0:0:0:1','2019-03-04 11:47:39'),(4,1,'沙漠骆驼','系统登陆认证操作,,OTHER',88,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@6315bea, org.apache.catalina.connector.ResponseFacade@517d4d04]','0:0:0:0:0:0:0:1','2019-03-04 11:48:32'),(5,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',115,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-04 11:49:31'),(6,1,'沙漠骆驼','部门管理,获取部门管理 列表,QUERY',15,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-04 11:50:29'),(7,1,'沙漠骆驼','/sys/user,获取用户列表,QUERY',38,'GET','[{limit=10, offset=0, deptIds=[1, 2, 4]}]','0:0:0:0:0:0:0:1','2019-03-04 11:50:30'),(8,1,'沙漠骆驼','/sys/user,获取用户列表,QUERY',24,'GET','[{limit=10, offset=0, deptId=1, deptIds=[1, 2, 4]}]','0:0:0:0:0:0:0:1','2019-03-04 11:50:33'),(9,1,'沙漠骆驼','角色,获取角色 列表,QUERY',21,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-04 11:50:43'),(10,NULL,NULL,'系统登陆,,LOGIN',9,'GET','[]','0:0:0:0:0:0:0:1','2019-03-04 17:48:08'),(11,1,'沙漠骆驼','系统登陆认证操作,,OTHER',16,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@176fdc12, org.apache.catalina.connector.ResponseFacade@697ab806]','0:0:0:0:0:0:0:1','2019-03-04 17:48:10'),(12,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',19,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-04 17:48:12'),(13,NULL,NULL,'系统登陆,,LOGIN',13,'GET','[]','0:0:0:0:0:0:0:1','2019-03-05 11:52:48'),(14,1,'沙漠骆驼','系统登陆认证操作,,OTHER',43,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@478ed017, org.apache.catalina.connector.ResponseFacade@308f0ffa]','0:0:0:0:0:0:0:1','2019-03-05 11:52:52'),(15,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',112,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-05 11:52:58'),(16,1,'沙漠骆驼','部门管理,获取部门管理 列表,QUERY',14,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-05 11:53:00'),(17,1,'沙漠骆驼','/sys/user,获取用户列表,QUERY',94,'GET','[{limit=10, offset=0, deptIds=[1, 2, 4]}]','0:0:0:0:0:0:0:1','2019-03-05 11:53:03'),(18,1,'沙漠骆驼','角色,获取角色 列表,QUERY',20,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 11:53:06'),(19,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',15,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-05 11:53:21'),(20,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',15,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-05 11:53:48'),(21,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',11,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-05 11:54:28'),(22,1,'沙漠骆驼','角色,获取角色 列表,QUERY',17,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 11:54:32'),(23,1,'沙漠骆驼','/sys/user,获取用户列表,QUERY',34,'GET','[{limit=10, offset=0, deptIds=[1, 2, 4]}]','0:0:0:0:0:0:0:1','2019-03-05 11:54:37'),(24,1,'沙漠骆驼','角色,获取角色 列表,QUERY',15,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 11:55:30'),(25,1,'沙漠骆驼','角色,获取角色 列表,QUERY',55,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:00:07'),(26,1,'沙漠骆驼','角色,获取角色 列表,QUERY',24,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:00:20'),(27,1,'沙漠骆驼','角色,获取角色 列表,QUERY',19,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:01:09'),(28,1,'沙漠骆驼','角色,获取角色 列表,QUERY',18,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:01:10'),(29,1,'沙漠骆驼','角色,获取角色 列表,QUERY',19,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:01:16'),(30,1,'沙漠骆驼','角色,获取角色 列表,QUERY',15,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:01:17'),(31,1,'沙漠骆驼','角色,获取角色 列表,QUERY',21,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:02:48'),(32,1,'沙漠骆驼','角色,获取角色 列表,QUERY',13,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:02:51'),(33,1,'沙漠骆驼','角色,获取角色 列表,QUERY',11,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:02:52'),(34,1,'沙漠骆驼','角色,获取角色 列表,QUERY',15,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:04:10'),(35,1,'沙漠骆驼','角色,获取角色 列表,QUERY',15,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:04:15'),(36,1,'沙漠骆驼','角色,获取角色 列表,QUERY',50,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:13:51'),(37,1,'沙漠骆驼','角色,获取角色 列表,QUERY',19,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:13:53'),(38,1,'沙漠骆驼','角色,获取角色 列表,QUERY',22,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:15:06'),(39,1,'沙漠骆驼','角色,获取角色 列表,QUERY',18,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:19:33'),(40,1,'沙漠骆驼','角色,获取角色 列表,QUERY',26,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:19:37'),(41,1,'沙漠骆驼','角色,获取角色 列表,QUERY',14,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:20:01'),(42,1,'沙漠骆驼','角色,获取角色 列表,QUERY',12,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:20:22'),(43,1,'沙漠骆驼','角色,获取角色 列表,QUERY',18,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:22:25'),(44,1,'沙漠骆驼','角色,获取角色 列表,QUERY',15,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:22:28'),(45,1,'沙漠骆驼','角色,获取角色 列表,QUERY',11,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:23:30'),(46,1,'沙漠骆驼','角色,获取角色 列表,QUERY',12,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 12:23:32'),(47,NULL,NULL,'系统登陆,,LOGIN',26,'GET','[]','0:0:0:0:0:0:0:1','2019-03-05 16:19:42'),(48,1,'沙漠骆驼','系统登陆认证操作,,OTHER',44,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@5b284183, org.apache.catalina.connector.ResponseFacade@1df13c5f]','0:0:0:0:0:0:0:1','2019-03-05 16:19:45'),(49,1,'沙漠骆驼','角色,获取角色 列表,QUERY',16,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:19:50'),(50,1,'沙漠骆驼','角色,获取角色 列表,QUERY',13,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:19:55'),(51,1,'沙漠骆驼','角色,获取角色 列表,QUERY',15,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:19:59'),(52,1,'沙漠骆驼','角色,获取角色 列表,QUERY',14,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:20:07'),(53,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',19,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:31'),(54,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',13,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:33'),(55,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',11,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:34'),(56,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',15,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:35'),(57,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',10,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:36'),(58,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',11,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:37'),(59,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',15,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:38'),(60,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',14,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:38'),(61,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',11,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:40'),(62,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',12,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:41'),(63,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',10,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:42'),(64,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',13,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:21:42'),(65,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',12,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:22:34'),(66,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',13,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:22:36'),(67,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',11,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-05 16:22:38'),(68,NULL,NULL,'系统登陆,,LOGIN',5,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:12:30'),(69,1,'沙漠骆驼','系统登陆认证操作,,OTHER',90,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@27d96289, org.apache.catalina.connector.ResponseFacade@2dcc3d31]','0:0:0:0:0:0:0:1','2019-03-07 14:12:36'),(70,1,'沙漠骆驼','系统日志,获取系统日志列表,QUERY',84,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 14:12:51'),(71,1,'沙漠骆驼','角色,获取角色 列表,QUERY',27,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 14:16:45'),(72,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',49,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 14:17:42'),(73,1,'沙漠骆驼','角色,获取角色 列表,QUERY',15,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 14:18:14'),(74,NULL,NULL,'系统退出,,OTHER',5,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:18:16'),(75,1,'沙漠骆驼','系统登陆认证操作,,OTHER',12,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@73822d9b, org.apache.catalina.connector.ResponseFacade@3680ad8f]','0:0:0:0:0:0:0:1','2019-03-07 14:18:18'),(76,NULL,NULL,'系统退出,,OTHER',4,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:40:09'),(77,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:40:11'),(78,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:40:18'),(79,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:40:31'),(80,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:40:32'),(81,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:40:33'),(82,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:41:03'),(83,NULL,NULL,'系统登陆,,LOGIN',2,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:41:04'),(84,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:41:18'),(85,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:41:59'),(86,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:41:59'),(87,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:42:43'),(88,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:42:44'),(89,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:42:45'),(90,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:42:56'),(91,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:44:02'),(92,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:44:13'),(93,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 14:58:39'),(94,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:02:34'),(95,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:02:36'),(96,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:02:37'),(97,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:03:14'),(98,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:03:17'),(99,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:03:59'),(100,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:04:00'),(101,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:04:20'),(102,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:05:29'),(103,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:05:30'),(104,1,'沙漠骆驼','系统登陆认证操作,,OTHER',17,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@6bc5ef29, org.apache.catalina.connector.ResponseFacade@69faee77]','0:0:0:0:0:0:0:1','2019-03-07 15:05:31'),(105,1,'沙漠骆驼','系统登陆认证操作,,OTHER',12,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@4a5dfdf4, org.apache.catalina.connector.ResponseFacade@69faee77]','0:0:0:0:0:0:0:1','2019-03-07 15:07:02'),(106,1,'沙漠骆驼','系统登陆认证操作,,OTHER',7,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@47c1f110, org.apache.catalina.connector.ResponseFacade@69faee77]','0:0:0:0:0:0:0:1','2019-03-07 15:07:03'),(107,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:04'),(108,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:05'),(109,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:11'),(110,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:13'),(111,1,'沙漠骆驼','系统登陆认证操作,,OTHER',7,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@66b0b7fd, org.apache.catalina.connector.ResponseFacade@69faee77]','0:0:0:0:0:0:0:1','2019-03-07 15:07:14'),(112,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:16'),(113,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:17'),(114,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:23'),(115,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:24'),(116,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:30'),(117,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:31'),(118,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:31'),(119,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:32'),(120,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:33'),(121,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:34'),(122,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:34'),(123,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:34'),(124,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:35'),(125,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:39'),(126,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:39'),(127,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:43'),(128,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:50'),(129,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:07:55'),(130,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:08:05'),(131,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:08:17'),(132,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:08:18'),(133,1,'沙漠骆驼','系统登陆认证操作,,OTHER',9,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@2b60083b, org.apache.catalina.connector.ResponseFacade@63dd0059]','0:0:0:0:0:0:0:1','2019-03-07 15:08:19'),(134,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:08:21'),(135,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:08:22'),(136,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:08:22'),(137,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:08:22'),(138,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:08:33'),(139,1,'沙漠骆驼','系统登陆认证操作,,OTHER',8,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@418ebfc9, org.apache.catalina.connector.ResponseFacade@63dd0059]','0:0:0:0:0:0:0:1','2019-03-07 15:08:34'),(140,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:08:36'),(141,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:09:34'),(142,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:09:35'),(143,1,'沙漠骆驼','系统登陆认证操作,,OTHER',6,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@171f70c0, org.apache.catalina.connector.ResponseFacade@18234401]','0:0:0:0:0:0:0:1','2019-03-07 15:09:36'),(144,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:09:38'),(145,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:09:38'),(146,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:09:39'),(147,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:09:39'),(148,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:09:39'),(149,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:10:03'),(150,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:10:08'),(151,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:10:12'),(152,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:10:21'),(153,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:10:25'),(154,NULL,NULL,'系统退出,,OTHER',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:10:41'),(155,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:10:44'),(156,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:10:46'),(157,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:10:46'),(158,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:10:49'),(159,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:10:52'),(160,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:11:41'),(161,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:11:41'),(162,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:11:42'),(163,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:11:42'),(164,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:11:42'),(165,1,'沙漠骆驼','系统登陆认证操作,,OTHER',7,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@733b9e9d, org.apache.catalina.connector.ResponseFacade@7598b250]','0:0:0:0:0:0:0:1','2019-03-07 15:11:43'),(166,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:11:48'),(167,1,'沙漠骆驼','系统登陆认证操作,,OTHER',8,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@32dcda24, org.apache.catalina.connector.ResponseFacade@7598b250]','0:0:0:0:0:0:0:1','2019-03-07 15:11:55'),(168,1,'沙漠骆驼','系统登陆认证操作,,OTHER',12,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@3765117, org.apache.catalina.connector.ResponseFacade@7598b250]','0:0:0:0:0:0:0:1','2019-03-07 15:12:07'),(169,1,'沙漠骆驼','系统登陆认证操作,,OTHER',7,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@56bef41d, org.apache.catalina.connector.ResponseFacade@7598b250]','0:0:0:0:0:0:0:1','2019-03-07 15:12:08'),(170,1,'沙漠骆驼','系统登陆认证操作,,OTHER',6,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@5804291e, org.apache.catalina.connector.ResponseFacade@7598b250]','0:0:0:0:0:0:0:1','2019-03-07 15:12:09'),(171,1,'沙漠骆驼','系统登陆认证操作,,OTHER',5,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@3f69f7ab, org.apache.catalina.connector.ResponseFacade@7598b250]','0:0:0:0:0:0:0:1','2019-03-07 15:12:10'),(172,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:12:11'),(173,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:12:11'),(174,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:12:12'),(175,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:12:12'),(176,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:12:12'),(177,1,'沙漠骆驼','系统登陆认证操作,,OTHER',8,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@1a9f8b2f, org.apache.catalina.connector.ResponseFacade@6d1ef6]','0:0:0:0:0:0:0:1','2019-03-07 15:12:13'),(178,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:12:14'),(179,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:12:32'),(180,1,'沙漠骆驼','系统登陆认证操作,,OTHER',8,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@6dbff4d9, org.apache.catalina.connector.ResponseFacade@7598b250]','0:0:0:0:0:0:0:1','2019-03-07 15:12:33'),(181,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:12:35'),(182,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:12:38'),(183,1,'沙漠骆驼','系统登陆认证操作,,OTHER',9,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@798cd207, org.apache.catalina.connector.ResponseFacade@69faee77]','0:0:0:0:0:0:0:1','2019-03-07 15:12:41'),(184,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:13:39'),(185,1,'沙漠骆驼','系统登陆认证操作,,OTHER',10,'POST','[tayle, 1234562222, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@60b54ba9, org.apache.catalina.connector.ResponseFacade@69faee77]','0:0:0:0:0:0:0:1','2019-03-07 15:13:42'),(186,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:13:48'),(187,1,'沙漠骆驼','系统登陆认证操作,,OTHER',9,'POST','[tayle111, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@6cef43b1, org.apache.catalina.connector.ResponseFacade@6d1ef6]','0:0:0:0:0:0:0:1','2019-03-07 15:13:50'),(188,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:13:52'),(189,1,'沙漠骆驼','系统登陆认证操作,,OTHER',10,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@1ebb3ca3, org.apache.catalina.connector.ResponseFacade@6d1ef6]','0:0:0:0:0:0:0:1','2019-03-07 15:13:55'),(190,1,'沙漠骆驼','系统登陆认证操作,,OTHER',8,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@5bec30af, org.apache.catalina.connector.ResponseFacade@6d1ef6]','0:0:0:0:0:0:0:1','2019-03-07 15:14:04'),(191,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:14:06'),(192,1,'沙漠骆驼','系统登陆认证操作,,OTHER',5,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@220eefe4, org.apache.catalina.connector.ResponseFacade@7598b250]','0:0:0:0:0:0:0:1','2019-03-07 15:14:10'),(193,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:14:15'),(194,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:14:43'),(195,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:15:59'),(196,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:16:00'),(197,1,'沙漠骆驼','系统登陆,,LOGIN',2,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:16:20'),(198,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:16:23'),(199,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:16:27'),(200,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:16:29'),(201,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:16:33'),(202,1,'沙漠骆驼','系统登陆认证操作,,OTHER',5,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@2db0aa14, org.apache.catalina.connector.ResponseFacade@6d1ef6]','0:0:0:0:0:0:0:1','2019-03-07 15:16:34'),(203,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:16:36'),(204,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:17:41'),(205,1,'沙漠骆驼','系统登陆认证操作,,OTHER',6,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@147ea72a, org.apache.catalina.connector.ResponseFacade@63dd0059]','0:0:0:0:0:0:0:1','2019-03-07 15:17:43'),(206,1,'沙漠骆驼','系统登陆认证操作,,OTHER',7,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@422fcd17, org.apache.catalina.connector.ResponseFacade@63dd0059]','0:0:0:0:0:0:0:1','2019-03-07 15:18:45'),(207,1,'沙漠骆驼','系统登陆认证操作,,OTHER',11,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@45ddb217, org.apache.catalina.connector.ResponseFacade@63dd0059]','0:0:0:0:0:0:0:1','2019-03-07 15:18:45'),(208,1,'沙漠骆驼','系统登陆认证操作,,OTHER',7,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@4d5eb745, org.apache.catalina.connector.ResponseFacade@63dd0059]','0:0:0:0:0:0:0:1','2019-03-07 15:18:46'),(209,1,'沙漠骆驼','系统登陆认证操作,,OTHER',6,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@734c28f5, org.apache.catalina.connector.ResponseFacade@63dd0059]','0:0:0:0:0:0:0:1','2019-03-07 15:18:47'),(210,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:18:47'),(211,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:18:48'),(212,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:18:49'),(213,1,'沙漠骆驼','系统登陆认证操作,,OTHER',5,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@1d5d82c3, org.apache.catalina.connector.ResponseFacade@570abab6]','0:0:0:0:0:0:0:1','2019-03-07 15:18:50'),(214,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:18:51'),(215,1,'沙漠骆驼','系统登陆认证操作,,OTHER',7,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@60ae2ab3, org.apache.catalina.connector.ResponseFacade@69faee77]','0:0:0:0:0:0:0:1','2019-03-07 15:18:53'),(216,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:18:54'),(217,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:18:55'),(218,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:19:46'),(219,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:19:47'),(220,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:19:47'),(221,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:19:47'),(222,1,'沙漠骆驼','系统登陆认证操作,,OTHER',7,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@453ddb5f, org.apache.catalina.connector.ResponseFacade@6d1ef6]','0:0:0:0:0:0:0:1','2019-03-07 15:19:48'),(223,1,'沙漠骆驼','系统登陆认证操作,,OTHER',11,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@5b8c0b30, org.apache.catalina.connector.ResponseFacade@6d1ef6]','0:0:0:0:0:0:0:1','2019-03-07 15:19:49'),(224,1,'沙漠骆驼','系统登陆认证操作,,OTHER',10,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@47870028, org.apache.catalina.connector.ResponseFacade@6d1ef6]','0:0:0:0:0:0:0:1','2019-03-07 15:19:50'),(225,1,'沙漠骆驼','系统登陆认证操作,,OTHER',5,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@488ded8, org.apache.catalina.connector.ResponseFacade@6d1ef6]','0:0:0:0:0:0:0:1','2019-03-07 15:19:50'),(226,1,'沙漠骆驼','系统登陆认证操作,,OTHER',6,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@4e83af35, org.apache.catalina.connector.ResponseFacade@6d1ef6]','0:0:0:0:0:0:0:1','2019-03-07 15:19:52'),(227,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:19:53'),(228,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:20:32'),(229,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:20:33'),(230,1,'沙漠骆驼','系统登陆认证操作,,OTHER',7,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@414e58e4, org.apache.catalina.connector.ResponseFacade@69faee77]','0:0:0:0:0:0:0:1','2019-03-07 15:20:34'),(231,1,'沙漠骆驼','系统登陆认证操作,,OTHER',11,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@687ff11e, org.apache.catalina.connector.ResponseFacade@69faee77]','0:0:0:0:0:0:0:1','2019-03-07 15:20:35'),(232,1,'沙漠骆驼','系统登陆认证操作,,OTHER',6,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@473c0f49, org.apache.catalina.connector.ResponseFacade@69faee77]','0:0:0:0:0:0:0:1','2019-03-07 15:20:36'),(233,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:20:37'),(234,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:20:38'),(235,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:20:39'),(236,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:20:39'),(237,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:20:40'),(238,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:20:57'),(239,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:20:59'),(240,1,'沙漠骆驼','系统登陆,,LOGIN',7,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:21:12'),(241,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:21:17'),(242,1,'沙漠骆驼','系统登陆认证操作,,OTHER',9,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@446e00fd, org.apache.catalina.connector.ResponseFacade@22209d5c]','0:0:0:0:0:0:0:1','2019-03-07 15:21:18'),(243,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:21:20'),(244,1,'沙漠骆驼','系统登陆,,LOGIN',9,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:21:59'),(245,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:22:01'),(246,1,'沙漠骆驼','系统登陆认证操作,,OTHER',15,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@7a50aaef, org.apache.catalina.connector.ResponseFacade@5bffe9a0]','0:0:0:0:0:0:0:1','2019-03-07 15:22:02'),(247,1,'沙漠骆驼','系统登陆认证操作,,OTHER',11,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@312c4a8c, org.apache.catalina.connector.ResponseFacade@5bffe9a0]','0:0:0:0:0:0:0:1','2019-03-07 15:22:38'),(248,1,'沙漠骆驼','系统登陆认证操作,,OTHER',5,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@6590d859, org.apache.catalina.connector.ResponseFacade@5bffe9a0]','0:0:0:0:0:0:0:1','2019-03-07 15:22:39'),(249,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:22:40'),(250,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:22:41'),(251,1,'沙漠骆驼','系统登陆认证操作,,OTHER',4,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@317be987, org.apache.catalina.connector.ResponseFacade@1201d5dc]','0:0:0:0:0:0:0:1','2019-03-07 15:22:42'),(252,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:22:44'),(253,1,'沙漠骆驼','系统登陆认证操作,,OTHER',5,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@44df0028, org.apache.catalina.connector.ResponseFacade@3b844940]','0:0:0:0:0:0:0:1','2019-03-07 15:22:46'),(254,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:22:47'),(255,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:24:21'),(256,1,'沙漠骆驼','系统登陆认证操作,,OTHER',6,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@3fca84d9, org.apache.catalina.connector.ResponseFacade@1201d5dc]','0:0:0:0:0:0:0:1','2019-03-07 15:24:22'),(257,NULL,NULL,'系统退出,,OTHER',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:25:24'),(258,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:25:25'),(259,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:25:25'),(260,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:25:26'),(261,NULL,NULL,'系统登陆,,LOGIN',4,'GET','[]','127.0.0.1','2019-03-07 15:25:47'),(262,1,'沙漠骆驼','系统登陆认证操作,,OTHER',10,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@122eac33, org.apache.catalina.connector.ResponseFacade@5b6560c6]','127.0.0.1','2019-03-07 15:25:49'),(263,1,'沙漠骆驼','系统登陆,,LOGIN',0,'GET','[]','127.0.0.1','2019-03-07 15:25:51'),(264,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:26:33'),(265,1,'沙漠骆驼','系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:28:47'),(266,NULL,NULL,'系统退出,,OTHER',10,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:31:28'),(267,1,'沙漠骆驼','系统登陆认证操作,,OTHER',41,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@1ca76231, org.apache.catalina.connector.ResponseFacade@3156bf9b]','0:0:0:0:0:0:0:1','2019-03-07 15:31:30'),(268,NULL,NULL,'系统退出,,OTHER',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:31:32'),(269,1,'沙漠骆驼','系统登陆认证操作,,OTHER',15,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@5006b9f, org.apache.catalina.connector.ResponseFacade@e3ff9e]','0:0:0:0:0:0:0:1','2019-03-07 15:48:34'),(270,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',78,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 15:48:37'),(271,1,'沙漠骆驼','部门管理,获取部门管理 列表,QUERY',14,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 15:48:39'),(272,1,'沙漠骆驼','/sys/user,获取用户列表,QUERY',43,'GET','[{limit=10, offset=0, deptIds=[1, 2, 4]}]','0:0:0:0:0:0:0:1','2019-03-07 15:48:41'),(273,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',15,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 15:48:47'),(274,NULL,NULL,'系统退出,,OTHER',3,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:57:39'),(275,1,'沙漠骆驼','系统登陆认证操作,,OTHER',20,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@480779e9, org.apache.catalina.connector.ResponseFacade@382bcd56]','0:0:0:0:0:0:0:1','2019-03-07 15:57:41'),(276,NULL,NULL,'系统退出,,OTHER',2,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 15:59:16'),(277,1,'沙漠骆驼','系统登陆认证操作,,OTHER',10,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@38a7c7eb, org.apache.catalina.connector.ResponseFacade@350240e8]','0:0:0:0:0:0:0:1','2019-03-07 15:59:18'),(278,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',75,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 16:00:50'),(279,NULL,NULL,'系统登陆,,LOGIN',7,'GET','[]','0:0:0:0:0:0:0:1','2019-03-07 17:15:26'),(280,1,'沙漠骆驼','系统登陆认证操作,,OTHER',13,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@c8be581, org.apache.catalina.connector.ResponseFacade@23619f65]','0:0:0:0:0:0:0:1','2019-03-07 17:15:29'),(281,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',11,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:21:40'),(282,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',12,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:26:16'),(283,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',13,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:27:04'),(284,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',13,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:27:14'),(285,1,'沙漠骆驼','角色,获取角色 列表,QUERY',30,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 17:27:20'),(286,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',24,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 17:27:37'),(287,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',18,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 17:28:50'),(288,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',12,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:29:44'),(289,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',12,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:30:46'),(290,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',11,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:30:48'),(291,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',12,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:32:17'),(292,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',13,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:32:37'),(293,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',11,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:33:14'),(294,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',11,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:33:16'),(295,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',11,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:33:24'),(296,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',11,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:33:42'),(297,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',9,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:34:05'),(298,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',8,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:34:25'),(299,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',29,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:34:27'),(300,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',16,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 17:34:56'),(301,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',12,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:35:46'),(302,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',10,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:36:08'),(303,1,'沙漠骆驼','角色,获取角色 列表,QUERY',17,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 17:36:14'),(304,1,'沙漠骆驼','/sys/user,获取用户列表,QUERY',51,'GET','[{limit=10, offset=0, deptIds=[1, 2, 4]}]','0:0:0:0:0:0:0:1','2019-03-07 17:36:22'),(305,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',19,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 17:36:28'),(306,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',16,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 17:36:47'),(307,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',12,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 17:40:30'),(308,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',8,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 17:58:17'),(309,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',23,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 17:58:19'),(310,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',11,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 18:00:32'),(311,1,'沙漠骆驼','角色,获取角色 列表,QUERY',26,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 18:00:39'),(312,1,'沙漠骆驼','角色,获取角色 列表,QUERY',16,'GET','[{limit=10, offset=0}]','127.0.0.1','2019-03-07 18:12:13'),(313,1,'沙漠骆驼','角色,获取角色 列表,QUERY',14,'GET','[{limit=10, offset=0}]','127.0.0.1','2019-03-07 18:12:18'),(314,1,'沙漠骆驼','/sys/user,获取用户列表,QUERY',53,'GET','[{limit=10, offset=0, deptIds=[1, 2, 4]}]','127.0.0.1','2019-03-07 18:12:23'),(315,1,'沙漠骆驼','部门管理,获取部门管理 列表,QUERY',7,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-07 18:12:24'),(316,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',22,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 18:12:35'),(317,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',20,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 18:16:04'),(318,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',17,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 18:17:43'),(319,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',17,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 18:18:13'),(320,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',15,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 18:19:48'),(321,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',18,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 18:26:56'),(322,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',10,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-07 18:28:06'),(323,NULL,NULL,'系统登陆,,LOGIN',8,'GET','[]','0:0:0:0:0:0:0:1','2019-03-08 09:33:27'),(324,NULL,NULL,'系统登陆,,LOGIN',1,'GET','[]','0:0:0:0:0:0:0:1','2019-03-08 09:33:28'),(325,1,'沙漠骆驼','系统登陆认证操作,,OTHER',18,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@3890fde5, org.apache.catalina.connector.ResponseFacade@26459263]','0:0:0:0:0:0:0:1','2019-03-08 09:33:38'),(326,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',13,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-08 09:33:45'),(327,NULL,NULL,'系统登陆,,LOGIN',6,'GET','[]','0:0:0:0:0:0:0:1','2019-03-08 10:21:06'),(328,NULL,NULL,'系统登陆,,LOGIN',0,'GET','[]','0:0:0:0:0:0:0:1','2019-03-08 10:21:06'),(329,1,'沙漠骆驼','系统登陆认证操作,,OTHER',8,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@353a9712, org.apache.catalina.connector.ResponseFacade@37befb8d]','0:0:0:0:0:0:0:1','2019-03-08 10:21:08'),(330,1,'沙漠骆驼','数据字典目标表,获取数据字典目标表列表,QUERY',16,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-08 10:21:13'),(331,1,'沙漠骆驼','角色,获取角色 列表,QUERY',14,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-08 10:47:12'),(332,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',13,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-08 10:47:23'),(333,1,'沙漠骆驼','部门管理,获取部门管理 列表,QUERY',12,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-08 10:47:23'),(334,1,'沙漠骆驼','/sys/user,获取用户列表,QUERY',32,'GET','[{limit=10, offset=0, deptIds=[1, 2, 4]}]','0:0:0:0:0:0:0:1','2019-03-08 10:47:24'),(335,1,'沙漠骆驼','角色,获取角色 列表,QUERY',15,'GET','[{limit=10, offset=0}]','0:0:0:0:0:0:0:1','2019-03-08 10:47:24'),(336,NULL,NULL,'系统登陆,,LOGIN',5,'GET','[]','0:0:0:0:0:0:0:1','2019-03-08 12:06:35'),(337,1,'沙漠骆驼','系统登陆认证操作,,OTHER',63,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@1035a9bf, org.apache.catalina.connector.ResponseFacade@12b17e1d]','0:0:0:0:0:0:0:1','2019-03-08 12:06:37'),(338,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',56,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-08 12:06:54'),(339,1,'沙漠骆驼','部门管理,获取部门管理 列表,QUERY',18,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-08 12:07:05'),(340,1,'沙漠骆驼','/sys/user,获取用户列表,QUERY',58,'GET','[{limit=10, offset=0, deptIds=[1, 2, 4]}]','0:0:0:0:0:0:0:1','2019-03-08 12:07:07'),(341,NULL,NULL,'系统登陆,,LOGIN',4,'GET','[]','0:0:0:0:0:0:0:1','2019-03-08 14:20:00'),(342,1,'沙漠骆驼','系统登陆认证操作,,OTHER',304,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@470928ca, org.apache.catalina.connector.ResponseFacade@600f3306]','0:0:0:0:0:0:0:1','2019-03-08 15:02:40'),(343,1,'沙漠骆驼','部门管理,获取部门管理 列表,QUERY',54,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-08 15:03:25'),(344,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',23,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-08 15:03:26'),(345,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',27,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-08 15:11:09'),(346,1,'沙漠骆驼','部门管理,获取部门管理 列表,QUERY',8,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-08 15:11:23'),(347,1,'沙漠骆驼','/sys/user,获取用户列表,QUERY',53,'GET','[{limit=10, offset=0, deptIds=[1, 2, 4]}]','0:0:0:0:0:0:0:1','2019-03-08 15:11:27'),(348,NULL,NULL,'系统登陆,,LOGIN',4,'GET','[]','0:0:0:0:0:0:0:1','2019-03-08 15:18:28'),(349,1,'沙漠骆驼','系统登陆认证操作,,OTHER',27,'POST','[tayle, 123456, false, org.apache.shiro.web.servlet.ShiroHttpServletRequest@72636f8d, org.apache.catalina.connector.ResponseFacade@5e9cc400]','0:0:0:0:0:0:0:1','2019-03-08 15:18:31'),(350,1,'沙漠骆驼','菜单管理,获取菜单管理 列表,QUERY',47,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-08 15:20:07'),(351,1,'沙漠骆驼','部门管理,获取部门管理 列表,QUERY',18,'GET','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-08 15:21:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'系统管理','','',0,'fa fa-gears',0,'2017-08-09 22:49:47','2019-03-01 18:06:09','1'),(2,1,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',3,'2017-08-09 22:55:15',NULL,'1'),(3,1,'部门管理','sys/dept/','sys:dept:dept',1,'fa fa-group',4,'2017-08-09 22:55:15',NULL,'1'),(4,1,'用户管理','sys/user/','sys:user:user',1,'fa fa-user',1,'2017-08-10 14:12:11',NULL,'1'),(5,1,'角色管理','sys/role','sys:role:role',1,'fa fa-user-secret',2,'2017-08-10 14:13:19',NULL,'1'),(6,4,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(7,4,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(8,4,'删除','','sys:user:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(9,4,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(10,4,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(11,2,'新增','sys/menu/','sys:menu:add',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(12,2,'编辑','sys/menu/','sys:menu:edit',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(13,2,'删除','sys/menu/','sys:menu:remove',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(17,5,'编辑','','sys:role:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(18,5,'删除','','sys:role:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(25,3,'新增','','sys:dept:add',2,'',NULL,NULL,NULL,'1'),(26,3,'编辑','','sys:dept:edit',2,'',NULL,NULL,NULL,'1'),(32,3,'删除','','sys:dept:remove',2,'',NULL,NULL,NULL,'1'),(37,0,'系统工具','','',0,'fa fa-cog fa-spin',NULL,'2019-03-01 14:16:05','2019-03-01 16:12:33','1'),(38,37,'自动生成代码','generator','sys:generator:generator',1,'fa fa-anchor ',NULL,'2019-03-01 14:22:52','2019-03-01 17:54:59','1'),(39,0,'系统监控','','',0,'fa fa-tachometer',3,'2019-03-01 18:09:57',NULL,'1'),(40,39,'系统日志','sys/log','sys:log:log',1,'fa fa-file-archive-o',NULL,'2019-03-01 18:11:48',NULL,'1'),(41,5,'新增','','sys:role:add',2,'',NULL,'2019-03-05 11:53:48',NULL,'1'),(42,1,'数据字典','sys/dict','sys:dict:dict',1,'fa fa-book',NULL,'2019-03-07 17:26:16','2019-03-07 17:27:14','1'),(43,42,'新增','','sys:dict:add',2,'',NULL,'2019-03-07 17:35:45',NULL,'1'),(44,42,'编辑','','sys:dict:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(45,42,'删除','','sys:dict:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(46,1,'数据字典数据','','sys:dictData',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(47,46,'编辑字典数据','','sys:dictData:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(48,46,'新增字典数据','','sys:dictData:add',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(49,46,'删除字典数据','','sys:dictData:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','superAdmin','',NULL,NULL,'2019-03-07 18:00:43','1'),(2,'用户管理员','userAdmin','用于管理用户信息',NULL,NULL,NULL,'1'),(3,'系统运维员','operations','',NULL,NULL,'2019-03-05 12:04:14','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (57,2,4),(58,2,6),(59,2,7),(60,2,8),(61,2,9),(62,2,10),(63,2,1),(222,3,40),(223,3,39),(274,1,1),(275,1,2),(276,1,3),(277,1,4),(278,1,5),(279,1,6),(280,1,7),(281,1,8),(282,1,9),(283,1,10),(284,1,11),(285,1,12),(286,1,13),(287,1,17),(288,1,18),(289,1,25),(290,1,26),(291,1,32),(292,1,37),(293,1,38),(294,1,39),(295,1,40),(296,1,41),(297,1,42),(298,1,43),(299,1,44),(300,1,45),(301,1,46);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'tayle','沙漠骆驼','a91f1e137d8d6d94fd865266a664948c',2,'123@qq.com','13112344321',1,NULL,'','2019-03-01 14:21:13',1,'',NULL,'','','','','');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (38,1,1),(43,1,1);
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

-- Dump completed on 2019-03-08 15:43:39
