-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-05-20 19:38:16.084

/*
Diagram zwiazkow encji zawierajacy informacje o pszczelarzach
- jeden pszczelarz posiada wiele uli
- w jednym ulu moze byc jedna rodzina pszczela w danym okresie czasu
- w tabeli rodzina pszczela nalezy umiescic informacje o wielkosci roju
(S - silny, P - przecientny M - slaby), oraz informacje czy jest krolowa
- pszczelarz wykonuje wiele razy w ciagu sezonu przeglad pszczol 
(nalezy wpisac w tabeli date przegladu)
- pszczelarz produkuje wiele rodzajow miodu
- miod jest rozlewany do jednego odstojnika, jeden odstojnik na przestrzeni czasu
moze miec wiele miodow
- kazdy rodzaj miodu ma swoja cene (zaklasamy ze jest ona stala)
*/

-- tables
-- Table: Miod
CREATE TABLE Miod (
    id int  NOT NULL,
    Odstojniki_id int  NOT NULL,
    ilosc_miodu int  NOT NULL,
    Rodzaj_Miodu_id int  NOT NULL,
    Pszczelarz_nr_id_pasieki int  NOT NULL,
    CONSTRAINT Miod_pk PRIMARY KEY  (id)
);

GO

-- Table: Odstojniki
CREATE TABLE Odstojniki (
    id int  NOT NULL,
    poj_odstojnika int  NOT NULL,
    CONSTRAINT Odstojniki_pk PRIMARY KEY  (id)
);

GO

-- Table: Przeglad
CREATE TABLE Przeglad (
    id int  NOT NULL,
    termin_przegladu date  NOT NULL,
    Rodzina_pszczela_id int  NOT NULL,
    CONSTRAINT Przeglad_pk PRIMARY KEY  (id)
);

GO

-- Table: Pszczelarz
CREATE TABLE Pszczelarz (
    nr_id_pasieki int  NOT NULL,
    imie varchar(20)  NOT NULL,
    nazwisko varchar(20)  NOT NULL,
    Czy_zwiaz_pszcz char(1)  NOT NULL,
    CONSTRAINT Pszczelarz_pk PRIMARY KEY  (nr_id_pasieki)
);

GO

-- Table: Rodzaj_Miodu
CREATE TABLE Rodzaj_Miodu (
    id int  NOT NULL,
    cena_za_1L int  NOT NULL,
    Nazwa_miodu varchar(20)  NOT NULL,
    CONSTRAINT Rodzaj_Miodu_pk PRIMARY KEY  (id)
);

-- Table: Rodzina_pszczela
CREATE TABLE Rodzina_pszczela (
    id int  NOT NULL,
    wielkosc_roju char(1)  NOT NULL,
    czy_jest_krolowa char(1)  NOT NULL,
    Ul_numer_ula int  NOT NULL,
    od date  NOT NULL,
    do date  NOT NULL,
    CONSTRAINT Rodzina_pszczela_pk PRIMARY KEY  (id)
);

GO

-- Table: Ul
CREATE TABLE Ul (
    numer_ula int  NOT NULL,
    kolor char(3)  NOT NULL,
    czy_wymaga_remontu char(1)  NOT NULL,
    Pszczelarz_nr_id_pasieki int  NOT NULL,
    CONSTRAINT Ul_pk PRIMARY KEY  (numer_ula)
);

GO

-- Table: Ul_Archiwum
CREATE TABLE Ul_Archiwum (
	Operacja varchar(20)  NOT NULL,
    numer_ula int  NOT NULL,
    kolor char(3)  NOT NULL,
    czy_wymaga_remontu char(1)  NOT NULL,
    Pszczelarz_nr_id_pasieki int  NOT NULL,
);

GO

-- foreign keys
-- Reference: Miod_Pszczelarz (table: Miod)
ALTER TABLE Miod ADD CONSTRAINT Miod_Pszczelarz
    FOREIGN KEY (Pszczelarz_nr_id_pasieki)
    REFERENCES Pszczelarz (nr_id_pasieki);

	GO

-- Reference: Miod_Rodzaj_Miodu (table: Miod)
ALTER TABLE Miod ADD CONSTRAINT Miod_Rodzaj_Miodu
    FOREIGN KEY (Rodzaj_Miodu_id)
    REFERENCES Rodzaj_Miodu (id);

	GO

-- Reference: Przeglad_Rodzina_pszczela (table: Przeglad)
ALTER TABLE Przeglad ADD CONSTRAINT Przeglad_Rodzina_pszczela
    FOREIGN KEY (Rodzina_pszczela_id)
    REFERENCES Rodzina_pszczela (id);

	GO

-- Reference: Rodzaj_miodu_Odstojniki (table: Miod)
ALTER TABLE Miod ADD CONSTRAINT Rodzaj_miodu_Odstojniki
    FOREIGN KEY (Odstojniki_id)
    REFERENCES Odstojniki (id);

	GO

-- Reference: Rodzina_pszczela_Ul (table: Rodzina_pszczela)
ALTER TABLE Rodzina_pszczela ADD CONSTRAINT Rodzina_pszczela_Ul
    FOREIGN KEY (Ul_numer_ula)
    REFERENCES Ul (numer_ula);

	GO

-- Reference: Ul_Pszczelarz (table: Ul)
ALTER TABLE Ul ADD CONSTRAINT Ul_Pszczelarz
    FOREIGN KEY (Pszczelarz_nr_id_pasieki)
    REFERENCES Pszczelarz (nr_id_pasieki);

-- End of file.

GO

insert into pszczelarz (NR_ID_PASIEKI,IMIE,NAZWISKO,Czy_zwiaz_pszcz)VALUES('7305573','JAN','KOWALSKi','T');
insert into pszczelarz (NR_ID_PASIEKI,IMIE,NAZWISKO,Czy_zwiaz_pszcz)VALUES('3924995','BRONISLAW','ADAMCZYK','T');
insert into pszczelarz (NR_ID_PASIEKI,IMIE,NAZWISKO,Czy_zwiaz_pszcz)VALUES('6436446','PAWEL','ZYNDRA','N');
insert into pszczelarz (NR_ID_PASIEKI,IMIE,NAZWISKO,Czy_zwiaz_pszcz)VALUES('6524959','ALEXANDER','SEMEYKO','T');
insert into pszczelarz (NR_ID_PASIEKI,IMIE,NAZWISKO,Czy_zwiaz_pszcz)VALUES('8241397','KATARZYNA','RUDZINSKA','N');

GO

insert into rodzaj_miodu (ID,CENA_ZA_1L,NAZWA_MIODU)VALUES('1','60','SPADZIOWY');
insert into rodzaj_miodu (ID,CENA_ZA_1L,NAZWA_MIODU)VALUES('2','50','GRYCZANY');
insert into rodzaj_miodu (ID,CENA_ZA_1L,NAZWA_MIODU)VALUES('3','40','RZEPAKOWY');
insert into rodzaj_miodu (ID,CENA_ZA_1L,NAZWA_MIODU)VALUES('4','50','AKACJOWY');
insert into rodzaj_miodu (ID,CENA_ZA_1L,NAZWA_MIODU)VALUES('5','40','LIPOWY');
insert into rodzaj_miodu (ID,CENA_ZA_1L,NAZWA_MIODU)VALUES('6','100','WRZOSOWY');
insert into rodzaj_miodu (ID,CENA_ZA_1L,NAZWA_MIODU)VALUES('7','40','WIELOKWIATOWY');
insert into rodzaj_miodu (ID,CENA_ZA_1L,NAZWA_MIODU)VALUES('8','50','FACELIOWY');

GO

insert into odstojniki (ID,POJ_ODSTOJNIKA)VALUES('111','100');
insert into odstojniki (ID,POJ_ODSTOJNIKA)VALUES('112','50');
insert into odstojniki (ID,POJ_ODSTOJNIKA)VALUES('113','80');
insert into odstojniki (ID,POJ_ODSTOJNIKA)VALUES('114','60');
insert into odstojniki (ID,POJ_ODSTOJNIKA)VALUES('115','50');
insert into odstojniki (ID,POJ_ODSTOJNIKA)VALUES('116','50');
insert into odstojniki (ID,POJ_ODSTOJNIKA)VALUES('117','100');
insert into odstojniki (ID,POJ_ODSTOJNIKA)VALUES('118','100');
insert into odstojniki (ID,POJ_ODSTOJNIKA)VALUES('119','90');
insert into odstojniki (ID,POJ_ODSTOJNIKA)VALUES('120','80');

GO

insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1000','ZIE','N','7305573');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1001','ZIE','N','7305573');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1002','CZE','T','7305573');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1003','BIA','N','7305573');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1004','NIE','N','7305573');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1005','CZE','T','7305573');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1006','ZIE','N','7305573');

insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1007','CZE','T','7305573');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1008','NIE','N','7305573');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1009','CZE','T','7305573');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1010','BIA','N','7305573');

insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1011','NIE','N','6524959');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1012','CZE','N','6524959');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1013','BIA','N','6524959');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1014','ZIE','T','3924995');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1015','CZE','N','3924995');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1016','ZOL','N','3924995');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1017','CZE','N','3924995');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1018','ZIE','T','3924995');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1019','BIA','N','8241397');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1020','ZOL','T','8241397');


insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1021','BIA','N','8241397');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1022','BIA','N','8241397');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1023','ZIE','N','8241397');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1024','BIA','T','6436446');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1025','ZIE','N','6436446');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1026','CZE','N','6436446');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1027','ZIE','N','6436446');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1028','CZE','T','6436446');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1029','BIA','N','6436446');
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1030','CZE','T','6436446');

GO

insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('700','M','T','1000','2015-06-10','2017-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('701','M','T','1000','2018-05-13','2020-10-10');

insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('702','D','N','1001','2016-05-14','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('703','S','T','1002','2019-06-14','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('704','D','T','1003','2018-06-14','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('705','M','T','1004','2017-06-05','2017-06-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('706','D','T','1004','2017-06-19','2018-04-05');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('707','D','T','1004','2018-05-20','2019-09-12');

insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('708','S','N','1008','2019-06-17','2020-10-10');

insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('709','S','T','1010','2017-06-15','2019-09-13');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('710','S','T','1010','2020-05-15','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('711','M','N','1011','2017-06-17','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('712','D','T','1012','2018-05-07','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('713','D','T','1013','2016-06-06','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('714','D','N','1014','2016-06-09','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('715','M','T','1015','2018-07-10','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('716','D','T','1016','2019-05-26','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('717','S','T','1017','2015-07-09','2016-09-12');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('718','S','N','1017','2017-05-05','2018-04-12');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('719','S','T','1017','2018-06-07','2020-10-10');

insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('720','M','T','1020','2016-05-15','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('721','M','N','1021','2017-06-16','2019-09-12');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('722','S','T','1022','2016-05-27','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('723','M','T','1023','2018-07-30','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('724','D','N','1024','2018-05-10','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('725','D','T','1025','2019-05-30','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('726','S','T','1026','2018-07-10','2019-10-01');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('727','M','N','1027','2016-05-14','2020-10-10');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('728','D','T','1028','2016-05-17','2019-09-22');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('729','M','N','1029','2017-07-26','2020-10-10');

insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('730','D','N','1030','2017-07-12','2019-04-30');
insert into rodzina_pszczela (ID,WIELKOSC_ROJU,CZY_JEST_KROLOWA,UL_NUMER_ULA,OD,DO)VALUES('731','D','T','1030','2020-05-29','2020-05-31');

GO

insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5001','2015-06-10','700');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5002','2017-10-10','700');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5003','2018-05-13','701');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5004','2020-10-10','701');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5005','2016-05-14','702');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5006','2020-10-10','702');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5007','2019-06-14','703');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5008','2020-10-10','703');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5009','2018-06-14','704');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5010','2020-10-10','704');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5011','2017-06-05','705');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5012','2017-06-10','705');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5013','2017-06-19','706');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5014','2018-04-05','706');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5015','2018-05-20','707');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5016','2019-09-12','707');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5017','2019-06-17','708');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5018','2020-10-10','708');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5019','2017-06-15','709');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5020','2019-09-13','709');

insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5021','2020-05-15','710');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5022','2020-10-10','710');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5023','2017-06-17','711');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5024','2020-10-10','711');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5025','2018-05-07','712');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5026','2020-10-10','712');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5027','2016-06-06','713');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5028','2020-10-10','713');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5029','2016-06-09','714');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5030','2020-10-10','714');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5031','2018-07-10','715');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5032','2020-10-10','715');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5033','2019-05-26','716');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5034','2020-10-10','716');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5035','2015-07-09','717');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5036','2016-09-12','717');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5037','2017-05-05','718');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5038','2018-04-12','718');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5039','2018-06-07','719');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5040','2020-10-10','719');

insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5041','2016-05-15','720');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5042','2020-10-10','720');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5043','2017-06-16','721');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5044','2019-09-12','721');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5045','2016-05-27','722');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5046','2020-10-10','722');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5047','2018-07-30','723');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5048','2020-10-10','723');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5049','2018-05-10','724');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5050','2020-10-10','724');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5051','2019-05-30','725');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5052','2020-10-10','725');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5053','2018-07-10','726');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5054','2019-10-01','726');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5055','2016-05-14','727');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5056','2020-10-10','727');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5057','2016-05-17','728');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5058','2019-09-22','728');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5059','2017-07-26','729');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5060','2020-10-10','729');

insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5061','2017-07-12','730');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5062','2019-04-30','730');

insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5063','2020-05-29','731');
insert into PRZEGLAD(ID,TERMIN_PRZEGLADU,RODZINA_PSZCZELA_ID)VALUES('5064','2020-05-31','731');

GO

insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5000','112','30','1','7305573');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5001','112','40','2','7305573');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5002','111','90','3','7305573');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5003','113','50','5','7305573');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5004','117','85','7','7305573');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5005','112','45','2','7305573');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5006','114','80','3','7305573');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5007','114','48','5','7305573');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5008','113','76','7','7305573');


insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5009','115','25','3','3924995');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5010','115','42','5','3924995');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5011','116','45','7','3924995');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5012','116','12','3','3924995');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5013','116','12','5','3924995');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5014','115','40','7','3924995');

insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5015','115','22','1','6436446');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5016','113','59','2','6436446');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5017','120','69','3','6436446');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5018','116','77','5','6436446');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5019','117','100','7','6436446');

insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5020','115','14','8','6436446');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5021','116','33','2','6436446');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5022','119','55','3','6436446');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5023','117','86','5','6436446');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5024','116','99','7','6436446');


insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5025','117','84','3','6524959');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5026','119','48','5','6524959');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5027','118','62','7','6524959');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5028','117','76','3','6524959');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5029','120','64','5','6524959');

insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5030','118','88','7','6524959');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5031','112','39','1','8241397');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5032','119','89','3','8241397');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5033','114','54','5','8241397');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5034','111','84','7','8241397');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5035','116','46','8','8241397');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5036','115','10','1','8241397');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5037','120','74','3','8241397');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5038','114','63','5','8241397');
insert into miod (ID,ODSTOJNIKI_ID,ILOSC_MIODU,RODZAJ_MIODU_ID,PSZCZELARZ_NR_ID_PASIEKI)VALUES('5039','119','73','7','8241397');

GO

/*
Tiger ktorego zadaniem jest zapisywanie operacji (After INSERT,DELETE) wykonanych na tabeli Ul do tabeli Ul_Archiwum.
*/
-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create TRIGGER tiger_UL --tworzenie tigera
	on UL
   After INSERT,DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	
	declare @numer_ula int  =0; --deklarowanie zmiennych
    declare @kolor char(3) =0;
    declare @czy_wymaga_remontu char(1) ;
    declare @Pszczelarz_nr_id_pasieki int ;
	if exists(Select 1 from inserted ) -- jesli rekord byl wstawiony, wstawiamy dane do tabeli
	begin
		Select @numer_ula=(i.numer_ula) from inserted i;
		Select @kolor=(i.kolor) from inserted i;
		Select @czy_wymaga_remontu=(i.czy_wymaga_remontu) from inserted i;
		Select @Pszczelarz_nr_id_pasieki=(i.Pszczelarz_nr_id_pasieki) from inserted i;
		INSERT INTO Ul_Archiwum(Operacja, numer_ula,kolor,czy_wymaga_remontu,Pszczelarz_nr_id_pasieki) VALUES ('INSERT',@numer_ula,@kolor,@czy_wymaga_remontu,@Pszczelarz_nr_id_pasieki);
		print 'INSERT - dodano do archiwum UL_Archiwum'
	end
	else if exists(Select 1 from deleted ) -- jesli rekord zostal skasowany, wstawiamy dane do tabeli
	begin
		Select @numer_ula=(i.numer_ula) from deleted i;
		Select @kolor=(i.kolor) from deleted i;
		Select @czy_wymaga_remontu=(i.czy_wymaga_remontu) from deleted i;
		Select @Pszczelarz_nr_id_pasieki=(i.Pszczelarz_nr_id_pasieki) from deleted i;
		INSERT INTO Ul_Archiwum(Operacja, numer_ula,kolor,czy_wymaga_remontu,Pszczelarz_nr_id_pasieki) VALUES ('DELETE',@numer_ula,@kolor,@czy_wymaga_remontu,@Pszczelarz_nr_id_pasieki);
		print 'DELETE - dodano do archiwum UL_Archiwum'
	end
	
END
GO

--procedura

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		s20128
-- Create date: 2020-11-30
-- Description:	procedura_1
-- =============================================
Create PROCEDURE ProcedureName 
@WymaganaIloscUli INT
AS
BEGIN
SET NOCOUNT ON;



DECLARE @IloscUli INT --Tworzenie zmiennej iloscUli w celu przypisana ilosci uli do zmiennej
DECLARE @IloscOdstojnikow INT --Tworzenie zmiennej IloscOdstojnikow w celu przypisana ilosci odstojnikow do zmiennej

DECLARE cur CURSOR FOR   --Deklarowanie kursora
SELECT Pszczelarz.nr_id_pasieki
FROM Pszczelarz;
DECLARE @nr_id INT;

OPEN cur; --otwieranie kursora
FETCH NEXT FROM cur INTO @nr_id; --przejscie do pierwszego elementu

WHILE @@FETCH_STATUS = 0
BEGIN
				Select @IloscUli = count(*) --przypisanie do zmiennej ilosci Uli
				from Pszczelarz,Ul
				where Pszczelarz.nr_id_pasieki=Ul.Pszczelarz_nr_id_pasieki and Pszczelarz.nr_id_pasieki=@nr_id

				Select @IloscOdstojnikow = count(distinct Odstojniki.id)  --przypisanie do zmiennej Ilosci Odstojnikow
				from Pszczelarz, Miod, Odstojniki
				where Pszczelarz.nr_id_pasieki=@nr_id and 
				Pszczelarz.nr_id_pasieki=Miod.Pszczelarz_nr_id_pasieki and
				Odstojniki.id = Miod.Odstojniki_id
				
				PRINT 'nr id pasieki ('+CAST(@nr_id AS VARCHAR)+') ILOSC ULI: ('+CAST(@IloscUli AS VARCHAR)+') ILOSC Odstojnikow: ('+CAST(@IloscOdstojnikow AS VARCHAR)+')'; --wypisanie komunikatu
				
				if @IloscUli>@WymaganaIloscUli --jesli ilosc ul jest wieksza niz ilosc uli podana przez uzytkownika wykona sie if
				BEGIN
					PRINT 'nr id pasieki ('+CAST(@nr_id AS VARCHAR)+')  spelnia wymagania' --wypisanie komunikatu
					DECLARE @newIdUL INT = (Select max(Ul.numer_ula)+1 from Ul); 
					insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES(@newIdUL,'CZE','N',@nr_id);--wpisanie do tabeli
				END
		
	FETCH NEXT FROM cur INTO @nr_id; --pobieranie nastepnego elementu
END;	
		CLOSE cur; --zamkniecie kursora
		DEALLOCATE cur; -- dealokowanie kursora
		
	END

GO
--pokazanie jak dziala procedura
Exec ProcedureName 100
Exec ProcedureName 10
--pokazanie jak dziala kursor

select * from Ul_Archiwum
select*from UL
insert into ul (NUMER_ULA,KOLOR,CZY_WYMAGA_REMONTU,Pszczelarz_nr_id_pasieki)VALUES('1031','CZE','N','3924995');
delete from Ul where Ul.numer_ula='1031';

Go