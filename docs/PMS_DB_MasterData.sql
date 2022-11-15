/*
PMS365 Web
데이타 베이스 기본 자료 목록

*/
CREATE USER 'pmswebsms'@'%' IDENTIFIED BY 'dn!fl#dps6613';
GRANT EXECUTE, PROCESS, SELECT, SHOW DATABASES, SHOW VIEW, DELETE, EVENT, INDEX, INSERT, REFERENCES, TRIGGER, UPDATE, LOCK TABLES, RELOAD, CREATE TEMPORARY TABLES  ON *.* TO 'pmswebsms'@'%';
FLUSH PRIVILEGES;

INSERT INTO `LOCALE` (`LOCALE_ID`, `LOCALE_NAME`, `LOCALE_DESC`) VALUES 
(1, 'ko-kr', 'Korean'),
(2, 'en-us', 'English(US)');

INSERT INTO `SPECIES` (`SPECIES_ID`, `SPECIES_IDENTIFIER`,`SPECIES_NAME`) VALUES 
(1, 'Canine', '개'),
(2, 'Feline', '고양이'),
(3, 'Rabbit', '토끼'),
(4, 'Equine', '말'),
(5, 'Hedgehog', '고슴도치'),
(6, 'Ferret', '페릿'),
(7, 'Hamster', '햄스터'),
(8, 'Guinea Pig', '기니아피그'),
(9, 'Iguana', '이구아나'),
(10, 'Lizard', '도마뱀'),
(11, 'Snake', '뱀'),
(12, 'Turtle', '거북이'),
(13, 'Avian', '새'),
(14, 'Rodent', '설치류'),
(15, 'Reptile', '양서류'),
(16, 'Bovine', '소'),
(17, 'Swine', '돼지'),
(18, 'Etc.', '기타');
INSERT INTO `SPECIESLOCALE` (`SPECIES_ID`, `LOCALE_ID`, `SPECIESLOCALE_NAME`) VALUES 
(1, 1, '개'),
(2, 1, '고양이'),
(3, 1, '토끼'),
(4, 1, '말'),
(5, 1, '고슴도치'),
(6, 1, '페릿'),
(7, 1, '햄스터'),
(8, 1, '기니아피그'),
(9, 1, '이구아나'),
(10, 1, '도마뱀'),
(11, 1, '뱀'),
(12, 1, '거북이'),
(13, 1, '새'),
(14, 1, '설치류'),
(15, 1, '양서류'),
(16, 1, '소'),
(17, 1, '수생동물'),
(18, 1, '기타'),
(1, 2, 'Canine'),
(2, 2, 'Feline'),
(3, 2, 'Rabbit'),
(4, 2, 'Equine'),
(5, 2, 'Hedgehog'),
(6, 2, 'Ferret'),
(7, 2, 'Hamster'),
(8, 2, 'Guinea Pig'),
(9, 2, 'Iguana'),
(10, 2, 'Lizard'),
(11, 2, 'Snake'),
(12, 2, 'Turtle'),
(13, 2, 'Avian'),
(14, 2, 'Rodent'),
(15, 2, 'Reptile'),
(16, 2, 'Bovine'),
(17, 2, 'Aquatic'),
(18, 2, 'Etc.');

INSERT INTO `service` (`name`,`config`,`is_default`) VALUES
('standard','{\"woorien_mobile\":{\"parent_check\":false,\"child_check\":{}},\"hospital_manager\":{\"parent_check\":false,\"child_check\":{\"crm\":false,\"operation\":true,\"sales\":true,\"expenses\":true,\"scm\":true}}}',1),
('premium','{\"woorien_mobile\":{\"parent_check\":true,\"child_check\":{}},\"hospital_manager\":{\"parent_check\":true,\"child_check\":{\"crm\":true,\"operation\":true,\"sales\":true,\"expenses\":true,\"scm\":true}}}',0),
('platinum','{\"woorien_mobile\":{\"parent_check\":false,\"child_check\":{}},\"hospital_manager\":{\"parent_check\":false,\"child_check\":{\"crm\":true,\"operation\":true,\"sales\":false,\"expenses\":false,\"scm\":false}}}',0);

INSERT INTO `DOMAIN` (DOMAIN_ID, DOMAIN_NAME) VALUES (1, 'RESERVED');
INSERT INTO `HOSPITAL` (HOSPITAL_ID, DOMAIN_ID, HOSPITAL_NAME, HOSPITAL_MASTER, service_id) VALUES (1, 1, 'Woorien', 'Woorien', 3);

INSERT INTO PLANTYPE VALUES(1, 'Examination');
INSERT INTO PLANTYPE VALUES(2, 'Vaccination');
INSERT INTO PLANTYPE VALUES(3, 'Grooming');
INSERT INTO PLANTYPE VALUES(4, 'Merchandise');
INSERT INTO PLANTYPE VALUES(5, 'Hospitalization');
INSERT INTO PLANTYPE VALUES(6, 'Lodging');

INSERT INTO PLANTYPELOCALE VALUES
(1, 1, '진료'),
(2, 1, '백신'),
(3, 1, '미용'),
(4, 1, '용품'),
(5, 1, '입원'),
(6, 1, '호텔'),
(1, 2, 'Examination'),
(2, 2, 'Vaccination'),
(3, 2, 'Grooming'),
(4, 2, 'Merchandise'),
(5, 2, 'Hospitalization'),
(6, 2, 'Lodging');

INSERT INTO SCHEDULETYPE VALUES
(1, 'Schedule'),
(2, 'Follow Up'),
(3, 'Call'),
(4, 'Private'),
(5, 'Beauty'),
(6, 'Vaccine');
INSERT INTO SCHEDULETYPELOCALE VALUES
(1, 1, '일반 예약'),
(2, 1, 'Follow Up'),
(3, 1, '통화 예정'),
(4, 1, '개인 일정'),
(5, 1, '미용 예약'),
(6, 1, 'Vaccine'),
(1, 2, 'Schedule'),
(2, 2, 'Follow Up'),
(3, 2, 'Call'),
(4, 2, 'Private'),
(5, 2, 'Beauty'),
(6, 2, 'Vaccine');
  
INSERT INTO `SEX` (`SEX_ID`, `SEX_IDENTIFIER`, `SEX_NAME`) VALUES 
(1, 'Male', '수컷'),
(2, 'Female', '암컷'),
(3, 'Castrated male', '중성화 수컷'),
(4, 'Spayed female', '중성화 암컷'),
(5, 'Unknown', '알수없음');

INSERT INTO `SEXLOCALE` (`SEX_ID`, `LOCALE_ID`, `SEXLOCALE_NAME`) VALUES 
(1, 1, 'Male'),
(2, 1, 'Female'),
(3, 1, 'Castrated male'),
(4, 1, 'Spayed female'),
(5, 1, 'Unknown'),
(1, 2, 'Male'),
(2, 2, 'Female'),
(3, 2, 'Castrated male'),
(4, 2, 'Spayed female'),
(5, 2, 'Unknown');

INSERT INTO `UNIT` (`UNIT_ID`, `LOCALE_ID`, `UNIT_NAME`) VALUES 
(1, 1, '초'),
(2, 1, '분'),
(3, 1, '시간'),
(4, 1, '일'),
(5, 1, '주'),
(6, 1, '개월'),
(7, 1, '년'),
(1, 2, 'sec(s)'),
(2, 2, 'mins(s)'),
(3, 2, 'hours(s)'),
(4, 2, 'day(s)'),
(5, 2, 'week(s)'),
(6, 2, 'month(s)'),
(7, 2, 'year(s)');

INSERT INTO `CONFIGITEM` (`CONFIGITEM_NAME`, `CONFIGITEM_TYPE`) VALUES
('DataSharingInDomain', 0),
('ApplicationTitle', 0),
('UseDebugLog', 1),
('LogToFile', 1),
('UseSharedFrame', 1),
('MainFrame.Top', 1),
('MainFrame.Left', 1),
('MainFrame.Width', 1),
('MainFrame.Height', 1),
('MainFrame.Desktop_Name', 1),
('MainFrame.Desktop_Resolution', 1),
('SMS.AutoSendTerminal', 0),
('MainFrame.Thread.MessageQueueSleepInterval', 1),
('MainFrame.Thread.MessageQueuePopInterval', 1),
('Order.DisplayType', 1),
('Schedule.ScheduleListSingleDate', 1),
('Schedule.UseHistoryDateSync', 1),
('Schedule.DetailRectAnimation', 1),
('Schedule.HideCompleted', 1),
('Schedule.ShowPetName', 1),
('Schedule.BarColor.ColorBy', 1),
('Schedule.BarColor.Reserve', 1),
('Schedule.BarColor.Beauty', 1),
('Schedule.BarColor.Followup', 1),
('Schedule.BarColor.Contact', 1),
('Schedule.BarColor.Private', 1),
('Schedule.BarColor.Vaccine', 1),
('Schedule.ScheduleDisplaySignIDs', 1),
('SMS.MergeFlag', 0),
('SMS.DisplayFlag', 0),
('SMS.MainNumberOnly', 0),
('NIMS.Key', 0),
('NIMS.Code', 0),
('NIMS.DefaultStorage', 0),
('NIMS.HospName', 0),
('NIMS.Charge', 0),
('NIMS.OfficeCode', 0),
('NIMS.OfficeName', 0),
('NIMS.ID', 0),
('ChartList.ShowImageCount', 1),
('ChartList.ShowTRXFlag', 1),
('ChartList.ShowVaccine', 1),
('ChartList.ShowBeauty', 1),
('ChartList.ShowHosp', 1),
('ChartList.ShowLab', 1),
('ChartList.ShowItem', 1),
('ChartList.ShowAttachedFile', 1),
('ChartList.ShowDrugTaking', 1),
('ChartList.CopySubjective', 1),
('ChartList.CopyTRX', 1),
('ThermalPrinter.DirectSend', 1),
('ThermalPrinter.PrintBarCode', 0),
('ThermalPrinter.ComPort', 1),
('ThermalPrinter.Driver', 1),
('ThermalPrinter.Use', 1),
('ThermalPrinter.Receipt', 0),
('ThermalPrinter.RxPrint', 0),
('Network.ReceiveLabCompleted', 1),
('CID.ReceiveCIDInfo', 1),
('CID.ShowCIDAsBalloon', 1),
('CID.AutoClose', 1),
('Messanger.Popup', 1),
('Messanger.SoundAlert', 1),
('Messanger.AllowDomain', 0),
('Receipt.PrintPoint', 0),
('Receipt.PrintDebt', 0),
('Receipt.DoNotShowTax', 0),
('Receipt.UseA4', 0),
('Receipt.AlarmOnNew', 1),
('Receipt.SendToReceiptReady', 0),
('Receipt.IgnoreHospPet', 0),
('Receipt.DefaultPayMethod', 1),
('Receipt.ShowInfoPanel', 1),
('Receipt.ShowWithVAT', 1),
('Receipt.TrimDC', 0),
('Receipt.DISCOUNT.DiscountByRank', 0),
('Receipt.POINT.OnlyCash', 0),
('Receipt.TaxTrimOption', 0),
('TRX.RxPrintAll', 1),
('TRX.TxPrint', 1),
('TRX.VaccinePrint', 1),
('TRX.UseGridRxPrint', 1),
('TRX.AutoStartSearch', 1),
('TRX.PrintSign', 1),
('Hosp.ShowAllRoom', 1),
('Hosp.CurrFloor', 1),
('Hosp.DisplayByType', 1),
('Vaccination.MouseAction.DblClick', 1),
('Lab.LabTableDESC', 1),
('Vaccination.LastIdxPrint', 1),
('TRX.COL_DOSE', 1),
('TRX.COL_CODE', 1),
('TRX.COL_TC', 1),
('TRX.COL_DAY', 1),
('TRX.COL_DAYS', 1),
('TRX.COL_TOTAL', 1),
('TRX.COL_ROUTE', 1),
('TRX.COL_SIGN', 1),
('TRX.COL_PRICE', 1),
('TRX.UseGrid', 1),
('TRX.AutoCalcWhenPaste', 1),
('TRX.RecreatePlanGrid', 1),
('CID.ListMaxNum', 0),
('CIDAPI.Provider', 1),
('CIDAPI.KT.ID', 1),
('CIDAPI.KT.PW', 1),
('CIDAPI.KTC.Tel', 1),
('CIDAPI.KTC.ID', 1),
('CIDAPI.KTC.PW', 1),
('CIDAPI.LG.DSCServer', 1),
('CIDAPI.LG.ID', 1),
('CIDAPI.LG.PW', 1),
('CIDAPI.LG.IMS', 1),
('CIDAPI.SK.Key', 1),
('CIDAPI.SK.ID', 1),
('CIDAPI.SK.PW', 1),
('CIDAPI.SK_IMS.Key', 1),
('CIDAPI.SK_IMS.ID', 1),
('CIDAPI.SK_IMS.PW', 1),
('Awaiter.UseClientMonitor', 1),
('Awaiter.UseTermAsCaller', 1),
('Awaiter.OrderByDESC', 1),
('Awaiter.ShowType', 1),
('Awaiter.ShowAll', 1),
('Awaiter.ShowPetSerial', 1),
('RTF.LastUsedFormat', 1),
('ChartList.DefaultEditor', 1),
('ChartList.AddChartAndDesc', 1),
('ChartList.TxReadyAlert', 1),
('ChartList.ImportApp', 1),
('ChartList.ImportFrom', 1),
('Pay.HideZeroPay', 1),
('Pay.ShowHideZeroPay', 1),
('Receipt.PutDebtToEdit', 0),
('Receipt.RecpAfterPrint', 1),
('Receipt.RecpAfterClose', 1),
('ORDER.UsePID', 0),
('MainFrame.UseCommuteLog', 0),
('History.ShowMed', 1),
('History.ShowBeauty', 1),
('History.ShowVital', 1),
('History.ShowVaccine', 1),
('History.ShowHosp', 1),
('History.ShowLab', 1),
('History.LastSelected', 1),
('Register.ShowIncompletedPay', 1),
('Register.DoNotShowUnavailablePet', 1),
('Register.ShowPayTotal', 1),
('LocalCachePath', 1),
('SharedCachePath', 1),
('SharedCache_Username', 1),
('SharedCache_Password', 1),
('ChartList.SetTreatOnCreateChart', 0),
('Stock.ShowNIMSDrugFirst', 1),
('TRX.TxColor', 1),
('TRX.RxColor', 1),
('Outpatient.ShowType', 1),
('MainFrame.SearchWithLargeField', 1),
('TRX.ColorAsBG', 1);

INSERT INTO `SUBJECT` VALUES
(1, 'MG', 1),
(2, 'GS', 2),
(3, 'OS', 3),
(4, 'DR', 4),
(5, 'ENT', 5),
(6, 'EY', 6),
(7, 'OB', 7),
(8, 'CP', 8);

INSERT INTO `SUBJECTLOCALE` VALUES
(1, 1, '내과'),
(1, 2, 'Medicus Gratus'),
(2, 1, '외과'),
(2, 2, 'General Surgery'),
(3, 1, '정형외과'),
(3, 2, 'OrthoSurgery'),
(4, 1, '피부과'),
(4, 2, 'Dermatology'),
(5, 1, '이비인후과'),
(5, 2, 'Ear, Nose & Throat'),
(6, 1, '안과'),
(6, 2, 'Eye'),
(7, 1, '산과'),
(7, 2, 'Obstetrics'),
(8, 1, '임상병리과'),
(8, 2, 'Clinical Pathology');

INSERT INTO `VENDORINDEX` (VENDORINDEX_CHAR, VENDORINDEX_CONDITION, VENDORINDEX_ORDER, LOCALE_ID) VALUES
('ㄱ', 'between \'가\' and \'나\'', 1, 1),
('ㄴ', 'between \'나\' and \'다\'', 1, 1),
('ㄷ', 'between \'다\' and \'라\'', 1, 1),
('ㄹ', 'between \'라\' and \'마\'', 1, 1),
('ㅁ', 'between \'마\' and \'바\'', 1, 1),
('ㅂ', 'between \'바\' and \'사\'', 1, 1),
('ㅅ', 'between \'사\' and \'아\'', 1, 1),
('ㅇ', 'between \'아\' and \'자\'', 1, 1),
('ㅈ', 'between \'자\' and \'차\'', 1, 1),
('ㅊ', 'between \'차\' and \'카\'', 1, 1),
('ㅋ', 'between \'카\' and \'타\'', 1, 1),
('ㅌ', 'between \'타\' and \'파\'', 1, 1),
('ㅍ', 'between \'파\' and \'하\'', 1, 1),
('ㅎ', 'between \'하\' and \'힣\'', 1, 1),
('A', 'like \'a%\'', 1, 2),
('B', 'like \'b%\'', 1, 2),
('C', 'like \'c%\'', 1, 2),
('D', 'like \'d%\'', 1, 2),
('E', 'like \'e%\'', 1, 2),
('F', 'like \'f%\'', 1, 2),
('G', 'like \'g%\'', 1, 2),
('H', 'like \'h%\'', 1, 2),
('I', 'like \'i%\'', 1, 2),
('J', 'like \'j%\'', 1, 2),
('K', 'like \'k%\'', 1, 2),
('L', 'like \'l%\'', 1, 2),
('M', 'like \'m%\'', 1, 2),
('N', 'like \'n%\'', 1, 2),
('O', 'like \'o%\'', 1, 2),
('P', 'like \'p%\'', 1, 2),
('Q', 'like \'q%\'', 1, 2),
('R', 'like \'r%\'', 1, 2),
('S', 'like \'s%\'', 1, 2),
('T', 'like \'t%\'', 1, 2),
('U', 'like \'u%\'', 1, 2),
('V', 'like \'v%\'', 1, 2),
('W', 'like \'w%\'', 1, 2),
('X', 'like \'x%\'', 1, 2),
('Y', 'like \'y%\'', 1, 2),
('Z', 'like \'z%\'', 1, 2);

INSERT INTO `TAXFREETYPE` VALUES
(1,  '가. 가측'),
(2,  '나. 수산동물'),
(3,  '다. 장애인 보조견'),
(4,  '라. 기초수급자가 기르는 동물');

INSERT INTO `DENTSPECIES` (`DENTSPECIES_ID`, `DENTSPECIES_NAME`)
VALUES 
  (1, 'Canine'),
  (2, 'Feline'),
  (3, 'ETC'),
  (4, 'BiteWings');
  
INSERT INTO `DENTPOS` (`DENTPOS_ID`, `DENTSPECIES_ID`, `DENTPOS_NAME`, `DENTPOS_INDEX`)
VALUES 
  (1, 1, 'ETC', 0),
  (2, 1, '[UR]CAN', 1),
  (3, 1, '[U]INC', 2),
  (4, 1, '[UL]CAN', 3),
  (5, 1, '[UL]PM-M', 4),
  (6, 1, '[LL]PM-M', 5),
  (7, 1, '[LL]CAN', 6),
  (8, 1, '[L]INC', 7),
  (9, 1, '[LR]CAN', 8),
  (10, 1, '[LR]M-PM', 9),
  (11, 1, '[UR]M-PM', 10),
  (12, 2, 'ETC', 0),
  (13, 2, '[U]INC', 1),
  (14, 2, '[UL]PM-M', 2),
  (15, 2, '[LL]PM-M', 3),
  (16, 2, '[L]INC', 4),
  (17, 2, '[LR]M-PM', 5),
  (18, 2, '[UR]M-PM', 6),
  (19, 3, 'ETC', 0),
  (20, 3, '[ETC] U', 1),
  (21, 3, '[ETC] R', 2),
  (22, 3, '[ETC] D', 3),
  (23, 3, '[ETC] L', 4),
  (24, 4, 'ETC', 0),
  (25, 4, '[BW] 1', 1),
  (26, 4, '[BW] 2', 2),
  (27, 4, '[BW] 3', 3),
  (28, 4, '[BW] 4', 4);

INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아펜핀셔', 'Affenpinscher');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아프간 하운드', 'Afghan Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아이누견', 'Ainu Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '에어데일 테리어', 'Airedale Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아카시바 도그', 'Akbash Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아키타', 'Akita');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아키타', 'Akita');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '알래스칸 맬러뮤트', 'Alaskan Malamute');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '알핀 닥스브라케', 'Alpine Dachsbracke');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아메리칸 블랙 앤 쿤하운드', 'American Black and Tan Coonhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아메리칸 불독', 'American Bulldog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아메리칸 에스키모 도그', 'American Eskimo Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아메리칸 폭스하운드', 'American Foxhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아메리칸 핏 불 테리어', 'American Pit Bull Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아메리칸 스테포드셔 테리어', 'American Staffor dshire Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아메리칸 스태퍼드셔 테리어', 'American Staffordshire Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아메리칸 워터 스패니얼', 'American Water Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아나톨리안 카라바시 도그', 'Anatolian Karabash Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아나톨리아 셰퍼드 도그', 'Anatolian Shepherd Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '앵글로 프랑세즈', 'Anglos-Francaises');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아펜젤러', 'Appenzeller');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아리에쥬아', 'Ariegeois');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '오스트레일리언 캐틀 도그', 'Australian Cattle Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '오스트레일리안 켈피', 'Australian Kelpie');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '오스트레일리언 셰퍼드', 'Australian Shepherd');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '오스트레일리언 테리어', 'Australian Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '오스트리아 브랜들브라케', 'Austrian Brandlbracke');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '오스트리아 숏트헤어드 핀셔', 'Austrian Shorthaired Pinscher');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아자와크', 'Azawakh');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '발리 마운틴 도그', 'Bali Mountain Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '바르베', 'Barbet');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '바센지', 'Basenji');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '바셋 아르테지안 노르만', 'Basset Artesien Normand');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '바셋 하운드', 'Basset Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '바셋 아르테지안 노르만', 'Bavarian Artesien Normand');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '바바리안 마운틴 하운드', 'Bavarian Mountain Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '비글 해리어', 'Beagle Harrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '비글', 'Beagle');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '비어디드 콜리', 'Bearded Collie');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '베르제 드 보스', 'Bearger de Beauce');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '보스롱', 'Beauceron');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '베들링턴 테리어', 'Bedlington Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '벨지안 그리퐁', 'Belgian Griffons');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '벨기에 말리노이즈', 'Belgian Malinois');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '벨기에 시프도그', 'Belgian Sheepdog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '벨지안 쉽도그', 'Belgian Sheepdogs');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '벨기에 테뷰런', 'Belgian Tervuren');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '벨가마스코', 'Bergamasco');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '베르제 드 피카르', 'Berger de Picard');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '베르제 드 피레네즈', 'Berger des Pyenees');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '버니즈 마운틴 도그', 'Bernese Mountain Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '비숑 프리제', 'Bichon Frise');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '빌리', 'Billy');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '블랙 앤드 탄 쿤하운드', 'Black and Tan Coonhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '블랙 러시안 테리어', 'Black Russian Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '블루 드 가스코뉴', 'Bleus de Gascogne');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '블러드 하운드', 'Bloodhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '블루틱 쿤하운드', 'Bluetick Coonhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '볼로그네제', 'Bolognese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '보더 콜리', 'Border Collie');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '보더 테리어', 'Border Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '보르조이', 'Borzoi');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '보스턴 테리어', 'Boston Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '부비에 데 플랑드르', 'Bouvier des Flandres');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '복서', 'Boxer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '보이킨 스파니엘', 'Boykin Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '브라꼬 이탈리아노', 'Bracco Italiano');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '브라크 다 리에쥐', 'Braque d''Ariege');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '브라크 도 베르뉴', 'Braque d''Auvergne');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '브라크 뒤 부르보네', 'Braque du Bourbonnais');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '브라크 뒤퓌이', 'Braque Duppy');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '브라크 프랑세', 'Braque Francaises');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '브라크 생-제르맹', 'Braque Saint-German');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '브리아드', 'Briard');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '브리타니', 'Brittany');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '브뤼셀 그리펀', 'Brussels Griffon');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '불 테리어', 'Bull Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '불도그', 'Bulldog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '불 마스티프', 'Bullmastiff');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '케언 테리어', 'Cairn Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '케이넌 도그', 'Canaan Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '카오 다 세라 데 아이레스', 'Cao da Serra de Aires');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '카오 데 카스트로 라보레이로', 'Cao de Castro Laboreiro');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '카디건 웰시 코기', 'Cardigan Welsh Corgi');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '카탈란 쉽도그', 'Catalan Sheepdog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '코카시안 오브차카', 'Caucasian Ovtcharka');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '카발리에 킹 찰스 스패니얼', 'Cavalier King Charles Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '체스키 포섹', 'Cesky Fousek');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '체서피크 베이 레트리버', 'Chesapeake Bay Retriever');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '시앵 프랑세즈', 'Chien d''Artois');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '시앵 드 라틀라(스', 'Chien de I''Atlas)');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '시잉 프랑세즈', 'Chien Francaises');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '치와와', 'Chihuahua');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '차이니스 크레스티드', 'Chinese Crested');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '차이니스 샤페이', 'Chinese Shar-pei');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '호르타이', 'Chortaj');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '차우차우', 'Chow Chow');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '시르네코 델레트나', 'Cirneco dell''Etna');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '클럼버 스파니엘', 'Clumber Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '클럼버 스패니얼', 'Clumber Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '코커 스패니얼', 'Cocker Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '콜리', 'Collie');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '콘티넬탈 토이 스파니엘', 'Continental Toy Spaniels');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '꼬통 드 툴레아', 'Coton de Tulear');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '크로아티안 쉽도그', 'Croatian Sheepdog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '컬리코티드 레트리버', 'Curly-Coated Retriever');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '체스키 테리어', 'Czesky Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '닥스훈트', 'Dachshund');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '달마티안', 'Dalmatian');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '댄디 딘몬트 테리어', 'Dandie Dinmont Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '대니쉬 브로홀머', 'Danish Broholmer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '도이치 브라케', 'Deutsche Bracke');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '도이체르 바흐텔훈트', 'Deutscher Wachtelhund');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '딩고', 'Dingo');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '도베르만 핀셔', 'Dobermann Pinscher');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '도고 아르젠티노', 'Dogo Argentino');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '도그 드 보르도', 'Dogue de Bordeaux');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '도사견', 'DOSA');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '드렌체 파트리죤드', 'Drentse Patrijshond');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '드레버', 'Drever');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '던커', 'Dunker');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '더치 세퍼드', 'Dutch Shepherds');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '더치 스무숀드', 'Dutoh Smoushond');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '잉글리쉬 코커', 'E.Cocker Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '이스트 러시안 코오싱 하운드', 'East Russian Coursing Hounds');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '엘크하운드', 'Elkhounds');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '잉글리시 코커 스패니얼', 'English Cocker Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '잉글리쉬 쿤하운드', 'English Coonhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '잉글리시 폭스하운드', 'English Foxhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '잉글리시 세터', 'English Setter');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '잉글리쉬 세퍼드', 'English Shepherd');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '잉글리시 스프링어 스패니얼', 'English Springer Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '잉글리시 토이 스패니얼', 'English Toy Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '엔텔부쳐', 'Entelbucher');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '에피뉴엘 프랑세', 'Epagneul Francais');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '에파뉴엘 파카르디', 'Epagneul Picardies');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '에피뉴엘 퐁 오드메', 'Epagneul Pont-Audemer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '에스키모 도그', 'Eskimo Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '에스토니아 하운드', 'Estonian Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '에스트렐라 마운틴 도그', 'Estrela Mountain Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '유라시안', 'Eurasian');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '포브 드 브르타뉴', 'Fauves de Bretagne');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '필드 스패니얼', 'Field Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '필라 브라질레이로', 'Fila Brasileiro');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '피니쉬 하운드', 'Finnish Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '피니시 스피츠', 'Finnish Spitz');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '플랫코티드 레트리버', 'Flat-Coated Retriever');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  'Smooth', 'Fox Terrier (Smooth)');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  'Wire', 'Fox Terrier (Wire)');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '프렌치 불도그', 'French Bulldog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '갈고 에스파뇨르', 'Galgo Espanol');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '가스콩-생통주아', 'Gascons-Saintongeois');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '져먼 헌트 테리어', 'German Hunting Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '져먼 롱헤어드 포인터', 'German Longhaired Pointer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '저먼 핀셔', 'German Pinscher');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '저먼 셰퍼드 도그', 'German Shepherd Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '저먼 쇼트헤어드 포인터', 'German Shorthaired Pointer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '져먼 스피츠', 'German Spitz');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '저먼 와이어헤어드 포인터', 'German Wirehaired Pointer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '자이언트 슈나우저', 'Giant Schnauzer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '글렌 오브 이말 테리어', 'Glen of Imaal Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '골든 레트리버', 'Golden Retriever');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '고든 세터', 'Gordon Setter');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '그레이트 데인', 'Great Dane');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '그레이트 피레네', 'Great Pyrenees');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '그레이터 스위스 마운틴 도그', 'Greater Swiss Mountain Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '그릭 헤어하운드', 'Greek Harehound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '그린랜드 도그', 'Greenland Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '그레이하운드', 'Greyhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '그리퐁 방뎅', 'Griffon Vendeens');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '할델스퇴바레', 'Haldenstovare');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '해밀톤스퇴바레', 'Hamiltonstovare');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '해리어', 'Harrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '허배너스', 'Havanese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '호바와트', 'Hovawart');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '하이젠훈트', 'Hygenhund');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '이비전 하운드', 'Ibizan Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아이슬란드 도그', 'Iceland Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '잉카 헤어리스 도그', 'Inca Hairless Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아이리쉬 레드 앤 화이트 세터', 'Irish Red and White Setter');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아이리시 세터', 'Irish Setter');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아이리시 테리어', 'Irish Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아이리시 워터 스패니얼', 'Irish Water Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '아이리시 울프 하운드', 'Irish Wolfhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '이탤리언 그레이하운드', 'Italian Greyhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '잭 러셀 테리어', 'Jack Russell Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '재퍼니스 친', 'Japanese Chin');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '제페니즈 미들 사이즈 도그', 'Japanese Middle Size Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '제페니즈 스피츠', 'Japanese Spitz');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '제페니즈 테리어', 'Japaness Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '진도개', 'Jindo Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '카레리언 베어 라이카', 'Karelian Bear Laikas');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '카렐로-피니쉬 라이카', 'Karelo-Finnish Laika');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '케이스혼트', 'Keeshond');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '케리 블루 테리어', 'Kerry Blue Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '기주견', 'Kijuken');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '코몬도르', 'Komondor');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '쿠이커혼제', 'Kooikerhondje');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '크라스키 오브카', 'Krasky Ovcar');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '크롬포흘뢴더', 'Kromfohrlander');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '쿠바스', 'Kuvasz');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '래브라도 레트리버', 'Labrador Retriever');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '레이크랜드 테리어', 'Lakeland Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '랭카셔 힐러', 'Lancashire Heeler');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '렌드시어', 'Landseer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '랩핀포로코이라', 'Lapinporokoira');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '라프훈트', 'Lapphunds');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '라트비안 하운드', 'Latvian Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '레온베르거', 'Leonberger');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '르베스크', 'Levesque');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '라사압소', 'Lhasa Apso');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '리트아니안 하운드', 'Lithuanian Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '로첸', 'Lowchen');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '룬데훈트', 'Lundehund');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '마쟈르 아가르', 'Magyar Agar');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '몰티즈', 'Maltese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '맨체스터 테리어', 'Manchester Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '마렘마 쉽도그', 'Maremma Sheepdog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '마르키쉬에', 'Markiesje');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '마스티프', 'Mastiff');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '미니어처 불 테리어', 'Miniature Bull Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '미니어처 핀셔', 'Miniature Pinscher');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '미니어처 슈나우저', 'Miniature Schnauzer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '미들 아시안 오브차카', 'Middle Asian Ovtcharka');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '혼합', 'Mongrel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '모스크바 와치도그', 'Moscow Watchdog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '무디', 'Mude');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '뮨스터랜드', 'Munsterlanders');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '네오폴리탄 마스티프', 'Neopolitan Mastiff');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '뉴 기니아 싱잉 도그', 'New Guinea Singing Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '뉴펀들랜드', 'Newfoundland');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '노르보텐 스피츠', 'Norbottenspets');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '노퍽 테리어', 'Norfolk Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '노르웰지안 부훈트', 'Norwegian Buhund');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '노르웨이 엘크 하운드', 'Norwegian Elkhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '노리치 테리어', 'Norwich Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '노바 스코셔 덕 톨링 레트리버', 'Nova Scotia Duck Tolling Retriever');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '올드 데니쉬 버드 도그', 'Old Danish Bird Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '올드 잉글리시 시프도그', 'Old English Sheepdog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '올드 잉글리쉬 불독', 'Olde English Bulldog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '오터 하운드', 'Otter hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '오우짜렉 포드할안스키', 'Owczarek Podhalanski');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '파피용', 'Papillon');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '페키니즈', 'Pekingese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '펨브록 웰시 코기', 'Pembroke Welsh Corgi');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '뻬르디구에로 포르투구에소', 'Perdiguero Portugueso');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '뻬르로 드 파스토르 말로르퀸', 'Perro de Pastor Mallor quin');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '뻬르로 드 쁘레샤 카나리오', 'Perro de Presa Canario');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '뻬르로 드 쁘레샤 말로르퀸', 'Perro de Presa Mallorquin');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '페루비안 잉카 오키드', 'Peruvian Inca Orchid');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '프티 바세 그리퐁 방댕', 'Petit Basset Griffon Vendeen');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '파라오 하운드', 'Pharaoh Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '플롯 하운드', 'Plott Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '뽀덴고 포르투구에소', 'Podengo Portuguesos');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '포인터', 'Pointer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '프와트뱅', 'Poitevin');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '폴리쉬 그레이 하운드', 'Polish Greyhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '폴리쉬 하운드', 'Polish Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '폴리시 롤런드 시프도그', 'Polish Lowland Sheepdog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '포메라니안', 'Pomeranian');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '푸들', 'Poodle');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '포르셀엔', 'Porcelaine');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '포르투갈 워터 도그', 'Portuguese Water Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '푸델 포인터', 'Pudelpointer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '퍼그', 'Pug');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '풀리', 'Puli');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '푸미', 'Pumi');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '풍산견', 'Pungsan Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '피레니안 마스티프', 'Pyrenean Mastiff');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '라페이로 도 알렌테조', 'Rafeiro do Alentezo');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '레드본 쿤하운드', 'Redbone Coonhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '로디지아 리지백', 'Rhodesian Ridgeback');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '로트와일러', 'Rottweiler');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '러시안 할리퀸 하운드', 'Russian Harlequin Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '러시안 하운드', 'Russian Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '러시안 스파니엘', 'Russian Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '사르로스울프 하운드', 'Saarlooswolfhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '사부에소 에소파뇰', 'Sabuesos Espanoles');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '세인트 버나드', 'Saint Bernard');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '살루키', 'Saluki');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '사모예드', 'Samoyed');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '삽살개', 'Sapsaree');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '사플라니낙', 'Sarplaninac');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '삭펜도스', 'Schapendoes');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스첼스퇴바레', 'Schillerstovare');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스키퍼키', 'Schipperke');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '슈나우져', 'Schnauzers');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스코티시 디어하운드', 'Scottish Deerhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스코티시 테리어', 'Scottish Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '실리엄 테리어', 'Sealyham Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '세구지오 이탈리아노', 'Segugios Italianos');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '셰터', 'Setter');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '샤페이', 'Shar-Pei');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '셔틀랜드 시프도그', 'Shetland Sheepdog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '시바 이누', 'Shiba Inu');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '시추', 'Shih Tzu');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '시베리언 허스키', 'Siberian Husky');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '시베리안 라이카', 'Siberian Laikas');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '실키 테리어', 'Silky Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스카이 테리어', 'Skye Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '슬루기', 'Sloughi');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '슬로바크 쿠바', 'Slovak Cuvas');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '슬로바키안 하운드', 'Slovakian Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '소프트 코티드 휘튼 테리어', 'Soft Coated Wheaten Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '사우스 러시안 오브차카', 'South Russian Ovtcharka');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스페니쉬 마스티프', 'Spanish Mastiff');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스페니쉬 포인터', 'Spanish Pointer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스피노네 이탈리아노', 'Spinone Italiano');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스피노네 이탈리아노', 'Spinone Italiano');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스피츠', 'spitz');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스테비 훈', 'Stabyhoun');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스테포드셔 불 테리어', 'Staffor dshire Bull Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스태퍼드셔 불 테리어', 'Staffordshire Bull Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스탠더드 슈나우저', 'Standard Schnauzer');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스티첼할', 'Stichelhaar');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스트렐루프스퇴바레', 'Strellufstover');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스틸리안 마운틴 하운드', 'Styrian Roughhaired Mountain Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '서식스 스패니얼', 'Sussex Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '스위스 하운드', 'Swiss Hounds');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '텔로미언', 'Telomian');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '티벳탄 마스티프', 'Tibetan Mastiff');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '티벳탄 스파니엘', 'Tibetan Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '티벳탄 테리어', 'Tibetan Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '토이 폭스 테리어', 'Toy Fox Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '트랜실바니안 하운드', 'Transylvanian Hound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '트링 워커 쿤하운드', 'Treeing Walker Coonhound');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '티롤러 브라케', 'Tyroler Bracke');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '바스코타 스펫츠', 'Vasgotaspets');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '비즐라', 'Vizsla');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '볼피노 이탈리아노', 'Volpino Italiano');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '와이머라너', 'Weimaraner');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '웰쉬 코르기', 'Welsh Corgis');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '웰시 스프링어 스패니얼', 'Welsh Springer Spaniel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '웰시 테리어', 'Welsh Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '웨스트 하이랜드 화이트 테리어', 'West Highland White Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '웨스트팔라안 닥스브라케', 'Westphalian Dachsbracke');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '웨터훈', 'Wetterhoun');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '휘핏', 'Whippet');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '화이트 세퍼드 도그', 'White Shepherd Dog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '와이어헤어드 포인팅 그리펀', 'Wirehaired Pointing Griffon');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '와이어헤어드 포인팅 그리퐁', 'Wirehired Pointing Griffon');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '쇼로이츠퀸틀리', 'Xoloitxcuinti');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '요크셔 테리어', 'Yorkshire Terrier');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (1,  '유고슬라비안 하운드', 'Yugoslavian Hounds');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '아비시니아', 'Abyssinian');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '아메리칸 밥테일', 'American Bobtail');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '아메리칸 컬', 'American Curl');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '아메리칸 숏 헤어', 'American Shorthair');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '아메리칸 와이어 헤어', 'American wirehair');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '발리니즈', 'Balinese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '뱅갈', 'Bengal');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '버만', 'Birman');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '봄베이', 'Bombay');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '브리티쉬 쇼트헤어', 'British Shorthair');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '버마', 'Burmese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '캘리포니아 스팽글드', 'California Spangled');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '샤트룩스', 'Chartreux');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '칼라포인터 숏헤어', 'ColorpointShorthair');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '코니시 렉스', 'Cornish Rex');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '킴릭', 'Cymric');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '데본 렉스', 'Devon Rex');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '에집션 마우', 'Egytian Maus');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '엑죠틱 숏헤어', 'Exotic Shorthair');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '하바나 브라운', 'Havana Brown');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '히말라얀', 'Himalayan');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '제페니즈 밥테일', 'Japanese Bobtail');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '자바니즈', 'Javanese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  'Korean', 'K.C');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '코랏', 'Korat');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '라팜', 'La Perm');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '메인 쿤', 'Maine Coon');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '맹크스', 'Manx');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '혼합', 'Mongrel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '먼치킨', 'Munchkin');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '네벨룽', 'Nebelung');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '노르위전 포레스트', 'Norwegian Forest');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '옥시캣', 'Oci');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '오리엔탈 롱헤어', 'Oriental Longhair');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '페르시안', 'Persian');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '랙돌', 'Ragdoll');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '러시안 블루', 'Russian Blue');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '스코티쉬 폴더', 'Scottich Fold');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '셀커크 렉스', 'Selkirk Rex');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '샴', 'Siamese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '시베리언', 'Siberian');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '싱가푸라', 'Singapura');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '스노우슈', 'Snowshoe');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '소말리', 'Somali');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '스핑크스', 'Sphynx');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '티파니', 'Tiffany');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '통키니즈', 'Tonkinese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '터키쉬 앙고라', 'Turkish Angora');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '터키쉬 밴', 'Turkish Van');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '요크 초콜릿', 'York Chocolate');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (2,  '코리안 숏헤어', 'Korean Shorthair');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (3,  '라이언 헤드', 'Lion Head');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (3,  '드워프', 'Dwarf');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (3,  '더치', 'Dutch');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (3,  '앙고라', 'Angora');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (3,  '롭이어', 'Lop Eared');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (3,  '히말라얀', 'Himalayan');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (3,  '렉스', 'Rex');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (3,  '소형 드워프', 'Mini Dwarf');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (3,  '혼합', 'Mixed');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (3,  '믹스', 'Mongrel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (3,  '알수없음', 'Unknown');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (5,  '고슴도치', 'Hedgehog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (6,  '페릿', 'Ferret');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (7,  '햄스터', 'Hamster');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (7,  '시리안 햄스터', 'Syrian Hamster');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (7,  '시베리안 햄스터', 'Siberian Hamster');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (7,  '캠벨 러시안 햄스터', 'The Dwarf Campbells Russian Hamster');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (7,  '중국 햄스터', 'Chinese Hamster');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (7,  '로보르브스키 햄스터', 'Roborovski Hamster');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (7,  '다람쥐', 'Squirrel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (9,  '이구아나', 'Iguana');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (10, '도마뱀', 'Lizard');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (11, '뱀', 'Snake');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (11, '혼합', 'Mixed');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (12, '거북이', 'Tortoise');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (12, '알수없음', 'Unknown');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '호금조', 'Gouldian Finch');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '카나리아', 'Canary');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '소문조', 'Star Finch');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '백십자매', 'White Bengalese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '갈색십자매', 'Right Brown Bengalese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '도가머리십자매', 'Bengalese');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '시나몬 문조', 'Cinamon Java Sparrow');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '백문조', 'White Java Sparrow');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '대금화조', 'Java Sparrow');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '고대금화조', 'Diamond Sparrow');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '백금화조', 'Zebra Finch');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '모란앵무', 'Peach-faced Love-bird');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '소자앵무', 'Violet-nacked Lory');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '뉴기니아 앵무', 'New Guinea Parrot');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '왕관앵무', 'Cockatiel');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '거위', 'Goose');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '공작', 'Peacock');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '금계', 'Golden pheasant');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '꿩', 'Pheasant');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '기러기', 'Wild goose');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '칠면조', 'Domesticated Turkey');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '닭', 'Fowl');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '혼합', 'Mixed');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (13,  '알수없음', 'Unknown');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (14, '프레리도그', 'PrairieDog');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (14,  '알수없음', 'Unknown');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (15,  '양서류', 'Reptile');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (16,  '소', 'Bovine');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (17,  '돼지', 'Swine');
INSERT INTO `BREED` (SPECIES_ID,   BREED_NAME, BREED_ENGNAME) VALUES (18,  '기타', 'Etc.');
commit;

