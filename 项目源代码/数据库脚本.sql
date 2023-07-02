/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 5.7.31-log : Database - yf_exam
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yf_exam` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `yf_exam`;

/*Table structure for table `el_exam` */

DROP TABLE IF EXISTS `el_exam`;

CREATE TABLE `el_exam` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT '考试名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '考试描述',
  `open_type` int(11) NOT NULL DEFAULT '1' COMMENT '1公开2部门3定员',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '考试状态',
  `time_limit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否限时',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `total_score` int(11) NOT NULL DEFAULT '0' COMMENT '总分数',
  `total_time` int(11) NOT NULL DEFAULT '0' COMMENT '总时长（分钟）',
  `qualify_score` int(11) NOT NULL DEFAULT '0' COMMENT '及格分数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `open_type` (`open_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试主表';

/*Data for the table `el_exam` */

insert  into `el_exam`(`id`,`title`,`content`,`open_type`,`state`,`time_limit`,`start_time`,`end_time`,`create_time`,`update_time`,`total_score`,`total_time`,`qualify_score`) values 
('1674387841112731649','英语模拟考试1','英语模拟考试1',1,0,0,NULL,NULL,'2023-06-29 20:02:25','2023-06-29 20:02:25',100,100,60);

/*Table structure for table `el_exam_depart` */

DROP TABLE IF EXISTS `el_exam_depart`;

CREATE TABLE `el_exam_depart` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `exam_id` varchar(32) NOT NULL DEFAULT '' COMMENT '考试ID',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `exam_id` (`exam_id`),
  KEY `depart_id` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试部门';

/*Data for the table `el_exam_depart` */

/*Table structure for table `el_exam_repo` */

DROP TABLE IF EXISTS `el_exam_repo`;

CREATE TABLE `el_exam_repo` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `exam_id` varchar(64) NOT NULL COMMENT '考试ID',
  `repo_id` varchar(64) NOT NULL COMMENT '题库ID',
  `radio_count` int(11) NOT NULL DEFAULT '0' COMMENT '单选题数量',
  `radio_score` int(11) NOT NULL DEFAULT '0' COMMENT '单选题分数',
  `multi_count` int(11) NOT NULL DEFAULT '0' COMMENT '多选题数量',
  `multi_score` int(11) NOT NULL DEFAULT '0' COMMENT '多选题分数',
  `judge_count` int(11) NOT NULL DEFAULT '0' COMMENT '判断题数量',
  `judge_score` int(11) NOT NULL DEFAULT '0' COMMENT '判断题分数',
  `saq_count` int(11) NOT NULL DEFAULT '0' COMMENT '简答题数量',
  `saq_score` int(11) NOT NULL DEFAULT '0' COMMENT '简答题分数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `exam_repo_id` (`exam_id`,`repo_id`),
  KEY `rule_id` (`exam_id`) USING BTREE,
  KEY `repo_id` (`repo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试题库';

/*Data for the table `el_exam_repo` */

insert  into `el_exam_repo`(`id`,`exam_id`,`repo_id`,`radio_count`,`radio_score`,`multi_count`,`multi_score`,`judge_count`,`judge_score`,`saq_count`,`saq_score`) values 
('1674387841209200641','1674387841112731649','1674378381090746370',10,7,3,5,3,5,0,0);

/*Table structure for table `el_paper` */

DROP TABLE IF EXISTS `el_paper`;

CREATE TABLE `el_paper` (
  `id` varchar(64) NOT NULL COMMENT '试卷ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  `exam_id` varchar(64) NOT NULL COMMENT '规则ID',
  `title` varchar(64) NOT NULL COMMENT '考试标题',
  `total_time` int(11) NOT NULL DEFAULT '0' COMMENT '考试时长',
  `user_time` int(11) NOT NULL DEFAULT '0' COMMENT '用户时长',
  `total_score` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总分',
  `qualify_score` int(11) NOT NULL DEFAULT '0' COMMENT '及格分',
  `obj_score` int(11) NOT NULL DEFAULT '0' COMMENT '客观分',
  `subj_score` int(11) NOT NULL DEFAULT '0' COMMENT '主观分',
  `user_score` int(11) NOT NULL COMMENT '用户得分',
  `has_saq` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否包含简答题',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '试卷状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `limit_time` datetime DEFAULT NULL COMMENT '截止时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `exam_id` (`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录';

/*Data for the table `el_paper` */

insert  into `el_paper`(`id`,`user_id`,`depart_id`,`exam_id`,`title`,`total_time`,`user_time`,`total_score`,`qualify_score`,`obj_score`,`subj_score`,`user_score`,`has_saq`,`state`,`create_time`,`update_time`,`limit_time`) values 
('1674387956800024577','10001','1318103313740320770','1674387841112731649','英语模拟考试1',100,1,100,60,29,0,29,0,2,'2023-06-29 20:02:52','2023-06-29 20:03:25','2023-06-29 21:42:52');

/*Table structure for table `el_paper_qu` */

DROP TABLE IF EXISTS `el_paper_qu`;

CREATE TABLE `el_paper_qu` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `paper_id` varchar(64) NOT NULL COMMENT '试卷ID',
  `qu_id` varchar(64) NOT NULL COMMENT '题目ID',
  `qu_type` int(11) NOT NULL COMMENT '题目类型',
  `answered` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已答',
  `answer` varchar(5000) NOT NULL DEFAULT '' COMMENT '主观答案',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '问题排序',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '单题分分值',
  `actual_score` int(11) NOT NULL DEFAULT '0' COMMENT '实际得分(主观题)',
  `is_right` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否答对',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录考题';

/*Data for the table `el_paper_qu` */

insert  into `el_paper_qu`(`id`,`paper_id`,`qu_id`,`qu_type`,`answered`,`answer`,`sort`,`score`,`actual_score`,`is_right`) values 
('1674387956812607490','1674387956800024577','1674382902852448257',1,1,'',0,7,7,0),
('1674387956829384706','1674387956800024577','1674384236100055041',1,1,'',1,7,7,0),
('1674387956829384707','1674387956800024577','1674384456108077057',1,1,'',2,7,7,1),
('1674387956837773313','1674387956800024577','1674381002404917250',1,1,'',3,7,7,0),
('1674387956841967617','1674387956800024577','1674382052071436290',1,1,'',4,7,7,0),
('1674387956841967618','1674387956800024577','1674385154803625985',1,1,'',5,7,7,0),
('1674387956850356226','1674387956800024577','1674383394944970754',1,1,'',6,7,7,0),
('1674387956854550529','1674387956800024577','1674382284440072194',1,1,'',7,7,7,1),
('1674387956858744833','1674387956800024577','1674382544713412609',1,1,'',8,7,7,0),
('1674387956862939138','1674387956800024577','1674384689458180097',1,1,'',9,7,7,0),
('1674387956862939139','1674387956800024577','1674386776711622657',2,1,'',10,5,5,0),
('1674387956871327745','1674387956800024577','1674386534738030593',2,1,'',11,5,5,0),
('1674387956900687873','1674387956800024577','1674387348978266113',2,1,'',12,5,5,0),
('1674387956909076481','1674387956800024577','1674386019673305089',3,1,'',13,5,5,1),
('1674387956909076482','1674387956800024577','1674385744514379777',3,1,'',14,5,5,1),
('1674387956917465089','1674387956800024577','1674385842669481986',3,1,'',15,5,5,1);

/*Table structure for table `el_paper_qu_answer` */

DROP TABLE IF EXISTS `el_paper_qu_answer`;

CREATE TABLE `el_paper_qu_answer` (
  `id` varchar(64) NOT NULL COMMENT '自增ID',
  `paper_id` varchar(64) NOT NULL COMMENT '试卷ID',
  `answer_id` varchar(32) NOT NULL COMMENT '回答项ID',
  `qu_id` varchar(32) NOT NULL COMMENT '题目ID',
  `is_right` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否正确项',
  `checked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否选中',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `abc` varchar(64) NOT NULL DEFAULT '' COMMENT '选项标签',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录答案';

/*Data for the table `el_paper_qu_answer` */

insert  into `el_paper_qu_answer`(`id`,`paper_id`,`answer_id`,`qu_id`,`is_right`,`checked`,`sort`,`abc`) values 
('07c650ee-4826-49b3-b24b-aec6677dbd57','1674387956800024577','1674382284456849410','1674382284440072194',0,0,2,'C'),
('150ed7bd-55fa-4345-920c-e56f8eebb16a','1674387956800024577','1674386019740413954','1674386019673305089',0,0,1,'B'),
('172124c7-1d60-4d81-9c3c-deeff9bc062b','1674387956800024577','1674383394974330882','1674383394944970754',0,0,3,'D'),
('1d65fd39-d819-414d-a23e-eec125596ce0','1674387956800024577','1674382284456849412','1674382284440072194',0,0,1,'B'),
('21a39d86-c6dd-4b5c-99d3-6338ad0cd35a','1674387956800024577','1674386776787120131','1674386776711622657',1,0,1,'B'),
('22f254bf-b627-4688-bfc3-9a308e831ea4','1674387956800024577','1674383394978525187','1674383394944970754',1,0,2,'C'),
('246f31e7-bad6-4a28-9987-80433b1126d8','1674387956800024577','1674386534754807809','1674386534738030593',0,1,0,'A'),
('31142e66-c241-4e55-8aba-f79de1b26be5','1674387956800024577','1674384456133242884','1674384456108077057',1,1,0,'A'),
('34b89a3c-5b9a-41c5-b11c-82248da43b89','1674387956800024577','1674385842703036417','1674385842669481986',0,0,1,'B'),
('350f1d89-7681-46f6-bb81-42baf0bd100a','1674387956800024577','1674384456133242883','1674384456108077057',0,0,3,'D'),
('357adc52-0a45-43c2-a08b-945560f5cb53','1674387956800024577','1674381002560106498','1674381002404917250',0,0,2,'C'),
('35fe20eb-4bcc-4951-9014-773faa308762','1674387956800024577','1674382544742772739','1674382544713412609',0,1,0,'A'),
('3606a624-2559-4dd2-99c9-2567fd8d7b1d','1674387956800024577','1674383394974330883','1674383394944970754',0,0,1,'B'),
('370961e6-6105-4ade-a459-07c092415a21','1674387956800024577','1674385154866540546','1674385154803625985',1,0,1,'B'),
('38026c8f-fde6-4d59-afe2-ea45716194d6','1674387956800024577','1674382052092407811','1674382052071436290',0,1,0,'A'),
('392ce615-84e3-49e2-a25a-8b18c3604d88','1674387956800024577','1674382052092407813','1674382052071436290',1,0,2,'C'),
('40b33a45-ea9e-4864-be41-c49557eb96ea','1674387956800024577','1674385744547934209','1674385744514379777',0,0,1,'B'),
('426020f5-d455-4352-a9d7-12152b65fe60','1674387956800024577','1674382902940528642','1674382902852448257',1,0,1,'B'),
('440ab1c6-b4d5-485e-a0a8-1bad345a38e6','1674387956800024577','1674384689479151619','1674384689458180097',0,0,1,'B'),
('470787c0-2352-4f43-908e-e305a6e1bfb3','1674387956800024577','1674386019744608258','1674386019673305089',1,1,0,'A'),
('4760aa82-2bf8-4015-a6d4-fd2d1ec6fa79','1674387956800024577','1674387349045374980','1674387348978266113',1,0,2,'C'),
('4c3abf9c-3fe2-4a31-b523-1207c40ad893','1674387956800024577','1674385842703036418','1674385842669481986',1,1,0,'A'),
('4c479317-ee86-4c34-8f33-0731af72bdf8','1674387956800024577','1674381002551717890','1674381002404917250',0,1,0,'A'),
('4c844506-cf74-4134-80e9-aaa67bc2d60f','1674387956800024577','1674384689479151621','1674384689458180097',1,0,2,'C'),
('4d69dfa0-f55e-47d8-9adc-6b476a8841a7','1674387956800024577','1674385154866540547','1674385154803625985',0,1,0,'A'),
('58b2f186-8ae1-4921-b814-9f08a56f83a9','1674387956800024577','1674386776787120130','1674386776711622657',1,0,2,'C'),
('595e172a-ad67-4af0-be94-922531d1f7ec','1674387956800024577','1674382544742772740','1674382544713412609',0,0,2,'C'),
('69f4ea61-bf9d-46d1-aa1d-17a04c4edd6f','1674387956800024577','1674384689479151620','1674384689458180097',0,0,3,'D'),
('69fae706-ecf2-46f2-9690-add8a08dc5db','1674387956800024577','1674384236133609475','1674384236100055041',0,0,3,'D'),
('808269f9-b59c-4137-898a-681ce75b58c1','1674387956800024577','1674387349045374979','1674387348978266113',1,0,1,'B'),
('8885bf3f-847f-49b4-be2a-e13ebfa76d9f','1674387956800024577','1674385154874929153','1674385154803625985',0,0,3,'D'),
('8c8a7150-a68e-42b9-aba5-9775c804156a','1674387956800024577','1674382902944722946','1674382902852448257',0,0,2,'C'),
('939ffefc-7dea-41d7-a120-10dcad52a35a','1674387956800024577','1674382052092407812','1674382052071436290',0,0,3,'D'),
('955dad23-6a1e-4f9f-a207-6fc31502c554','1674387956800024577','1674382284456849409','1674382284440072194',1,1,0,'A'),
('9ba4ce6e-ea40-4f6e-80f2-6ef7507bc65a','1674387956800024577','1674384456124854273','1674384456108077057',0,0,1,'B'),
('9f2432af-4cf7-4301-816a-a4f57ef2b7dd','1674387956800024577','1674382284456849411','1674382284440072194',0,0,3,'D'),
('a88086b0-34ed-4c8e-9bef-459aa5cc52b2','1674387956800024577','1674386776787120129','1674386776711622657',0,0,3,'D'),
('a978f422-52b2-4d87-853d-7b963ef00395','1674387956800024577','1674382544738578433','1674382544713412609',1,0,3,'D'),
('aba24ffe-6c0d-48c5-885f-771541c198ba','1674387956800024577','1674384236133609474','1674384236100055041',1,0,2,'C'),
('ac095839-7036-4f8c-94df-a7e3cc252a39','1674387956800024577','1674387349045374977','1674387348978266113',1,0,3,'D'),
('b4dcc287-e8f4-4dff-9bfb-f16fe9f83864','1674387956800024577','1674382544742772738','1674382544713412609',0,0,1,'B'),
('b786c85d-fd31-40ac-a489-dfc0592c6fc7','1674387956800024577','1674386534763196418','1674386534738030593',1,0,3,'D'),
('b8230ee0-61aa-4677-a8be-49979d1465e6','1674387956800024577','1674384689479151618','1674384689458180097',0,1,0,'A'),
('baa27b51-d06b-4a8a-aa1f-02ecfb7d54d5','1674387956800024577','1674384456133242882','1674384456108077057',0,0,2,'C'),
('bf812f40-31f9-44a9-861e-e04938db624a','1674387956800024577','1674382902944722947','1674382902852448257',0,1,0,'A'),
('c3edce42-6751-4e77-9bb1-b5926d94689c','1674387956800024577','1674384236133609476','1674384236100055041',0,0,1,'B'),
('c48f4707-37c5-4c56-8d0d-65ab5c34186a','1674387956800024577','1674384236125220866','1674384236100055041',0,1,0,'A'),
('ce3e14ee-f92d-4349-8c54-b3a4cb3f9523','1674387956800024577','1674385154874929154','1674385154803625985',0,0,2,'C'),
('cfff371d-c873-4ecc-aa6f-4b01b4670d39','1674387956800024577','1674382902944722948','1674382902852448257',0,0,3,'D'),
('d470ec01-7efe-47e9-9b23-6fff1c565a86','1674387956800024577','1674385744543739906','1674385744514379777',1,1,0,'A'),
('d58ed913-71a0-4331-ad03-92e675b2b44c','1674387956800024577','1674381002560106499','1674381002404917250',0,0,3,'D'),
('d6937107-3434-4bef-b948-91cc2cd52bce','1674387956800024577','1674386534763196419','1674386534738030593',1,0,1,'B'),
('dd4758c9-8f64-4083-8584-6ac75d7fc7f0','1674387956800024577','1674387349045374978','1674387348978266113',0,1,0,'A'),
('eb95e032-d52a-46a6-bd12-a881a678504b','1674387956800024577','1674381002560106497','1674381002404917250',1,0,1,'B'),
('edabdab5-134c-4bf2-a268-4d159e6a7b97','1674387956800024577','1674386534763196420','1674386534738030593',1,0,2,'C'),
('f2c6e763-648a-42c7-866a-da7cc019de9c','1674387956800024577','1674383394978525186','1674383394944970754',0,1,0,'A'),
('f3f693b1-c9a6-42fd-8449-a4b7ce76757d','1674387956800024577','1674386776782925825','1674386776711622657',1,1,0,'A'),
('f46c4425-d309-4112-9373-39ece22f705e','1674387956800024577','1674382052092407810','1674382052071436290',0,0,1,'B');

/*Table structure for table `el_qu` */

DROP TABLE IF EXISTS `el_qu`;

CREATE TABLE `el_qu` (
  `id` varchar(64) NOT NULL COMMENT '题目ID',
  `qu_type` int(11) NOT NULL COMMENT '题目类型',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '1普通,2较难',
  `image` varchar(500) NOT NULL DEFAULT '' COMMENT '题目图片',
  `content` varchar(2000) NOT NULL COMMENT '题目内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '题目备注',
  `analysis` varchar(2000) NOT NULL DEFAULT '' COMMENT '整题解析',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_type` (`qu_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试题主表';

/*Data for the table `el_qu` */

insert  into `el_qu`(`id`,`qu_type`,`level`,`image`,`content`,`create_time`,`update_time`,`remark`,`analysis`) values 
('1674381002404917250',1,1,'','No sooner ________ themselves in their seats in the theatre ________ the curtain went up.','2023-06-29 19:35:14','2023-06-29 19:35:14','','因为以否定词或半否定词开头的句子，要用部分倒装。另外，no sooner…than…(一…就…)是固定答搭配，且no sooner分句中的谓语通常用过去完成时，而than分句中的谓语用一般过去时。'),
('1674381420233093121',1,1,'','I wonder if your girl friend will go to the ball. If she ________ , so ________ mine.','2023-06-29 19:36:54','2023-06-29 19:36:54','','因为由前句判现在还没有去舞会，是将来时态；又因为在条件状语从句中要用一般现在时代替一般将来时，所以正确答案是does;will。If she does, so will mine. =If she goes to the ball, my girl friend will go, too.'),
('1674382052071436290',1,1,'','It’s necessary that not only ________ to see a doctor but also stay at home for a good sleep.','2023-06-29 19:39:24','2023-06-29 19:39:24','','当not only…but also…不是连接两个不同的主语时，以not only开头的句子要用部分倒装，排除A和C。又因为it is necessary后的that从句一般要用should +动词原形，所以只有D正确。'),
('1674382284440072194',1,1,'','In ________ , but out ________ again.','2023-06-29 19:40:20','2023-06-29 19:40:20','','主句是名词时，其后要倒装，但是代词时不用倒装。'),
('1674382544713412609',1,1,'',' It’s beyond description. Nowhere else in the world ________ such a quiet, beautiful place.','2023-06-29 19:41:22','2023-06-29 19:41:22','','因为是nowhere否定词，以否定词开头的句子，要用部分否定。'),
('1674382902852448257',1,1,'','Not until Dec. 2003 ________ caught by the US soldiers, and it was a great victory for the USA.','2023-06-29 19:42:47','2023-06-29 19:42:47','',' 因为以否定词not until开头的句子要用部分倒装，排除B和D；又因为2003年12月是过去时间，用一般过去时，所以选A。'),
('1674383149553020929',1,1,'',' Only after ________ his homework ________ to watch TV.','2023-06-29 19:43:46','2023-06-29 19:43:46','','因为“only+状语”放在句首时，句子要用部分倒装；但这个“状语”是从句时，从句不要倒装，所以只有A正确。'),
('1674383394944970754',1,1,'','Form then on we never saw her again, nor ________ from her.','2023-06-29 19:44:45','2023-06-29 19:44:45','','因为“nor +情态动词、助动词或be+主语”表示“…也不”之意，又由前文的saw可知hear也是一般过去时态，所以用助动词did。'),
('1674383994130657281',1,1,'','________ our bus; we’ll have to wait for the next.','2023-06-29 19:47:07','2023-06-29 19:47:07','','因为以here, there, up, down, in, out, now, then, away, off等副词开头时，常用完全倒装。句意是：我们要坐的公共汽车走了，我们将不得不等下一辆。'),
('1674384236100055041',1,1,'','－It was careless of you to have left your new bike outside all night.\n\n－My god! ________ .','2023-06-29 19:48:05','2023-06-29 19:48:05','','因为这里不是表示“…也一样”，而是对对方所言表示赞同：“的确如此”，所以不用倒装。'),
('1674384456108077057',1,1,'','What a naughty boy he was! ________ .','2023-06-29 19:48:58','2023-06-29 19:48:58','','句子以副词down开头，本来应该要用完全倒装，但由于主语为代词，所以不用倒装。'),
('1674384689458180097',1,1,'','On the opposite wall ________ one map ________ dozens of pictures.','2023-06-29 19:49:53','2023-06-29 19:49:53','','因为以作状语的介词短语开头，句子要用完全倒装；又hang作“(某物) 悬挂在”解是不及物动词，不用于被动语态，排除B和C；又因one map与dozens of pictures没有包含关系，排除A。'),
('1674384886418501633',1,1,'','You can never use my computer. At no time ________ that machine.','2023-06-29 19:50:40','2023-06-29 19:50:40','','因为以否定词at no time(永不, 在任何时候都不)开头，句子要用部分倒装。'),
('1674385154803625985',1,1,'','Not until all the fish died in the river ________ how serious the pollution was.','2023-06-29 19:51:44','2023-06-29 19:51:44','','因为以否定词not until开头，句子用部分倒装。'),
('1674385744514379777',3,1,'','The Great Wall of China is the longest wall in the world.','2023-06-29 19:54:05','2023-06-29 19:54:05','',''),
('1674385842669481986',3,1,'','The United States of America has 52 states.','2023-06-29 19:54:28','2023-06-29 19:54:28','',''),
('1674385924382912514',3,1,'','The word \"facetious\" contains all five vowels in alphabetical order.','2023-06-29 19:54:48','2023-06-29 19:54:48','',''),
('1674386019673305089',3,1,'','The capital of Australia is Sydney.','2023-06-29 19:55:10','2023-06-29 19:55:10','',''),
('1674386093170094081',3,1,'','\"The Catcher in the Rye\" is a novel written by J.D. Salinger.','2023-06-29 19:55:28','2023-06-29 19:55:28','',''),
('1674386534738030593',2,1,'','Which of the following words is not an adverb?','2023-06-29 19:57:13','2023-06-29 19:57:13','',''),
('1674386776711622657',2,1,'','Which of the following is not a phrasal verb meaning \"to stop doing something\"?','2023-06-29 19:58:11','2023-06-29 19:58:11','',''),
('1674386973625806850',2,1,'','Which of the following words is not an adjective?','2023-06-29 19:58:58','2023-06-29 19:58:58','',''),
('1674387133139382274',2,1,'','Which of the following is not a conjunction?','2023-06-29 19:59:36','2023-06-29 19:59:36','',''),
('1674387348978266113',2,1,'','Which of the following is not a correct sentence with a complex sentence structure?','2023-06-29 20:00:27','2023-06-29 20:00:27','','');

/*Table structure for table `el_qu_answer` */

DROP TABLE IF EXISTS `el_qu_answer`;

CREATE TABLE `el_qu_answer` (
  `id` varchar(64) NOT NULL COMMENT '答案ID',
  `qu_id` varchar(64) NOT NULL COMMENT '问题ID',
  `is_right` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否正确',
  `image` varchar(500) NOT NULL DEFAULT '' COMMENT '选项图片',
  `content` varchar(5000) NOT NULL DEFAULT '' COMMENT '答案内容',
  `analysis` varchar(5000) NOT NULL DEFAULT '' COMMENT '答案分析',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试题答案选项';

/*Data for the table `el_qu_answer` */

insert  into `el_qu_answer`(`id`,`qu_id`,`is_right`,`image`,`content`,`analysis`) values 
('1674381002551717890','1674381002404917250',0,'','they have settled; before',''),
('1674381002560106497','1674381002404917250',1,'','had they settled; than',''),
('1674381002560106498','1674381002404917250',0,'','have they settled; when',''),
('1674381002560106499','1674381002404917250',0,'','they had settled; than',''),
('1674381420262453250','1674381420233093121',0,'','does; does',''),
('1674381420262453251','1674381420233093121',1,'','does; will ',''),
('1674381420270841857','1674381420233093121',0,'','will; does',''),
('1674381420270841858','1674381420233093121',0,'','would; will',''),
('1674382052092407810','1674382052071436290',0,'','Bob should go',''),
('1674382052092407811','1674382052071436290',0,'','did Bob go',''),
('1674382052092407812','1674382052071436290',0,'','Bob’s going',''),
('1674382052092407813','1674382052071436290',1,'','should Bob go',''),
('1674382284456849409','1674382284440072194',1,'','came the teacher; he went ',''),
('1674382284456849410','1674382284440072194',0,'','came the teacher; went he',''),
('1674382284456849411','1674382284440072194',0,'','did the teacher come; he went',''),
('1674382284456849412','1674382284440072194',0,'','the teacher came; went he',''),
('1674382544738578433','1674382544713412609',1,'',' can there be',''),
('1674382544742772738','1674382544713412609',0,'','you can find',''),
('1674382544742772739','1674382544713412609',0,'','there can be',''),
('1674382544742772740','1674382544713412609',0,'','can find you',''),
('1674382902940528642','1674382902852448257',1,'','was Saddam Hussein',''),
('1674382902944722946','1674382902852448257',0,'',' Saddam Hussein was',''),
('1674382902944722947','1674382902852448257',0,'','had Saddam Hussein been',''),
('1674382902944722948','1674382902852448257',0,'','Saddam Hussein had been',''),
('1674383149569798146','1674383149553020929',1,'',' he has finished; is he allowed',''),
('1674383149573992449','1674383149553020929',0,'',' has he finished; is he allowed',''),
('1674383149573992450','1674383149553020929',0,'',' he has finished; he is allowed',''),
('1674383149573992451','1674383149553020929',0,'','has he finished; he is allowed',''),
('1674383394974330882','1674383394944970754',0,'','heard we',''),
('1674383394974330883','1674383394944970754',0,'',' had we heard',''),
('1674383394978525186','1674383394944970754',0,'',' we have heard',''),
('1674383394978525187','1674383394944970754',1,'',' did we hear',''),
('1674383994155823106','1674383994130657281',0,'','Does there go',''),
('1674383994155823107','1674383994130657281',0,'','It goes',''),
('1674383994160017409','1674383994130657281',1,'','There goes',''),
('1674383994160017410','1674383994130657281',0,'','Does it go',''),
('1674384236125220866','1674384236100055041',0,'','So did I',''),
('1674384236133609474','1674384236100055041',1,'','So I did',''),
('1674384236133609475','1674384236100055041',0,'','So was I',''),
('1674384236133609476','1674384236100055041',0,'','So were you',''),
('1674384456124854273','1674384456108077057',0,'','Down jumped he from the desk',''),
('1674384456133242882','1674384456108077057',0,'','From the desk jumped he down',''),
('1674384456133242883','1674384456108077057',0,'','He down jumped from the desk',''),
('1674384456133242884','1674384456108077057',1,'','Down he jumped from the desk',''),
('1674384689479151618','1674384689458180097',0,'','hang; including',''),
('1674384689479151619','1674384689458180097',0,'',' are hung; together with',''),
('1674384689479151620','1674384689458180097',0,'','is hanged; with',''),
('1674384689479151621','1674384689458180097',1,'','is hanging; as well as',''),
('1674384886481416193','1674384886418501633',0,'','you should touch',''),
('1674384886481416194','1674384886418501633',1,'','should you touch',''),
('1674384886481416195','1674384886418501633',0,'','touch should you',''),
('1674384886481416196','1674384886418501633',0,'','you touch',''),
('1674385154866540546','1674385154803625985',1,'','did the villagers realize',''),
('1674385154866540547','1674385154803625985',0,'','the villagers realized',''),
('1674385154874929153','1674385154803625985',0,'','the villagers did realize',''),
('1674385154874929154','1674385154803625985',0,'','didn’t the villagers realize',''),
('1674385744543739906','1674385744514379777',1,'','正确',''),
('1674385744547934209','1674385744514379777',0,'','错误',''),
('1674385842703036417','1674385842669481986',0,'','正确',''),
('1674385842703036418','1674385842669481986',1,'','错误',''),
('1674385924399689729','1674385924382912514',1,'','正确',''),
('1674385924399689730','1674385924382912514',0,'','错误',''),
('1674386019740413954','1674386019673305089',0,'','正确',''),
('1674386019744608258','1674386019673305089',1,'','错误',''),
('1674386093186871298','1674386093170094081',1,'','正确',''),
('1674386093195259906','1674386093170094081',0,'','错误',''),
('1674386534754807809','1674386534738030593',0,'','Quickly',''),
('1674386534763196418','1674386534738030593',1,'','Beautiful',''),
('1674386534763196419','1674386534738030593',1,'','Happy',''),
('1674386534763196420','1674386534738030593',1,'','Exciting',''),
('1674386776782925825','1674386776711622657',1,'','Carry on',''),
('1674386776787120129','1674386776711622657',0,'','Give up',''),
('1674386776787120130','1674386776711622657',1,'','Take up',''),
('1674386776787120131','1674386776711622657',1,'','Come up with',''),
('1674386973692915714','1674386973625806850',1,'','Sing',''),
('1674386973697110018','1674386973625806850',1,'','Singing',''),
('1674386973697110019','1674386973625806850',1,'','Singer',''),
('1674386973697110020','1674386973625806850',0,'','Singable',''),
('1674387133160353794','1674387133139382274',0,'','And',''),
('1674387133160353795','1674387133139382274',1,'','Quickly',''),
('1674387133160353796','1674387133139382274',1,'','Beautiful',''),
('1674387133160353797','1674387133139382274',1,'','Exciting',''),
('1674387349045374977','1674387348978266113',1,'','I went to the store to buy some milk.',''),
('1674387349045374978','1674387348978266113',0,'','Although it was raining, we still went to the park.',''),
('1674387349045374979','1674387348978266113',1,'','She is a doctor and her husband is a lawyer.',''),
('1674387349045374980','1674387348978266113',1,'','The cat sat on the mat.','');

/*Table structure for table `el_qu_repo` */

DROP TABLE IF EXISTS `el_qu_repo`;

CREATE TABLE `el_qu_repo` (
  `id` varchar(64) NOT NULL,
  `qu_id` varchar(64) NOT NULL COMMENT '试题',
  `repo_id` varchar(64) NOT NULL COMMENT '归属题库',
  `qu_type` int(11) NOT NULL DEFAULT '0' COMMENT '题目类型',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `repo_id` (`repo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试题题库关联';

/*Data for the table `el_qu_repo` */

insert  into `el_qu_repo`(`id`,`qu_id`,`repo_id`,`qu_type`,`sort`) values 
('1674381420275036161','1674381420233093121','1674378381090746370',1,1),
('1674381549249884161','1674381002404917250','1674378381090746370',1,2),
('1674382052104990721','1674382052071436290','1674378381090746370',1,3),
('1674382284469432322','1674382284440072194','1674378381090746370',1,4),
('1674382544755355650','1674382544713412609','1674378381090746370',1,5),
('1674382902953111553','1674382902852448257','1674378381090746370',1,6),
('1674383149582381058','1674383149553020929','1674378381090746370',1,7),
('1674383394991108098','1674383394944970754','1674378381090746370',1,8),
('1674383994160017411','1674383994130657281','1674378381090746370',1,9),
('1674384236137803777','1674384236100055041','1674378381090746370',1,10),
('1674384456141631489','1674384456108077057','1674378381090746370',1,11),
('1674384689483345922','1674384689458180097','1674378381090746370',1,12),
('1674384886489804802','1674384886418501633','1674378381090746370',1,13),
('1674385154879123457','1674385154803625985','1674378381090746370',1,14),
('1674385744552128514','1674385744514379777','1674378381090746370',3,15),
('1674385842711425026','1674385842669481986','1674378381090746370',3,16),
('1674385924408078337','1674385924382912514','1674378381090746370',3,17),
('1674386019748802561','1674386019673305089','1674378381090746370',3,18),
('1674386093199454209','1674386093170094081','1674378381090746370',3,19),
('1674386534763196421','1674386534738030593','1674378381090746370',2,20),
('1674386776795508737','1674386776711622657','1674378381090746370',2,21),
('1674386973701304322','1674386973625806850','1674378381090746370',2,22),
('1674387133168742401','1674387133139382274','1674378381090746370',2,23),
('1674387349057957889','1674387348978266113','1674378381090746370',2,24);

/*Table structure for table `el_repo` */

DROP TABLE IF EXISTS `el_repo`;

CREATE TABLE `el_repo` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '题库ID',
  `code` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '题库编号',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '题库名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '题库备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='题库信息';

/*Data for the table `el_repo` */

insert  into `el_repo`(`id`,`code`,`title`,`remark`,`create_time`,`update_time`) values 
('1674378381090746370','','英语六级考试题库','','2023-06-29 19:24:49','2023-06-29 19:24:49');

/*Table structure for table `el_user_book` */

DROP TABLE IF EXISTS `el_user_book`;

CREATE TABLE `el_user_book` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `exam_id` varchar(32) NOT NULL COMMENT '考试ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `qu_id` varchar(64) NOT NULL COMMENT '题目ID',
  `create_time` datetime DEFAULT NULL COMMENT '加入时间',
  `update_time` datetime DEFAULT NULL COMMENT '最近错误时间',
  `wrong_count` int(11) NOT NULL COMMENT '错误时间',
  `title` varchar(1000) NOT NULL COMMENT '题目标题',
  `sort` int(11) NOT NULL COMMENT '错题序号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `sort` (`sort`),
  KEY `exam_id` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='错题本';

/*Data for the table `el_user_book` */

insert  into `el_user_book`(`id`,`exam_id`,`user_id`,`qu_id`,`create_time`,`update_time`,`wrong_count`,`title`,`sort`) values 
('1674388092666114049','1674387841112731649','10001','1674382902852448257','2023-06-29 20:03:25','2023-06-29 20:03:25',1,'Not until Dec. 2003 ________ caught by the US soldiers, and it was a great victory for the USA.',1),
('1674388092682891265','1674387841112731649','10001','1674384236100055041','2023-06-29 20:03:25','2023-06-29 20:03:25',1,'－It was careless of you to have left your new bike outside all night.\n\n－My god! ________ .',2),
('1674388092695474177','1674387841112731649','10001','1674381002404917250','2023-06-29 20:03:25','2023-06-29 20:03:25',1,'No sooner ________ themselves in their seats in the theatre ________ the curtain went up.',3),
('1674388092712251393','1674387841112731649','10001','1674382052071436290','2023-06-29 20:03:25','2023-06-29 20:03:25',1,'It’s necessary that not only ________ to see a doctor but also stay at home for a good sleep.',4),
('1674388092733222914','1674387841112731649','10001','1674385154803625985','2023-06-29 20:03:25','2023-06-29 20:03:25',1,'Not until all the fish died in the river ________ how serious the pollution was.',5),
('1674388092741611522','1674387841112731649','10001','1674383394944970754','2023-06-29 20:03:25','2023-06-29 20:03:25',1,'Form then on we never saw her again, nor ________ from her.',6),
('1674388092758388737','1674387841112731649','10001','1674382544713412609','2023-06-29 20:03:25','2023-06-29 20:03:25',1,' It’s beyond description. Nowhere else in the world ________ such a quiet, beautiful place.',7),
('1674388092775165953','1674387841112731649','10001','1674384689458180097','2023-06-29 20:03:25','2023-06-29 20:03:25',1,'On the opposite wall ________ one map ________ dozens of pictures.',8),
('1674388092796137474','1674387841112731649','10001','1674386776711622657','2023-06-29 20:03:25','2023-06-29 20:03:25',1,'Which of the following is not a phrasal verb meaning \"to stop doing something\"?',9),
('1674388092808720386','1674387841112731649','10001','1674386534738030593','2023-06-29 20:03:25','2023-06-29 20:03:25',1,'Which of the following words is not an adverb?',10),
('1674388092821303298','1674387841112731649','10001','1674387348978266113','2023-06-29 20:03:25','2023-06-29 20:03:25',1,'Which of the following is not a correct sentence with a complex sentence structure?',11);

/*Table structure for table `el_user_exam` */

DROP TABLE IF EXISTS `el_user_exam`;

CREATE TABLE `el_user_exam` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `exam_id` varchar(32) NOT NULL COMMENT '考试ID',
  `try_count` int(11) NOT NULL DEFAULT '1' COMMENT '考试次数',
  `max_score` int(11) NOT NULL DEFAULT '0' COMMENT '最高分数',
  `passed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录';

/*Data for the table `el_user_exam` */

insert  into `el_user_exam`(`id`,`user_id`,`exam_id`,`try_count`,`max_score`,`passed`,`create_time`,`update_time`) values 
('1674388092448010241','10001','1674387841112731649',1,29,0,'2023-06-29 20:03:25','2023-06-29 20:03:25');

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_cron_triggers` */

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `SCHED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_job_details` */

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values 
('examScheduler','STATE_ACCESS'),
('examScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values 
('examScheduler','DESKTOP-77B2L2A1688037811724',1688040974600,10000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(6) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `qrtz_triggers` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `site_name` varchar(255) DEFAULT NULL COMMENT '系统名称',
  `front_logo` varchar(255) DEFAULT NULL COMMENT '前端LOGO',
  `back_logo` varchar(255) DEFAULT NULL COMMENT '后台LOGO',
  `copy_right` varchar(255) DEFAULT NULL COMMENT '版权信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) DEFAULT '' COMMENT '修改人',
  `data_flag` int(11) DEFAULT '0' COMMENT '数据标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统设置';

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`site_name`,`front_logo`,`back_logo`,`copy_right`,`create_time`,`update_time`,`create_by`,`update_by`,`data_flag`) values 
('1','英语六级报考系统',NULL,NULL,NULL,'2023-05-20 16:51:30','2023-06-20 16:51:30','','',1);

/*Table structure for table `sys_depart` */

DROP TABLE IF EXISTS `sys_depart`;

CREATE TABLE `sys_depart` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `dept_type` int(11) NOT NULL DEFAULT '1' COMMENT '1公司2部门',
  `parent_id` varchar(32) NOT NULL COMMENT '所属上级',
  `dept_name` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  `dept_code` varchar(255) NOT NULL DEFAULT '' COMMENT '部门编码',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门信息';

/*Data for the table `sys_depart` */

insert  into `sys_depart`(`id`,`dept_type`,`parent_id`,`dept_name`,`dept_code`,`sort`) values 
('1302853644578000898',1,'0','中国教育考试','A01',1),
('1302855940200284161',1,'1302855776496599041','南开大学','A01A01A01',2),
('1302855994843676674',1,'1302855776496599041','北京大学','A01A01A02',1),
('1302856017283203073',1,'1302855776496599041','清华大学','A01A01A03',3),
('1302856084475953154',1,'1302855776496599041','北京理工大学','A01A01A05',5),
('1302856266567467010',1,'1302855896415944705','南京大学','A01A05A01',1),
('1302856320602685442',1,'1302855896415944705','天津大学','A01A05A02',2),
('1318103313740320770',1,'1302853644578000898','武汉大学','A01A01',1),
('1318103339229106178',1,'1302853644578000898','中山大学','A01A02',2),
('1318103362494910465',1,'1302853644578000898','深圳大学','A01A03',3);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '角色ID',
  `role_name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role_name`) values 
('sa','超级管理员'),
('student','学员');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) NOT NULL DEFAULT '' COMMENT '密码盐',
  `role_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '角色列表',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `data_flag` int(11) NOT NULL DEFAULT '0' COMMENT '0正常,1隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`user_name`,`real_name`,`password`,`salt`,`role_ids`,`depart_id`,`create_time`,`update_time`,`state`,`data_flag`) values 
('10001','admin','超管A','06681cd08837b21adf6b5ef9279d403d','XoFFuS','sa','1318103313740320770','2020-04-20 13:51:03','2020-04-20 13:51:03',0,0),
('1252125239901696002','person','张三','6dfdd6761a3e8319719f32abb9aeae9c','tZCjLq','student','1318103339229106178','2020-04-20 14:41:35','2020-04-20 14:41:35',0,0),
('1674373038637862913','cjn','cjn','176e995100fcd971b87d8fbddf781811','NBHGKG','student','','2023-06-29 19:03:35','2023-06-29 19:03:35',0,0);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values 
('1318103579445284865','10001','sa'),
('1318128865264132097','1252125239901696002','student'),
('1587574421424279555','1587574421424279554','student'),
('1674373038734331905','1674373038637862913','student');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
