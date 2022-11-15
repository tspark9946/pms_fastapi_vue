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
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_AT` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(10) unsigned NULL DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `HOSPITAL_ID` int(10) unsigned NOT NULL,
  `order_idx` int(11) DEFAULT NULL,
  `advice_token` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sign_id`),
  UNIQUE KEY `sign_id_UNIQUE` (`sign_id`),
  KEY `fk_sign_HOSPITAL_ID_idx` (`HOSPITAL_ID`),
  CONSTRAINT `fk_sign_HOSPITAL_ID` FOREIGN KEY (`HOSPITAL_ID`) REFERENCES `HOSPITAL` (`HOSPITAL_ID`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);

CREATE TABLE `apikeys` (
  `apikeys_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `access_key` varchar(64) NOT NULL ,
  `secret_key` varchar(64) NOT NULL ,
  `user_memo` varchar(40) DEFAULT NULL,
  `status` ENUM('active', 'stopped', 'deleted') DEFAULT 'active',
  `is_whitelisted` tinyint(4) DEFAULT '0' ,
  `sign_id` int(10) unsigned NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`apikeys_id`),
  UNIQUE KEY `apikeys_id_UNIQUE` (`apikeys_id`),
  KEY `fk_apikeys_sign_id_idx` (`sign_id`),
  CONSTRAINT `fk_apikeys_sign_id` FOREIGN KEY (`sign_id`) REFERENCES `sign` (`sign_id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE `apiwhitelists` (
  `apiwhitelists_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_addr` varchar(64) NOT NULL ,
  `apikeys_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`apiwhitelists_id`),
  UNIQUE KEY `apiwhitelists_id_UNIQUE` (`apiwhitelists_id`),
  KEY `fk_apiwhitelists_apikeys_id_idx` (`apikeys_id`),
  CONSTRAINT `fk_apiwhitelists_apikeys_id` FOREIGN KEY (`apikeys_id`) REFERENCES `apikeys` (`apikeys_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE `client` (
  `client_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_serial` int(10) unsigned NOT NULL,
  `client_name` varchar(64) DEFAULT NULL,
  `client_zip` varchar(10) DEFAULT NULL COMMENT 'Zip code',
  `client_address1` varchar(127) DEFAULT NULL,
  `client_address2` varchar(127) DEFAULT NULL,
  `client_email` varchar(64) DEFAULT NULL,
  `client_etc` varchar(127) DEFAULT NULL COMMENT 'Additional notes',
  `client_alert` tinyint(4) DEFAULT NULL COMMENT 'Determine showing client_memo2 with popup or not. 0 : not showing, 1 : Popup only, 2 : Popup with sound',
  `rank_id` int(10) unsigned DEFAULT NULL,
  `client_firstdate` date NOT NULL DEFAULT (CURRENT_DATE) COMMENT 'first visit',
  `client_debt` decimal(10,2) DEFAULT 0,
  `client_resmoney` decimal(10,2) DEFAULT 0,
  `client_point` decimal(10,2) DEFAULT 0,
  `client_memo1` text COMMENT 'general memo (Plain text)',
  `client_memo1_encoded` text COMMENT 'general memo (Rich text)',
  `client_memo2` text COMMENT 'memo that should not shown to client (Plain text)',
  `client_memo2_encoded` text COMMENT 'memo that should not shown to client (Rich text)',
  `client_state` tinyint(1) DEFAULT 0 COMMENT '0: Normal, 1: Deleted',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_sign_id` int(10) unsigned DEFAULT NULL,
  `created_sign_name` varchar(32) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_sign_id` int(10) unsigned DEFAULT NULL,
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
);

CREATE TABLE `tel` (
  `tel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `tel_number` varchar(32) DEFAULT NULL COMMENT 'Contact',
  `tel_name` varchar(64) DEFAULT NULL COMMENT 'Contact name',
  `tel_default` tinyint(4) DEFAULT NULL COMMENT 'Main number or not',
  `tel_type` tinyint(4) NOT NULL COMMENT 'Contact type\n0 : Tel\n1 : Mobile\n2 : E-Mail',
  `tel_allow_phone` tinyint(4) DEFAULT '0' COMMENT 'Allow calls',
  `tel_allow_sms` tinyint(4) DEFAULT '0' COMMENT 'Allow messages',
  `tel_allow_email` tinyint(4) DEFAULT '0' COMMENT 'Allow e-mail',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_sign_id` int(10) unsigned DEFAULT NULL,
  `created_sign_name` varchar(32) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_sign_id` int(10) unsigned DEFAULT NULL,
  `modified_sign_name` varchar(32) DEFAULT NULL,
  `HOSPITAL_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tel_id`,`client_id`),
  UNIQUE KEY `tel_id_UNIQUE` (`tel_id`),
  KEY `fk_tel_client_id_idx` (`client_id`),
  KEY `fk_tel_created_sign_id_idx` (`created_sign_id`),
  KEY `fk_tel_modified_sign_id_idx` (`modified_sign_id`),
  KEY `fk_tel_HOSPITAL_ID_idx` (`HOSPITAL_ID`),
  CONSTRAINT `fk_tel_HOSPITAL_ID` FOREIGN KEY (`HOSPITAL_ID`) REFERENCES `HOSPITAL` (`HOSPITAL_ID`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
  CONSTRAINT `fk_tel_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
  CONSTRAINT `fk_tel_created_sign_id` FOREIGN KEY (`created_sign_id`) REFERENCES `sign` (`sign_id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
  CONSTRAINT `fk_tel_modified_sign_id` FOREIGN KEY (`modified_sign_id`) REFERENCES `sign` (`sign_id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);


// Pet 
CREATE TABLE `LOCALE` (
	`LOCALE_ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`LOCALE_NAME` VARCHAR(16) NULL DEFAULT NULL COMMENT 'Language-Country code (ISO 639-1). For example, \'en-US\' for \'English-Unites States\' \'and ko-KR\' for \'Korean-Korea\'. Please refer to \'ISO_LanguageCode_Table.xlsx\'.' COLLATE 'utf8mb4_unicode_ci',
	`LOCALE_DESC` VARCHAR(64) NULL DEFAULT NULL COMMENT 'Description' COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`LOCALE_ID`) USING BTREE,
	UNIQUE INDEX `LOCALE_ID_UNIQUE` (`LOCALE_ID`) USING BTREE
);

CREATE TABLE `SPECIES` (
  `SPECIES_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SPECIES_IDENTIFIER` varchar(32) DEFAULT NULL COMMENT 'This is a key for SPECIES_NAME.',
  `SPECIES_NAME` varchar(45) DEFAULT NULL ,
    PRIMARY KEY (`SPECIES_ID`),
  UNIQUE KEY `SPECIES_ID_UNIQUE` (`SPECIES_ID`)
) ;


CREATE TABLE `SPECIESLOCALE` (
  `SPECIES_ID` int(10) unsigned NOT NULL,
  `LOCALE_ID` int(10) unsigned NOT NULL,
  `SPECIESLOCALE_NAME` varchar(45) DEFAULT NULL COMMENT 'This could be a localized name like a ''Canine(개)'' or ''con chó''',
  PRIMARY KEY (`SPECIES_ID`, `LOCALE_ID`),
  KEY `fk_SPECIESLOCALE_SPECIES_ID_idx` (`SPECIES_ID`),
  KEY `fk_SPECIESLOCALE_LOCALE_ID` (`LOCALE_ID`),
  CONSTRAINT `fk_SPECIESLOCALE_SPECIES_ID` FOREIGN KEY (`SPECIES_ID`) REFERENCES `SPECIES` (`SPECIES_ID`)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
  CONSTRAINT `fk_SPECIESLOCALE_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `LOCALE` (`LOCALE_ID`)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE `BREED` (
  `BREED_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SPECIES_ID` int(10) unsigned NOT NULL,
  `BREED_NAME` varchar(127) DEFAULT NULL COMMENT 'localized name like a ''삽살개''',
  `BREED_ENGNAME` varchar(127) DEFAULT NULL COMMENT 'English name',
  PRIMARY KEY (`BREED_ID`),
  KEY `fk_BREED_SPECIES_ID_idx` (`SPECIES_ID`),
  CONSTRAINT `fk_BREED_SPECIES_ID` FOREIGN KEY (`SPECIES_ID`) REFERENCES `SPECIES` (`SPECIES_ID`)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE `SEX` (
  `SEX_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SEX_IDENTIFIER` varchar(45) DEFAULT NULL COMMENT 'None, Male, Female, Castrated male, Spayed female',
  `SEX_NAME` varchar(45) DEFAULT NULL ,
  PRIMARY KEY (`SEX_ID`),
  UNIQUE KEY `SEX_ID_UNIQUE` (`SEX_ID`)
);

CREATE TABLE `SEXLOCALE` (
  `SEX_ID` int(10) unsigned NOT NULL,
  `LOCALE_ID` int(10) unsigned NOT NULL,
  `SEXLOCALE_NAME` varchar(45) DEFAULT NULL COMMENT 'localized name like a ''수컷'' or ''giống đực''',
  PRIMARY KEY (`SEX_ID`, `LOCALE_ID`),
  KEY `fk_SEXLOCALE_SEX_ID_idx` (`SEX_ID`),
  KEY `fk_SEXLOCALE_LOCALE_ID` (`LOCALE_ID`),
  CONSTRAINT `fk_SEXLOCALE_SEX_ID` FOREIGN KEY (`SEX_ID`) REFERENCES `SEX` (`SEX_ID`)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
  CONSTRAINT `fk_SEXLOCALE_LOCALE_ID` FOREIGN KEY (`LOCALE_ID`) REFERENCES `LOCALE` (`LOCALE_ID`)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE `TAXFREETYPE` (
  `TAXFREETYPE_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TAXFREETYPE_NAME` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`TAXFREETYPE_ID`)
 );

CREATE TABLE `pet` (
  `pet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `pet_serial` int(10) unsigned NOT NULL,
  `pet_rfid` varchar(64) DEFAULT NULL COMMENT 'Serial number of RFID implanted in the body',
  `pet_rfidtype` tinyint(4) DEFAULT '0' COMMENT '0 : In Body, 1 : Out Body, 2 : Pendent',
  `pet_name` varchar(64) DEFAULT NULL,
  `SPECIES_ID` int(10) unsigned DEFAULT NULL,
  `pet_breed` varchar(48) DEFAULT NULL,
  `SEX_ID` int(10) unsigned DEFAULT NULL,
  `pet_color` varchar(48) DEFAULT NULL COMMENT 'White, White with Black spot, etc...',
  `pet_birth` date DEFAULT NULL COMMENT 'Date of birth',
  `pet_staff1` varchar(32) DEFAULT NULL COMMENT 'Chief',
  `pet_staff2` varchar(32) DEFAULT NULL COMMENT 'Assistant',
  `pet_refer` varchar(127) DEFAULT NULL COMMENT 'If this patient refered from other hospital, user will be input hospital name here. But, most of users using this as additional notes.',
  `pet_firstdate` date NOT NULL DEFAULT (CURRENT_DATE) COMMENT 'first visit',
  `pet_lastdate` date NOT NULL DEFAULT (CURRENT_DATE) COMMENT 'last visit',
  `pet_memo1` text COMMENT 'Plain text of memo',
  `pet_memo1_encoded` text COMMENT 'Encoded(Formatted) text of memo',
  `pet_memo2` text,
  `pet_memo2_encoded` text,
  `pet_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 : Normal, 1 : Deleted, 2 : Dead, 3 : Adopted',
  `pet_alert` tinyint(4) DEFAULT '0',
  `pet_feed` varchar(64) DEFAULT NULL COMMENT 'Staple food',
  `TAXFREETYPE_ID` tinyint(4) unsigned DEFAULT NULL,
  `pet_default` tinyint(4) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_sign_id` int(10) unsigned DEFAULT NULL,
  `created_sign_name` varchar(32) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_sign_id` int(10) unsigned NULL,
  `modified_sign_name` varchar(32) DEFAULT NULL,
  `order_idx` int(11) DEFAULT NULL,
  `HOSPITAL_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pet_id`, `client_id`),
  UNIQUE KEY `pet_id_UNIQUE` (`pet_id`),
  KEY `pet_serial_idx` (`pet_serial`),
  KEY `fk_pet_species_idx` (`SPECIES_ID`),
  KEY `fk_pet_client_id_idx` (`client_id`),
  KEY `fk_pet_sex_id_idx` (`SEX_ID`),
  KEY `fk_pet_TAXFREETYPE_ID_idx` (`TAXFREETYPE_ID`),
  KEY `fk_pet_created_sign_id_idx` (`created_sign_id`),
  KEY `fk_pet_modified_sign_id_idx` (`modified_sign_id`),
  KEY `fk_pet_HOSPITAL_ID_idx` (`HOSPITAL_ID`),
  CONSTRAINT `fk_pet_HOSPITAL_ID` FOREIGN KEY (`HOSPITAL_ID`) REFERENCES `HOSPITAL` (`HOSPITAL_ID`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_SEX_ID` FOREIGN KEY (`SEX_ID`) REFERENCES `SEX` (`SEX_ID`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
  CONSTRAINT `fk_pet_SPECIES_ID` FOREIGN KEY (`SPECIES_ID`) REFERENCES `SPECIES` (`SPECIES_ID`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
  CONSTRAINT `fk_pet_TAXFREETYPE_ID` FOREIGN KEY (`TAXFREETYPE_ID`) REFERENCES `TAXFREETYPE` (`TAXFREETYPE_ID`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
  CONSTRAINT `fk_pet_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_created_sign_id` FOREIGN KEY (`created_sign_id`) REFERENCES `sign` (`sign_id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
  CONSTRAINT `fk_pet_modified_sign_id` FOREIGN KEY (`modified_sign_id`) REFERENCES `sign` (`sign_id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);