-- script for build the site

CREATE DATABASE IF NOT EXISTS tophey
USE tophey;

--用户

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password`  varchar(32) NOT NULL,
  `use_name` varchar(20) NOT NULL,
  `info` longtext,
  `telephone` varchar(20) DEFAULT NULL,
  `zipCode` varchar(10) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `ip`     varchar(20) DEFAULT NULL,  --创建用户时的ip
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) CHARSET=utf8;

-- 私服相关信息
-- 用户填入的信息
CREATE TABLE IF NOT EXISTS `server_info` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(20) character set utf8 NOT NULL,
  `line` varchar(20) character set utf8 NOT NULL,  -- 线路
  `description` varchar(2000) character set utf8 NOT NULL,
  `url` varchar(200) character set utf8 NOT NULL,
  `title` varchar(100) NOT NULL,
  `banner_url` varchar(200) NOT NULL,
  `category_id`   int(10) NOT NULL,
  `create_date` datetime NOT NULL,
  `is_disable`  int(1)  NOT NULL default 0, --私服是否已经被取缔
  `disable_date`  datetime default NULL,
  `disable_reason`  varchar(200) character set utf8,
  PRIMARY KEY  (`id`),
  UNIQUE KEY(`md5(url)`);
) CHARSET=utf8;


-- 我们计算出来的信息
-- 随便列举了一些字段,还需要添加
CREATE TABLE IF NOT EXISTS `server_sys_info` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(20) character set utf8 NOT NULL, -- 重复信息,方便查询
  `category_id`   int(10) NOT NULL,  -- 重复信息
  `refresh_date` datetime NOT NULL,   -- 更新时间
  `score`     int(10) NOT NULL,
  `ping`     int (100) NOT NULL,      -- 计算scroe的依据
  `server_num`  int(5) DEFAULT 0,     -- 私服xx区数目
  `server_create_time` datetime not NULL,  -- 私服成立时间
  `server_new_open_time`  datetime not NULL, --私服开新区的时间
  `vote_in`   int (10) DEFAULT 0,
  `vote_out`   int(10) DEFAULT 0,
  `privilege`   int(5) DEFAULT 0,        --特权.类似于给钱,让他在前面这种
  PRIMARY KEY  (`id`),
) CHARSET=utf8;


-- 游戏分类
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(20) character set utf8 NOT NULL,
  `image_url`  varchar(1024) character,
  `description` varchar(2000) character set utf8 NOT NULL,
  `create_date` datetime NOT NULL,
  `display_order`  int(3) NOT NULL, -- 展示的顺序
  `is_disabled`    int(1) default 0,
  PRIMARY KEY  (`id`),
) CHARSET=utf8;

-- 用户权限
-- 不同的group 对应不同权限
-- 违禁的用户,有一个单独的权限
CREATE TABLE IF NOT EXISTS `group` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(20) character set utf8 NOT NULL,
  `description` varchar(2000) character set utf8 NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
) CHARSET=utf8;

-- 爬虫的来源
CREATE TABLE IF NOT EXISTS `crawl_source` (
  `id` int(10) NOT NULL auto_increment,
  `url` varchar(1024) character set utf8 NOT NULL,
  `category_id`   int(10) NOT NULL,  -- 这个url里的东西,是那种类型的私服
  `crawl_date` datetime default null, --上次爬取的时间
  `create_date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
) CHARSET=utf8;


-- parser之后的结果
-- 有些字段 我也不太清楚这是干嘛的
CREATE TABLE IF NOT EXISTS `parser_result` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(20) character set utf8 NOT NULL,
  `line` varchar(20) character set utf8 NOT NULL,  -- 线路
  `description` varchar(2000) character set utf8 NOT NULL,
  `url` varchar(200) character set utf8 NOT NULL,
  `title` varchar(100) NOT NULL,
  `banner_url` varchar(200) NOT NULL,
  `category_id`   int(10) NOT NULL,
  `create_date`  datetime,
  `jieshao` varchar(18) character set utf8 NOT NULL,
  `banben` varchar(4) character set utf8 NOT NULL,
  `qq` varchar(10) character set utf8 NOT NULL,
  `exp`  varchar(10) character set utf8 NOT NULL,
  PRIMARY KEY  (`id`),
) CHARSET=utf8;

-- 爬虫的历史
CREATE TABLE IF NOT EXISTS `crawl_history` (
  `id` int(10) NOT NULL auto_increment,
  `url` varchar(1024) character set utf8 NOT NULL,
  `http_code` int(3)  NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
) CHARSET=utf8;

