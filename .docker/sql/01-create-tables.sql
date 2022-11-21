------------------------------------------------------------------------------ #
-- Version 0.1.0

-- This is a description of the sql file.
-- 	* this is a description
-- 	* this is a description
------------------------------------------------------------------------------ #

USE magento2_developer;

drop table IF exists developer_information;

create table IF not exists developer_information (
	PRIMARY KEY (id),
	id         INT(20)      NOT NULL AUTO_INCREMENT,
	meta       VARCHAR(100) NOT NULL,
	created_at Datetime DEFAULT NULL,
	updated_at Datetime DEFAULT NULL
) engine=innodb charset=utf8mb4 comment='this is the developer test table';

--

USE magento2_report;

drop table IF exists report_information;

create table IF not exists `report_information` (
	PRIMARY KEY (id),
	id         INT(20)      NOT NULL AUTO_INCREMENT,
	meta       VARCHAR(100) NOT NULL,
	created_at Datetime DEFAULT NULL,
	updated_at Datetime DEFAULT NULL
) engine=innodb charset=utf8mb4 comment='this is the reports test table';

--

USE magento2_tests;

drop table IF exists test_information;

create table IF not exists test_information (
	PRIMARY KEY (id),
	id         INT(20)      NOT NULL AUTO_INCREMENT,
	meta       VARCHAR(100) NOT NULL,
	created_at Datetime DEFAULT NULL,
	updated_at Datetime DEFAULT NULL
) engine=innodb charset=utf8mb4 comment='this is the tests test table';