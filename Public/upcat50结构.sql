-- Adminer 4.7.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `wormsystem`;
CREATE DATABASE `wormsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wormsystem`;

DROP TABLE IF EXISTS `auto_exec_browsers`;
CREATE TABLE `auto_exec_browsers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrBrowserName` varchar(20) NOT NULL,
  `chrBrowserENName` varchar(30) DEFAULT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_jobs`;
CREATE TABLE `auto_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intBrowserID` int(11) NOT NULL,
  `intExecTaskID` int(11) DEFAULT NULL,
  `tPayload` text NOT NULL,
  `tintState` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 排队中 1 运行中 ',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_logs`;
CREATE TABLE `auto_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intOrderNo` int(11) DEFAULT NULL,
  `chrResult` varchar(20) DEFAULT NULL,
  `chrCmd` varchar(100) DEFAULT NULL,
  `chrCmdParam` varchar(255) DEFAULT NULL,
  `chrErrorMessage` varchar(255) DEFAULT NULL,
  `fltDuring` double(8,2) DEFAULT NULL,
  `chrImage` varchar(255) DEFAULT NULL,
  `chrElementAlias` varchar(150) DEFAULT NULL,
  `chrDescription` varchar(50) DEFAULT NULL,
  `intLineNo` int(11) DEFAULT NULL,
  `intLevel` int(11) DEFAULT NULL,
  `chrStatus` varchar(20) DEFAULT NULL,
  `intScriptID` int(11) DEFAULT NULL,
  `intSchemeID` int(11) DEFAULT NULL,
  `intExecTaskID` int(11) DEFAULT NULL,
  `intJobID` int(11) DEFAULT NULL,
  `intTaskID` int(11) DEFAULT NULL,
  `intTimerTaskID` int(11) DEFAULT NULL,
  `intReportID` int(11) DEFAULT NULL,
  `intBrowserID` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linelog` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_logs20181105`;
CREATE TABLE `auto_logs20181105` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intOrderNo` int(11) DEFAULT NULL,
  `chrResult` varchar(20) DEFAULT NULL,
  `chrCmd` varchar(100) DEFAULT NULL,
  `chrCmdParam` varchar(255) DEFAULT NULL,
  `chrErrorMessage` varchar(255) DEFAULT NULL,
  `fltDuring` double(8,2) DEFAULT NULL,
  `chrImage` varchar(255) DEFAULT NULL,
  `chrElementAlias` varchar(150) DEFAULT NULL,
  `chrDescription` varchar(50) DEFAULT NULL,
  `intLineNo` int(11) DEFAULT NULL,
  `intLevel` int(11) DEFAULT NULL,
  `chrStatus` varchar(20) DEFAULT NULL,
  `intScriptID` int(11) DEFAULT NULL,
  `intSchemeID` int(11) DEFAULT NULL,
  `intExecTaskID` int(11) DEFAULT NULL,
  `intJobID` int(11) DEFAULT NULL,
  `intTaskID` int(11) DEFAULT NULL,
  `intTimerTaskID` int(11) DEFAULT NULL,
  `intReportID` int(11) DEFAULT NULL,
  `intBrowserID` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linelog` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_projects`;
CREATE TABLE `auto_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrProjectName` varchar(50) NOT NULL,
  `intParentID` int(10) DEFAULT NULL,
  `chrMemo` varchar(500) DEFAULT NULL,
  `intCreaterID` int(11) NOT NULL,
  `intModifyID` int(11) NOT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intCompanyID` int(11) DEFAULT '0',
  `intType` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_reports`;
CREATE TABLE `auto_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intTaskID` int(11) DEFAULT NULL,
  `intTaskType` int(11) DEFAULT '0' COMMENT '1 普通任务 2 定时任务',
  `intState` int(11) NOT NULL,
  `intFlag` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_schemes`;
CREATE TABLE `auto_schemes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrSchemeName` varchar(50) NOT NULL,
  `intCreaterID` int(11) NOT NULL,
  `intModifyID` int(11) NOT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_scheme_relations`;
CREATE TABLE `auto_scheme_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intSchemeID` int(11) NOT NULL,
  `intFlowID` int(11) DEFAULT NULL,
  `intAttID` int(11) DEFAULT '0',
  `intFlag` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_schemeID` (`intSchemeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_scripts`;
CREATE TABLE `auto_scripts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrScriptName` varchar(100) DEFAULT NULL,
  `intProjectID` int(11) DEFAULT NULL,
  `intTopProjectID` int(11) DEFAULT NULL,
  `intParamAttID` int(11) DEFAULT NULL,
  `intAsc` int(11) NOT NULL,
  `intCreaterID` int(11) NOT NULL,
  `intModifyID` int(11) NOT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_paramAttID` (`intParamAttID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_script_files`;
CREATE TABLE `auto_script_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intScriptID` int(11) NOT NULL,
  `intAttID` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_script_relations`;
CREATE TABLE `auto_script_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intScriptID` int(11) NOT NULL,
  `intAttID` int(11) NOT NULL,
  `intMain` int(11) DEFAULT '0' COMMENT '是否是主入口文件，为以后多文件预留字段',
  `intCreaterID` int(11) DEFAULT NULL,
  `intModifyID` int(11) DEFAULT NULL,
  `intVersion` int(11) DEFAULT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_attID` (`intAttID`),
  KEY `idx_scriptID` (`intScriptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_tasks`;
CREATE TABLE `auto_tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrTaskName` varchar(50) NOT NULL,
  `intAttID` int(11) DEFAULT NULL,
  `intProjectID` int(11) DEFAULT NULL,
  `intTaskType` int(11) DEFAULT '0' COMMENT '0 真实创建任务 1 单独运行案例时自动生成一条虚拟任务 3性能等任务',
  `intCreaterID` int(11) NOT NULL,
  `intModifyID` int(11) NOT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_task_execs`;
CREATE TABLE `auto_task_execs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intTimerTaskID` int(11) DEFAULT '0',
  `intTaskID` int(11) NOT NULL,
  `chrBrowserIDs` varchar(255) NOT NULL,
  `chrBrowserNames` varchar(255) DEFAULT NULL,
  `chrEmails` varchar(255) NOT NULL,
  `intCreaterID` int(11) NOT NULL,
  `intState` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 未执行(不存在记录即为0) 1 执行中 2 执行成功 3 执行失败',
  `intFlag` int(11) DEFAULT '0' COMMENT '1 删除（历史结果）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  `intExecType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_task_relations`;
CREATE TABLE `auto_task_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intTaskID` int(11) NOT NULL,
  `intSchemeID` int(11) NOT NULL,
  `intExecOrder` int(11) DEFAULT NULL,
  `intCreaterID` int(11) DEFAULT NULL,
  `intModifyID` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_timer_relate_tasks`;
CREATE TABLE `auto_timer_relate_tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intTiTaskID` int(11) NOT NULL,
  `intTaskID` int(11) NOT NULL,
  `intCreaterID` int(11) DEFAULT NULL,
  `intModifyID` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_timer_tasks`;
CREATE TABLE `auto_timer_tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrTiTaskName` varchar(50) NOT NULL,
  `intTiTaskTypeID` int(11) DEFAULT NULL,
  `intProjectID` int(11) DEFAULT NULL,
  `intCreaterID` int(11) NOT NULL,
  `intModifyID` int(11) NOT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auto_timer_task_relations`;
CREATE TABLE `auto_timer_task_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intTiTaskID` int(11) NOT NULL,
  `chrExecBrowserIds` varchar(50) DEFAULT NULL,
  `chrEmails` varchar(255) DEFAULT NULL,
  `intExecRateID` varchar(255) DEFAULT NULL,
  `dtExecBeginDate` date DEFAULT NULL,
  `dtExecEndDate` date DEFAULT NULL,
  `chrExecTime` varchar(10) DEFAULT NULL,
  `dtLastTime` datetime DEFAULT NULL,
  `intExecCount` int(11) DEFAULT '0',
  `intState` int(11) DEFAULT NULL,
  `intFlag` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `bug`;
CREATE TABLE `bug` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) NOT NULL,
  `newtitle` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) NOT NULL,
  `time` datetime NOT NULL,
  `reportid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` text NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` text NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `resource_machines`;
CREATE TABLE `resource_machines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrMachName` varchar(50) DEFAULT NULL,
  `chrIp` varchar(30) DEFAULT NULL,
  `chrMacIP` varchar(30) DEFAULT NULL,
  `chrMaxCount` int(10) DEFAULT NULL,
  `chrNowCount` int(10) DEFAULT NULL,
  `chrNowState` int(10) DEFAULT NULL,
  `intCreaterID` int(11) DEFAULT NULL,
  `intModifyID` int(11) DEFAULT NULL,
  `chrBelongTo` varchar(50) DEFAULT NULL,
  `hostIp` varchar(100) DEFAULT NULL,
  `vmName` varchar(100) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `resource_plans`;
CREATE TABLE `resource_plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrTaskName` varchar(1000) DEFAULT NULL,
  `chrMachineId` varchar(1000) DEFAULT NULL,
  `chrNowState` varchar(1000) DEFAULT NULL,
  `chrEmails` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `resource_plans_children`;
CREATE TABLE `resource_plans_children` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrTaskId` varchar(1000) DEFAULT NULL,
  `chrMachineId` varchar(1000) DEFAULT NULL,
  `chrMachineName` varchar(1000) DEFAULT NULL,
  `chrMachineMacIP` varchar(1000) DEFAULT '0' COMMENT '0 真实创建任务 1 单独运行案例时自动生成一条虚拟任务 3性能等任务',
  `chrhostIp` varchar(1000) DEFAULT NULL,
  `chrvmName` varchar(1000) DEFAULT NULL,
  `chruserName` varchar(1000) DEFAULT NULL,
  `chrpassword` varchar(1000) DEFAULT NULL,
  `chrStepId` varchar(1000) DEFAULT NULL,
  `chrStepIdForY` varchar(1000) DEFAULT '0',
  `chrStepName` varchar(1000) DEFAULT NULL,
  `chrStepFun` varchar(1000) DEFAULT NULL,
  `chrError` varchar(5000) DEFAULT NULL,
  `chrPct` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `resource_steps`;
CREATE TABLE `resource_steps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrStepId` varchar(50) DEFAULT NULL,
  `chrStepName` varchar(30) DEFAULT NULL,
  `chrStepFun` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `run`;
CREATE TABLE `run` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) NOT NULL,
  `newtitle` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) NOT NULL,
  `time` datetime NOT NULL,
  `reportid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_applications`;
CREATE TABLE `sys_applications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrAppName` varchar(50) NOT NULL,
  `chrAppDesc` varchar(200) DEFAULT NULL,
  `intFlag` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_attachments`;
CREATE TABLE `sys_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrFile` varchar(255) NOT NULL,
  `chrFileName` varchar(100) NOT NULL,
  `chrFileType` varchar(20) NOT NULL,
  `fltFileSize` double(8,2) NOT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_companies`;
CREATE TABLE `sys_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrCompanyCode` varchar(100) NOT NULL,
  `chrCompanyName` varchar(50) NOT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='原企业信息表（即注册用户所在的企业），每张表中都会带有企业信息表的ID，用户实现多租户的数据隔离';


DROP TABLE IF EXISTS `sys_desktops`;
CREATE TABLE `sys_desktops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intImgDetailID` int(11) NOT NULL,
  `intThemeStyleID` int(11) NOT NULL,
  `intUserID` int(11) NOT NULL,
  `intFlag` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_dicts`;
CREATE TABLE `sys_dicts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrDictName` varchar(50) NOT NULL,
  `chrDictValue` varchar(100) NOT NULL,
  `chrDictValue1` varchar(100) NOT NULL,
  `chrDictValue2` varchar(100) NOT NULL,
  `chrDictValue3` varchar(100) NOT NULL,
  `chrDictValue4` varchar(100) NOT NULL,
  `chrDictValue5` varchar(100) NOT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_flows`;
CREATE TABLE `sys_flows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intFormID` int(11) DEFAULT '0',
  `intFlowType` int(11) DEFAULT NULL COMMENT '0 工作流 1 脚本流',
  `chrFlowName` varchar(50) DEFAULT NULL,
  `chrMemo` varchar(500) DEFAULT NULL,
  `intFlowAsc` int(11) DEFAULT NULL,
  `intStatus` int(11) DEFAULT '0',
  `intCreaterID` int(11) DEFAULT NULL,
  `intModifyID` int(11) DEFAULT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_flow_processes`;
CREATE TABLE `sys_flow_processes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intFlowID` int(11) NOT NULL,
  `intRelationID` int(11) DEFAULT NULL,
  `chrProcessName` varchar(50) DEFAULT NULL,
  `chrProcessType` int(11) DEFAULT '0' COMMENT '0 is_one 1 is_step',
  `chrProcessTo` varchar(255) DEFAULT '',
  `chrProcessStyle` varchar(500) DEFAULT NULL,
  `intCreaterID` int(11) DEFAULT NULL,
  `intModifyID` int(11) DEFAULT NULL,
  `intFlag` int(2) DEFAULT '0' COMMENT '1 删除',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_flowID` (`intFlowID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_flow_pro_relations`;
CREATE TABLE `sys_flow_pro_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intProcessID` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_img_details`;
CREATE TABLE `sys_img_details` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `chrSmallBGPath` varchar(260) NOT NULL,
  `chrDisplayBGPath` varchar(260) NOT NULL,
  `chrImgName` varchar(255) NOT NULL,
  `intImgTypeID` int(11) NOT NULL,
  `intIsShare` int(11) NOT NULL DEFAULT '0',
  `intCreaterID` int(11) NOT NULL,
  `chrImgENName` varchar(255) DEFAULT NULL,
  `intFlag` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intUserID` int(11) NOT NULL,
  `chrUrlRoot` varchar(255) NOT NULL,
  `chrRoute` varchar(100) NOT NULL,
  `intAjax` int(11) NOT NULL,
  `chrRequestType` varchar(20) NOT NULL,
  `chrRequestData` varchar(255) NOT NULL,
  `chrAreaIP` varchar(20) NOT NULL,
  `chrUserAgent` varchar(255) NOT NULL,
  `chrRequestResult` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_machines`;
CREATE TABLE `sys_machines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrMachName` varchar(50) NOT NULL,
  `chrIp` varchar(30) NOT NULL,
  `intCreaterID` int(11) DEFAULT NULL,
  `intModifyID` int(11) DEFAULT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_machine_configs`;
CREATE TABLE `sys_machine_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intMachineID` int(11) NOT NULL,
  `intBrowserID` int(11) NOT NULL,
  `intCreaterID` int(11) DEFAULT NULL,
  `intModifyID` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_machine_relations`;
CREATE TABLE `sys_machine_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intMachineID` int(11) NOT NULL,
  `intHubPort` int(11) NOT NULL,
  `chrHub` varchar(255) NOT NULL,
  `intHubMaxCount` int(11) NOT NULL,
  `intHubNowCount` int(11) NOT NULL,
  `intCreaterID` int(11) DEFAULT NULL,
  `intModifyID` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrMenuCode` varchar(30) DEFAULT NULL,
  `chrAppID` int(11) NOT NULL DEFAULT '0',
  `chrMenuName` varchar(50) NOT NULL,
  `intImgDetailID` int(11) NOT NULL DEFAULT '22',
  `chrMenuClass` varchar(30) DEFAULT NULL,
  `chrMenuMethodName` varchar(50) NOT NULL,
  `chrMemo` varchar(255) DEFAULT NULL,
  `intCreaterID` int(11) NOT NULL,
  `intIsShare` int(11) NOT NULL DEFAULT '0',
  `intClassifyID` int(11) NOT NULL DEFAULT '1',
  `intMenuAsc` int(11) NOT NULL,
  `intParentID` int(11) DEFAULT '0',
  `chrMenuMethodArgs` varchar(500) DEFAULT NULL,
  `intFlag` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_menu_classifies`;
CREATE TABLE `sys_menu_classifies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrClassifyName` varchar(20) NOT NULL,
  `intClassifyAsc` int(11) NOT NULL,
  `intImgDetailID` int(11) NOT NULL,
  `chrClassifyClass` varchar(30) DEFAULT NULL,
  `intCreaterID` int(11) NOT NULL,
  `intIsShare` int(11) NOT NULL DEFAULT '0',
  `intClassifyType` int(11) NOT NULL,
  `chrClassifyArgs` varchar(500) NOT NULL,
  `intFlag` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_menu_types`;
CREATE TABLE `sys_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrMenuTypeName` varchar(30) NOT NULL,
  `intImgDetailID` int(11) DEFAULT NULL,
  `intMenuTypeAsc` int(11) NOT NULL,
  `intParentID` int(11) DEFAULT NULL,
  `intCreaterID` int(11) NOT NULL,
  `intFlag` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_menu_users`;
CREATE TABLE `sys_menu_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intMenuID` int(11) DEFAULT NULL,
  `intUserID` int(11) DEFAULT NULL,
  `intIsDisplayDesktop` tinyint(1) DEFAULT '1',
  `intIsDisplayLeft` tinyint(1) DEFAULT '0' COMMENT '是否显示在左菜单 0 否 1 是',
  `intFlag` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_organizations`;
CREATE TABLE `sys_organizations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `intParentID` int(10) DEFAULT NULL,
  `chrOrgCode` varchar(50) DEFAULT NULL,
  `chrOrgName` varchar(100) DEFAULT NULL,
  `chrOrgDesc` varchar(300) DEFAULT NULL,
  `intOrgType` int(2) DEFAULT NULL COMMENT '0 公司、部门 1 岗位',
  `intFlag` int(2) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='原企业（即注册用户企业）创建的组织机构';


DROP TABLE IF EXISTS `sys_org_roles-del`;
CREATE TABLE `sys_org_roles-del` (
  `id` int(10) NOT NULL,
  `intOrgID` int(10) DEFAULT NULL,
  `intRoleID` int(10) DEFAULT NULL,
  `intCreateID` int(11) NOT NULL,
  `intModifyID` int(11) NOT NULL,
  `intFlag` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分级授权管理组织机构（公司、部门）表';


DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intMenuID` varchar(30) NOT NULL COMMENT '模块（即菜单）ID，权限属于哪个模块',
  `chrRightCode` varchar(36) DEFAULT NULL COMMENT '权限code',
  `chrRightName` varchar(50) DEFAULT NULL COMMENT '权限名称：可访问、删除、修改、增加等',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `chrParentCode` varchar(30) DEFAULT NULL,
  `chrEvent` varchar(20) DEFAULT NULL,
  `intCompanyID` int(11) DEFAULT '0' COMMENT '区分哪些权限属于哪些原始企业（即注册用户企业） 注册',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能表（模块功能、按钮功能）';


DROP TABLE IF EXISTS `sys_priviliges`;
CREATE TABLE `sys_priviliges` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `chrPriviligeType` varchar(50) DEFAULT NULL COMMENT '权限类型 role or user（直接将权限分配给角色还是用户）',
  `intPriviligeTypeValue` int(10) DEFAULT NULL COMMENT '权限类型的ID roleID or userID or groupID 等（角色ID、用户ID、组ID等）',
  `chrPriviligeOperationType` varchar(50) DEFAULT NULL COMMENT '权限操作类型 menu or button or data 等',
  `chrPriviligeOperationTypeValue` varchar(36) DEFAULT NULL COMMENT '权限操作类型值 menuID or buttonCode or resourceObjectCode 等',
  `intPriviligeOperation` tinyint(1) DEFAULT '0' COMMENT '权限操作启用 0 不启用 1 启用',
  `intIsDisplayDesktop` tinyint(1) DEFAULT '0' COMMENT '是否显示在桌面 0 否 1 是',
  `intIsDisplayLeft` tinyint(1) DEFAULT '0' COMMENT '是否显示在左导航 0 否 1 是',
  `intFlag` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intOrgID` int(11) DEFAULT '0',
  `intCompanyID` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能权限关系表';


DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrResourceCode` varchar(30) DEFAULT NULL,
  `chrResourceName` varchar(50) NOT NULL,
  `chrResourceRule` varchar(255) DEFAULT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限类型';


DROP TABLE IF EXISTS `sys_resource_objects`;
CREATE TABLE `sys_resource_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrResObjCode` varchar(36) DEFAULT NULL,
  `chrResourceCode` varchar(30) NOT NULL,
  `intObjectID` int(11) NOT NULL,
  `intFlag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intCompanyID` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限';


DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrRoleName` varchar(20) NOT NULL,
  `chrRoleDesc` varchar(200) DEFAULT NULL,
  `intCreateID` int(11) DEFAULT NULL,
  `intModifyID` int(11) DEFAULT NULL,
  `intFlag` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `intOrgID` int(10) DEFAULT '0' COMMENT '废弃--角色属于那个组织机构（集团、公司）,多组织机构需要定义哪些角色属于那个组织机构，原始企业中的下属组织机构',
  `intCompanyID` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表（超级管理员、企业管理员、其他自定义操作角色）';


DROP TABLE IF EXISTS `sys_servers`;
CREATE TABLE `sys_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_theme_styles`;
CREATE TABLE `sys_theme_styles` (
  `id` int(10) NOT NULL,
  `chrThemeName` varchar(100) DEFAULT NULL,
  `chrThemePath` varchar(260) DEFAULT NULL,
  `chrThemeStyleFolder` varchar(200) DEFAULT NULL,
  `intImgDetailID` int(10) DEFAULT NULL,
  `intFlag` int(2) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sys_user_roles`;
CREATE TABLE `sys_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `intUserID` int(11) NOT NULL,
  `intRoleID` int(11) NOT NULL,
  `intCreateID` int(11) NOT NULL,
  `intModifyID` int(11) NOT NULL,
  `intFlag` int(2) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chrUserCode` varchar(50) DEFAULT NULL,
  `chrUserName` varchar(50) NOT NULL,
  `chrEmail` varchar(50) NOT NULL,
  `chrTel` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `intHeadID` int(11) DEFAULT NULL,
  `intState` int(11) NOT NULL,
  `intAdmin` int(11) NOT NULL DEFAULT '0',
  `intOsDisplay` int(2) DEFAULT '0' COMMENT '展示形式 0 经典（左树右表） 1 桌面形式',
  `intFlag` int(2) DEFAULT '0',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `intOrgID` int(11) DEFAULT '0' COMMENT '实现多租户',
  `intCompanyID` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_chremail_unique` (`chrEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2020-03-02 09:01:31
