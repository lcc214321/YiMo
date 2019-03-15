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
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (369,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.MenuController.list','[{sort=order_no}]','0:0:0:0:0:0:0:1','2019-03-11 10:50:05','http://localhost/YiMo/sys/menu/list','获取菜单管理 列表','菜单管理'),(370,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.LogController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-11 10:56:37','http://localhost/YiMo/sys/log/list','获取系统日志列表','系统日志'),(371,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.LogController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-11 10:56:42','http://localhost/YiMo/sys/log/list','获取系统日志列表','系统日志'),(372,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 10:58:24','http://localhost/YiMo/sys/menu/list','获取菜单管理 列表','菜单管理'),(373,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 10:58:25','http://localhost/YiMo/sys/dept/list','获取部门管理 列表','部门管理'),(374,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:17:47','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(375,1,'沙漠骆驼','UPDATE',101,'top.yimo.sys.controller.DeptController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:18:05','http://localhost/YiMo/sys/dept/update','更新部门信息','部门管理'),(376,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:18:05','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(377,1,'沙漠骆驼','INSERT',55,'top.yimo.sys.controller.DeptController.save',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:18:15','http://localhost/YiMo/sys/dept/save','新增部门','部门管理'),(378,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:18:15','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(379,1,'沙漠骆驼','UPDATE',134,'top.yimo.sys.controller.DeptController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:18:22','http://localhost/YiMo/sys/dept/update','更新部门信息','部门管理'),(380,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:18:22','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(381,1,'沙漠骆驼','QUERY',26,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:18:37','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(382,1,'沙漠骆驼','QUERY',20,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:18:38','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(383,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:18:56','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(384,1,'沙漠骆驼','QUERY',35,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:18:59','http://localhost/YiMo/sys/dictData/list/Sex','获取数据字典数据表列表','数据字典数据表'),(385,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:19:10','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(386,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:19:34','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(387,1,'沙漠骆驼','QUERY',50,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-11 11:41:00','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(388,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:03:33','http://localhost/YiMo/login','系统登陆','系统认证'),(389,1,'沙漠骆驼','LOGIN',55,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:04:08','http://localhost/YiMo/login','认证操作','用户认证'),(390,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:04:36','http://localhost/YiMo/login','系统登陆','系统认证'),(391,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:05:12','http://localhost/YiMo/login','认证操作','用户认证'),(392,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:05:53','http://localhost/YiMo/login;JSESSIONID=02d71e37-da67-4174-8144-a2e4094a7469','系统登陆','系统认证'),(393,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:05:53','http://localhost/YiMo/login;JSESSIONID=02d71e37-da67-4174-8144-a2e4094a7469','系统登陆','系统认证'),(394,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:54:13','http://localhost/YiMo/login;JSESSIONID=bbcb6540-401a-4b4c-92e9-75fd2e71bedd','系统登陆','系统认证'),(395,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:54:15','http://localhost/YiMo/login','认证操作','用户认证'),(396,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:54:19','http://localhost/YiMo/login','认证操作','用户认证'),(397,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:54:22','http://localhost/YiMo/login','系统登陆','系统认证'),(398,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:54:22','http://localhost/YiMo/login','系统登陆','系统认证'),(399,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:54:22','http://localhost/YiMo/login','系统登陆','系统认证'),(400,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:54:25','http://localhost/YiMo/login','认证操作','用户认证'),(401,1,'沙漠骆驼','QUERY',121,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:54:29','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(402,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:54:35','http://localhost/YiMo/login','系统登陆','系统认证'),(403,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 15:54:37','http://localhost/YiMo/login','认证操作','用户认证'),(404,NULL,NULL,'LOGIN',5,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:40:22','http://localhost/YiMo/login;JSESSIONID=28aa29bf-c019-4a20-a643-7b2ec17f969d','系统登陆','系统认证'),(405,1,'沙漠骆驼','LOGIN',15,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:40:24','http://localhost/YiMo/login','认证操作','用户认证'),(406,1,'沙漠骆驼','QUERY',27,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:40:33','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(407,1,'沙漠骆驼','QUERY',26,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:40:37','http://localhost/YiMo/sys/dictData/list/Status','获取数据字典数据表列表','数据字典数据表'),(408,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:40:47','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(409,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:40:53','http://localhost/YiMo/login;JSESSIONID=0cad7043-fd04-49b1-b214-305c06244e33','系统登陆','系统认证'),(410,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:40:55','http://localhost/YiMo/login','认证操作','用户认证'),(411,NULL,NULL,'LOGIN',10,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:48:34','http://localhost/YiMo/login;JSESSIONID=fcf3593e-8d3c-4082-9660-ef0005535e22','系统登陆','系统认证'),(412,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:48:35','http://localhost/YiMo/login;JSESSIONID=fcf3593e-8d3c-4082-9660-ef0005535e22','系统登陆','系统认证'),(413,1,'沙漠骆驼','LOGIN',15,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:48:37','http://localhost/YiMo/login','认证操作','用户认证'),(414,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:48:40','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(415,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:48:56','http://localhost/YiMo/login;JSESSIONID=09117395-5528-41f9-93f2-6d6753a5d99a','系统登陆','系统认证'),(416,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:48:56','http://localhost/YiMo/login;JSESSIONID=09117395-5528-41f9-93f2-6d6753a5d99a','系统登陆','系统认证'),(417,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:48:58','http://localhost/YiMo/login','认证操作','用户认证'),(418,NULL,NULL,'LOGIN',12,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:50:40','http://localhost/YiMo/login;JSESSIONID=48b74479-0a6d-4e83-9c28-7254c97fc52b','系统登陆','系统认证'),(419,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:50:43','http://localhost/YiMo/login','系统登陆','系统认证'),(420,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:50:43','http://localhost/YiMo/login','系统登陆','系统认证'),(421,1,'沙漠骆驼','LOGIN',18,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:50:45','http://localhost/YiMo/login','认证操作','用户认证'),(422,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:50:51','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(423,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:50:59','http://localhost/YiMo/login;JSESSIONID=bda00e8d-0c57-4516-b342-ba824735bb84','系统登陆','系统认证'),(424,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:50:59','http://localhost/YiMo/login;JSESSIONID=bda00e8d-0c57-4516-b342-ba824735bb84','系统登陆','系统认证'),(425,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:51:00','http://localhost/YiMo/login','认证操作','用户认证'),(426,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 16:51:18','http://localhost/YiMo/login','系统登陆','系统认证'),(427,NULL,NULL,'LOGIN',7,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:04:14','http://localhost/YiMo/login;JSESSIONID=cbb09876-0bf0-40c9-9543-4fffde6c0880','系统登陆','系统认证'),(428,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:04:14','http://localhost/YiMo/login;JSESSIONID=cbb09876-0bf0-40c9-9543-4fffde6c0880','系统登陆','系统认证'),(429,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:04:16','http://localhost/YiMo/login','认证操作','用户认证'),(430,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:04:20','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(431,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:04:29','http://localhost/YiMo/login;JSESSIONID=e8598964-1aba-432f-b1a8-876862d81514','系统登陆','系统认证'),(432,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:04:29','http://localhost/YiMo/login;JSESSIONID=e8598964-1aba-432f-b1a8-876862d81514','系统登陆','系统认证'),(433,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:04:31','http://localhost/YiMo/login','认证操作','用户认证'),(434,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:04:46','http://localhost/YiMo/login','系统登陆','系统认证'),(435,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:04:49','http://localhost/YiMo/login','系统登陆','系统认证'),(436,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:04:51','http://localhost/YiMo/login','认证操作','用户认证'),(437,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:05:02','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(438,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:05:10','http://localhost/YiMo/login;JSESSIONID=b693b179-0f19-46b1-a24e-8b5675f26d42','系统登陆','系统认证'),(439,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:05:10','http://localhost/YiMo/login;JSESSIONID=b693b179-0f19-46b1-a24e-8b5675f26d42','系统登陆','系统认证'),(440,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:05:11','http://localhost/YiMo/login','认证操作','用户认证'),(441,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:05:19','http://localhost/YiMo/login','系统登陆','系统认证'),(442,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:06:05','http://localhost/YiMo/login;JSESSIONID=f9eeea4e-d78e-4d4f-a806-d956aa3a5f66','系统登陆','系统认证'),(443,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:06:06','http://localhost/YiMo/login;JSESSIONID=f9eeea4e-d78e-4d4f-a806-d956aa3a5f66','系统登陆','系统认证'),(444,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:06:07','http://localhost/YiMo/login','认证操作','用户认证'),(445,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:06:11','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(446,1,'沙漠骆驼','UPDATE',99,'top.yimo.sys.controller.MenuController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:06:33','http://localhost/YiMo//sys/menu//update','更新保存','菜单管理'),(447,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:06:34','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(448,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:07:27','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(449,1,'沙漠骆驼','UPDATE',88,'top.yimo.sys.controller.MenuController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:07:34','http://localhost/YiMo//sys/menu//update','更新保存','菜单管理'),(450,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:07:35','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(451,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:07:45','http://localhost/YiMo/login;JSESSIONID=312d2389-efe2-46eb-b03d-409c154ca2a3','系统登陆','系统认证'),(452,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:07:45','http://localhost/YiMo/login;JSESSIONID=312d2389-efe2-46eb-b03d-409c154ca2a3','系统登陆','系统认证'),(453,1,'沙漠骆驼','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:07:47','http://localhost/YiMo/login','认证操作','用户认证'),(454,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:07:48','http://localhost/YiMo/login','系统登陆','系统认证'),(455,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:07:49','http://localhost/YiMo/login','系统登陆','系统认证'),(456,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:07:57','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(457,1,'沙漠骆驼','UPDATE',97,'top.yimo.sys.controller.MenuController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:08:06','http://localhost/YiMo//sys/menu//update','更新保存','菜单管理'),(458,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:08:06','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(459,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:08:16','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(460,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:08:21','http://localhost/YiMo/login','认证操作','用户认证'),(461,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:08:24','http://localhost/YiMo/login','系统登陆','系统认证'),(462,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:08:24','http://localhost/YiMo/login','系统登陆','系统认证'),(463,1,'沙漠骆驼','LOGIN',35,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:09:23','http://localhost/YiMo/login','认证操作','用户认证'),(464,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:09:31','http://localhost/YiMo/login;JSESSIONID=e3b647e2-c764-47b1-94c1-08ec098d30c7','系统登陆','系统认证'),(465,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:09:32','http://localhost/YiMo/login;JSESSIONID=e3b647e2-c764-47b1-94c1-08ec098d30c7','系统登陆','系统认证'),(466,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:09:34','http://localhost/YiMo/login','认证操作','用户认证'),(467,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:09:38','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(468,1,'沙漠骆驼','UPDATE',90,'top.yimo.sys.controller.MenuController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:09:44','http://localhost/YiMo//sys/menu//update','更新保存','菜单管理'),(469,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:09:44','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(470,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:09:52','http://localhost/YiMo/login','系统登陆','系统认证'),(471,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:09:52','http://localhost/YiMo/login','系统登陆','系统认证'),(472,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:09:52','http://localhost/YiMo/login','系统登陆','系统认证'),(473,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:09:57','http://localhost/YiMo/login','认证操作','用户认证'),(474,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:10:00','http://localhost/YiMo/login','系统登陆','系统认证'),(475,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:10:00','http://localhost/YiMo/login','系统登陆','系统认证'),(476,NULL,NULL,'LOGIN',5,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:13:16','http://localhost/YiMo/login;JSESSIONID=85f6854b-e063-4145-8802-d47517a3faac','系统登陆','系统认证'),(477,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:13:18','http://localhost/YiMo/login','认证操作','用户认证'),(478,NULL,NULL,'LOGIN',9,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:15:49','http://localhost/YiMo/login;JSESSIONID=2956dd34-48fa-44fb-aca9-ad0abb9dd7ef','系统登陆','系统认证'),(479,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:15:49','http://localhost/YiMo/login;JSESSIONID=2956dd34-48fa-44fb-aca9-ad0abb9dd7ef','系统登陆','系统认证'),(480,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:15:52','http://localhost/YiMo/login','认证操作','用户认证'),(481,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:15:55','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(482,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:30:11','http://localhost/YiMo/login;JSESSIONID=0053156e-2df5-4834-bd7e-4b94e4650394','系统登陆','系统认证'),(483,NULL,NULL,'LOGIN',5,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:31:21','http://localhost/YiMo/login;JSESSIONID=cfabc44d-e262-4d88-b640-51aa74abe299','系统登陆','系统认证'),(484,1,'沙漠骆驼','LOGIN',16,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:31:24','http://localhost/YiMo/login','认证操作','用户认证'),(485,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:31:27','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(486,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:34:44','http://localhost/YiMo/login;JSESSIONID=9df44359-ee21-4e3d-ac99-a9e769693890','系统登陆','系统认证'),(487,NULL,NULL,'LOGIN',4,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:38:37','http://localhost/YiMo/login;JSESSIONID=ecad610a-dcfa-43b5-afad-80997acc7557','系统登陆','系统认证'),(488,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:38:37','http://localhost/YiMo/login;JSESSIONID=ecad610a-dcfa-43b5-afad-80997acc7557','系统登陆','系统认证'),(489,1,'沙漠骆驼','LOGIN',18,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:38:39','http://localhost/YiMo/login','认证操作','用户认证'),(490,1,'沙漠骆驼','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:38:54','http://localhost/YiMo/login','认证操作','用户认证'),(491,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:39:02','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(492,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:03','http://localhost/YiMo/login;JSESSIONID=21fa5fdf-f9f0-493a-b4f5-eef4eb7c2ba0','系统登陆','系统认证'),(493,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:04','http://localhost/YiMo/login;JSESSIONID=21fa5fdf-f9f0-493a-b4f5-eef4eb7c2ba0','系统登陆','系统认证'),(494,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:08','http://localhost/YiMo/login','认证操作','用户认证'),(495,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:12','http://localhost/YiMo/login','认证操作','用户认证'),(496,NULL,NULL,'LOGOUT',3,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:15','http://localhost/YiMo/logout','系统退出','用户认证'),(497,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:20','http://localhost/YiMo/login','认证操作','用户认证'),(498,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:28','http://localhost/YiMo/login','认证操作','用户认证'),(499,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:31','http://localhost/YiMo/login','认证操作','用户认证'),(500,1,'沙漠骆驼','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:32','http://localhost/YiMo/login','认证操作','用户认证'),(501,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:33','http://localhost/YiMo/login','认证操作','用户认证'),(502,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:33','http://localhost/YiMo/login','认证操作','用户认证'),(503,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:33','http://localhost/YiMo/login','认证操作','用户认证'),(504,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:33','http://localhost/YiMo/login','认证操作','用户认证'),(505,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:34','http://localhost/YiMo/login','认证操作','用户认证'),(506,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:34','http://localhost/YiMo/login','认证操作','用户认证'),(507,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:34','http://localhost/YiMo/login','认证操作','用户认证'),(508,1,'沙漠骆驼','LOGIN',16,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:34','http://localhost/YiMo/login','认证操作','用户认证'),(509,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:41:34','http://localhost/YiMo/login','认证操作','用户认证'),(510,NULL,NULL,'LOGIN',8,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:50:17','http://localhost/YiMo/login','系统登陆','系统认证'),(511,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:50:20','http://localhost/YiMo/login','认证操作','用户认证'),(512,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:50:24','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(513,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:52:38','http://localhost/YiMo/login;JSESSIONID=cc147f77-b406-45bd-9d32-07fa23b42970','系统登陆','系统认证'),(514,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:53:27','http://localhost/YiMo/login;JSESSIONID=fb120e25-4307-4e9c-b681-4c09c627e35b','系统登陆','系统认证'),(515,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:53:27','http://localhost/YiMo/login;JSESSIONID=fb120e25-4307-4e9c-b681-4c09c627e35b','系统登陆','系统认证'),(516,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:53:30','http://localhost/YiMo/login','认证操作','用户认证'),(517,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:53:36','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(518,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:56:47','http://localhost/YiMo/login;JSESSIONID=34a8c5db-2387-4eac-8da5-79e05173e42e','系统登陆','系统认证'),(519,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:56:48','http://localhost/YiMo/login','系统登陆','系统认证'),(520,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:57:58','http://localhost/YiMo/login','认证操作','用户认证'),(521,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:58:01','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(522,1,'沙漠骆驼','UPDATE',201,'top.yimo.sys.controller.MenuController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:58:05','http://localhost/YiMo//sys/menu//update','更新保存','菜单管理'),(523,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:58:05','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(524,1,'沙漠骆驼','UPDATE',92,'top.yimo.sys.controller.MenuController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:58:09','http://localhost/YiMo//sys/menu//update','更新保存','菜单管理'),(525,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:58:09','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(526,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:59:19','http://localhost/YiMo/login;JSESSIONID=4e5dfbc3-412b-4702-a7e6-8040b7924f17','系统登陆','系统认证'),(527,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.login',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:59:19','http://localhost/YiMo/login','系统登陆','系统认证'),(528,NULL,NULL,'LOGIN',41,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:59:56','http://localhost/YiMo/login','认证操作','用户认证'),(529,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 17:59:59','http://localhost/YiMo/login','认证操作','用户认证'),(530,1,'沙漠骆驼','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 18:01:10','http://localhost/YiMo/login','认证操作','用户认证'),(531,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-11 18:01:15','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(532,1,'沙漠骆驼','LOGIN',39,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-11 18:01:49','http://localhost/YiMo/login','认证操作','用户认证'),(533,1,'沙漠骆驼','LOGIN',101,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:55:30','http://localhost/YiMo/login','认证操作','用户认证'),(534,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:55:42','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(535,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:56:41','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(536,1,'沙漠骆驼','QUERY',44,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:56:48','http://localhost/YiMo/sys/user/list','获取用户列表','/sys/user'),(537,1,'沙漠骆驼','QUERY',33,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:56:51','http://localhost/YiMo/sys/user/list','获取用户列表','/sys/user'),(538,1,'沙漠骆驼','QUERY',24,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:56:51','http://localhost/YiMo/sys/user/list','获取用户列表','/sys/user'),(539,1,'沙漠骆驼','QUERY',22,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:56:52','http://localhost/YiMo/sys/user/list','获取用户列表','/sys/user'),(540,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:56:52','http://localhost/YiMo/sys/user/list','获取用户列表','/sys/user'),(541,1,'沙漠骆驼','QUERY',28,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:56:53','http://localhost/YiMo/sys/user/list','获取用户列表','/sys/user'),(542,1,'沙漠骆驼','QUERY',32,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:56:54','http://localhost/YiMo/sys/user/list','获取用户列表','/sys/user'),(543,1,'沙漠骆驼','QUERY',25,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:56:55','http://localhost/YiMo/sys/user/list','获取用户列表','/sys/user'),(544,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:56:56','http://localhost/YiMo/sys/user/list','获取用户列表','/sys/user'),(545,1,'沙漠骆驼','QUERY',39,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 09:56:56','http://localhost/YiMo/sys/user/list','获取用户列表','/sys/user'),(546,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-12 10:04:05','http://localhost/YiMo/login','认证操作','用户认证'),(547,1,'沙漠骆驼','LOGIN',501,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-12 18:23:09','http://localhost/YiMo/login','认证操作','用户认证'),(548,1,'沙漠骆驼','QUERY',92,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-12 18:25:06','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(549,1,'沙漠骆驼','QUERY',25,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-12 18:25:09','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(550,1,'沙漠骆驼','QUERY',69,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 18:25:12','http://localhost/YiMo/sys/user/list','获取用户列表','/sys/user'),(551,1,'沙漠骆驼','QUERY',30,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 18:25:38','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(552,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-12 18:25:39','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(553,1,'沙漠骆驼','LOGIN',772,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-13 14:49:19','http://localhost/YiMo/login','认证操作','用户认证'),(554,1,'沙漠骆驼','QUERY',161,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-13 14:49:52','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(555,1,'沙漠骆驼','QUERY',27,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-13 14:49:55','http://localhost/YiMo/sys/dictData/list/OnlineStatus','获取数据字典数据表列表','数据字典数据表'),(556,1,'沙漠骆驼','LOGIN',43,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-13 14:53:18','http://localhost/YiMo/login','认证操作','用户认证'),(557,1,'沙漠骆驼','LOGIN',31,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-13 14:59:19','http://localhost/YiMo/login','认证操作','用户认证'),(558,NULL,NULL,'LOGOUT',7,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-13 14:59:29','http://localhost/YiMo/logout','系统退出','用户认证'),(559,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-13 14:59:31','http://localhost/YiMo/login','认证操作','用户认证'),(560,1,'沙漠骆驼','LOGIN',265,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-13 15:43:09','http://localhost/YiMo/login','认证操作','用户认证'),(561,1,'沙漠骆驼','QUERY',103,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-13 15:43:27','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(562,1,'沙漠骆驼','LOGIN',577,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-15 17:12:40','http://localhost/YiMo/login','认证操作','用户认证'),(563,1,'沙漠骆驼','LOGIN',16,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-15 17:18:31','http://localhost/YiMo/login','认证操作','用户认证'),(564,1,'沙漠骆驼','LOGIN',23,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-15 17:39:29','http://localhost/YiMo/login','认证操作','用户认证'),(565,NULL,NULL,'LOGOUT',141,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-15 17:39:36','http://localhost/YiMo/logout','系统退出','用户认证'),(566,1,'沙漠骆驼','LOGIN',143660,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-15 17:44:26','http://localhost/YiMo/login','认证操作','用户认证'),(567,NULL,NULL,'LOGOUT',11,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-15 17:48:12','http://localhost/YiMo/logout','系统退出','用户认证'),(568,1,'沙漠骆驼','LOGIN',18,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-15 17:48:19','http://localhost/YiMo/login','认证操作','用户认证'),(569,NULL,NULL,'LOGOUT',24,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-15 17:49:40','http://localhost/YiMo/logout','系统退出','用户认证'),(570,1,'沙漠骆驼','LOGIN',21,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-15 17:49:59','http://localhost/YiMo/login','认证操作','用户认证'),(571,1,'沙漠骆驼','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-15 17:52:12','http://localhost/YiMo/login','认证操作','用户认证'),(572,1,'沙漠骆驼','LOGIN',114,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-15 18:00:07','http://localhost/YiMo/login','认证操作','用户认证');
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
INSERT INTO `sys_menu` VALUES (1,0,'系统管理','','',0,'fa fa-gears',0,'2017-08-09 22:49:47','2019-03-01 18:06:09','1'),(2,1,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',3,'2017-08-09 22:55:15',NULL,'1'),(3,1,'部门管理','sys/dept/','sys:dept:dept',1,'fa fa-group',4,'2017-08-09 22:55:15',NULL,'1'),(4,1,'用户管理','sys/user/','sys:user:user',1,'fa fa-user',1,'2017-08-10 14:12:11',NULL,'1'),(5,1,'角色管理','sys/role','sys:role:role',1,'fa fa-user-secret',2,'2017-08-10 14:13:19',NULL,'1'),(6,4,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(7,4,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(8,4,'删除','','sys:user:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(9,4,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(10,4,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(11,2,'新增','sys/menu/','sys:menu:add',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(12,2,'编辑','sys/menu/','sys:menu:edit',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(13,2,'删除','sys/menu/','sys:menu:remove',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(17,5,'编辑','','sys:role:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(18,5,'删除','','sys:role:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(25,3,'新增','','sys:dept:add',2,'',NULL,NULL,NULL,'1'),(26,3,'编辑','','sys:dept:edit',2,'',NULL,NULL,NULL,'1'),(32,3,'删除','','sys:dept:remove',2,'',NULL,NULL,NULL,'1'),(37,0,'系统工具','','',0,'fa fa-cog fa-spin',NULL,'2019-03-01 14:16:05','2019-03-11 17:58:05','1'),(38,37,'自动生成代码','generator','sys:generator:generator',1,'fa fa-anchor ',NULL,'2019-03-01 14:22:52','2019-03-11 17:58:09','1'),(39,0,'系统监控','','',0,'fa fa-tachometer',3,'2019-03-01 18:09:57',NULL,'1'),(40,39,'系统日志','sys/log','sys:log:log',1,'fa fa-file-archive-o',NULL,'2019-03-01 18:11:48',NULL,'1'),(41,5,'新增','','sys:role:add',2,'',NULL,'2019-03-05 11:53:48',NULL,'1'),(42,1,'数据字典','sys/dict','sys:dict:dict',1,'fa fa-book',NULL,'2019-03-07 17:26:16','2019-03-07 17:27:14','1'),(43,42,'新增','','sys:dict:add',2,'',NULL,'2019-03-07 17:35:45',NULL,'1'),(44,42,'编辑','','sys:dict:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(45,42,'删除','','sys:dict:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(46,1,'数据字典数据','','sys:dictData',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(47,46,'编辑字典数据','','sys:dictData:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(48,46,'新增字典数据','','sys:dictData:add',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(49,46,'删除字典数据','','sys:dictData:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
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
INSERT INTO `sys_user_online` VALUES ('189310256865840242',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2019-03-15 18:57:57
