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
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(190) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` VALUES ('YiMoScheduler','trigger-SyncOnlineStatusJob','trigger-myCronJob','0/30 * * * * ?','Asia/Shanghai'),('YiMoScheduler','trigger-WebLogJob','trigger-myCronJob','0/1 * * * * ?','Asia/Shanghai'),('YiMoScheduler','trigger-WebSocketMessageJob','trigger-myCronJob','0/5 * * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(190) DEFAULT NULL,
  `JOB_GROUP` varchar(190) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` VALUES ('YiMoScheduler','SyncOnlineStatusJob','myCronJob','同步在线用户状态','top.yimo.common.quartz.job.SyncOnlineStatusJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('YiMoScheduler','WebLogJob','myCronJob','定时轮询读取服务器日志','top.yimo.common.quartz.job.WebLogJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('YiMoScheduler','WebSocketMessageJob','myCronJob','自动发送webSocket消息','top.yimo.common.quartz.job.WebSocketMessageJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('clusteredScheduler','TRIGGER_ACCESS'),('YiMoScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` VALUES ('YiMoScheduler','trigger-SyncOnlineStatusJob','trigger-myCronJob','SyncOnlineStatusJob','myCronJob',NULL,1557913350000,1557913320000,5,'PAUSED','CRON',1555039980000,0,NULL,0,''),('YiMoScheduler','trigger-WebLogJob','trigger-myCronJob','WebLogJob','myCronJob',NULL,1558340621131,1557913330000,5,'PAUSED','CRON',1555396082000,0,NULL,0,''),('YiMoScheduler','trigger-WebSocketMessageJob','trigger-myCronJob','WebSocketMessageJob','myCronJob',NULL,1557913340000,1557913335000,5,'PAUSED','CRON',1554198281000,0,NULL,0,'');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='部门管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,'一墨有限公司',1,'1'),(2,1,'科技部',2,'1'),(4,1,'审批部',4,'1'),(5,1,'业务部',3,'1'),(6,1,'市场部',5,'1'),(7,1,'人事部',6,'1');
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
INSERT INTO `sys_dict` VALUES ('MenuType','目录类型',1,1,'2019-05-24 17:01:08',NULL),('OnlineStatus','在线状态',1,1,'2019-04-11 17:27:51','2019-04-11 17:27:51'),('Sex','性别',1,1,'2019-04-11 17:27:51','2019-04-11 17:27:48'),('Status','状态',1,1,'2019-04-11 17:27:51','2019-04-11 17:27:45');
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
  CONSTRAINT `sys_dict_data_sys_dict_fk` FOREIGN KEY (`dict_type`) REFERENCES `sys_dict` (`dict_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES ('MenuType','0','目录','label-info',1,1,'2019-05-24 17:13:57','2019-05-24 17:16:50'),('MenuType','1','菜单','label-success',1,1,'2019-05-24 17:14:10','2019-05-24 17:14:56'),('MenuType','2','按钮','label-warning',1,1,'2019-05-24 17:14:18','2019-05-24 17:15:05'),('OnlineStatus','off_line','下线','label-danger',1,NULL,NULL,NULL),('OnlineStatus','on_line','在线','label-primary',1,NULL,NULL,'2019-05-24 11:42:10'),('Sex','1','男',NULL,1,NULL,NULL,NULL),('Sex','2','女',NULL,1,NULL,NULL,NULL),('Sex','3','未知','',1,1,'2019-04-12 11:34:06',NULL),('Status','0','停用','label-danger',1,NULL,NULL,'2019-04-12 10:06:18'),('Status','1','正常','label-primary',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `job_class_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错失触发策略',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_user_id` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  `description` varchar(100) DEFAULT NULL COMMENT '任务描述',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (4,'SyncOnlineStatusJob','myCronJob','top.yimo.common.quartz.job.SyncOnlineStatusJob','','0/30 * * * * ?','1','0','1','2019-03-26 11:07:19','0','2019-04-12 11:33:00','','同步在线用户状态'),(5,'WebSocketMessageJob','myCronJob','top.yimo.common.quartz.job.WebSocketMessageJob','','0/5 * * * * ?','3','0','1','2019-04-02 17:18:08',NULL,'2019-04-02 17:44:41','','自动发送webSocket消息'),(6,'WebLogJob','myCronJob','top.yimo.common.quartz.job.WebLogJob','','0/1 * * * * ?',NULL,'0','1','2019-04-16 11:04:05','1','2019-04-16 14:28:02','','定时轮询读取服务器日志');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5904 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (5873,1,'一墨大侠','QUERY',7,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:04:17','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(5874,1,'一墨大侠','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:04:35','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5875,1,'一墨大侠','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:06:10','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5876,1,'一墨大侠','QUERY',15,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:06:15','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5877,1,'一墨大侠','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:06:17','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5878,1,'一墨大侠','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:06:19','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5879,1,'一墨大侠','QUERY',32,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:06:21','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5880,1,'一墨大侠','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:06:34','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5881,1,'一墨大侠','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:06:41','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5882,1,'一墨大侠','QUERY',14,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:06:44','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5883,1,'一墨大侠','QUERY',14,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:06:45','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5884,1,'一墨大侠','QUERY',15,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:07:25','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5885,1,'一墨大侠','QUERY',15,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:07:33','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5886,1,'一墨大侠','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:07:42','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5887,1,'一墨大侠','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:09:14','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5888,1,'一墨大侠','QUERY',15,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:09:15','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5889,1,'一墨大侠','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:09:16','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5890,1,'一墨大侠','QUERY',53,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:09:22','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5891,1,'一墨大侠','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:09:28','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5892,1,'一墨大侠','QUERY',15,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:09:32','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5893,NULL,NULL,'LOGOUT',68,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:09:33','http://localhost/YiMo/logout','系统退出','用户认证'),(5894,54,'超级管理员','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:09:40','http://localhost/YiMo/login','认证操作','用户认证'),(5895,54,'超级管理员','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:09:52','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5896,54,'超级管理员','resetPwd',86,'top.yimo.sys.controller.UserController.resetPwd',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:10:00','http://localhost/YiMo/sys/user/resetPwd/54','提交重置用户密码','/sys/user'),(5897,54,'超级管理员','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:10:00','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5898,54,'超级管理员','QUERY',14,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:10:30','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(5899,NULL,NULL,'LOGOUT',89,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:10:34','http://localhost/YiMo/logout','系统退出','用户认证'),(5900,1,'一墨大侠','LOGIN',3,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:10:38','http://localhost/YiMo/login','认证操作','用户认证'),(5901,NULL,NULL,'LOGOUT',58,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:11:02','http://localhost/YiMo/logout','系统退出','用户认证'),(5902,1,'一墨大侠','LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:11:04','http://localhost/YiMo/login','认证操作','用户认证'),(5903,1,'一墨大侠','QUERY',7,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-05-24 18:11:09','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'系统管理','','',0,'fa fa-gears',10,'2017-08-09 22:49:47','2019-04-12 16:04:12','1'),(2,1,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',13,'2017-08-09 22:55:15','2019-03-27 16:21:32','1'),(3,1,'部门管理','sys/dept/','sys:dept:dept',1,'fa fa-group',14,'2017-08-09 22:55:15','2019-03-27 16:21:35','1'),(4,1,'用户管理','sys/user/','sys:user:user',1,'fa fa-user',11,'2017-08-10 14:12:11','2019-03-27 16:21:24','1'),(5,1,'角色管理','sys/role','sys:role:role',1,'fa fa-user-secret',12,'2017-08-10 14:13:19','2019-03-27 16:21:28','1'),(6,4,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(7,4,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(8,4,'删除','','sys:user:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(9,4,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(10,4,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(11,2,'新增','sys/menu/','sys:menu:add',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(12,2,'编辑','sys/menu/','sys:menu:edit',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(13,2,'删除','sys/menu/','sys:menu:remove',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(17,5,'编辑','','sys:role:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(18,5,'删除','','sys:role:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(25,3,'新增','','sys:dept:add',2,'',NULL,NULL,NULL,'1'),(26,3,'编辑','','sys:dept:edit',2,'',NULL,NULL,NULL,'1'),(32,3,'删除','','sys:dept:remove',2,'',NULL,NULL,NULL,'1'),(37,0,'系统工具','','',0,'fa fa-cog fa-spin',20,'2019-03-01 14:16:05','2019-03-27 16:19:49','1'),(38,37,'自动生成代码','generator','sys:generator:generator',1,'fa fa-anchor ',20,'2019-03-01 14:22:52','2019-03-27 16:19:41','1'),(39,0,'系统监控','','',0,'fa fa-tachometer',30,'2019-03-01 18:09:57','2019-04-23 14:47:35','1'),(40,39,'系统操作日志','sys/log','sys:log:log',1,'fa fa-file-archive-o',31,'2019-03-01 18:11:48','2019-04-16 10:57:16','1'),(41,5,'新增','','sys:role:add',2,'',NULL,'2019-03-05 11:53:48',NULL,'1'),(42,1,'数据字典','sys/dict','sys:dict:dict',1,'fa fa-book',15,'2019-03-07 17:26:16','2019-03-27 16:21:39','1'),(43,42,'新增','','sys:dict:add',2,'',NULL,'2019-03-07 17:35:45',NULL,'1'),(44,42,'编辑','','sys:dict:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(45,42,'删除','','sys:dict:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(46,42,'数据字典数据','','sys:dictData',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(47,42,'编辑字典数据','','sys:dictData:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(48,42,'新增字典数据','','sys:dictData:add',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(49,42,'删除字典数据','','sys:dictData:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(50,39,'在线用户','sys/userOnline','sys:userOnline:userOnline',1,'fa fa-user',32,'2019-03-18 15:16:35','2019-03-27 16:20:58','1'),(51,50,'强制提出','','sys:userOnline:kickout',2,'',NULL,'2019-03-18 15:29:08',NULL,'1'),(53,39,'定时任务管理','sys/job','sys:job:job',1,'fa fa-calendar',33,'2019-03-25 17:00:14','2019-03-27 16:21:02','1'),(54,37,'表单构建器','common/frombuild','common:frombuild',1,'fa fa-arrows',21,'2019-03-27 16:19:30','2019-05-22 18:37:19','1'),(55,39,'服务器日志','sys/webLog/tail','sys:weblog:tail',1,'fa fa-calendar-o',34,'2019-04-16 10:58:34','2019-05-22 18:25:17','0'),(56,37,'swagger','sys/swagger/view','sys:swagger:view',1,'fa fa-file-archive-o',23,'2019-04-23 12:08:05','2019-04-23 12:08:15','1'),(57,39,'Druid','sys/druid/view','sys:druid:view',1,'fa fa-wrench',35,'2019-04-23 14:48:56',NULL,'1');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','superAdmin','',NULL,NULL,'2019-04-23 14:49:06','1'),(2,'用户管理员','userAdmin','用于管理用户信息',NULL,NULL,'2019-04-12 17:22:16','1'),(3,'系统运维员','operations','',NULL,NULL,'2019-04-16 10:59:03','1'),(4,'默认角色','default','默认角色',NULL,NULL,NULL,'1');
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
  CONSTRAINT `sys_role_menu_sys_menu_fk` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_role_menu_sys_role_fk` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=532 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (404,2,4),(405,2,5),(406,2,6),(407,2,7),(408,2,8),(409,2,9),(410,2,10),(411,2,17),(412,2,18),(413,2,41),(414,2,1),(415,3,39),(416,3,40),(417,3,50),(418,3,51),(419,3,53),(420,3,55),(494,1,1),(495,1,2),(496,1,3),(497,1,4),(498,1,5),(499,1,6),(500,1,7),(501,1,8),(502,1,9),(503,1,10),(504,1,11),(505,1,12),(506,1,13),(507,1,17),(508,1,18),(509,1,25),(510,1,26),(511,1,32),(512,1,37),(513,1,38),(514,1,39),(515,1,40),(516,1,41),(517,1,42),(518,1,43),(519,1,44),(520,1,45),(521,1,46),(522,1,47),(523,1,48),(524,1,49),(525,1,50),(526,1,51),(527,1,53),(528,1,54),(529,1,55),(530,1,56),(531,1,57);
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','一墨大侠','45b9bfb1d5f018a7fad7b38d0f10ec5b',1,'123@qq.com','13112344321',1,1,NULL,'2019-05-23 16:55:06',1,'2018-01-01',NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `sys_user_online` VALUES ('38ea84fd-1d38-4043-a651-32367a006a14',NULL,NULL,NULL,NULL,'127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-24 14:34:00','2019-05-24 18:09:33',NULL),('9b57773a-d31f-4d62-90f7-edd6a9741290',NULL,NULL,NULL,NULL,'127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-24 18:09:40','2019-05-24 18:10:34',NULL),('a55ec5fe-0967-4818-bf57-624d2ed76b9d',NULL,NULL,NULL,NULL,'127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-24 18:10:38','2019-05-24 18:11:02',NULL);
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
  CONSTRAINT `sys_user_role_sys_user_fk` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (86,1,1);
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

-- Dump completed on 2019-05-24 18:13:16
