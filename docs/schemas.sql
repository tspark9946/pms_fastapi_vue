CREATE TABLE `HOSPITAL` (
  `HOSPITAL_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `HOSPITAL_NAME` varchar(64) DEFAULT NULL COMMENT 'Hospital name',
  `HOSPITAL_MASTER` varchar(64) DEFAULT NULL COMMENT 'Cheif of all business. Generally, the director of a hospital',
  `HOSPITAL_TEL1` varchar(64) DEFAULT NULL,
  `HOSPITAL_TEL2` varchar(64) DEFAULT NULL,
  `HOSPITAL_CALLBACK_TEL` varchar(64) DEFAULT NULL,
  `HOSPITAL_FAX` varchar(64) DEFAULT NULL,
  `HOSPITAL_EMAIL` varchar(64) DEFAULT NULL,
  `HOSPITAL_ADDRESS1` varchar(127) DEFAULT NULL COMMENT 'Street address, P.O.box',
  `HOSPITAL_ADDRESS2` varchar(127) DEFAULT NULL COMMENT 'unit, building, floor, etc.',
  `HOSPITAL_CITY` varchar(127) DEFAULT NULL COMMENT 'City',
  `HOSPITAL_REGION` varchar(127) DEFAULT NULL COMMENT 'State/Province/Region',
  `HOSPITAL_ZIP` varchar(127) DEFAULT NULL COMMENT 'Zip code',
  `HOSPITAL_INTL_NAME` varchar(64) DEFAULT NULL COMMENT 'HOSPITAL_NAME for international(INTL) documents.',
  `HOSPITAL_INTL_MASTER` varchar(64) DEFAULT NULL,
  `HOSPITAL_INTL_TEL1` varchar(64) DEFAULT NULL,
  `HOSPITAL_INTL_TEL2` varchar(64) DEFAULT NULL,
  `HOSPITAL_INTL_FAX` varchar(64) DEFAULT NULL,
  `HOSPITAL_INTL_EMAIL` varchar(64) DEFAULT NULL,
  `HOSPITAL_INTL_ADDRESS1` varchar(127) DEFAULT NULL,
  `HOSPITAL_INTL_ADDRESS2` varchar(127) DEFAULT NULL,
  `HOSPITAL_INTL_CITY` varchar(127) DEFAULT NULL,
  `HOSPITAL_INTL_REGION` varchar(127) DEFAULT NULL,
  `HOSPITAL_CP_CODE` varchar(32) DEFAULT NULL,
  `HOSPITAL_TIMEZONE` varchar(32) DEFAULT NULL,
  `HOSPITAL_NO_OF_ALLOWABLE_PCS` int(10) DEFAULT NULL,
  `HOSPITAL_NO_OF_ALLOWABLE_MOBILES` int(10) DEFAULT NULL,
  `HOSPITAL_STATUS` tinyint(1) DEFAULT '1' COMMENT '0: Inactive, 1: Active',
  `HOSPITAL_STORAGE_CAPACITY` int(10) DEFAULT '100' COMMENT 'Storage capacity of a hospital, count by Gigabytes',
  `HOSPITAL_STORAGE_USAGE` double DEFAULT '0' COMMENT 'Storage usage of a hospital (Unit: MB)',
  `HOSPITAL_BUSINESS_REGISTRATION_NUMBER` varchar(127) DEFAULT NULL,
  `HOSPITAL_SMS_COUNT` int(10) DEFAULT 0 COMMENT 'Total remaining number of SMS',
  `HOSPITAL_APCODE` VARCHAR(5),
  `HOSPITAL_ACCODE` VARCHAR(5),
  `MEMO` varchar(2000) DEFAULT NULL,
  `RECENT_LOGIN` timestamp NULL DEFAULT NULL,
  `CREATED_BY` int(10) unsigned DEFAULT NULL,
  `CREATION_DATETIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(10) unsigned DEFAULT NULL,
  `MODIFIED_DATETIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `HOSPITAL_DELETED` tinyint(1) DEFAULT '0' COMMENT '0: Normal; 1: Deleted',
  PRIMARY KEY (`HOSPITAL_ID`),
  UNIQUE KEY `HOSPITAL_ID_UNIQUE` (`HOSPITAL_ID`)
) ;


CREATE TABLE `rank` (
  `rank_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(64) DEFAULT NULL COMMENT 'rank name (ex : A, B,C, etc)',
  `rank_default` tinyint(4) DEFAULT 0,
  `order_idx` int(11) DEFAULT NULL,
  `HOSPITAL_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`rank_id`),
  UNIQUE KEY `rank_id_UNIQUE` (`rank_id`),
  KEY `fk_rank_HOSPITAL_ID_idx` (`HOSPITAL_ID`),
  CONSTRAINT `fk_rank_HOSPITAL_ID` FOREIGN KEY (`HOSPITAL_ID`) REFERENCES `HOSPITAL` (`HOSPITAL_ID`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);

CREATE TABLE `sign` (
  `sign_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sign_name` varchar(32) DEFAULT NULL COMMENT 'nickname that used only in hospital (ex. Dr.Lee)',
  `sign_email` VARCHAR(64) COMMENT 'e-mail',
  `sign_password` varchar(255) COMMENT 'password',
  `sign_password_type` int(1) DEFAULT '1' COMMENT '(Deprecated) Encrypted type of password - 0: AES , 1: SHA1',
  `sign_privileges` bigint unsigned NULL DEFAULT NULL COMMENT 'User Privileges',
  `sign_cellphone` varchar(50) DEFAULT NULL COMMENT 'User''s cellphones',
  `sign_license_number` varchar(255) DEFAULT NULL COMMENT '(Deprecated) User License Number',
  `sign_department` varchar(32) DEFAULT NULL COMMENT 'Department of surgery, Accounting department, etc.', 
  `sign_jobtitle` varchar(32) DEFAULT NULL,
  `sign_masteraccount` tinyint(4) DEFAULT 0 COMMENT 'Master account holder',
  `sign_color` int unsigned NOT NULL DEFAULT X'FF7D7D7D',
  `sign_resign` tinyint(4) DEFAULT 0,
  `sign_resigndate` date DEFAULT NULL,
  `created_by` int(10) unsigned NULL DEFAULT NULL,
  `creation_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(10) unsigned NULL DEFAULT NULL,
  `modified_datetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `HOSPITAL_ID` int(10) unsigned NOT NULL,
  `order_idx` int(11) DEFAULT NULL,
  `advice_token` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sign_id`),
  UNIQUE KEY `sign_id_UNIQUE` (`sign_id`),
  KEY `fk_sign_HOSPITAL_ID_idx` (`HOSPITAL_ID`),
  CONSTRAINT `fk_sign_HOSPITAL_ID` FOREIGN KEY (`HOSPITAL_ID`) REFERENCES `HOSPITAL` (`HOSPITAL_ID`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
)

CREATE TABLE `client` (
  `client_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_serial` int(10) unsigned NOT NULL,
  `client_name` varchar(64) DEFAULT NULL,
  `client_zip` varchar(10) DEFAULT NULL COMMENT 'Zip code',
  `client_address1` varchar(127) DEFAULT NULL,
  `client_address2` varchar(127) DEFAULT NULL,
  `client_etc` varchar(127) DEFAULT NULL COMMENT 'Additional notes',
  `client_alert` tinyint(4) DEFAULT NULL COMMENT 'Determine showing client_memo2 with popup or not. 0 : not showing, 1 : Popup only, 2 : Popup with sound',
  `rank_id` int(10) unsigned DEFAULT NULL,
  `client_firstdate` date DEFAULT NULL COMMENT 'first visit',
  `client_debt` decimal(10,2) DEFAULT 0,
  `client_resmoney` decimal(10,2) DEFAULT 0,
  `client_point` decimal(10,2) DEFAULT 0,
  `client_memo1` text COMMENT 'general memo (Plain text)',
  `client_memo1_encoded` text COMMENT 'general memo (Rich text)',
  `client_memo2` text COMMENT 'memo that should not shown to client (Plain text)',
  `client_memo2_encoded` text COMMENT 'memo that should not shown to client (Rich text)',
  `client_state` tinyint(1) DEFAULT 0 COMMENT '0: Normal, 1: Deleted',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_sign_id` int(10) unsigned NULL,
  `created_sign_name` varchar(32) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_sign_id` int(10) unsigned NULL,
  `modified_sign_name` varchar(32) DEFAULT NULL,
  `HOSPITAL_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_id_UNIQUE` (`client_id`),
  KEY `client_serial_idx` (`client_serial`),
  KEY `fk_client_rank_id_idx` (`rank_id`),
  KEY `fk_client_created_sign_id_idx` (`created_sign_id`),
  KEY `fk_client_modified_sign_id_idx` (`modified_sign_id`),
  KEY `fk_client_HOSPITAL_ID_idx` (`HOSPITAL_ID`),
  CONSTRAINT `fk_client_HOSPITAL_ID` FOREIGN KEY (`HOSPITAL_ID`) REFERENCES `HOSPITAL` (`HOSPITAL_ID`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_created_sign_id` FOREIGN KEY (`created_sign_id`) REFERENCES `sign` (`sign_id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
  CONSTRAINT `fk_client_modified_sign_id` FOREIGN KEY (`modified_sign_id`) REFERENCES `sign` (`sign_id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
  CONSTRAINT `fk_client_rank_id` FOREIGN KEY (`rank_id`) REFERENCES `rank` (`rank_id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE
)