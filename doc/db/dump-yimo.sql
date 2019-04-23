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
INSERT INTO `qrtz_fired_triggers` VALUES ('YiMoScheduler','NON_CLUSTERED1556001995799','trigger-WebLogJob','trigger-myCronJob','NON_CLUSTERED',1556002413074,1556002414000,5,'ACQUIRED',NULL,NULL,'0','0');
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
INSERT INTO `qrtz_triggers` VALUES ('YiMoScheduler','trigger-SyncOnlineStatusJob','trigger-myCronJob','SyncOnlineStatusJob','myCronJob',NULL,1556002440000,1556002410000,5,'WAITING','CRON',1555039980000,0,NULL,0,''),('YiMoScheduler','trigger-WebLogJob','trigger-myCronJob','WebLogJob','myCronJob',NULL,1556002414000,1556002413000,5,'ACQUIRED','CRON',1555396082000,0,NULL,0,''),('YiMoScheduler','trigger-WebSocketMessageJob','trigger-myCronJob','WebSocketMessageJob','myCronJob',NULL,1555555625000,1555555620000,5,'PAUSED','CRON',1554198281000,0,NULL,0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=2290 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1584,1,'沙漠骆驼','LOGIN',22,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-28 15:17:47','http://localhost/YiMo/login','认证操作','用户认证'),(1585,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-28 15:17:56','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1586,1,'沙漠骆驼','QUERY',22,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-28 15:17:57','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1587,1,'沙漠骆驼','LOGIN',61,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-28 16:39:47','http://localhost/YiMo/login','认证操作','用户认证'),(1588,1,'沙漠骆驼','QUERY',44,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-28 16:40:07','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1589,1,'沙漠骆驼','QUERY',77,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-28 16:40:10','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1590,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-28 17:21:51','http://localhost/YiMo/login','认证操作','用户认证'),(1591,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-28 18:16:24','http://localhost/YiMo/login','认证操作','用户认证'),(1592,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-28 18:16:27','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1593,1,'沙漠骆驼','FORCE',9,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-28 18:17:12','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(1594,1,'沙漠骆驼','FORCE',9,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-28 18:17:16','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(1595,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-28 18:17:25','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1596,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-29 09:41:15','http://localhost/YiMo/login','认证操作','用户认证'),(1597,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-29 09:41:26','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1598,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-29 09:41:27','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1599,1,'沙漠骆驼','QUERY',41,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-29 09:41:29','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1600,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-29 09:41:30','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(1601,1,'沙漠骆驼','LOGIN',25,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 15:37:46','http://localhost/YiMo/login','认证操作','用户认证'),(1602,1,'沙漠骆驼','LOGIN',19,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:02:16','http://localhost/YiMo/login','认证操作','用户认证'),(1603,1,'沙漠骆驼','LOGIN',174,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:03:57','http://localhost/YiMo/login','认证操作','用户认证'),(1604,1,'沙漠骆驼','LOGIN',18,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:04:31','http://localhost/YiMo/login','认证操作','用户认证'),(1605,1,'沙漠骆驼','LOGIN',36,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:09:38','http://localhost/YiMo/login','认证操作','用户认证'),(1606,1,'沙漠骆驼','LOGIN',45,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:10:27','http://localhost/YiMo/login','认证操作','用户认证'),(1607,NULL,NULL,'LOGOUT',33,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:20:07','http://localhost/YiMo/logout','系统退出','用户认证'),(1608,1,'沙漠骆驼','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:20:10','http://localhost/YiMo/login','认证操作','用户认证'),(1609,1,'沙漠骆驼','LOGIN',24,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:23:03','http://localhost/YiMo/login','认证操作','用户认证'),(1610,1,'沙漠骆驼','LOGIN',21,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:26:40','http://localhost/YiMo/login','认证操作','用户认证'),(1611,1,'沙漠骆驼','LOGIN',16,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:29:16','http://localhost/YiMo/login','认证操作','用户认证'),(1612,1,'沙漠骆驼','LOGIN',24,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:30:51','http://localhost/YiMo/login','认证操作','用户认证'),(1613,1,'沙漠骆驼','LOGIN',15,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:35:33','http://localhost/YiMo/login','认证操作','用户认证'),(1614,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:36:35','http://localhost/YiMo/login','认证操作','用户认证'),(1615,1,'沙漠骆驼','LOGIN',15,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 16:37:44','http://localhost/YiMo/login','认证操作','用户认证'),(1616,2,'测试用户','LOGIN',18,'top.yimo.common.controller.AuthController.doLogin',NULL,'172.29.30.231','2019-04-02 16:38:46','http://172.29.30.233/YiMo/login','认证操作','用户认证'),(1617,1,'沙漠骆驼','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:00:55','http://localhost/YiMo/login','认证操作','用户认证'),(1618,1,'沙漠骆驼','LOGIN',17,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:06:52','http://localhost/YiMo/login','认证操作','用户认证'),(1619,1,'沙漠骆驼','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-02 17:13:43','http://localhost/YiMo/login','认证操作','用户认证'),(1620,1,'沙漠骆驼','QUERY',67,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:13:49','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1621,1,'沙漠骆驼','DELETE',36,'top.yimo.sys.controller.JobController.save',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:18:08','http://localhost/YiMo/sys/job/save','新增','定时任务调度表'),(1622,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:18:08','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1623,1,'沙漠骆驼','UPDATE',165,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:19:44','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1624,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:19:45','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1625,1,'沙漠骆驼','LOGIN',97,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:26:01','http://localhost/YiMo/login','认证操作','用户认证'),(1626,1,'沙漠骆驼','QUERY',42,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:26:05','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1627,1,'沙漠骆驼','UPDATE',38,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:26:16','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1628,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:26:16','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1629,1,'沙漠骆驼','UPDATE',58,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:26:19','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1630,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:26:19','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1631,1,'沙漠骆驼','UPDATE',40,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:27:47','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1632,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:27:47','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1633,1,'沙漠骆驼','DELETE',52,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:28:41','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1634,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:28:41','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1635,1,'沙漠骆驼','UPDATE',60,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:28:44','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1636,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:28:44','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1637,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:29:50','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1638,1,'沙漠骆驼','UPDATE',31,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:29:52','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1639,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:29:52','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1640,1,'沙漠骆驼','UPDATE',38,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:29:55','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1641,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:29:55','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1642,1,'沙漠骆驼','UPDATE',25,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:30:35','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1643,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:30:35','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1644,1,'沙漠骆驼','UPDATE',38,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:30:40','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1645,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:30:40','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1646,1,'沙漠骆驼','UPDATE',45,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:30:50','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1647,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:30:50','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1648,1,'沙漠骆驼','DELETE',48,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:30:55','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1649,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:30:55','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1650,1,'沙漠骆驼','UPDATE',31,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:31:01','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1651,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:31:01','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1652,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:36:57','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1653,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:37:59','http://localhost/YiMo/login','认证操作','用户认证'),(1654,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:38:03','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1655,1,'沙漠骆驼','UPDATE',58,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:38:28','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1656,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:38:28','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1657,1,'沙漠骆驼','DELETE',156,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:38:52','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1658,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:38:52','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1659,1,'沙漠骆驼','DELETE',42,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:39:01','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1660,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:39:01','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1661,1,'沙漠骆驼','UPDATE',186,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:39:05','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1662,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:39:05','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1663,1,'沙漠骆驼','UPDATE',56,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:39:21','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1664,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:39:21','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1665,1,'沙漠骆驼','DELETE',86,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:39:31','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1666,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:39:31','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1667,1,'沙漠骆驼','UPDATE',26,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:39:33','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1668,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:39:33','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1669,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:40:02','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1670,1,'沙漠骆驼','UPDATE',33,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:40:54','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1671,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:40:54','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1672,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:41:01','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1673,1,'沙漠骆驼','LOGIN',56,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:44:06','http://localhost/YiMo/login','认证操作','用户认证'),(1674,1,'沙漠骆驼','QUERY',45,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:44:09','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1675,1,'沙漠骆驼','UPDATE',53,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:44:10','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1676,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:44:11','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1677,1,'沙漠骆驼','DELETE',136,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:44:31','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1678,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:44:31','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1679,1,'沙漠骆驼','DELETE',132,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:44:41','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1680,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:44:41','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1681,1,'沙漠骆驼','UPDATE',38,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:44:43','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1682,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:44:43','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1683,1,'沙漠骆驼','UPDATE',30,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:45:14','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1684,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:45:14','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1685,1,'沙漠骆驼','LOGIN',15,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:58:30','http://localhost/YiMo/login','认证操作','用户认证'),(1686,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:58:33','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1687,1,'沙漠骆驼','UPDATE',141,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:58:46','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1688,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 17:58:46','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1689,2,'测试用户','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'172.29.30.231','2019-04-02 18:00:03','http://172.29.30.233/YiMo/login','认证操作','用户认证'),(1690,NULL,NULL,'LOGOUT',25,'top.yimo.common.controller.AuthController.logout',NULL,'172.29.30.231','2019-04-02 18:00:49','http://172.29.30.233/YiMo/logout','系统退出','用户认证'),(1691,2,'测试用户','LOGIN',17,'top.yimo.common.controller.AuthController.doLogin',NULL,'172.29.30.231','2019-04-02 18:00:57','http://172.29.30.233/YiMo/login','认证操作','用户认证'),(1692,1,'沙漠骆驼','UPDATE',33,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-04-02 18:02:53','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1693,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 18:02:53','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1694,1,'沙漠骆驼','UPDATE',20,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-04-02 18:03:01','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1695,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-02 18:03:01','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1696,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-02 18:08:27','http://localhost/YiMo/login','认证操作','用户认证'),(1697,1,'沙漠骆驼','LOGIN',228,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-10 10:28:17','http://localhost/YiMo/login','认证操作','用户认证'),(1698,1,'沙漠骆驼','QUERY',43,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-10 10:28:21','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1699,NULL,NULL,'LOGOUT',48,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-04-10 10:28:37','http://localhost/YiMo/logout','系统退出','用户认证'),(1700,1,'沙漠骆驼','LOGIN',16,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-10 14:30:39','http://localhost/YiMo/login','认证操作','用户认证'),(1701,1,'沙漠骆驼','QUERY',33,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-10 14:30:42','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1702,1,'沙漠骆驼','LOGIN',18,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-10 14:31:39','http://localhost/YiMo/login','认证操作','用户认证'),(1703,1,'沙漠骆驼','QUERY',33,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-10 14:31:42','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1704,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-10 15:07:08','http://localhost/YiMo/login','认证操作','用户认证'),(1705,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.RoleController.listByPage',NULL,'127.0.0.1','2019-04-10 15:07:10','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1706,1,'沙漠骆驼','QUERY',25,'top.yimo.sys.controller.UserController.listByPage',NULL,'127.0.0.1','2019-04-10 15:07:12','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1707,1,'沙漠骆驼','LOGIN',19,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-10 15:07:42','http://localhost/YiMo/login','认证操作','用户认证'),(1708,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-10 15:07:45','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1709,1,'沙漠骆驼','QUERY',20,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-10 15:07:46','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1710,1,'沙漠骆驼','LOGIN',48,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-10 15:23:06','http://localhost/YiMo/login','认证操作','用户认证'),(1711,1,'沙漠骆驼','QUERY',93,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-10 15:23:09','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1712,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-10 16:00:36','http://localhost/YiMo/login','认证操作','用户认证'),(1713,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-10 16:00:39','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1714,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-10 16:00:41','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1715,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-10 16:08:46','http://localhost/YiMo/login','认证操作','用户认证'),(1716,1,'沙漠骆驼','QUERY',31,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-10 16:08:48','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1717,1,'沙漠骆驼','LOGIN',32,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-10 18:02:46','http://localhost/YiMo/login','认证操作','用户认证'),(1718,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-10 18:06:50','http://localhost/YiMo/login','认证操作','用户认证'),(1719,1,'沙漠骆驼','LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 09:47:26','http://localhost/YiMo/login','认证操作','用户认证'),(1720,1,'沙漠骆驼','QUERY',31,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 09:47:31','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1721,1,'沙漠骆驼','LOGIN',47,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 11:25:11','http://localhost/YiMo/login','认证操作','用户认证'),(1722,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 14:05:41','http://localhost/YiMo/login','认证操作','用户认证'),(1723,1,'沙漠骆驼','LOGIN',19,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:37:57','http://localhost/YiMo/login','认证操作','用户认证'),(1724,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:45:51','http://localhost/YiMo/login','认证操作','用户认证'),(1725,1,'沙漠骆驼','LOGIN',15,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:47:27','http://localhost/YiMo/login','认证操作','用户认证'),(1726,1,'沙漠骆驼','LOGIN',49,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:50:00','http://localhost/YiMo/login','认证操作','用户认证'),(1727,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:51:49','http://localhost/YiMo/login','认证操作','用户认证'),(1728,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:52:39','http://localhost/YiMo/login','认证操作','用户认证'),(1729,1,'沙漠骆驼','LOGIN',49,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:54:44','http://localhost/YiMo/login','认证操作','用户认证'),(1730,1,'沙漠骆驼','QUERY',56,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:54:47','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1731,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:55:29','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1732,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:55:31','http://localhost/YiMo/sys/dictData/list/Status','获取数据字典数据表列表','数据字典数据表'),(1733,1,'沙漠骆驼','QUERY',4,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:58:28','http://localhost/YiMo/sys/dictData/list/Status','获取数据字典数据表列表','数据字典数据表'),(1734,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 16:58:40','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1735,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:00:09','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1736,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:00:12','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1737,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:00:15','http://localhost/YiMo/sys/dictData/list/Status','获取数据字典数据表列表','数据字典数据表'),(1738,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:00:30','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1739,1,'沙漠骆驼','QUERY',24,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:01:35','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1740,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:01:46','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1741,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:01:53','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1742,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:23:17','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1743,1,'沙漠骆驼','QUERY',3,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:23:22','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(1744,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:23:24','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1745,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:23:25','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1746,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:23:26','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1747,1,'沙漠骆驼','QUERY',4,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:26:07','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1748,1,'沙漠骆驼','QUERY',3,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:27:45','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1749,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:27:48','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1750,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:27:51','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1751,1,'沙漠骆驼','QUERY',4,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:28:19','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1752,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:28:20','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1753,1,'沙漠骆驼','QUERY',3,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:28:21','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1754,1,'沙漠骆驼','QUERY',4,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:28:47','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1755,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:29:32','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1756,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:29:41','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1757,1,'沙漠骆驼','QUERY',39,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:29:43','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1758,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:29:44','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1759,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:29:44','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1760,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:29:45','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1761,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:29:46','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1762,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:29:46','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1763,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:29:50','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1764,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:29:53','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1765,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:29:58','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1766,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:30:01','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1767,1,'沙漠骆驼','QUERY',23,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:30:03','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1768,1,'沙漠骆驼','QUERY',4,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:30:04','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1769,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:31:07','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1770,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:31:08','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1771,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:31:11','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1772,1,'沙漠骆驼','LOGIN',16,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:33:35','http://localhost/YiMo/login','认证操作','用户认证'),(1773,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:33:38','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1774,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:33:42','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1775,1,'沙漠骆驼','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:34:44','http://localhost/YiMo/login','认证操作','用户认证'),(1776,1,'沙漠骆驼','LOGIN',24,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:37:11','http://localhost/YiMo/login','认证操作','用户认证'),(1777,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:37:15','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1778,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:37:19','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1779,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:37:22','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1780,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:37:25','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1781,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:38:43','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1782,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:38:44','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1783,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:38:45','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1784,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:38:46','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1785,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:38:46','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1786,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:38:50','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1787,NULL,NULL,'LOGOUT',24,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:38:52','http://localhost/YiMo/logout','系统退出','用户认证'),(1788,NULL,NULL,'LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:38:54','http://localhost/YiMo/login','认证操作','用户认证'),(1789,NULL,NULL,'LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:38:57','http://localhost/YiMo/login','认证操作','用户认证'),(1790,1,'沙漠骆驼','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:39:32','http://localhost/YiMo/login','认证操作','用户认证'),(1791,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:39:36','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1792,1,'沙漠骆驼','resetPwd',30,'top.yimo.sys.controller.UserController.resetPwd',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:39:39','http://localhost/YiMo/sys/user/resetPwd/1','提交重置用户密码','/sys/user'),(1793,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:39:39','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1794,1,'沙漠骆驼','resetPwd',34,'top.yimo.sys.controller.UserController.resetPwd',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:39:42','http://localhost/YiMo/sys/user/resetPwd/1','提交重置用户密码','/sys/user'),(1795,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:39:42','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1796,NULL,NULL,'LOGOUT',31,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:39:46','http://localhost/YiMo/logout','系统退出','用户认证'),(1797,NULL,NULL,'LOGIN',3,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:39:47','http://localhost/YiMo/login','认证操作','用户认证'),(1798,1,'沙漠骆驼','LOGIN',3,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:40:26','http://localhost/YiMo/login','认证操作','用户认证'),(1799,NULL,NULL,'LOGOUT',26,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:40:29','http://localhost/YiMo/logout','系统退出','用户认证'),(1800,NULL,NULL,'LOGIN',3,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:40:30','http://localhost/YiMo/login','认证操作','用户认证'),(1801,NULL,NULL,'LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:41:04','http://localhost/YiMo/login','认证操作','用户认证'),(1802,NULL,NULL,'LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:04','http://localhost/YiMo/login','认证操作','用户认证'),(1803,NULL,NULL,'LOGIN',0,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:05','http://localhost/YiMo/login','认证操作','用户认证'),(1804,NULL,NULL,'LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:05','http://localhost/YiMo/login','认证操作','用户认证'),(1805,NULL,NULL,'LOGIN',3,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:05','http://localhost/YiMo/login','认证操作','用户认证'),(1806,NULL,NULL,'LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:05','http://localhost/YiMo/login','认证操作','用户认证'),(1807,NULL,NULL,'LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:06','http://localhost/YiMo/login','认证操作','用户认证'),(1808,NULL,NULL,'LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:06','http://localhost/YiMo/login','认证操作','用户认证'),(1809,NULL,NULL,'LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:13','http://localhost/YiMo/login','认证操作','用户认证'),(1810,NULL,NULL,'LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:13','http://localhost/YiMo/login','认证操作','用户认证'),(1811,NULL,NULL,'LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:14','http://localhost/YiMo/login','认证操作','用户认证'),(1812,NULL,NULL,'LOGIN',3,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:14','http://localhost/YiMo/login','认证操作','用户认证'),(1813,NULL,NULL,'LOGIN',16,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:16','http://localhost/YiMo/login','认证操作','用户认证'),(1814,NULL,NULL,'LOGIN',17,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:41:16','http://localhost/YiMo/login','认证操作','用户认证'),(1815,NULL,NULL,'LOGIN',17,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:16','http://localhost/YiMo/login','认证操作','用户认证'),(1816,NULL,NULL,'LOGIN',19,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:16','http://localhost/YiMo/login','认证操作','用户认证'),(1817,NULL,NULL,'LOGIN',24,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:16','http://localhost/YiMo/login','认证操作','用户认证'),(1818,NULL,NULL,'LOGIN',4,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:17','http://localhost/YiMo/login','认证操作','用户认证'),(1819,NULL,NULL,'LOGIN',4,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:17','http://localhost/YiMo/login','认证操作','用户认证'),(1820,NULL,NULL,'LOGIN',3,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:17','http://localhost/YiMo/login','认证操作','用户认证'),(1821,NULL,NULL,'LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:17','http://localhost/YiMo/login','认证操作','用户认证'),(1822,NULL,NULL,'LOGIN',3,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:17','http://localhost/YiMo/login','认证操作','用户认证'),(1823,NULL,NULL,'LOGIN',3,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:18','http://localhost/YiMo/login','认证操作','用户认证'),(1824,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'127.0.0.1','2019-04-11 17:41:59','http://localhost/YiMo/login','认证操作','用户认证'),(1825,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserController.listByPage',NULL,'127.0.0.1','2019-04-11 17:42:06','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1826,NULL,NULL,'LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:42:55','http://localhost/YiMo/login','认证操作','用户认证'),(1827,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:42:58','http://localhost/YiMo/login','认证操作','用户认证'),(1828,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:43:00','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1829,1,'沙漠骆驼','resetPwd',18,'top.yimo.sys.controller.UserController.resetPwd',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:43:02','http://localhost/YiMo/sys/user/resetPwd/1','提交重置用户密码','/sys/user'),(1830,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:43:02','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1831,NULL,NULL,'LOGOUT',50,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:43:05','http://localhost/YiMo/logout','系统退出','用户认证'),(1832,1,'沙漠骆驼','LOGIN',4,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:43:07','http://localhost/YiMo/login','认证操作','用户认证'),(1833,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-11 17:43:10','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1834,NULL,NULL,'LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:05:08','http://localhost/YiMo/login','认证操作','用户认证'),(1835,NULL,NULL,'LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:05:23','http://localhost/YiMo/login','认证操作','用户认证'),(1836,1,'沙漠骆驼','LOGIN',4,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:05:34','http://localhost/YiMo/login','认证操作','用户认证'),(1837,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:05:41','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1838,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:05:50','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1839,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:05:53','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1840,1,'沙漠骆驼','QUERY',23,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:05:53','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1841,1,'沙漠骆驼','QUERY',4,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:06:03','http://localhost/YiMo/sys/dictData/list/Status','获取数据字典数据表列表','数据字典数据表'),(1842,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:06:07','http://localhost/YiMo/sys/dictData/list/Status','获取数据字典数据表列表','数据字典数据表'),(1843,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:06:18','http://localhost/YiMo/sys/dictData/list/Status','获取数据字典数据表列表','数据字典数据表'),(1844,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:06:22','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1845,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:06:24','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1846,NULL,NULL,'LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:54:19','http://localhost/YiMo/login','认证操作','用户认证'),(1847,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:54:27','http://localhost/YiMo/login','认证操作','用户认证'),(1848,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:54:30','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1849,1,'沙漠骆驼','QUERY',25,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:54:32','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1850,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:54:45','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1851,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:54:47','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1852,1,'沙漠骆驼','QUERY',20,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:54:50','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1853,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:54:53','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1854,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:55:27','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1855,1,'沙漠骆驼','LOGIN',81,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:56:01','http://localhost/YiMo/login','认证操作','用户认证'),(1856,1,'沙漠骆驼','QUERY',75,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:56:06','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1857,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:56:29','http://localhost/YiMo/login','认证操作','用户认证'),(1858,1,'沙漠骆驼','QUERY',26,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:56:32','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1859,1,'沙漠骆驼','QUERY',24,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:57:17','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1860,1,'沙漠骆驼','QUERY',20,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:58:27','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1861,1,'沙漠骆驼','QUERY',25,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:58:34','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1862,1,'沙漠骆驼','QUERY',23,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:59:16','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1863,1,'沙漠骆驼','QUERY',25,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 10:59:36','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1864,1,'沙漠骆驼','QUERY',22,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:00:30','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1865,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:00:42','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1866,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:02:50','http://localhost/YiMo/login','认证操作','用户认证'),(1867,1,'沙漠骆驼','QUERY',36,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:02:52','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1868,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:03:54','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1869,1,'沙漠骆驼','QUERY',23,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:04:41','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1870,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:06:07','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1871,1,'沙漠骆驼','QUERY',23,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:07:17','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1872,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:07:57','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1873,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:08:41','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1874,1,'沙漠骆驼','QUERY',23,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:09:02','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1875,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:09:03','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1876,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:09:04','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1877,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:09:07','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1878,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:09:20','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1879,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:09:40','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1880,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:09:42','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1881,1,'沙漠骆驼','QUERY',20,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:10:21','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1882,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:11:53','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1883,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:12:16','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1884,1,'沙漠骆驼','QUERY',22,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:12:36','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1885,1,'沙漠骆驼','QUERY',29,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:12:52','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1886,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:13:10','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1887,1,'沙漠骆驼','QUERY',34,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:18:44','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1888,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:19:07','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1889,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:20:56','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1890,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:21:53','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1891,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:23:13','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1892,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:24:10','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1893,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:24:25','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1894,1,'沙漠骆驼','QUERY',20,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:24:27','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1895,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:25:02','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1896,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:25:03','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1897,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:26:04','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1898,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:26:43','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1899,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:26:48','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1900,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:27:51','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1901,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:27:53','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1902,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:27:54','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1903,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:27:55','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1904,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:27:55','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1905,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:27:58','http://localhost/YiMo/sys/dictData/list/OnlineStatus','获取数据字典数据表列表','数据字典数据表'),(1906,1,'沙漠骆驼','QUERY',41,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:28:09','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1907,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:28:10','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1908,1,'沙漠骆驼','LOGIN',4,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:29:15','http://localhost/YiMo/login','认证操作','用户认证'),(1909,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:29:18','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1910,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:29:33','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1911,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:29:34','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1912,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:29:35','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1913,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:29:38','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(1914,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:29:58','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1915,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:32:28','http://localhost/YiMo/login','认证操作','用户认证'),(1916,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:32:31','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1917,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:32:42','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1918,1,'沙漠骆驼','QUERY',4,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:32:43','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1919,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:32:44','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1920,1,'沙漠骆驼','QUERY',35,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:32:45','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1921,1,'沙漠骆驼','DELETE',407,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:00','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1922,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:00','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1923,1,'沙漠骆驼','UPDATE',174,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:04','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1924,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:04','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1925,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:09','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1926,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:13','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1927,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:19','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1928,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:20','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1929,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:21','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1930,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:23','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1931,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:24','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1932,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:25','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1933,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:25','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1934,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:27','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1935,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:28','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1936,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:33','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1937,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:42','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1938,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:48','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1939,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:33:50','http://localhost/YiMo/sys/dictData/list/Sex','获取数据字典数据表列表','数据字典数据表'),(1940,1,'沙漠骆驼','QUERY',3,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:34:06','http://localhost/YiMo/sys/dictData/list/Sex','获取数据字典数据表列表','数据字典数据表'),(1941,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:34:17','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1942,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:36:19','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1943,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:36:21','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(1944,1,'沙漠骆驼','QUERY',5,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:36:32','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1945,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:36:35','http://localhost/YiMo/sys/dictData/list/Sex','获取数据字典数据表列表','数据字典数据表'),(1946,1,'沙漠骆驼','QUERY',3,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:36:45','http://localhost/YiMo/sys/dictData/list/OnlineStatus','获取数据字典数据表列表','数据字典数据表'),(1947,1,'沙漠骆驼','QUERY',3,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:38:21','http://localhost/YiMo/sys/dictData/list/OnlineStatus','获取数据字典数据表列表','数据字典数据表'),(1948,1,'沙漠骆驼','QUERY',3,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:38:33','http://localhost/YiMo/sys/dictData/list/OnlineStatus','获取数据字典数据表列表','数据字典数据表'),(1949,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:43:39','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1950,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:43:47','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1951,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:47:09','http://localhost/YiMo/login','认证操作','用户认证'),(1952,1,'沙漠骆驼','QUERY',33,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 11:47:12','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1953,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:30:50','http://localhost/YiMo/login','认证操作','用户认证'),(1954,1,'沙漠骆驼','QUERY',69,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:31:01','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1955,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:31:10','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1956,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:33:20','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1957,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:34:47','http://localhost/YiMo/login','认证操作','用户认证'),(1958,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:34:50','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1959,NULL,NULL,'LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:36:06','http://localhost/YiMo/login','认证操作','用户认证'),(1960,NULL,NULL,'LOGIN',3,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:36:15','http://localhost/YiMo/login','认证操作','用户认证'),(1961,NULL,NULL,'LOGIN',1,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:36:18','http://localhost/YiMo/login','认证操作','用户认证'),(1962,NULL,NULL,'LOGIN',3,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:36:29','http://localhost/YiMo/login','认证操作','用户认证'),(1963,NULL,NULL,'LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:36:41','http://localhost/YiMo/login','认证操作','用户认证'),(1964,NULL,NULL,'LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:38:10','http://localhost/YiMo/login','认证操作','用户认证'),(1965,2,'测试用户','LOGIN',32,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:38:41','http://localhost/YiMo/login','认证操作','用户认证'),(1966,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:38:53','http://localhost/YiMo/login','认证操作','用户认证'),(1967,1,'沙漠骆驼','QUERY',63,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:38:55','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1968,2,'测试用户','QUERY',7,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:39:02','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1969,2,'测试用户','QUERY',19,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:39:07','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1970,2,'测试用户','QUERY',9,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:39:09','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(1971,2,'测试用户','QUERY',30,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:39:10','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1972,2,'测试用户','QUERY',12,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:39:12','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1973,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:39:42','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1974,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:39:43','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(1975,1,'沙漠骆驼','QUERY',3,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:40:03','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1976,NULL,NULL,'LOGIN',19,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:40:56','http://localhost/YiMo/login','认证操作','用户认证'),(1977,NULL,NULL,'LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:41:05','http://localhost/YiMo/login','认证操作','用户认证'),(1978,1,'沙漠骆驼','LOGIN',19,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:45:40','http://localhost/YiMo/login','认证操作','用户认证'),(1979,1,'沙漠骆驼','QUERY',56,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:46:01','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1980,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:46:05','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(1981,1,'沙漠骆驼','QUERY',2,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:46:08','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1982,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:46:16','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1983,1,'沙漠骆驼','QUERY',29,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:46:19','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1984,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:46:24','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1985,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:46:30','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1986,1,'沙漠骆驼','FORCE',6,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:46:33','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(1987,1,'沙漠骆驼','FORCE',8,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:46:37','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(1988,1,'沙漠骆驼','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:46:51','http://localhost/YiMo/login','认证操作','用户认证'),(1989,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:46:54','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1990,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:47:34','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1991,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:48:11','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1992,1,'沙漠骆驼','QUERY',2,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:48:41','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1993,1,'沙漠骆驼','QUERY',2,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:48:43','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(1994,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:48:44','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1995,NULL,NULL,'LOGIN',23,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:54:32','http://localhost/YiMo/login','认证操作','用户认证'),(1996,NULL,NULL,'LOGIN',2,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:54:33','http://localhost/YiMo/login','认证操作','用户认证'),(1997,1,'一墨大侠','LOGIN',31,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:55:06','http://localhost/YiMo/login','认证操作','用户认证'),(1998,1,'一墨大侠','QUERY',89,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:55:12','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1999,1,'一墨大侠','QUERY',34,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:55:50','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2000,3,'呵呵','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:58:19','http://localhost/YiMo/login','认证操作','用户认证'),(2001,1,'一墨大侠','QUERY',22,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:58:55','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2002,1,'一墨大侠','QUERY',15,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 14:59:10','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2003,NULL,NULL,'LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:02:22','http://localhost/YiMo/login','认证操作','用户认证'),(2004,NULL,NULL,'LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:21:26','http://localhost/YiMo/login','认证操作','用户认证'),(2005,NULL,NULL,'LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:25:53','http://localhost/YiMo/login','认证操作','用户认证'),(2006,NULL,NULL,'LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:29:02','http://localhost/YiMo/login','认证操作','用户认证'),(2007,NULL,NULL,'LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:29:05','http://localhost/YiMo/login','认证操作','用户认证'),(2008,1,'一墨大侠','LOGIN',36,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:29:44','http://localhost/YiMo/login','认证操作','用户认证'),(2009,1,'一墨大侠','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:29:49','http://localhost/YiMo/login','认证操作','用户认证'),(2010,1,'一墨大侠','LOGIN',4,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:29:54','http://localhost/YiMo/login','认证操作','用户认证'),(2011,1,'一墨大侠','QUERY',53,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:35:57','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2012,1,'一墨大侠','QUERY',26,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:37:41','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2013,1,'一墨大侠修改','LOGIN',4,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:38:36','http://localhost/YiMo/login','认证操作','用户认证'),(2014,1,'一墨大侠修改','QUERY',20,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:38:40','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2015,1,'一墨大侠修改','QUERY',22,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:38:48','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2016,1,'一墨大侠再次修改后','LOGIN',174,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:40:59','http://localhost/YiMo/login','认证操作','用户认证'),(2017,1,'一墨大侠再次修改后','QUERY',186,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:41:03','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2018,1,'一墨大侠再次修改后','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:41:08','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2019,1,'一墨大侠再次修改后','QUERY',15,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:41:16','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2020,1,'一墨大侠再次修改后','QUERY',24,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:41:47','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2021,1,'一墨大侠再次修改后','QUERY',14,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:42:02','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2022,1,'一墨大侠再次修改后','QUERY',23,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:42:06','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2023,1,'一墨大侠再次修改后','QUERY',24,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:42:12','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2024,NULL,NULL,'LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:43:16','http://localhost/YiMo/login','认证操作','用户认证'),(2025,NULL,NULL,'LOGIN',2,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:43:17','http://localhost/YiMo/login','认证操作','用户认证'),(2026,NULL,NULL,'LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:44:24','http://localhost/YiMo/login','认证操作','用户认证'),(2027,NULL,NULL,'LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:48:57','http://localhost/YiMo/login','认证操作','用户认证'),(2028,NULL,NULL,'LOGIN',2,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:48:59','http://localhost/YiMo/login','认证操作','用户认证'),(2029,NULL,NULL,'LOGIN',4,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:49:00','http://localhost/YiMo/login','认证操作','用户认证'),(2030,NULL,NULL,'LOGIN',15,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:49:03','http://localhost/YiMo/login','认证操作','用户认证'),(2031,NULL,NULL,'LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:49:03','http://localhost/YiMo/login','认证操作','用户认证'),(2032,NULL,NULL,'LOGIN',4,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:49:04','http://localhost/YiMo/login','认证操作','用户认证'),(2033,NULL,NULL,'LOGIN',2,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:49:05','http://localhost/YiMo/login','认证操作','用户认证'),(2034,NULL,NULL,'LOGIN',2,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:49:13','http://localhost/YiMo/login','认证操作','用户认证'),(2035,1,'一墨大侠再次修改后','LOGIN',67,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:54:10','http://localhost/YiMo/login','认证操作','用户认证'),(2036,1,'一墨大侠再次修改后','QUERY',81,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:54:13','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2037,1,'一墨大侠','QUERY',27,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:54:19','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2038,1,'一墨大侠','QUERY',1,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:54:38','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2039,1,'一墨大侠修改','QUERY',19,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-12 15:54:47','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2250,1,'一墨大侠修改','QUERY',40,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-18 10:47:43','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2251,1,'一墨大侠修改','QUERY',23,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-18 10:47:47','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2252,1,'一墨大侠修改','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-18 10:47:52','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2253,1,'一墨大侠修改','QUERY',17,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-18 10:47:53','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2254,1,'一墨大侠修改','QUERY',13,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-18 10:47:56','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2255,1,'一墨大侠修改','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-18 10:47:57','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2256,1,'一墨大侠修改','QUERY',10,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-18 10:47:59','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2257,1,'一墨大侠修改','QUERY',12,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-18 10:47:59','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2258,1,'一墨大侠修改','QUERY',14,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-18 10:48:00','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2259,1,'一墨大侠修改','QUERY',16,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-18 10:48:04','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2260,1,'一墨大侠修改','QUERY',20,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-18 10:48:07','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2261,1,'一墨大侠修改','LOGIN',101,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 11:27:24','http://localhost/YiMo/login','认证操作','用户认证'),(2262,1,'一墨大侠修改','QUERY',64,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-23 11:30:57','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(2263,1,'一墨大侠修改','QUERY',13,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-23 11:31:00','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(2264,1,'一墨大侠修改','QUERY',34,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-23 11:31:02','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2265,1,'一墨大侠修改','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 11:50:14','http://localhost/YiMo/login','认证操作','用户认证'),(2266,1,'一墨大侠修改','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 11:50:22','http://localhost/YiMo/login','认证操作','用户认证'),(2267,1,'一墨大侠修改','LOGIN',22,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 11:52:36','http://localhost/YiMo/login','认证操作','用户认证'),(2268,1,'一墨大侠修改','UPDATE',12,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-04-23 11:54:50','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(2269,1,'一墨大侠修改','LOGIN',41,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 12:07:18','http://localhost/YiMo/login','认证操作','用户认证'),(2270,1,'一墨大侠修改','QUERY',212,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-23 12:07:28','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(2271,1,'一墨大侠修改','INSERT',56,'top.yimo.sys.controller.MenuController.save',NULL,'0:0:0:0:0:0:0:1','2019-04-23 12:08:05','http://localhost/YiMo//sys/menu//save','新增保存','菜单管理'),(2272,1,'一墨大侠修改','QUERY',13,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-23 12:08:05','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(2273,1,'一墨大侠修改','UPDATE',62,'top.yimo.sys.controller.MenuController.update',NULL,'0:0:0:0:0:0:0:1','2019-04-23 12:08:15','http://localhost/YiMo//sys/menu//update','更新保存','菜单管理'),(2274,1,'一墨大侠修改','QUERY',16,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-23 12:08:15','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(2275,1,'一墨大侠修改','QUERY',13,'top.yimo.sys.controller.RoleController.listByPage',NULL,'127.0.0.1','2019-04-23 12:08:17','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(2276,1,'一墨大侠修改','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:08:47','http://localhost/YiMo/login','认证操作','用户认证'),(2277,1,'一墨大侠修改','LOGIN',21,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:12:42','http://localhost/YiMo/login','认证操作','用户认证'),(2278,1,'一墨大侠修改','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:15:06','http://localhost/YiMo/login','认证操作','用户认证'),(2279,1,'一墨大侠修改','LOGIN',25,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:38:12','http://localhost/YiMo/login','认证操作','用户认证'),(2280,1,'一墨大侠修改','LOGIN',138,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:46:52','http://localhost/YiMo/login','认证操作','用户认证'),(2281,1,'一墨大侠修改','QUERY',306,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:47:04','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(2282,1,'一墨大侠修改','UPDATE',165,'top.yimo.sys.controller.MenuController.update',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:47:35','http://localhost/YiMo//sys/menu//update','更新保存','菜单管理'),(2283,1,'一墨大侠修改','QUERY',12,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:47:35','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(2284,1,'一墨大侠修改','INSERT',45,'top.yimo.sys.controller.MenuController.save',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:48:56','http://localhost/YiMo//sys/menu//save','新增保存','菜单管理'),(2285,1,'一墨大侠修改','QUERY',17,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:48:56','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(2286,1,'一墨大侠修改','QUERY',38,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:48:58','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(2287,1,'一墨大侠修改','QUERY',11,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:49:01','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(2288,1,'一墨大侠修改','LOGIN',23,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:49:58','http://localhost/YiMo/login','认证操作','用户认证'),(2289,1,'一墨大侠修改','LOGIN',23,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-04-23 14:51:09','http://localhost/YiMo/login','认证操作','用户认证');
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
INSERT INTO `sys_menu` VALUES (1,0,'系统管理','','',0,'fa fa-gears',10,'2017-08-09 22:49:47','2019-04-12 16:04:12','1'),(2,1,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',13,'2017-08-09 22:55:15','2019-03-27 16:21:32','1'),(3,1,'部门管理','sys/dept/','sys:dept:dept',1,'fa fa-group',14,'2017-08-09 22:55:15','2019-03-27 16:21:35','1'),(4,1,'用户管理','sys/user/','sys:user:user',1,'fa fa-user',11,'2017-08-10 14:12:11','2019-03-27 16:21:24','1'),(5,1,'角色管理','sys/role','sys:role:role',1,'fa fa-user-secret',12,'2017-08-10 14:13:19','2019-03-27 16:21:28','1'),(6,4,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(7,4,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(8,4,'删除','','sys:user:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(9,4,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(10,4,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(11,2,'新增','sys/menu/','sys:menu:add',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(12,2,'编辑','sys/menu/','sys:menu:edit',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(13,2,'删除','sys/menu/','sys:menu:remove',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(17,5,'编辑','','sys:role:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(18,5,'删除','','sys:role:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(25,3,'新增','','sys:dept:add',2,'',NULL,NULL,NULL,'1'),(26,3,'编辑','','sys:dept:edit',2,'',NULL,NULL,NULL,'1'),(32,3,'删除','','sys:dept:remove',2,'',NULL,NULL,NULL,'1'),(37,0,'系统工具','','',0,'fa fa-cog fa-spin',20,'2019-03-01 14:16:05','2019-03-27 16:19:49','1'),(38,37,'自动生成代码','generator','sys:generator:generator',1,'fa fa-anchor ',20,'2019-03-01 14:22:52','2019-03-27 16:19:41','1'),(39,0,'系统监控','','',0,'fa fa-tachometer',30,'2019-03-01 18:09:57','2019-04-23 14:47:35','1'),(40,39,'系统操作日志','sys/log','sys:log:log',1,'fa fa-file-archive-o',31,'2019-03-01 18:11:48','2019-04-16 10:57:16','1'),(41,5,'新增','','sys:role:add',2,'',NULL,'2019-03-05 11:53:48',NULL,'1'),(42,1,'数据字典','sys/dict','sys:dict:dict',1,'fa fa-book',15,'2019-03-07 17:26:16','2019-03-27 16:21:39','1'),(43,42,'新增','','sys:dict:add',2,'',NULL,'2019-03-07 17:35:45',NULL,'1'),(44,42,'编辑','','sys:dict:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(45,42,'删除','','sys:dict:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(46,42,'数据字典数据','','sys:dictData',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(47,42,'编辑字典数据','','sys:dictData:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(48,42,'新增字典数据','','sys:dictData:add',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(49,42,'删除字典数据','','sys:dictData:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(50,39,'在线用户','sys/userOnline','sys:userOnline:userOnline',1,'fa fa-user',32,'2019-03-18 15:16:35','2019-03-27 16:20:58','1'),(51,50,'强制提出','','sys:userOnline:kickout',2,'',NULL,'2019-03-18 15:29:08',NULL,'1'),(53,39,'定时任务管理','sys/job','sys:job:job',1,'fa fa-calendar',33,'2019-03-25 17:00:14','2019-03-27 16:21:02','1'),(54,37,'表单构建器','tool/frombuild','tool:frombuild',1,'fa fa-arrows',21,'2019-03-27 16:19:30','2019-03-27 16:21:09','1'),(55,39,'服务器日志','sys/webLog/tail','sys:weblog:tail',1,'fa fa-spinner fa-spin',34,'2019-04-16 10:58:34','2019-04-16 10:58:51','1'),(56,37,'swagger','sys/swagger/view','sys:swagger:view',1,'fa fa-file-archive-o',23,'2019-04-23 12:08:05','2019-04-23 12:08:15','1'),(57,39,'Druid','sys/druid/view','sys:druid:view',1,'fa fa-wrench',35,'2019-04-23 14:48:56',NULL,'1');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'tayle','一墨大侠修改','a91f1e137d8d6d94fd865266a664948c',2,'123@qq.com','13112344321',1,NULL,'','2019-04-12 15:54:46',1,'',NULL,'','','','',''),(2,'test','测试用户111','a5cfa42781cb8660b198daceaea34167',2,'test@aa.com','13112344321',1,1,'2019-03-19 19:08:49','2019-04-12 17:22:24',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'demo','演示用户','ae8df3b6bd3e329b23d8560c7d114dea',5,'123@qq.com','13112344321',1,1,'2019-04-12 15:56:25','2019-04-12 15:59:03',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `sys_user_online` VALUES ('05e373a9-0787-4277-8542-ba942b01f81e',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 18:06:44','2019-04-10 00:00:00',NULL),('0907205c-f1eb-4b4e-90af-794310bcbb25',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:13:07','2019-04-12 17:14:00',NULL),('09556b95-d721-427f-937c-6b311ab75819',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:02:14','2019-04-02 16:10:00',NULL),('0979eea4-0962-488f-9f0a-a006b8a1c4bf',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:04:30','2019-04-02 16:10:00',NULL),('0dc5eb0f-ad1c-49b1-87b4-473466c27749',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:26:36','2019-04-02 16:30:04',NULL),('0e60cdc9-922a-43e5-9a3e-45f9697e9b8e',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 12:12:49','2019-04-16 12:14:13',NULL),('0ec1cf56-4b7a-45ff-babd-5d556020b7fc',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 14:45:30',NULL,NULL),('0fdaed17-c90c-4656-b936-f63badba3e1c',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:41:59','2019-04-12 11:33:04',NULL),('130613c4-717d-490d-a11a-a193d8897f45',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 14:30:49','2019-04-12 14:34:02',NULL),('152679d9-5348-403a-90e2-72f43e34b762',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:52:38','2019-04-12 11:33:04',NULL),('17610cec-f07d-4aa9-a067-01456adf1717',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:29:09','2019-04-02 16:30:04',NULL),('17620f2e-6c57-4aa8-8c2b-5a39a9d8db73',NULL,NULL,NULL,NULL,'127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-31 14:44:51','2019-03-31 00:00:00',NULL),('189c3018-fe57-43dd-9364-36c11bdee742',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 14:05:40','2019-04-11 00:00:00',NULL),('1cc2e789-8005-4c78-b28e-7aada6d38fa0',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:23:27','2019-04-12 17:24:30',NULL),('1d26300f-d8dc-41ea-afbd-9751ad7f23e6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:34:43','2019-04-12 11:33:04',NULL),('1ee54526-46de-4b14-b94c-4d3edcc62c9b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 16:16:31','2019-04-12 16:19:30',NULL),('1ffc49e3-5be4-4b42-8fad-9e790cb965ef',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 16:08:45','2019-04-10 00:00:00',NULL),('266accdd-9ff0-4d73-b606-1edea2987763',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:54:43','2019-04-12 11:33:04',NULL),('286d18a8-cb31-4457-9a29-9d540104763d',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 11:02:56','2019-04-16 11:06:30',NULL),('29b89726-d49d-4477-ba79-3cc5acd53ed3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:07:49','2019-04-12 17:08:55',NULL),('2ceb967a-88de-4746-b08f-68fcb300a239',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-28 16:39:42','2019-03-28 00:00:00',NULL),('2f469323-634e-4d64-bb84-a3e817a91a32',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 11:26:53','2019-04-23 11:43:35',NULL),('3022d95a-1867-47db-810a-bd43cf892f82',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 12:17:55','2019-04-16 14:27:34',NULL),('3037f379-4807-4bf5-932f-9d5a93109b24',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:30:49','2019-04-02 16:40:00',NULL),('327d8c46-c350-428b-90d4-f5d8788a0718',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 12:16:00','2019-04-16 12:17:49',NULL),('37e1fd76-8dfe-4705-8c45-0519cc8a7eac',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 10:54:18','2019-04-12 11:33:04',NULL),('3ca5ec18-19b7-4c16-b290-ec68f249df24',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 10:56:53','2019-04-16 11:03:00',NULL),('3e32d764-3ff2-4d04-932f-a2b0e06b2ee5',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:33:34','2019-04-12 11:33:04',NULL),('3ec3da2e-aa36-4a03-910a-002b7567a931',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:10:26','2019-04-02 00:00:00',NULL),('42637986-1ad7-4a82-ba40-f784750a61f6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 15:29:44','2019-04-12 15:29:52',NULL),('4425d829-1100-4503-85fa-aa23913c76d3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 11:50:11','2019-04-23 11:52:21',NULL),('443a0aab-bb33-4474-b631-58e4d366a9cc',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:09:34','2019-04-02 16:20:00',NULL),('45614e8f-b242-4b35-b1db-80c140ccef5b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:25:59','2019-04-02 17:40:00',NULL),('47c9f328-475e-40a2-ba43-086a4d19d22e',2,'test',2,'科技部','172.29.30.231','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:59:59','2019-04-02 00:00:00',NULL),('4acb6458-4fce-4c90-a117-980821b7740f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 14:38:08','2019-04-23 14:46:42',NULL),('4bf96798-c8d0-4226-a7ac-6722c6453952',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:45:48','2019-04-12 11:33:04',NULL),('4d0668b8-7024-4cf5-970b-2d84b340ab8a',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-16 14:27:36','2019-04-16 14:30:30',NULL),('4d95dd3e-1d2e-4228-be14-ec46dfe70713',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:43:53','2019-04-02 17:50:00',NULL),('4f94c094-e98e-47e5-aaa3-5d65a1e89311',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:18:09','2019-04-12 17:18:30',NULL),('5064ce6f-2b33-4557-9513-6abaa1d07c21',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','on_line','2019-04-23 14:46:45',NULL,NULL),('5246eaa3-543c-4598-97bb-c4c55f5481e3',2,'test',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-16 12:19:14','2019-04-16 14:27:34',NULL),('527f2ee7-6bcf-4917-9286-2f1be3440888',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 16:00:42','2019-04-12 16:04:00',NULL),('53febc42-7bb9-45ca-969e-9f15cac6b563',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 11:02:49',NULL,NULL),('543984ac-c321-473b-a760-d69f6aab225b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 14:55:06','2019-04-12 15:29:38',NULL),('552a3eb8-27ca-4ec2-a0e7-51b0ab436962',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:37:55','2019-04-12 11:33:04',NULL),('55472643-9d2a-4729-b2dc-6b67edb43345',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-29 09:41:14','2019-03-29 10:16:31',NULL),('56ae20de-afc6-4c25-9ee2-abbbeef0469b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:16:01','2019-04-12 17:16:30',NULL),('5bbe4044-4186-403c-aedc-a55237af9598',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 09:47:17','2019-04-11 00:00:00',NULL),('5f9d2893-47af-4565-bfbc-ee1e03430e8a',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:37:58','2019-04-02 17:50:00',NULL),('6083651e-72e1-4aeb-beab-859cfcfa96cb',2,'test',2,'科技部','192.168.40.201','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:28:34','2019-04-16 14:31:30',NULL),('60ca2e53-10db-4c48-9d86-242ef0a55af7',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:55:26','2019-04-12 11:33:04',NULL),('614b268e-0eec-415a-9bfe-fcb03faffae3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-28 18:16:22','2019-03-28 00:00:00',NULL),('62d2d736-3fb7-4631-be18-ae7951b4a6b8',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:39:33','2019-04-11 00:00:00',NULL),('647fac88-2ae5-4b04-b167-7ec64c7baf79',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:49:58','2019-04-12 11:33:04',NULL),('69e0555d-338f-459c-a7fc-3daed7a6b7b2',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:16:29','2019-04-12 17:18:30',NULL),('6af8dc84-4836-4c96-8171-f9c6c8a29956',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 15:38:35','2019-04-12 15:41:00',NULL),('6ca9af80-f1b1-4e4f-ad04-372773408347',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 10:55:59',NULL,NULL),('6ee897ac-1431-4240-8e1e-771107d935f5',2,'test',2,'科技部','172.29.30.231','未知地址','Chrome','Windows 7','off_line','2019-04-02 18:00:57','2019-04-12 11:33:04',NULL),('6f7d7d4f-7d2a-4c00-a92c-6bdba79cb87f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 14:34:46','2019-04-12 14:38:35',NULL),('716532d3-33c1-4afe-a5a3-a535209b7d9d',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:24:47','2019-04-12 17:25:30',NULL),('76484780-a224-4e17-9d6f-44bc2657a245',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:47:26','2019-04-12 11:33:04',NULL),('802c4dfe-17aa-4f7c-ad74-833ead1a593b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 15:37:44','2019-04-02 15:40:00',NULL),('8477cba6-2b7f-4abb-af0e-4d5e59861845',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 14:31:38','2019-04-12 11:33:04',NULL),('84933620-8143-4008-8811-173fa338f0a6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:00:54','2019-04-02 17:10:00',NULL),('849d0e4a-e214-4635-8851-72d86a6dd4af',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 18:02:45','2019-04-12 11:33:04',NULL),('8a947f9e-16c3-4784-b275-c1e142f5fb63',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 15:29:49','2019-04-12 15:38:34',NULL),('8f967584-fdcd-4078-bb8b-6e98c125f49b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 15:40:58','2019-04-12 15:54:03',NULL),('904fa083-5a8e-4ee8-a982-99fa69a05818',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 16:51:48','2019-04-12 11:33:04',NULL),('93a2b8a5-7946-43a8-9c86-2bb2f1b0a7c3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 15:23:04','2019-04-10 00:00:00',NULL),('94ff2f1c-2961-48cd-baf3-3667deb101e3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:36:31','2019-04-02 16:40:00',NULL),('958e53bd-55ee-453b-af43-90b7beafbb7f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:37:40','2019-04-02 16:50:00',NULL),('975e6aa5-564f-409b-b387-0dd25220050a',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 12:14:23','2019-04-16 12:15:55',NULL),('9808be7e-f934-43e7-ad8d-9faec52e6c36',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:41:33','2019-04-16 14:42:57',NULL),('996fd72b-93a0-4e7e-87b2-5c8ad4d8a2d6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 11:45:12','2019-04-16 11:55:00',NULL),('9a077d99-cd35-48f3-886b-23a019760b0c',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:42:54','2019-04-11 00:00:00',NULL),('9af92e20-d6e7-4d8f-9bdc-78e1811e7366',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 16:03:51','2019-04-12 16:15:24',NULL),('9b2fbbe6-74c9-47a4-ab51-93b3361b7843',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:34:40','2019-04-16 14:35:11',NULL),('9d1b504d-aaea-474b-9951-ef1025935ba2',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 10:56:28','2019-04-12 11:33:04',NULL),('9e52f3c8-a899-48e5-b95d-d73052c9f853',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 14:08:43','2019-04-23 14:20:30',NULL),('a220d70a-682d-4f48-8c2c-e04734c79bff',2,'test',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 14:38:41','2019-04-12 14:45:30',NULL),('a48f9bcc-0ac9-4f03-b795-840778e06092',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:13:41','2019-04-02 17:30:00',NULL),('a81a0a4c-75b1-4225-9416-d8a42cfe5bd8',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 15:58:31','2019-04-12 16:00:40',NULL),('a8efee8f-0391-4ec5-9066-454fa587c9c3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:20:10','2019-04-02 16:30:04',NULL),('ade24461-9959-4e51-86ea-366d04c96ce9',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 11:47:08','2019-04-12 11:47:30',NULL),('b002376a-1d7e-4fc3-84be-f4190ed756dd',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:06:42','2019-04-12 17:08:00',NULL),('b049abd5-f51f-4923-ab00-5f298a4db3f2',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-28 15:17:43','2019-03-28 00:00:00',NULL),('b2c75d12-232c-44f3-9952-2c83ccdbe385',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 10:28:15','2019-04-10 00:00:00',NULL),('b2e74482-c22e-48ea-8939-a5aca2073967',1,'tayle',2,'科技部','192.168.40.201','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:41:54','2019-04-16 14:43:49',NULL),('bb7f6757-6add-4849-b4e9-e480b33d3b03',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 11:32:27','2019-04-12 11:47:08',NULL),('c7487e9f-a1ae-47e3-a234-3178f599d7f9',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:37:10','2019-04-11 00:00:00',NULL),('c759f538-ede2-433c-81e0-9fff73b13a02',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:18:58','2019-04-12 17:21:40',NULL),('ca49d771-bb4a-4d2f-9f1d-1d0b12c0285f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:14:07','2019-04-12 17:15:00',NULL),('cac278c9-cb44-4ced-9fc4-8b7fafebb00c',2,'test',2,'科技部','192.168.40.201','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:43:49','2019-04-16 14:45:39',NULL),('cc545ee2-c933-4ab7-872b-23dda55db541',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 16:19:27','2019-04-12 16:59:28',NULL),('ccaa6381-f37c-4d56-a44a-0a345902a41f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:24:28','2019-04-12 17:25:00',NULL),('cd337d8f-e0ed-4429-9798-ccb7e3fc30a6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 14:46:51','2019-04-12 14:55:00',NULL),('d1a12502-0fd6-4a8c-8d36-2f2be1bb49e3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 16:00:35','2019-04-12 11:33:04',NULL),('d5ac99a1-264f-4ca0-9f16-b3576f75e0df',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 15:29:52',NULL,NULL),('d81a16b2-5655-488b-94fc-80855d1f6ffe',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 10:05:07','2019-04-12 11:33:04',NULL),('d83ed9ef-a1e0-43fb-b918-63c6062fc67e',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-03-28 17:21:50','2019-03-28 00:00:00',NULL),('da131a66-1567-4041-b6a6-461e98612669',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 11:29:13','2019-04-12 11:33:04',NULL),('dbd4dc5c-c022-4d26-8db1-7461d255d03d',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-18 10:46:16','2019-04-18 10:50:30',NULL),('deceed6c-e0a6-45a7-a31b-dad7c5ec30d2',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 15:07:06','2019-04-12 11:33:04',NULL),('e059f87d-602d-47a0-976b-b602f7dc25ac',2,'test',2,'科技部','172.29.30.231','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:38:40','2019-04-02 16:50:00',NULL),('e307e694-da73-46bc-b695-275b3af5c732',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:10:22','2019-04-12 17:11:28',NULL),('e7844a6c-bdc0-4603-a232-07e6cef4af3b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 12:07:10','2019-04-23 12:11:00',NULL),('e8af8d3a-1747-4a9f-80d4-f524d01ebbda',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:35:30','2019-04-02 16:40:00',NULL),('e8fd38b6-322f-40eb-8def-76594f9fd1ca',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:42:57','2019-04-16 14:45:30',NULL),('eb7f5e25-6945-4d8c-9223-9cab16a520a5',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:43:07','2019-04-12 11:33:04',NULL),('eb96c180-4803-4522-be71-2d0a1dd360a3',1,'tayle',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 15:54:08','2019-04-12 15:58:01',NULL),('ec3f377f-03d7-4a57-830f-a6601e31cbc7',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 17:40:26','2019-04-11 00:00:00',NULL),('ed888046-d7a3-41b0-b918-df5e1ffe4f7f',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:35:15','2019-04-16 14:41:00',NULL),('eecab84d-25f7-4aac-aa31-85e4f8f648f7',2,'test',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 17:21:47','2019-04-12 17:23:30',NULL),('efa6e2d2-44ed-467d-9adc-6b45b23f00e7',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 14:30:37','2019-04-12 11:33:04',NULL),('f0708461-1176-4de9-8dbb-b2c34e5d75c8',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-11 11:25:03','2019-04-11 00:00:00',NULL),('f1acec23-976f-47f8-bd8d-0a75ef2bb2ae',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-10 15:07:41','2019-04-12 11:33:04',NULL),('f40347f8-699d-4fb7-bff9-13c7345bfcfd',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 17:06:44','2019-04-02 17:20:00',NULL),('f517370f-6a40-44f4-a32d-2065900a14de',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:22:58','2019-04-02 16:30:04',NULL),('f7746320-3c1c-409a-b4f1-a997eb50d54b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-16 14:30:10','2019-04-16 14:33:00',NULL),('f7d4267a-2101-41b6-9d97-041c114dd85b',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-04-23 11:52:19','2019-04-23 12:00:00',NULL),('f9989c1e-c774-481c-b886-52118a7b2fc2',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 16:03:56','2019-04-02 16:10:00',NULL),('fc134ba7-a6d2-4f22-9895-daa484d83161',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-02 18:08:26','2019-04-12 11:33:04',NULL),('fceb10ad-b042-4751-9ab2-b1961dbef400',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 7','off_line','2019-04-12 14:38:51','2019-04-12 14:45:30',NULL),('fedae05a-3855-4c0a-aec3-23beb675621f',3,'哈哈',2,'科技部','127.0.0.1','未知地址','Internet Explorer 11','Windows 7','off_line','2019-04-12 14:58:07','2019-04-12 15:29:38',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (73,1,1),(75,4,2),(77,2,2);
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

-- Dump completed on 2019-04-23 14:53:35
