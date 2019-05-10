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
INSERT INTO `qrtz_triggers` VALUES ('YiMoScheduler','trigger-SyncOnlineStatusJob','trigger-myCronJob','SyncOnlineStatusJob','myCronJob',NULL,1557484380000,1557484350000,5,'WAITING','CRON',1555039980000,0,NULL,0,''),('YiMoScheduler','trigger-WebLogJob','trigger-myCronJob','WebLogJob','myCronJob',NULL,1557484370000,1557484369000,5,'WAITING','CRON',1555396082000,0,NULL,0,''),('YiMoScheduler','trigger-WebSocketMessageJob','trigger-myCronJob','WebSocketMessageJob','myCronJob',NULL,1555555625000,1555555620000,5,'PAUSED','CRON',1554198281000,0,NULL,0,'');
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
INSERT INTO `sys_dict` VALUES ('OnlineStatus','在线状态',1,1,'2019-04-11 17:27:51','2019-04-11 17:27:51'),('Sex','性别',1,1,'2019-04-11 17:27:51','2019-04-11 17:27:48'),('Status','状态',1,1,'2019-04-11 17:27:51','2019-04-11 17:27:45');
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
  CONSTRAINT `sys_dict_data_sys_dict_fk` FOREIGN KEY (`dict_type`) REFERENCES `sys_dict` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES ('OnlineStatus','off_line','下线','label-danger',1,NULL,NULL,NULL),('OnlineStatus','on_line','在线','label-primary',1,NULL,NULL,NULL),('Sex','1','男',NULL,1,NULL,NULL,NULL),('Sex','2','女',NULL,1,NULL,NULL,NULL),('Sex','3','未知','',1,1,'2019-04-12 11:34:06',NULL),('Status','0','停用','label-danger',1,NULL,NULL,'2019-04-12 10:06:18'),('Status','1','正常','label-primary',1,NULL,NULL,NULL);
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
INSERT INTO `sys_job` VALUES (4,'SyncOnlineStatusJob','myCronJob','top.yimo.common.quartz.job.SyncOnlineStatusJob','','0/30 * * * * ?','1','1','1','2019-03-26 11:07:19','0','2019-04-12 11:33:00','','同步在线用户状态'),(5,'WebSocketMessageJob','myCronJob','top.yimo.common.quartz.job.WebSocketMessageJob','','0/5 * * * * ?','3','0','1','2019-04-02 17:18:08',NULL,'2019-04-02 17:44:41','','自动发送webSocket消息'),(6,'WebLogJob','myCronJob','top.yimo.common.quartz.job.WebLogJob','','0/1 * * * * ?',NULL,'1','1','2019-04-16 11:04:05','1','2019-04-16 14:28:02','','定时轮询读取服务器日志');
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
) ENGINE=InnoDB AUTO_INCREMENT=4272 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
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
INSERT INTO `sys_menu` VALUES (1,0,'系统管理','','',0,'fa fa-gears',10,'2017-08-09 22:49:47','2019-04-12 16:04:12','1'),(2,1,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',13,'2017-08-09 22:55:15','2019-03-27 16:21:32','1'),(3,1,'部门管理','sys/dept/','sys:dept:dept',1,'fa fa-group',14,'2017-08-09 22:55:15','2019-03-27 16:21:35','1'),(4,1,'用户管理','sys/user/','sys:user:user',1,'fa fa-user',11,'2017-08-10 14:12:11','2019-03-27 16:21:24','1'),(5,1,'角色管理','sys/role','sys:role:role',1,'fa fa-user-secret',12,'2017-08-10 14:13:19','2019-03-27 16:21:28','1'),(6,4,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(7,4,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(8,4,'删除','','sys:user:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(9,4,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(10,4,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(11,2,'新增','sys/menu/','sys:menu:add',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(12,2,'编辑','sys/menu/','sys:menu:edit',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(13,2,'删除','sys/menu/','sys:menu:remove',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(17,5,'编辑','','sys:role:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(18,5,'删除','','sys:role:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(25,3,'新增','','sys:dept:add',2,'',NULL,NULL,NULL,'1'),(26,3,'编辑','','sys:dept:edit',2,'',NULL,NULL,NULL,'1'),(32,3,'删除','','sys:dept:remove',2,'',NULL,NULL,NULL,'1'),(37,0,'系统工具','','',0,'fa fa-cog fa-spin',20,'2019-03-01 14:16:05','2019-03-27 16:19:49','1'),(38,37,'自动生成代码','generator','sys:generator:generator',1,'fa fa-anchor ',20,'2019-03-01 14:22:52','2019-03-27 16:19:41','1'),(39,0,'系统监控','','',0,'fa fa-tachometer',30,'2019-03-01 18:09:57','2019-04-23 14:47:35','1'),(40,39,'系统操作日志','sys/log','sys:log:log',1,'fa fa-file-archive-o',31,'2019-03-01 18:11:48','2019-04-16 10:57:16','1'),(41,5,'新增','','sys:role:add',2,'',NULL,'2019-03-05 11:53:48',NULL,'1'),(42,1,'数据字典','sys/dict','sys:dict:dict',1,'fa fa-book',15,'2019-03-07 17:26:16','2019-03-27 16:21:39','1'),(43,42,'新增','','sys:dict:add',2,'',NULL,'2019-03-07 17:35:45',NULL,'1'),(44,42,'编辑','','sys:dict:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(45,42,'删除','','sys:dict:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(46,42,'数据字典数据','','sys:dictData',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(47,42,'编辑字典数据','','sys:dictData:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(48,42,'新增字典数据','','sys:dictData:add',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(49,42,'删除字典数据','','sys:dictData:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(50,39,'在线用户','sys/userOnline','sys:userOnline:userOnline',1,'fa fa-user',32,'2019-03-18 15:16:35','2019-03-27 16:20:58','1'),(51,50,'强制提出','','sys:userOnline:kickout',2,'',NULL,'2019-03-18 15:29:08',NULL,'1'),(53,39,'定时任务管理','sys/job','sys:job:job',1,'fa fa-calendar',33,'2019-03-25 17:00:14','2019-03-27 16:21:02','1'),(54,37,'表单构建器','tool/frombuild','tool:frombuild',1,'fa fa-arrows',21,'2019-03-27 16:19:30','2019-03-27 16:21:09','1'),(55,39,'服务器日志','sys/webLog/tail','sys:weblog:tail',1,'fa fa-calendar-o',34,'2019-04-16 10:58:34','2019-04-29 11:06:05','1'),(56,37,'swagger','sys/swagger/view','sys:swagger:view',1,'fa fa-file-archive-o',23,'2019-04-23 12:08:05','2019-04-23 12:08:15','1'),(57,39,'Druid','sys/druid/view','sys:druid:view',1,'fa fa-wrench',35,'2019-04-23 14:48:56',NULL,'1');
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
INSERT INTO `sys_role` VALUES (1,'超级管理员','superAdmin','',NULL,NULL,'2019-04-23 14:49:06','1'),(2,'用户管理员','userAdmin','用于管理用户信息',NULL,NULL,'2019-04-12 17:22:16','1'),(3,'系统运维员','operations','',NULL,NULL,'2019-04-16 10:59:03','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'tayle','一墨大侠','a91f1e137d8d6d94fd865266a664948c',2,'123@qq.com','13112344321',1,NULL,'','2019-04-29 11:06:43',1,'',NULL,'','','','',''),(2,'test','','a5cfa42781cb8660b198daceaea34167',2,'test@aa.com','13112344321',1,1,'2019-03-19 19:08:49','2019-04-30 15:48:04',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'demo','','ae8df3b6bd3e329b23d8560c7d114dea',5,'123@qq.com','13112344321',1,1,'2019-04-12 15:56:25','2019-04-30 15:43:34',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `sys_user_online` VALUES ('05e373a9-0787-4277-8542-ba942b01f81e',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 18:06:44','2019-04-10 00:00:00',NULL),('0907205c-f1eb-4b4e-90af-794310bcbb25',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:13:07','2019-04-12 17:14:00',NULL),('09556b95-d721-427f-937c-6b311ab75819',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:02:14','2019-04-02 16:10:00',NULL),('0979eea4-0962-488f-9f0a-a006b8a1c4bf',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:04:30','2019-04-02 16:10:00',NULL),('0cc2736b-4cb6-40be-b9f1-3328e52ac07f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-30 16:45:25','2019-04-30 16:47:30',NULL),('0d6e19bd-c739-4d74-b544-7bb46da39f6e',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-07 16:57:57','2019-05-07 17:17:17',NULL),('0dc5eb0f-ad1c-49b1-87b4-473466c27749',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:26:36','2019-04-02 16:30:04',NULL),('0e60cdc9-922a-43e5-9a3e-45f9697e9b8e',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 12:12:49','2019-04-16 12:14:13',NULL),('0ec1cf56-4b7a-45ff-babd-5d556020b7fc',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 14:45:30',NULL,NULL),('0f141232-4845-494b-a682-433482494210',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','on_line','2019-05-10 18:16:52',NULL,NULL),('0fdaed17-c90c-4656-b936-f63badba3e1c',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:41:59','2019-04-12 11:33:04',NULL),('130613c4-717d-490d-a11a-a193d8897f45',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 14:30:49','2019-04-12 14:34:02',NULL),('152679d9-5348-403a-90e2-72f43e34b762',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:52:38','2019-04-12 11:33:04',NULL),('17610cec-f07d-4aa9-a067-01456adf1717',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:29:09','2019-04-02 16:30:04',NULL),('17620f2e-6c57-4aa8-8c2b-5a39a9d8db73',NULL,NULL,NULL,NULL,'127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-31 14:44:51','2019-03-31 00:00:00',NULL),('189c3018-fe57-43dd-9364-36c11bdee742',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 14:05:40','2019-04-11 00:00:00',NULL),('1932009f-1b7a-4d69-8627-f3d3c2badf39',NULL,NULL,NULL,NULL,'127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-30 15:41:04','2019-04-30 15:41:07',NULL),('1cc2e789-8005-4c78-b28e-7aada6d38fa0',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:23:27','2019-04-12 17:24:30',NULL),('1d26300f-d8dc-41ea-afbd-9751ad7f23e6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:34:43','2019-04-12 11:33:04',NULL),('1d6312b3-c6bf-43d2-bd7f-f626ad390e08',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-10 14:26:33','2019-05-10 15:04:01',NULL),('1ee54526-46de-4b14-b94c-4d3edcc62c9b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 16:16:31','2019-04-12 16:19:30',NULL),('1f371f68-0fbd-4ac2-bbc6-51ae621d45bc',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-08 10:16:18','2019-05-08 10:52:23',NULL),('1ffc49e3-5be4-4b42-8fad-9e790cb965ef',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 16:08:45','2019-04-10 00:00:00',NULL),('266accdd-9ff0-4d73-b606-1edea2987763',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:54:43','2019-04-12 11:33:04',NULL),('286d18a8-cb31-4457-9a29-9d540104763d',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 11:02:56','2019-04-16 11:06:30',NULL),('29b89726-d49d-4477-ba79-3cc5acd53ed3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:07:49','2019-04-12 17:08:55',NULL),('2ceb967a-88de-4746-b08f-68fcb300a239',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-28 16:39:42','2019-03-28 00:00:00',NULL),('2f469323-634e-4d64-bb84-a3e817a91a32',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 11:26:53','2019-04-23 11:43:35',NULL),('3022d95a-1867-47db-810a-bd43cf892f82',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 12:17:55','2019-04-16 14:27:34',NULL),('3037f379-4807-4bf5-932f-9d5a93109b24',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:30:49','2019-04-02 16:40:00',NULL),('327d8c46-c350-428b-90d4-f5d8788a0718',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 12:16:00','2019-04-16 12:17:49',NULL),('36402970-652b-4fe0-a9f9-4e3d5a4f9e1c',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-10 16:30:47','2019-05-10 17:36:46',NULL),('37e1fd76-8dfe-4705-8c45-0519cc8a7eac',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 10:54:18','2019-04-12 11:33:04',NULL),('3ca5ec18-19b7-4c16-b290-ec68f249df24',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 10:56:53','2019-04-16 11:03:00',NULL),('3db6dfba-75a4-4865-a80d-8b34cc7ac45a',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-09 16:44:54','2019-05-10 09:38:21',NULL),('3e32d764-3ff2-4d04-932f-a2b0e06b2ee5',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:33:34','2019-04-12 11:33:04',NULL),('3ec3da2e-aa36-4a03-910a-002b7567a931',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:10:26','2019-04-02 00:00:00',NULL),('41d0d52c-0274-4bb4-b229-3cd4e21ab77c',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-07 17:43:07','2019-05-07 21:35:11',NULL),('42637986-1ad7-4a82-ba40-f784750a61f6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 15:29:44','2019-04-12 15:29:52',NULL),('427f6280-9a78-4199-ad1b-24c94d960139',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-30 15:06:53','2019-04-30 15:09:07',NULL),('4425d829-1100-4503-85fa-aa23913c76d3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 11:50:11','2019-04-23 11:52:21',NULL),('443a0aab-bb33-4474-b631-58e4d366a9cc',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:09:34','2019-04-02 16:20:00',NULL),('45614e8f-b242-4b35-b1db-80c140ccef5b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:25:59','2019-04-02 17:40:00',NULL),('47c9f328-475e-40a2-ba43-086a4d19d22e',2,'test',2,'科技部','172.29.30.231','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:59:59','2019-04-02 00:00:00',NULL),('4acb6458-4fce-4c90-a117-980821b7740f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 14:38:08','2019-04-23 14:46:42',NULL),('4bf96798-c8d0-4226-a7ac-6722c6453952',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:45:48','2019-04-12 11:33:04',NULL),('4d0668b8-7024-4cf5-970b-2d84b340ab8a',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-16 14:27:36','2019-04-16 14:30:30',NULL),('4d95dd3e-1d2e-4228-be14-ec46dfe70713',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:43:53','2019-04-02 17:50:00',NULL),('4f94c094-e98e-47e5-aaa3-5d65a1e89311',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:18:09','2019-04-12 17:18:30',NULL),('5064ce6f-2b33-4557-9513-6abaa1d07c21',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 14:46:45','2019-04-23 14:54:00',NULL),('5246eaa3-543c-4598-97bb-c4c55f5481e3',2,'test',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-16 12:19:14','2019-04-16 14:27:34',NULL),('527f2ee7-6bcf-4917-9286-2f1be3440888',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 16:00:42','2019-04-12 16:04:00',NULL),('53febc42-7bb9-45ca-969e-9f15cac6b563',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 11:02:49',NULL,NULL),('543984ac-c321-473b-a760-d69f6aab225b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 14:55:06','2019-04-12 15:29:38',NULL),('54dcfb52-b9e0-43c3-91a5-4e0e3979a851',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-10 15:04:05','2019-05-10 16:14:04',NULL),('552a3eb8-27ca-4ec2-a0e7-51b0ab436962',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:37:55','2019-04-12 11:33:04',NULL),('55472643-9d2a-4729-b2dc-6b67edb43345',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-29 09:41:14','2019-03-29 10:16:31',NULL),('56ae20de-afc6-4c25-9ee2-abbbeef0469b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:16:01','2019-04-12 17:16:30',NULL),('5bbe4044-4186-403c-aedc-a55237af9598',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 09:47:17','2019-04-11 00:00:00',NULL),('5f9d2893-47af-4565-bfbc-ee1e03430e8a',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:37:58','2019-04-02 17:50:00',NULL),('6083651e-72e1-4aeb-beab-859cfcfa96cb',2,'test',2,'科技部','192.168.40.201','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:28:34','2019-04-16 14:31:30',NULL),('60ca2e53-10db-4c48-9d86-242ef0a55af7',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:55:26','2019-04-12 11:33:04',NULL),('614b268e-0eec-415a-9bfe-fcb03faffae3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-28 18:16:22','2019-03-28 00:00:00',NULL),('62d2d736-3fb7-4631-be18-ae7951b4a6b8',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:39:33','2019-04-11 00:00:00',NULL),('647fac88-2ae5-4b04-b167-7ec64c7baf79',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:49:58','2019-04-12 11:33:04',NULL),('69e0555d-338f-459c-a7fc-3daed7a6b7b2',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:16:29','2019-04-12 17:18:30',NULL),('6af8dc84-4836-4c96-8171-f9c6c8a29956',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 15:38:35','2019-04-12 15:41:00',NULL),('6ca9af80-f1b1-4e4f-ad04-372773408347',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 10:55:59',NULL,NULL),('6ee897ac-1431-4240-8e1e-771107d935f5',2,'test',2,'科技部','172.29.30.231','未知地址','Chrome','Windows 7','off_line','2019-04-02 18:00:57','2019-04-12 11:33:04',NULL),('6f77beca-4af4-4fed-b49a-12eb8bd71cdc',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-30 16:29:54','2019-04-30 16:32:00',NULL),('6f7d7d4f-7d2a-4c00-a92c-6bdba79cb87f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 14:34:46','2019-04-12 14:38:35',NULL),('716532d3-33c1-4afe-a5a3-a535209b7d9d',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:24:47','2019-04-12 17:25:30',NULL),('76484780-a224-4e17-9d6f-44bc2657a245',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:47:26','2019-04-12 11:33:04',NULL),('7ccf1556-5224-4c64-adb2-0b7fa40a0836',1,'tayle',2,'科技部','127.0.0.1','未知地址','Unknown','Unknown','off_line','2019-04-30 16:51:14','2019-04-30 16:54:06',NULL),('802c4dfe-17aa-4f7c-ad74-833ead1a593b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 15:37:44','2019-04-02 15:40:00',NULL),('8477cba6-2b7f-4abb-af0e-4d5e59861845',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 14:31:38','2019-04-12 11:33:04',NULL),('84933620-8143-4008-8811-173fa338f0a6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:00:54','2019-04-02 17:10:00',NULL),('849d0e4a-e214-4635-8851-72d86a6dd4af',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 18:02:45','2019-04-12 11:33:04',NULL),('87f420e6-baaa-45c3-b5e5-aa7c6ca8c1e3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-10 09:45:05','2019-05-10 12:34:05',NULL),('8a947f9e-16c3-4784-b275-c1e142f5fb63',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 15:29:49','2019-04-12 15:38:34',NULL),('8b9f07cc-af12-4c17-b4c5-6ee1b054bcfe',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-07 17:19:29','2019-05-07 17:43:15',NULL),('8c3a3b01-da5c-4164-bcb0-10a061a0563f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Unknown','Unknown','off_line','2019-04-30 16:45:30','2019-04-30 16:51:13',NULL),('8f967584-fdcd-4078-bb8b-6e98c125f49b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 15:40:58','2019-04-12 15:54:03',NULL),('904fa083-5a8e-4ee8-a982-99fa69a05818',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:51:48','2019-04-12 11:33:04',NULL),('93a2b8a5-7946-43a8-9c86-2bb2f1b0a7c3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 15:23:04','2019-04-10 00:00:00',NULL),('94ff2f1c-2961-48cd-baf3-3667deb101e3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:36:31','2019-04-02 16:40:00',NULL),('958e53bd-55ee-453b-af43-90b7beafbb7f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:37:40','2019-04-02 16:50:00',NULL),('975e6aa5-564f-409b-b387-0dd25220050a',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 12:14:23','2019-04-16 12:15:55',NULL),('9808be7e-f934-43e7-ad8d-9faec52e6c36',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:41:33','2019-04-16 14:42:57',NULL),('996fd72b-93a0-4e7e-87b2-5c8ad4d8a2d6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 11:45:12','2019-04-16 11:55:00',NULL),('9a077d99-cd35-48f3-886b-23a019760b0c',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:42:54','2019-04-11 00:00:00',NULL),('9af92e20-d6e7-4d8f-9bdc-78e1811e7366',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 16:03:51','2019-04-12 16:15:24',NULL),('9b2fbbe6-74c9-47a4-ab51-93b3361b7843',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:34:40','2019-04-16 14:35:11',NULL),('9d1b504d-aaea-474b-9951-ef1025935ba2',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 10:56:28','2019-04-12 11:33:04',NULL),('9e178b0e-7c48-4471-a582-a9c10ec1d3ff',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-30 16:48:49','2019-04-30 16:54:06',NULL),('9e52f3c8-a899-48e5-b95d-d73052c9f853',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 14:08:43','2019-04-23 14:20:30',NULL),('a220d70a-682d-4f48-8c2c-e04734c79bff',2,'test',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 14:38:41','2019-04-12 14:45:30',NULL),('a48f9bcc-0ac9-4f03-b795-840778e06092',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:13:41','2019-04-02 17:30:00',NULL),('a81a0a4c-75b1-4225-9416-d8a42cfe5bd8',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 15:58:31','2019-04-12 16:00:40',NULL),('a8efee8f-0391-4ec5-9066-454fa587c9c3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:20:10','2019-04-02 16:30:04',NULL),('a9171622-b5fb-41fb-855c-fba2fb33e2a7',1,'tayle',2,'科技部','127.0.0.1','未知地址','Unknown','Unknown','off_line','2019-04-30 16:55:50','2019-04-30 16:58:00',NULL),('ade24461-9959-4e51-86ea-366d04c96ce9',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 11:47:08','2019-04-12 11:47:30',NULL),('b002376a-1d7e-4fc3-84be-f4190ed756dd',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:06:42','2019-04-12 17:08:00',NULL),('b049abd5-f51f-4923-ab00-5f298a4db3f2',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-28 15:17:43','2019-03-28 00:00:00',NULL),('b2c75d12-232c-44f3-9952-2c83ccdbe385',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 10:28:15','2019-04-10 00:00:00',NULL),('b2e74482-c22e-48ea-8939-a5aca2073967',1,'tayle',2,'科技部','192.168.40.201','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:41:54','2019-04-16 14:43:49',NULL),('bb7f6757-6add-4849-b4e9-e480b33d3b03',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 11:32:27','2019-04-12 11:47:08',NULL),('bb945205-7f51-4093-9f1a-7b32078782cf',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-10 17:36:48','2019-05-10 18:17:21',NULL),('c68976e6-af37-4316-a162-23e7db2ad39c',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-29 11:04:09','2019-04-29 11:09:00',NULL),('c7487e9f-a1ae-47e3-a234-3178f599d7f9',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:37:10','2019-04-11 00:00:00',NULL),('c759f538-ede2-433c-81e0-9fff73b13a02',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:18:58','2019-04-12 17:21:40',NULL),('ca49d771-bb4a-4d2f-9f1d-1d0b12c0285f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:14:07','2019-04-12 17:15:00',NULL),('cac278c9-cb44-4ced-9fc4-8b7fafebb00c',2,'test',2,'科技部','192.168.40.201','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:43:49','2019-04-16 14:45:39',NULL),('cc545ee2-c933-4ab7-872b-23dda55db541',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 16:19:27','2019-04-12 16:59:28',NULL),('ccaa6381-f37c-4d56-a44a-0a345902a41f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:24:28','2019-04-12 17:25:00',NULL),('cd337d8f-e0ed-4429-9798-ccb7e3fc30a6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 14:46:51','2019-04-12 14:55:00',NULL),('d1a12502-0fd6-4a8c-8d36-2f2be1bb49e3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 16:00:35','2019-04-12 11:33:04',NULL),('d5ac99a1-264f-4ca0-9f16-b3576f75e0df',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 15:29:52',NULL,NULL),('d5f59aae-9202-4659-867b-4d923a55f2e3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-05-08 11:42:21','2019-05-08 12:22:23',NULL),('d81a16b2-5655-488b-94fc-80855d1f6ffe',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 10:05:07','2019-04-12 11:33:04',NULL),('d83ed9ef-a1e0-43fb-b918-63c6062fc67e',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-28 17:21:50','2019-03-28 00:00:00',NULL),('da131a66-1567-4041-b6a6-461e98612669',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 11:29:13','2019-04-12 11:33:04',NULL),('dbd4dc5c-c022-4d26-8db1-7461d255d03d',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-18 10:46:16','2019-04-18 10:50:30',NULL),('deceed6c-e0a6-45a7-a31b-dad7c5ec30d2',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 15:07:06','2019-04-12 11:33:04',NULL),('e059f87d-602d-47a0-976b-b602f7dc25ac',2,'test',2,'科技部','172.29.30.231','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:38:40','2019-04-02 16:50:00',NULL),('e307e694-da73-46bc-b695-275b3af5c732',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:10:22','2019-04-12 17:11:28',NULL),('e7844a6c-bdc0-4603-a232-07e6cef4af3b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 12:07:10','2019-04-23 12:11:00',NULL),('e8af8d3a-1747-4a9f-80d4-f524d01ebbda',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:35:30','2019-04-02 16:40:00',NULL),('e8fd38b6-322f-40eb-8def-76594f9fd1ca',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:42:57','2019-04-16 14:45:30',NULL),('eb7f5e25-6945-4d8c-9223-9cab16a520a5',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:43:07','2019-04-12 11:33:04',NULL),('eb96c180-4803-4522-be71-2d0a1dd360a3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 15:54:08','2019-04-12 15:58:01',NULL),('ec3f377f-03d7-4a57-830f-a6601e31cbc7',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:40:26','2019-04-11 00:00:00',NULL),('ed888046-d7a3-41b0-b918-df5e1ffe4f7f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:35:15','2019-04-16 14:41:00',NULL),('eecab84d-25f7-4aac-aa31-85e4f8f648f7',2,'test',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:21:47','2019-04-12 17:23:30',NULL),('efa6e2d2-44ed-467d-9adc-6b45b23f00e7',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 14:30:37','2019-04-12 11:33:04',NULL),('f0708461-1176-4de9-8dbb-b2c34e5d75c8',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 11:25:03','2019-04-11 00:00:00',NULL),('f1acec23-976f-47f8-bd8d-0a75ef2bb2ae',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 15:07:41','2019-04-12 11:33:04',NULL),('f40347f8-699d-4fb7-bff9-13c7345bfcfd',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:06:44','2019-04-02 17:20:00',NULL),('f4fc51a5-39bf-49f7-a47d-b23362399ef6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-30 15:10:29','2019-04-30 15:17:22',NULL),('f517370f-6a40-44f4-a32d-2065900a14de',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:22:58','2019-04-02 16:30:04',NULL),('f7746320-3c1c-409a-b4f1-a997eb50d54b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:30:10','2019-04-16 14:33:00',NULL),('f7d4267a-2101-41b6-9d97-041c114dd85b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 11:52:19','2019-04-23 12:00:00',NULL),('f9989c1e-c774-481c-b886-52118a7b2fc2',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:03:56','2019-04-02 16:10:00',NULL),('fc134ba7-a6d2-4f22-9895-daa484d83161',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 18:08:26','2019-04-12 11:33:04',NULL),('fceb10ad-b042-4751-9ab2-b1961dbef400',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 14:38:51','2019-04-12 14:45:30',NULL),('fedae05a-3855-4c0a-aec3-23beb675621f',3,'哈哈',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 14:58:07','2019-04-12 15:29:38',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (78,1,1),(82,4,2),(85,2,2);
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

-- Dump completed on 2019-05-10 18:41:21
