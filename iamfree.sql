-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: iamfree
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `t_comment`
--

DROP TABLE IF EXISTS `t_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `replyid` int(11) DEFAULT '0',
  `helpid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `constriant_user_comment_idx` (`userid`),
  KEY `constriant_user_help_idx` (`helpid`),
  KEY `constriant_reply_user_idx` (`replyid`),
  CONSTRAINT `constriant_comment_help` FOREIGN KEY (`helpid`) REFERENCES `t_help` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `constriant_reply_comment` FOREIGN KEY (`replyid`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `constriant_user_comment` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comment`
--

LOCK TABLES `t_comment` WRITE;
/*!40000 ALTER TABLE `t_comment` DISABLE KEYS */;
INSERT INTO `t_comment` VALUES (3,2,NULL,297,'<p>回答...</p>\r\n','2017-05-31 01:25:27'),(4,2,NULL,297,'<p>回答...</p>\r\n','2017-05-31 01:39:20'),(5,2,NULL,117,'<p>不知道啊</p>\r\n','2017-05-31 07:34:00'),(6,2,NULL,296,'<p>回答...</p>\r\n','2017-06-01 00:56:52'),(7,2,NULL,77,'<p>回答...</p>\r\n','2017-06-01 03:09:44'),(8,2,NULL,294,'<p>回答...</p>\r\n','2017-06-01 03:11:38'),(9,5,NULL,69,'<p>不知道</p>\r\n','2017-06-01 03:15:45'),(10,2,NULL,69,'<p>回答...</p>\r\n','2017-06-01 03:16:31'),(11,2,NULL,69,'<p>放点辣椒</p>\r\n','2017-06-01 03:21:53'),(13,5,NULL,302,'<p>不清楚</p>\r\n','2017-06-21 14:12:21'),(14,2,NULL,303,'<p>回答...纷纷</p>\r\n','2017-06-23 02:09:52');
/*!40000 ALTER TABLE `t_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_help`
--

DROP TABLE IF EXISTS `t_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `title` varchar(49) DEFAULT NULL,
  `content` mediumtext,
  `begintime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endtime` timestamp NULL DEFAULT NULL,
  `fcoin` int(11) DEFAULT '0',
  `state` varchar(1) DEFAULT 'T' COMMENT '''T''表示有效，‘C’表示取消，''A''表示完成',
  `anonymous` varchar(1) NOT NULL DEFAULT 'F',
  `tab` varchar(45) DEFAULT NULL,
  `imgPath` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL COMMENT '评论',
  `look` int(11) NOT NULL DEFAULT '0',
  `bestpid` int(11) DEFAULT NULL COMMENT '采纳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `constriant_help_user_idx` (`userid`),
  KEY `constriant_help_comment_idx` (`cid`),
  CONSTRAINT `constriant_help_comment` FOREIGN KEY (`cid`) REFERENCES `t_comment` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `constriant_help_user` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_help`
--

LOCK TABLES `t_help` WRITE;
/*!40000 ALTER TABLE `t_help` DISABLE KEYS */;
INSERT INTO `t_help` VALUES (69,2,'老北京素丸子怎么做好吃','老北京素丸子怎么做好吃','2017-05-25 16:39:39',NULL,1,'T','F','社会民生;文化艺术;健康生活;',NULL,NULL,9,11),(77,2,'台湾即将成为亚洲第一个同性婚姻合法的地区？','台湾即将成为亚洲第一个同性婚姻合法的地区？','2017-05-28 02:22:35',NULL,0,'T','T','',NULL,NULL,7,NULL),(97,2,'林心如霍建华真是非法同居吗?','林心如霍建华真是非法同居吗?','2017-05-25 16:48:52',NULL,0,'T','F','',NULL,NULL,0,NULL),(98,2,'模仿百度知道，做web作业','模仿百度知道，做web作业','2017-05-26 01:53:38',NULL,0,'T','F','',NULL,NULL,1,NULL),(99,2,'重庆人吃火锅的七大未解之谜，让你成为更地道的吃货','重庆人吃火锅的七大未解之谜，让你成为更地道的吃货','2017-05-26 01:56:18',NULL,0,'T','F','',NULL,NULL,0,NULL),(100,2,'宇宙一直在膨胀，为啥你不会受其影响而变胖？','宇宙一直在膨胀，为啥你不会受其影响而变胖？','2017-05-26 01:58:28',NULL,0,'T','F','',NULL,NULL,0,NULL),(104,2,'这部恐怖片, 很多人连十分钟都撑不下去！','这部恐怖片, 很多人连十分钟都撑不下去！','2017-05-26 02:05:13',NULL,0,'T','F','',NULL,NULL,2,NULL),(115,2,'在做一个测试模仿百度知道，做web作业','在做一个测试模仿百度知道，做web作业','2017-05-26 03:58:29',NULL,0,'T','F','',NULL,NULL,4,NULL),(117,5,'足球为什么是最适合儿童的运动项目','足球为什么是最适合儿童的运动项目','2017-05-29 08:10:20',NULL,0,'T','F','',NULL,NULL,171,5),(136,6,'辉县市冀屯镇离吴村镇有多远','辉县市冀屯镇离吴村镇有多远','2017-05-29 08:10:20',NULL,0,'T','F','',NULL,NULL,3,NULL),(139,7,'一年过去了，可还是单着','一年过去了，可还是单着','2017-05-29 08:10:20',NULL,0,'T','F','',NULL,NULL,3,NULL),(146,5,'一年过去了，可还是单着','一年过去了，可还是单着','2017-05-29 08:10:20',NULL,0,'T','F','',NULL,NULL,3,NULL),(166,7,'jsp页面跳转标签 forward标签详解','jsp页面跳转标签 forward标签详解','2017-05-29 08:10:20',NULL,0,'T','F','',NULL,NULL,6,NULL),(167,7,'测试','测试','2017-06-21 14:16:03',NULL,0,'T','F','','f1c1da86-55e3-43fd-bed3-3d58aba44a63.jpg',NULL,2,NULL),(184,7,'测试','测试','2017-06-21 14:16:03',NULL,0,'T','F','','f1c1da86-55e3-43fd-bed3-3d58aba44a63.jpg;f1c1da86-55e3-43fd-bed3-3d58aba44a63.jpg',NULL,4,NULL),(216,6,'可以自己带机油到4s店保养吗','可以自己带机油到4s店保养吗','2017-06-21 14:16:03',NULL,1,'T','F','','f1c1da86-55e3-43fd-bed3-3d58aba44a63.jpg',NULL,3,NULL),(229,5,'捏字换部首能组成什么字','捏字换部首能组成什么字','2017-06-21 14:16:03',NULL,0,'T','F','电脑网络;电子数码;','f1c1da86-55e3-43fd-bed3-3d58aba44a63.jpg',NULL,2,NULL),(241,5,'谁知道网上贷款，利息低 又安全靠谱的','谁知道网上贷款，利息低 又安全靠谱的','2017-06-21 14:16:03',NULL,0,'T','F','','f1c1da86-55e3-43fd-bed3-3d58aba44a63.jpg',NULL,5,NULL),(242,7,'端午节的来历','端午节的来历','2017-05-29 08:10:20',NULL,0,'T','F','','',NULL,1,NULL),(252,5,'端午节的由来有四种说法，下面分享各种说法的由来及习俗。','端午节的由来有四种说法，下面分享各种说法的由来及习俗。','2017-05-29 08:10:20',NULL,0,'T','F','','',NULL,3,NULL),(253,6,'hibernate得到的set集合为空?','hibernate得到的set集合为空?','2017-05-29 08:10:20',NULL,0,'T','F','','',NULL,1,NULL),(294,6,'detail','detail','2017-05-29 08:10:20',NULL,0,'T','F','','',NULL,4,NULL),(295,7,'成功了？','成功了？','2017-05-29 08:10:20',NULL,0,'T','F','','',NULL,44,NULL),(296,6,'科目一当时可以补考吗科目一当时可以补考吗科目一当时可以补考吗','科目一当时可以补考吗','2017-06-21 14:16:45',NULL,0,'T','F','','f1c1da86-55e3-43fd-bed3-3d58aba44a63.jpg',NULL,9,NULL),(297,6,'QQ附近的人的人气是怎么来的 为啥一个不帅的人渣人气会比漂亮的帅气的人人气高','QQ附近的人的人气是怎么来的 为啥一个不帅的人渣人气会比漂亮的帅气的人人气高','2017-05-29 08:10:20',NULL,0,'T','F','','',NULL,147,NULL),(301,2,'今年的高考数学难吗?','难的话我就不考了。','2017-06-21 14:16:45',NULL,0,'T','F','','f1c1da86-55e3-43fd-bed3-3d58aba44a63.jpg;f1c1da86-55e3-43fd-bed3-3d58aba44a63.jpg',NULL,4,NULL),(302,5,'领养的小孩可以上小学吗','应《中华人民共和国网络安全法》要求，自2017年6月1日起，使用互联网服务需进行帐号实名认证。为保障您的百度帐号能够正常使用，请尽快对帐号进行手机号验证，感谢您的理解与支持','2017-06-21 14:11:29',NULL,1,'T','F','','ed05a436-ff1b-450d-9542-f2d356de716d.jpg;',NULL,7,NULL),(303,5,'沃莱菲气垫bb霜好用吗？看评价特别好','气垫BB霜，是一种海绵气垫式BB粉凝霜，会“呼吸”的全新概念BB霜。突破传统的BB霜概念，模拟蜂巢储蜜原理，将BB霜紧锁于具有万千细孔的海绵气垫粉芯内，作用主要是遮瑕、调整肤色、隐藏毛孔，打造出空气感一般的裸妆效果，产品设计便于携带','2017-06-21 14:30:17',NULL,0,'T','F','','094d0f1a-a5a5-4748-8c6e-37ac2364c674.jpg;',NULL,4,NULL),(304,2,'受伤的','得到','2017-06-23 02:10:24',NULL,0,'T','T','娱乐休闲;地区;','63f347a9-e6a8-42d9-b47a-c532f2aa7d02.jpg;592b4210-61fd-4d67-9e13-b25c9576c22d.jpg;',NULL,5,NULL),(305,2,'eedddd','ddddddddd','2017-06-23 02:14:09',NULL,0,'T','F','法律法规;','18b567a0-8ea9-45f2-b1e6-14cdacd0c9d1.jpg;23c4d221-92b1-4e73-8235-00fdbfc6fb81.jpg;',NULL,2,NULL);
/*!40000 ALTER TABLE `t_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tab`
--

DROP TABLE IF EXISTS `t_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tab` (
  `id` int(11) NOT NULL,
  `tab` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tab`
--

LOCK TABLES `t_tab` WRITE;
/*!40000 ALTER TABLE `t_tab` DISABLE KEYS */;
INSERT INTO `t_tab` VALUES (1,'经济金融'),(2,'企业管理'),(3,'法律法规'),(4,'社会民生'),(5,'科学教育'),(6,'电脑网络'),(7,'电子数码'),(8,'医疗卫生'),(9,'心理分析'),(10,'文化艺术'),(11,'体育运动'),(12,'健康生活'),(13,'娱乐休闲'),(14,'地区'),(15,'其他');
/*!40000 ALTER TABLE `t_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `fcoin` int(11) DEFAULT '0',
  `intro` varchar(255) DEFAULT NULL,
  `imgpath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (2,'林嘉瑜','123456','1471914707@qq.com','18813960106',0,'无','566d427a-d462-4099-985e-3974ff2dcf80.png'),(5,'林先森','123456','1471911217@qq.com','18813960108',99,'无','4926a69b-a437-4894-979c-9bf7d5194c4c.jpg'),(6,'李一','123456','1471914710@qq.com','18813960101',100,'无','566d427a-d462-4099-985e-3974ff2dcf80.png'),(7,'五','123456','1471411217@qq.com','18813960511',100,'无','778d8020-510c-49b7-b551-76e2fb4b786d.png');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'iamfree'
--

--
-- Dumping routines for database 'iamfree'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-17 23:22:35
