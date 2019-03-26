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
INSERT INTO `qrtz_cron_triggers` VALUES ('YiMoScheduler','triggerSyncOnlineStatusJob','triggermyCronJob','0/50 * * * * ? *','Asia/Shanghai');
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
INSERT INTO `qrtz_job_details` VALUES ('YiMoScheduler','SyncOnlineStatusJob','myCronJob','同步在线用户状态','top.yimo.common.quartz.job.SyncOnlineStatusJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0');
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
INSERT INTO `qrtz_triggers` VALUES ('YiMoScheduler','triggerSyncOnlineStatusJob','triggermyCronJob','SyncOnlineStatusJob','myCronJob',NULL,1553585210000,1553585160000,5,'PAUSED','CRON',1553585114000,0,NULL,0,'');
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
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_user_id` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  `description` varchar(100) DEFAULT NULL COMMENT '任务描述',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (3,'SyncOnlineStatusJob','myCronJob','top.yimo.common.quartz.job.SyncOnlineStatusJob','','0/50 * * * * ? *','1','1','1','2019-03-26 11:07:19',NULL,'2019-03-26 15:15:35','','同步在线用户状态'),(4,'SyncOnlineStatusJob','myCronJob','top.yimo.common.quartz.job.SyncOnlineStatusJob','','0/30 * * * * ? *','1','0','1','2019-03-26 11:07:19','0','2019-03-26 15:25:28','','同步在线用户状态');
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
) ENGINE=InnoDB AUTO_INCREMENT=1286 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (703,1,'沙漠骆驼','LOGIN',43,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:17:47','http://localhost/YiMo/login','认证操作','用户认证'),(704,1,'沙漠骆驼','LOGIN',50832,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:23:31','http://localhost/YiMo/login','认证操作','用户认证'),(705,1,'沙漠骆驼','LOGIN',34418,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:30:45','http://localhost/YiMo/login','认证操作','用户认证'),(706,1,'沙漠骆驼','LOGIN',17409,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:40:40','http://localhost/YiMo/login','认证操作','用户认证'),(707,1,'沙漠骆驼','LOGIN',9437,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:42:52','http://localhost/YiMo/login','认证操作','用户认证'),(708,1,'沙漠骆驼','QUERY',145,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:43:59','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(709,1,'沙漠骆驼','QUERY',34,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:44:02','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(710,1,'沙漠骆驼','LOGIN',10298,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:45:16','http://localhost/YiMo/login','认证操作','用户认证'),(711,1,'沙漠骆驼','LOGIN',9770,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:45:16','http://localhost/YiMo/login','认证操作','用户认证'),(712,1,'沙漠骆驼','LOGIN',4999,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:50:35','http://localhost/YiMo/login','认证操作','用户认证'),(713,1,'沙漠骆驼','QUERY',83,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:52:52','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(714,1,'沙漠骆驼','LOGIN',3318,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:54:58','http://localhost/YiMo/login','认证操作','用户认证'),(715,1,'沙漠骆驼','LOGIN',2319,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:58:39','http://localhost/YiMo/login','认证操作','用户认证'),(716,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:58:46','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(717,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:59:26','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(718,1,'沙漠骆驼','QUERY',41,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 11:59:31','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(719,1,'沙漠骆驼','LOGIN',1695,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:00:24','http://localhost/YiMo/login','认证操作','用户认证'),(720,1,'沙漠骆驼','LOGIN',57,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:01:25','http://localhost/YiMo/login','认证操作','用户认证'),(721,NULL,NULL,'LOGOUT',3,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:01:53','http://localhost/YiMo/logout','系统退出','用户认证'),(722,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:02:10','http://localhost/YiMo/login','认证操作','用户认证'),(723,NULL,NULL,'LOGOUT',95,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:02:31','http://localhost/YiMo/logout','系统退出','用户认证'),(724,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:02:46','http://localhost/YiMo/login','认证操作','用户认证'),(725,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:03:47','http://localhost/YiMo/login','认证操作','用户认证'),(726,NULL,NULL,'LOGOUT',1,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:04:15','http://localhost/YiMo/logout','系统退出','用户认证'),(727,1,'沙漠骆驼','LOGIN',73,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:06:33','http://localhost/YiMo/login','认证操作','用户认证'),(728,NULL,NULL,'LOGOUT',53,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:06:37','http://localhost/YiMo/logout','系统退出','用户认证'),(729,1,'沙漠骆驼','LOGIN',70,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:09:51','http://localhost/YiMo/login','认证操作','用户认证'),(730,NULL,NULL,'LOGOUT',2,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:10:11','http://localhost/YiMo/logout','系统退出','用户认证'),(731,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:10:57','http://localhost/YiMo/login','认证操作','用户认证'),(732,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:12:32','http://localhost/YiMo/login','认证操作','用户认证'),(733,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:12:37','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(734,NULL,NULL,'LOGOUT',74,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:12:42','http://localhost/YiMo/logout','系统退出','用户认证'),(735,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:12:59','http://localhost/YiMo/login','认证操作','用户认证'),(736,1,'沙漠骆驼','LOGIN',50,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:14:31','http://localhost/YiMo/login','认证操作','用户认证'),(737,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:14:37','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(738,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:14:54','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(739,NULL,NULL,'LOGOUT',3,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:14:55','http://localhost/YiMo/logout','系统退出','用户认证'),(740,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:14:57','http://localhost/YiMo/login','认证操作','用户认证'),(741,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:00','http://localhost/YiMo/login','认证操作','用户认证'),(742,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:04','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(743,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:29','http://localhost/YiMo/login','认证操作','用户认证'),(744,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:35','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(745,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:56','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(746,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:15:58','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(747,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:16:00','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(748,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:16:04','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(749,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:16:40','http://localhost/YiMo/login','认证操作','用户认证'),(750,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:16:44','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(751,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 12:17:02','http://localhost/YiMo/login','认证操作','用户认证'),(752,1,'沙漠骆驼','LOGIN',263,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:05:09','http://localhost/YiMo/login','认证操作','用户认证'),(753,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:07:32','http://localhost/YiMo/login','认证操作','用户认证'),(754,1,'沙漠骆驼','QUERY',92,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:07:41','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(755,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:08:00','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(756,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:08:02','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(757,1,'沙漠骆驼','LOGIN',40,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:09:34','http://localhost/YiMo/login','认证操作','用户认证'),(758,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:09:41','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(759,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:09:46','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(760,NULL,NULL,'LOGOUT',17,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:11:34','http://localhost/YiMo/logout','系统退出','用户认证'),(761,1,'沙漠骆驼','LOGIN',19,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:11:36','http://localhost/YiMo/login','认证操作','用户认证'),(762,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:11:43','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(763,1,'沙漠骆驼','LOGIN',49,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:14:22','http://localhost/YiMo/login','认证操作','用户认证'),(764,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:14:26','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(765,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:14:55','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(766,NULL,NULL,'LOGOUT',95,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:14:57','http://localhost/YiMo/logout','系统退出','用户认证'),(767,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:14:59','http://localhost/YiMo/login','认证操作','用户认证'),(768,NULL,NULL,'LOGOUT',2,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:15:19','http://localhost/YiMo/logout','系统退出','用户认证'),(769,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:15:29','http://localhost/YiMo/login','认证操作','用户认证'),(770,1,'沙漠骆驼','LOGIN',384,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:21:59','http://localhost/YiMo/login','认证操作','用户认证'),(771,1,'沙漠骆驼','QUERY',74,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:22:03','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(772,1,'沙漠骆驼','LOGIN',37,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:53:56','http://localhost/YiMo/login','认证操作','用户认证'),(773,1,'沙漠骆驼','LOGIN',28,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:57:53','http://localhost/YiMo/login','认证操作','用户认证'),(774,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:58:16','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(775,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:58:20','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(776,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:58:24','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(777,1,'沙漠骆驼','FORCE',64,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:58:32','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(778,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 16:58:32','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(779,1,'沙漠骆驼','LOGIN',48,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:06:40','http://localhost/YiMo/login','认证操作','用户认证'),(780,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:06:46','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(781,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:00','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(782,NULL,NULL,'LOGOUT',64,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:01','http://localhost/YiMo/logout','系统退出','用户认证'),(783,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:02','http://localhost/YiMo/login','认证操作','用户认证'),(784,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:06','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(785,NULL,NULL,'LOGOUT',75,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:14','http://localhost/YiMo/logout','系统退出','用户认证'),(786,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:16','http://localhost/YiMo/login','认证操作','用户认证'),(787,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:19','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(788,1,'沙漠骆驼','FORCE',249,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:25','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(789,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:25','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(790,1,'沙漠骆驼','QUERY',29,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:33','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(791,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:40','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(792,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:07:48','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(793,NULL,NULL,'LOGOUT',92,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:08:02','http://localhost/YiMo/logout','系统退出','用户认证'),(794,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:08:03','http://localhost/YiMo/login','认证操作','用户认证'),(795,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:08:07','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(796,1,'沙漠骆驼','LOGIN',279,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:10:48','http://localhost/YiMo/login','认证操作','用户认证'),(797,1,'沙漠骆驼','LOGIN',39,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:34','http://localhost/YiMo/login','认证操作','用户认证'),(798,1,'沙漠骆驼','QUERY',57,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:37','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(799,1,'沙漠骆驼','FORCE',83,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:43','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(800,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:43','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(801,1,'沙漠骆驼','FORCE',61,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:46','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(802,1,'沙漠骆驼','QUERY',35,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:46','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(803,1,'沙漠骆驼','FORCE',100,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:49','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(804,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:14:53','http://localhost/YiMo/login','认证操作','用户认证'),(805,1,'沙漠骆驼','LOGIN',278,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:39:29','http://localhost/YiMo/login','认证操作','用户认证'),(806,1,'沙漠骆驼','LOGIN',336,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:58:58','http://localhost/YiMo/login','认证操作','用户认证'),(807,1,'沙漠骆驼','QUERY',89,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:59:02','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(808,1,'沙漠骆驼','FORCE',68,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:59:06','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(809,1,'沙漠骆驼','QUERY',29,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:59:06','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(810,1,'沙漠骆驼','FORCE',64,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:59:09','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(811,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 17:59:14','http://localhost/YiMo/login','认证操作','用户认证'),(812,1,'沙漠骆驼','LOGIN',43,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:01:48','http://localhost/YiMo/login','认证操作','用户认证'),(813,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:01:51','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(814,1,'沙漠骆驼','FORCE',63,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:01:55','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(815,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:02:02','http://localhost/YiMo/login','认证操作','用户认证'),(816,1,'沙漠骆驼','LOGIN',278,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:04:50','http://localhost/YiMo/login','认证操作','用户认证'),(817,1,'沙漠骆驼','QUERY',75,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:04:54','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(818,1,'沙漠骆驼','LOGIN',319,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:06:44','http://localhost/YiMo/login','认证操作','用户认证'),(819,1,'沙漠骆驼','QUERY',80,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:06:47','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(820,NULL,NULL,'FORCE',36737,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:06:52','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(821,1,'沙漠骆驼','LOGIN',51,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:18','http://localhost/YiMo/login','认证操作','用户认证'),(822,1,'沙漠骆驼','QUERY',34,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:21','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(823,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:24','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(824,1,'沙漠骆驼','QUERY',27,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:25','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(825,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:28','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(826,NULL,NULL,'LOGOUT',10,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:39','http://localhost/YiMo/logout','系统退出','用户认证'),(827,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:41','http://localhost/YiMo/login','认证操作','用户认证'),(828,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:44','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(829,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:46','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(830,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:48','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(831,NULL,NULL,'FORCE',98,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:09:50','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(832,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:10:11','http://localhost/YiMo/login','认证操作','用户认证'),(833,1,'沙漠骆驼','LOGIN',314,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:20:43','http://localhost/YiMo/login','认证操作','用户认证'),(834,1,'沙漠骆驼','QUERY',91,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:20:47','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(835,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:20:50','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(836,NULL,NULL,'FORCE',169135,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:20:53','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(837,1,'沙漠骆驼','LOGIN',18,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:23:50','http://localhost/YiMo/login','认证操作','用户认证'),(838,NULL,NULL,'LOGOUT',55,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:23:52','http://localhost/YiMo/logout','系统退出','用户认证'),(839,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:23:54','http://localhost/YiMo/login','认证操作','用户认证'),(840,1,'沙漠骆驼','LOGIN',398,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:27:39','http://localhost/YiMo/login','认证操作','用户认证'),(841,NULL,NULL,'LOGOUT',53,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:27:42','http://localhost/YiMo/logout','系统退出','用户认证'),(842,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:28:14','http://localhost/YiMo/login','认证操作','用户认证'),(843,NULL,NULL,'LOGOUT',340428,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:28:17','http://localhost/YiMo/logout','系统退出','用户认证'),(844,1,'沙漠骆驼','LOGIN',16,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:34:04','http://localhost/YiMo/login','认证操作','用户认证'),(845,1,'沙漠骆驼','LOGIN',322,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:36:32','http://localhost/YiMo/login','认证操作','用户认证'),(846,NULL,NULL,'LOGOUT',67,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:36:36','http://localhost/YiMo/logout','系统退出','用户认证'),(847,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:36:53','http://localhost/YiMo/login','认证操作','用户认证'),(848,1,'沙漠骆驼','QUERY',54,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:36:56','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(849,NULL,NULL,'FORCE',67,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:30','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(850,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:41','http://localhost/YiMo/login','认证操作','用户认证'),(851,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:44','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(852,NULL,NULL,'FORCE',132,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:49','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(853,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:53','http://localhost/YiMo/login','认证操作','用户认证'),(854,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:37:56','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(855,NULL,NULL,'FORCE',100,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:38:04','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(856,1,'沙漠骆驼','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:38:27','http://localhost/YiMo/login','认证操作','用户认证'),(857,NULL,NULL,'LOGOUT',129,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:38:51','http://localhost/YiMo/logout','系统退出','用户认证'),(858,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:02','http://localhost/YiMo/login','认证操作','用户认证'),(859,NULL,NULL,'LOGOUT',125,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:12','http://localhost/YiMo/logout','系统退出','用户认证'),(860,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:18','http://localhost/YiMo/login','认证操作','用户认证'),(861,NULL,NULL,'LOGOUT',67,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:25','http://localhost/YiMo/logout','系统退出','用户认证'),(862,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:26','http://localhost/YiMo/login','认证操作','用户认证'),(863,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:39:32','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(864,1,'沙漠骆驼','LOGIN',32,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:45:44','http://localhost/YiMo/login','认证操作','用户认证'),(865,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 18:45:47','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(866,1,'沙漠骆驼','LOGIN',70,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:03:01','http://localhost/YiMo/login','认证操作','用户认证'),(867,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:03:05','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(868,1,'沙漠骆驼','QUERY',43,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:03:10','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(869,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:04:01','http://localhost/YiMo/login','认证操作','用户认证'),(870,1,'沙漠骆驼','LOGIN',49,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:06:04','http://localhost/YiMo/login','认证操作','用户认证'),(871,NULL,NULL,'LOGOUT',3,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:06:46','http://localhost/YiMo/logout','系统退出','用户认证'),(872,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:07:03','http://localhost/YiMo/login','认证操作','用户认证'),(873,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:07:06','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(874,1,'沙漠骆驼','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:07:10','http://localhost/YiMo/login','认证操作','用户认证'),(875,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:02','http://localhost/YiMo/login','认证操作','用户认证'),(876,1,'沙漠骆驼','QUERY',31,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:05','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(877,1,'沙漠骆驼','QUERY',27,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:55','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(878,1,'沙漠骆驼','QUERY',60,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:57','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(879,1,'沙漠骆驼','QUERY',20,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:58','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(880,1,'沙漠骆驼','QUERY',24,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:59','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(881,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:08:59','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(882,1,'沙漠骆驼','QUERY',25,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:00','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(883,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:01','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(884,1,'沙漠骆驼','QUERY',22,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:03','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(885,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:10','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(886,1,'沙漠骆驼','QUERY',22,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:18','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(887,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:23','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(888,1,'沙漠骆驼','QUERY',26,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:28','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(889,2,'测试用户','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:45','http://localhost/YiMo/login','认证操作','用户认证'),(890,2,'测试用户','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:50','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(891,2,'测试用户','FORCE',2,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:54','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(892,2,'测试用户','QUERY',8,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:09:54','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(893,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:10:22','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(894,1,'沙漠骆驼','LOGIN',288,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:12:53','http://localhost/YiMo/login','认证操作','用户认证'),(895,2,'测试用户','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:01','http://localhost/YiMo/login','认证操作','用户认证'),(896,2,'测试用户','QUERY',57,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:05','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(897,2,'测试用户','FORCE',3,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:15','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(898,2,'测试用户','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:15','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(899,2,'测试用户','QUERY',26,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:18','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(900,2,'测试用户','QUERY',18,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:19','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(901,2,'测试用户','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:21','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(902,2,'测试用户','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:23','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(903,2,'测试用户','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:24','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(904,2,'测试用户','QUERY',19,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:27','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(905,2,'测试用户','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:28','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(906,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:38','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(907,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:47','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(908,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:13:49','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(909,1,'沙漠骆驼','LOGIN',35,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:17','http://localhost/YiMo/login','认证操作','用户认证'),(910,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:21','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(911,2,'测试用户','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:29','http://localhost/YiMo/login','认证操作','用户认证'),(912,2,'测试用户','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:33','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(913,2,'测试用户','FORCE',4,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:41','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(914,2,'测试用户','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:41','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(915,2,'测试用户','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:21:43','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(916,1,'沙漠骆驼','LOGIN',346,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:33','http://localhost/YiMo/login','认证操作','用户认证'),(917,1,'沙漠骆驼','QUERY',69,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:36','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(918,1,'沙漠骆驼','LOGIN',15,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:40','http://localhost/YiMo/login','认证操作','用户认证'),(919,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:43','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(920,2,'测试用户','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:54','http://localhost/YiMo/login','认证操作','用户认证'),(921,2,'测试用户','QUERY',21,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:30:57','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(922,2,'测试用户','FORCE',143,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:31:02','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(923,2,'测试用户','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:31:02','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(924,1,'沙漠骆驼','LOGIN',17,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:34:06','http://localhost/YiMo/login','认证操作','用户认证'),(925,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-19 19:34:08','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(926,1,'沙漠骆驼','LOGIN',22,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:45:11','http://localhost/YiMo/login','认证操作','用户认证'),(927,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:45:19','http://localhost/YiMo/login','认证操作','用户认证'),(928,1,'沙漠骆驼','LOGIN',1193,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:49:04','http://localhost/YiMo/login','认证操作','用户认证'),(929,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:49:18','http://localhost/YiMo/login','认证操作','用户认证'),(930,1,'沙漠骆驼','QUERY',68,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:49:21','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(931,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:49:38','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(932,1,'沙漠骆驼','QUERY',25,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:49:41','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(933,1,'沙漠骆驼','QUERY',20,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:49:43','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(934,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:49:46','http://localhost/YiMo/login','认证操作','用户认证'),(935,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:49:49','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(936,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:50:31','http://localhost/YiMo/login','认证操作','用户认证'),(937,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:50:37','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(938,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:50:56','http://localhost/YiMo/login','认证操作','用户认证'),(939,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-22 14:50:58','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(940,1,'沙漠骆驼','LOGIN',34,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 15:02:49','http://localhost/YiMo/login','认证操作','用户认证'),(941,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-22 15:02:51','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(942,1,'沙漠骆驼','LOGIN',67,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 15:15:35','http://localhost/YiMo/login','认证操作','用户认证'),(943,1,'沙漠骆驼','LOGIN',160,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 17:21:16','http://localhost/YiMo/login','认证操作','用户认证'),(944,1,'沙漠骆驼','LOGIN',88,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 18:20:41','http://localhost/YiMo/login','认证操作','用户认证'),(945,1,'沙漠骆驼','QUERY',56,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-22 18:20:45','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(946,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 18:35:35','http://localhost/YiMo/login','认证操作','用户认证'),(947,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 18:37:15','http://localhost/YiMo/login','认证操作','用户认证'),(948,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 18:39:01','http://localhost/YiMo/login','认证操作','用户认证'),(949,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-22 18:39:15','http://localhost/YiMo/login','认证操作','用户认证'),(950,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-22 18:39:18','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(951,1,'沙漠骆驼','LOGIN',80,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:31:30','http://localhost/YiMo/login','认证操作','用户认证'),(952,1,'沙漠骆驼','QUERY',94,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:31:39','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(953,1,'沙漠骆驼','QUERY',34,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:31:41','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(954,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:32:46','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(955,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:32:52','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(956,1,'沙漠骆驼','QUERY',129,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:32:54','http://localhost/YiMo/sys/dictData/list/Status','获取数据字典数据表列表','数据字典数据表'),(957,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:32:58','http://localhost/YiMo/sys/dictData/list/Sex','获取数据字典数据表列表','数据字典数据表'),(958,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.DictDataController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:33:00','http://localhost/YiMo/sys/dictData/list/OnlineStatus','获取数据字典数据表列表','数据字典数据表'),(959,1,'沙漠骆驼','QUERY',21,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:33:19','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(960,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:44:15','http://localhost/YiMo/login','认证操作','用户认证'),(961,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:44:18','http://localhost/YiMo/login','认证操作','用户认证'),(962,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:44:21','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(963,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:44:29','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(964,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:44:31','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(965,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:44:32','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(966,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:44:33','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(967,1,'沙漠骆驼','FORCE',2,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:44:35','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(968,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:44:36','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(969,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:44:38','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(970,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 11:44:40','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(991,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:02:57','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(992,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:03:03','http://localhost/YiMo/login','认证操作','用户认证'),(993,1,'沙漠骆驼','LOGIN',74,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:04:35','http://localhost/YiMo/login','认证操作','用户认证'),(994,1,'沙漠骆驼','LOGIN',21,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:05:46','http://localhost/YiMo/login','认证操作','用户认证'),(995,1,'沙漠骆驼','QUERY',53,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:06:14','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(996,1,'沙漠骆驼','QUERY',32,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:06:18','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(997,1,'沙漠骆驼','UPDATE',118,'top.yimo.sys.controller.MenuController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:06:25','http://localhost/YiMo//sys/menu//update','更新保存','菜单管理'),(998,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:06:25','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(999,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:06:28','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1000,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:06:30','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1001,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:07:24','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1002,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:07:27','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1003,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:07:28','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1004,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:07:38','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1005,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:08:12','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1006,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:08:59','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1007,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:09:00','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1008,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:09:17','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1009,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:19:29','http://localhost/YiMo/login','认证操作','用户认证'),(1010,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 17:19:33','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1011,1,'沙漠骆驼','LOGIN',21,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:19:01','http://localhost/YiMo/login','认证操作','用户认证'),(1012,1,'沙漠骆驼','QUERY',84,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:19:05','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1013,1,'沙漠骆驼','QUERY',48,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:20:12','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1014,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.DeptController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:20:17','http://localhost/YiMo/sys/dept/list','获取部门管理列表','部门管理'),(1015,1,'沙漠骆驼','QUERY',34,'top.yimo.sys.controller.UserController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:20:18','http://localhost/YiMo/sys/user/list','获取用户列表','用户管理'),(1016,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.RoleController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:20:20','http://localhost/YiMo/sys/role/list','获取角色 列表','角色'),(1017,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.DictController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:20:21','http://localhost/YiMo/sys/dict/list','获取数据字典目标表列表','数据字典目标表'),(1018,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:20:24','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1019,1,'沙漠骆驼','QUERY',24,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:20:27','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1020,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:20:28','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1021,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:20:30','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1022,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:20:35','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1023,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:25:13','http://localhost/YiMo/login','认证操作','用户认证'),(1024,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:25:16','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1025,1,'沙漠骆驼','LOGIN',15,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:31:26','http://localhost/YiMo/login','认证操作','用户认证'),(1026,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:31:29','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1027,1,'沙漠骆驼','UPDATE',119,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:31:33','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1028,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:31:33','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1029,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:32:54','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1030,1,'沙漠骆驼','UPDATE',85,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:33:07','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1031,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:33:07','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1032,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:34:18','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1033,1,'沙漠骆驼','UPDATE',102,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:34:21','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1034,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:34:21','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1035,1,'沙漠骆驼','UPDATE',99,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:34:51','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1036,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:34:51','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1037,1,'沙漠骆驼','LOGIN',13,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:36:12','http://localhost/YiMo/login','认证操作','用户认证'),(1038,1,'沙漠骆驼','QUERY',16,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:36:16','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1039,1,'沙漠骆驼','UPDATE',106,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:36:20','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1040,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:36:20','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1041,1,'沙漠骆驼','LOGIN',42,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:38:18','http://localhost/YiMo/login','认证操作','用户认证'),(1042,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:38:21','http://localhost/YiMo/login','认证操作','用户认证'),(1043,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:38:23','http://localhost/YiMo/login','认证操作','用户认证'),(1044,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:38:29','http://localhost/YiMo/login','认证操作','用户认证'),(1045,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:38:32','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1046,1,'沙漠骆驼','UPDATE',74,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:38:36','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1047,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:38:36','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1048,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:39:01','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1049,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:39:58','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1050,1,'沙漠骆驼','UPDATE',108,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:40:01','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1051,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:40:02','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1052,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:40:35','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1053,1,'沙漠骆驼','UPDATE',101,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:40:37','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1054,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:40:37','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1055,1,'沙漠骆驼','UPDATE',80,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:40:39','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1056,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:40:39','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1057,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:40:58','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1058,1,'沙漠骆驼','UPDATE',126,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:01','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1059,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:01','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1060,1,'沙漠骆驼','UPDATE',140,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:04','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1061,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:04','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1062,1,'沙漠骆驼','UPDATE',133,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:17','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1063,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:18','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1064,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:23','http://localhost/YiMo/login','认证操作','用户认证'),(1065,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:26','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1066,1,'沙漠骆驼','UPDATE',119,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:28','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1067,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:28','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1068,1,'沙漠骆驼','UPDATE',49,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:31','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1069,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:41:32','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1070,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:42:13','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1071,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:42:15','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1072,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:42:19','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1073,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:42:22','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1074,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:42:40','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1075,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:42:42','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1076,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:43:07','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1077,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:43:08','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1078,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:43:13','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1079,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:44:42','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1080,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:44:59','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1081,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:45:25','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1082,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:45:44','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1083,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-25 18:45:49','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1084,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 09:50:28','http://localhost/YiMo/login','认证操作','用户认证'),(1085,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 09:50:31','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1086,1,'沙漠骆驼','UPDATE',130,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 09:50:36','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1087,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 09:50:36','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1088,1,'沙漠骆驼','UPDATE',58,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 09:50:39','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1089,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 09:50:39','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1090,1,'沙漠骆驼','LOGIN',9,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 09:53:00','http://localhost/YiMo/login','认证操作','用户认证'),(1091,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 09:53:07','http://localhost/YiMo/login','认证操作','用户认证'),(1092,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 09:56:33','http://localhost/YiMo/login','认证操作','用户认证'),(1093,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 09:56:46','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1094,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:07:02','http://localhost/YiMo/login','认证操作','用户认证'),(1095,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:08:49','http://localhost/YiMo/login','认证操作','用户认证'),(1096,1,'沙漠骆驼','QUERY',14,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:08:58','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1097,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:09:00','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1098,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:09:23','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1099,1,'沙漠骆驼','UPDATE',99,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:09:31','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1100,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:09:31','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1101,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:17:12','http://localhost/YiMo/login','认证操作','用户认证'),(1102,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:17:15','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1103,1,'沙漠骆驼','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:21:02','http://localhost/YiMo/login','认证操作','用户认证'),(1104,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:21:04','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1105,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:22:08','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1106,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:31:19','http://localhost/YiMo/login','认证操作','用户认证'),(1107,1,'沙漠骆驼','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:34:18','http://localhost/YiMo/login','认证操作','用户认证'),(1108,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:34:20','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1109,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:34:42','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1110,1,'沙漠骆驼','LOGIN',18,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:43:29','http://localhost/YiMo/login','认证操作','用户认证'),(1111,1,'沙漠骆驼','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:45:45','http://localhost/YiMo/login','认证操作','用户认证'),(1112,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:45:48','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1113,1,'沙漠骆驼','DELETE',65,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:45:53','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1114,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:45:54','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1115,1,'沙漠骆驼','DELETE',49,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:46:00','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1116,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:46:00','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1117,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:47:08','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1118,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:47:10','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1119,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:47:19','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1120,1,'沙漠骆驼','DELETE',89,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:50:26','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1121,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:50:26','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1122,1,'沙漠骆驼','DELETE',52,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:50:29','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1123,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:50:30','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1124,1,'沙漠骆驼','DELETE',88,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:50:38','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1125,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:50:38','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1126,1,'沙漠骆驼','UPDATE',116,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:50:40','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1127,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:50:41','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1128,1,'沙漠骆驼','UPDATE',101,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:50:51','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1129,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:50:51','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1130,1,'沙漠骆驼','DELETE',59,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:51:03','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1131,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:51:03','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1132,1,'沙漠骆驼','UPDATE',91,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:51:05','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1133,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:51:06','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1134,1,'沙漠骆驼','DELETE',125,'top.yimo.sys.controller.JobController.save',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:52:19','http://localhost/YiMo/sys/job/save','新增','定时任务调度表'),(1135,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:52:19','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1136,1,'沙漠骆驼','UPDATE',54,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:52:24','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1137,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:52:24','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1138,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 10:59:17','http://localhost/YiMo/login','认证操作','用户认证'),(1139,1,'沙漠骆驼','LOGIN',12,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:04:08','http://localhost/YiMo/login','认证操作','用户认证'),(1140,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:04:11','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1141,1,'沙漠骆驼','DELETE',701,'top.yimo.sys.controller.JobController.remove',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:04:16','http://localhost/YiMo/sys/job/remove','删除','定时任务调度表'),(1142,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:04:17','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1143,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:05:14','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1144,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:05:35','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1145,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:05:38','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1146,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:05:46','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1147,1,'沙漠骆驼','UPDATE',93,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:05:51','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1148,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:05:51','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1149,1,'沙漠骆驼','DELETE',143,'top.yimo.sys.controller.JobController.remove',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:05:53','http://localhost/YiMo/sys/job/remove','删除','定时任务调度表'),(1150,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:05:53','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1151,1,'沙漠骆驼','DELETE',225,'top.yimo.sys.controller.JobController.save',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:07:19','http://localhost/YiMo/sys/job/save','新增','定时任务调度表'),(1152,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:07:20','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1153,1,'沙漠骆驼','UPDATE',99,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:09:19','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1154,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:09:19','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1155,1,'沙漠骆驼','UPDATE',58,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:09:24','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1156,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:09:24','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1157,1,'沙漠骆驼','UPDATE',461,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:10:35','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1158,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:10:36','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1159,1,'沙漠骆驼','LOGIN',24,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:32:28','http://localhost/YiMo/login','认证操作','用户认证'),(1160,1,'沙漠骆驼','QUERY',69,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:32:36','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1161,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:32:47','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1162,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:32:51','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1163,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:32:52','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1164,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:32:54','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1165,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:33:01','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1166,1,'沙漠骆驼','FORCE',3,'top.yimo.sys.controller.UserOnlineController.kickout',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:33:03','http://localhost/YiMo/sys/userOnline/kickout','强制踢出','在线用户记录'),(1167,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:33:03','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1168,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:33:06','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1169,1,'沙漠骆驼','QUERY',22,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:33:44','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1170,1,'沙漠骆驼','UPDATE',68,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:34:22','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1171,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:34:22','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1172,1,'沙漠骆驼','UPDATE',125,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:34:25','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1173,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:34:25','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1174,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:35:57','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1175,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:36:16','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1176,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:36:26','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1177,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:39:39','http://localhost/YiMo/login','认证操作','用户认证'),(1178,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:39:44','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1179,1,'沙漠骆驼','UPDATE',243,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:39:50','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1180,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:39:50','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1181,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:41:03','http://localhost/YiMo/login','认证操作','用户认证'),(1182,1,'沙漠骆驼','LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:41:05','http://localhost/YiMo/login','认证操作','用户认证'),(1183,1,'沙漠骆驼','LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:41:07','http://localhost/YiMo/login','认证操作','用户认证'),(1184,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:41:10','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1185,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:41:11','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1186,1,'沙漠骆驼','DELETE',100,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:41:34','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1187,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:41:34','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1188,1,'沙漠骆驼','UPDATE',107,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:41:37','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1189,1,'沙漠骆驼','QUERY',12,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:41:38','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1190,1,'沙漠骆驼','LOGIN',8,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:47:39','http://localhost/YiMo/login','认证操作','用户认证'),(1191,1,'沙漠骆驼','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:47:50','http://localhost/YiMo/login','认证操作','用户认证'),(1192,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:47:52','http://localhost/YiMo/login','认证操作','用户认证'),(1193,1,'沙漠骆驼','LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:47:53','http://localhost/YiMo/login','认证操作','用户认证'),(1194,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:47:57','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1195,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:47:59','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1196,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:47:59','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1197,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:48:01','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1198,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:48:03','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1199,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:48:04','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1200,1,'沙漠骆驼','LOGIN',20,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:50:58','http://localhost/YiMo/login','认证操作','用户认证'),(1201,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:50:59','http://localhost/YiMo/login','认证操作','用户认证'),(1202,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:51:02','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1203,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:51:03','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1204,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:51:25','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1205,1,'沙漠骆驼','QUERY',7,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:51:27','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1206,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:51:33','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1207,1,'沙漠骆驼','UPDATE',108,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:51:51','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1208,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 11:51:51','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1209,1,'沙漠骆驼','LOGIN',18,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 12:08:48','http://localhost/YiMo/login','认证操作','用户认证'),(1210,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 12:08:52','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1211,1,'沙漠骆驼','DELETE',68,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-26 12:09:02','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1212,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 12:09:02','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1213,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 12:13:37','http://localhost/YiMo/login','认证操作','用户认证'),(1214,1,'沙漠骆驼','LOGIN',16,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:12:50','http://localhost/YiMo/login','认证操作','用户认证'),(1215,1,'沙漠骆驼','LOGIN',19,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:16:02','http://localhost/YiMo/login','认证操作','用户认证'),(1216,1,'沙漠骆驼','LOGIN',23,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:19:42','http://localhost/YiMo/login','认证操作','用户认证'),(1217,NULL,NULL,'LOGOUT',9,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:21:32','http://localhost/YiMo/logout','系统退出','用户认证'),(1218,2,'测试用户','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:21:36','http://localhost/YiMo/login','认证操作','用户认证'),(1219,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:24:26','http://localhost/YiMo/login','认证操作','用户认证'),(1220,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:24:49','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1221,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:24:52','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1222,1,'沙漠骆驼','UPDATE',133,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:24:54','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1223,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:24:54','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1224,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:27:06','http://localhost/YiMo/login','认证操作','用户认证'),(1225,NULL,NULL,'LOGOUT',4,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:27:38','http://localhost/YiMo/logout','系统退出','用户认证'),(1226,1,'沙漠骆驼','LOGIN',7,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:27:40','http://localhost/YiMo/login','认证操作','用户认证'),(1227,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:27:43','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1228,1,'沙漠骆驼','UPDATE',69,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:27:48','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1229,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:27:48','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1230,1,'沙漠骆驼','DELETE',164,'top.yimo.sys.controller.JobController.remove',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:28:19','http://localhost/YiMo/sys/job/remove','删除','定时任务调度表'),(1231,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:28:19','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1232,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:29:05','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1233,1,'沙漠骆驼','UPDATE',212,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:29:08','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1234,1,'沙漠骆驼','QUERY',19,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:29:08','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1235,1,'沙漠骆驼','UPDATE',66,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:29:17','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1236,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:29:18','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1237,1,'沙漠骆驼','LOGIN',21,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:33:00','http://localhost/YiMo/login','认证操作','用户认证'),(1238,1,'沙漠骆驼','LOGIN',14,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:33:36','http://localhost/YiMo/login','认证操作','用户认证'),(1239,1,'沙漠骆驼','QUERY',64,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:33:52','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1240,1,'沙漠骆驼','LOGIN',21635,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:57:50','http://localhost/YiMo/login','认证操作','用户认证'),(1241,1,'沙漠骆驼','LOGIN',16979,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 14:59:58','http://localhost/YiMo/login','认证操作','用户认证'),(1242,1,'沙漠骆驼','LOGIN',12899,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:02:45','http://localhost/YiMo/login','认证操作','用户认证'),(1243,1,'沙漠骆驼','LOGIN',32,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:13:08','http://localhost/YiMo/login','认证操作','用户认证'),(1244,1,'沙漠骆驼','QUERY',70,'top.yimo.sys.controller.MenuController.list',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:13:25','http://localhost/YiMo/sys/menu/list','获取菜单列表','菜单管理'),(1245,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:13:32','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1246,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:15:01','http://localhost/YiMo/login','认证操作','用户认证'),(1247,1,'沙漠骆驼','QUERY',18,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:15:05','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1248,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:15:12','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1249,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:15:14','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1250,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:15:18','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1251,1,'沙漠骆驼','UPDATE',84,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:15:28','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1252,1,'沙漠骆驼','QUERY',10,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:15:28','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1253,1,'沙漠骆驼','DELETE',70,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:15:35','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1254,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:15:35','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1255,1,'沙漠骆驼','UPDATE',191,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:16:38','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1256,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:16:39','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1257,1,'沙漠骆驼','UPDATE',101,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:16:43','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1258,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:16:43','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1259,NULL,NULL,'LOGOUT',6,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:19:28','http://localhost/YiMo/logout','系统退出','用户认证'),(1260,1,'沙漠骆驼','LOGIN',11,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:19:29','http://localhost/YiMo/login','认证操作','用户认证'),(1261,1,'沙漠骆驼','QUERY',13,'top.yimo.sys.controller.UserOnlineController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:19:32','http://localhost/YiMo/sys/userOnline/list','获取在线用户记录','在线用户记录'),(1262,1,'沙漠骆驼','QUERY',20,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:19:33','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1263,1,'沙漠骆驼','UPDATE',171,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:19:38','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1264,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:19:38','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1265,1,'沙漠骆驼','UPDATE',106,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:21:16','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1266,1,'沙漠骆驼','QUERY',9,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:21:16','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1267,1,'沙漠骆驼','UPDATE',102,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:21:19','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1268,1,'沙漠骆驼','QUERY',15,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:21:19','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1269,1,'沙漠骆驼','LOGIN',10,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:24:00','http://localhost/YiMo/login','认证操作','用户认证'),(1270,1,'沙漠骆驼','LOGIN',5,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:24:33','http://localhost/YiMo/login','认证操作','用户认证'),(1271,NULL,NULL,'LOGOUT',2,'top.yimo.common.controller.AuthController.logout',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:24:49','http://localhost/YiMo/logout','系统退出','用户认证'),(1272,1,'沙漠骆驼','LOGIN',6,'top.yimo.common.controller.AuthController.doLogin',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:24:54','http://localhost/YiMo/login','认证操作','用户认证'),(1273,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:25:01','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1274,1,'沙漠骆驼','UPDATE',74,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:25:07','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1275,1,'沙漠骆驼','QUERY',17,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:25:08','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1276,1,'沙漠骆驼','DELETE',258,'top.yimo.sys.controller.JobController.remove',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:25:10','http://localhost/YiMo/sys/job/remove','删除','定时任务调度表'),(1277,1,'沙漠骆驼','QUERY',6,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:25:10','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1278,1,'沙漠骆驼','UPDATE',135,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:25:14','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1279,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:25:14','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1280,1,'沙漠骆驼','DELETE',879,'top.yimo.sys.controller.JobController.update',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:25:28','http://localhost/YiMo/sys/job/update','更新','定时任务调度表'),(1281,1,'沙漠骆驼','QUERY',11,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:25:29','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1282,1,'沙漠骆驼','UPDATE',72,'top.yimo.sys.controller.JobController.resume',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:26:16','http://localhost/YiMo/sys/job/resume','启动定时任务','定时任务调度表'),(1283,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:26:16','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表'),(1284,1,'沙漠骆驼','UPDATE',113,'top.yimo.sys.controller.JobController.pause',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:26:22','http://localhost/YiMo/sys/job/pause','暂停定时任务','定时任务调度表'),(1285,1,'沙漠骆驼','QUERY',8,'top.yimo.sys.controller.JobController.listByPage',NULL,'0:0:0:0:0:0:0:1','2019-03-26 15:26:22','http://localhost/YiMo/sys/job/list','获取定时任务调度表','定时任务调度表');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'系统管理','','',0,'fa fa-gears',0,'2017-08-09 22:49:47','2019-03-01 18:06:09','1'),(2,1,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',3,'2017-08-09 22:55:15',NULL,'1'),(3,1,'部门管理','sys/dept/','sys:dept:dept',1,'fa fa-group',4,'2017-08-09 22:55:15',NULL,'1'),(4,1,'用户管理','sys/user/','sys:user:user',1,'fa fa-user',1,'2017-08-10 14:12:11',NULL,'1'),(5,1,'角色管理','sys/role','sys:role:role',1,'fa fa-user-secret',2,'2017-08-10 14:13:19',NULL,'1'),(6,4,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(7,4,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(8,4,'删除','','sys:user:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(9,4,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(10,4,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(11,2,'新增','sys/menu/','sys:menu:add',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(12,2,'编辑','sys/menu/','sys:menu:edit',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(13,2,'删除','sys/menu/','sys:menu:remove',2,'',3,'2017-08-09 22:55:15',NULL,'1'),(17,5,'编辑','','sys:role:edit',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(18,5,'删除','','sys:role:remove',2,'',0,'2017-08-14 10:51:35',NULL,'1'),(25,3,'新增','','sys:dept:add',2,'',NULL,NULL,NULL,'1'),(26,3,'编辑','','sys:dept:edit',2,'',NULL,NULL,NULL,'1'),(32,3,'删除','','sys:dept:remove',2,'',NULL,NULL,NULL,'1'),(37,0,'系统工具','','',0,'fa fa-cog fa-spin',NULL,'2019-03-01 14:16:05','2019-03-18 16:04:01','1'),(38,37,'自动生成代码','generator','sys:generator:generator',1,'fa fa-anchor ',NULL,'2019-03-01 14:22:52','2019-03-11 17:58:09','1'),(39,0,'系统监控','','',0,'fa fa-tachometer',3,'2019-03-01 18:09:57',NULL,'1'),(40,39,'系统日志','sys/log','sys:log:log',1,'fa fa-file-archive-o',NULL,'2019-03-01 18:11:48',NULL,'1'),(41,5,'新增','','sys:role:add',2,'',NULL,'2019-03-05 11:53:48',NULL,'1'),(42,1,'数据字典','sys/dict','sys:dict:dict',1,'fa fa-book',NULL,'2019-03-07 17:26:16','2019-03-07 17:27:14','1'),(43,42,'新增','','sys:dict:add',2,'',NULL,'2019-03-07 17:35:45',NULL,'1'),(44,42,'编辑','','sys:dict:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(45,42,'删除','','sys:dict:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(46,42,'数据字典数据','','sys:dictData',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(47,42,'编辑字典数据','','sys:dictData:edit',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(48,42,'新增字典数据','','sys:dictData:add',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(49,42,'删除字典数据','','sys:dictData:remove',2,'',NULL,'2019-03-07 17:36:08',NULL,'1'),(50,39,'在线用户','sys/userOnline','sys:userOnline:userOnline',1,'fa fa-user',NULL,'2019-03-18 15:16:35','2019-03-18 15:21:51','1'),(51,50,'强制提出','','sys:userOnline:kickout',2,'',NULL,'2019-03-18 15:29:08',NULL,'1'),(52,0,'定时任务','','',0,'fa fa-bars',10,'2019-03-25 16:31:21','2019-03-25 17:00:24','0'),(53,39,'定时任务管理','sys/job','sys:job:job',1,'fa fa-calendar',1,'2019-03-25 17:00:14','2019-03-25 17:06:25','1');
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
INSERT INTO `sys_role` VALUES (1,'超级管理员','superAdmin','',NULL,NULL,'2019-03-25 17:01:05','1'),(2,'用户管理员','userAdmin','用于管理用户信息',NULL,NULL,NULL,'1'),(3,'系统运维员','operations','',NULL,NULL,'2019-03-05 12:04:14','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (57,2,4),(58,2,6),(59,2,7),(60,2,8),(61,2,9),(62,2,10),(63,2,1),(222,3,40),(223,3,39),(334,1,1),(335,1,2),(336,1,3),(337,1,4),(338,1,5),(339,1,6),(340,1,7),(341,1,8),(342,1,9),(343,1,10),(344,1,11),(345,1,12),(346,1,13),(347,1,17),(348,1,18),(349,1,25),(350,1,26),(351,1,32),(352,1,37),(353,1,38),(354,1,39),(355,1,40),(356,1,41),(357,1,42),(358,1,43),(359,1,44),(360,1,45),(361,1,46),(362,1,47),(363,1,48),(364,1,49),(365,1,50),(366,1,51),(367,1,52),(368,1,53);
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
INSERT INTO `sys_user_online` VALUES ('068e1781-3993-4249-98f9-b14085d957af',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','on_line','2019-03-26 15:24:54',NULL,NULL),('10eb301d-de12-4944-8c39-f2f2e39bfd5a',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 14:58:00','2019-03-26 15:00:30',NULL),('12b76578-4dd0-43ea-aba3-001b730ae0c6',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 14:16:02','2019-03-26 14:25:18',NULL),('399b3417-9eb3-417c-8fe8-143202864d1c',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 14:24:25','2019-03-26 14:26:55',NULL),('477faa90-26f6-4ecf-abe0-39eb4ace4eed',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 15:23:58','2019-03-26 15:25:00',NULL),('58e5cde7-44ba-48f5-8127-47cc4ba1a8cb',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 15:13:08',NULL,NULL),('5b50e321-19e5-46d9-8dc5-b02cf98433f5',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 15:01:08','2019-03-26 15:05:00',NULL),('637c2cf5-d12f-4d69-aad4-ae7b6628aa95',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 14:33:30','2019-03-26 14:36:30',NULL),('82882f29-ea33-4b89-8e47-ac7e0e10dbaa',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 14:32:58',NULL,NULL),('8a54b51e-a8ca-49b5-be9e-eeba9d5f21bd',2,'test',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 14:21:36','2019-03-26 14:25:18',NULL),('a54b3bbf-444d-4fe4-98ab-3badaf84de01',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 15:19:29','2019-03-26 15:23:30',NULL),('a5501c70-b350-459f-a68f-42ccb0a71edf',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 14:19:30','2019-03-26 14:25:18',NULL),('a700ac44-5b88-4073-97c7-f1698890f182',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 14:27:40','2019-03-26 14:32:06',NULL),('cca6a089-4c77-478d-aec7-5246c95c0f22',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 12:12:47','2019-03-26 14:25:18',NULL),('dd637c47-773d-495e-8128-9f52200cf2fc',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 14:59:55','2019-03-26 15:02:30',NULL),('ea083a36-735c-4da4-b05a-103acfe059da',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 15:15:01','2019-03-26 15:20:02',NULL),('fb1cc56e-997e-4710-90eb-a3eb7cd6a760',1,'tayle',2,'科技部','127.0.0.1','未知地址','Chrome','Windows 10','off_line','2019-03-26 12:08:46','2019-03-26 14:25:18',NULL);
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

-- Dump completed on 2019-03-26 15:47:53
