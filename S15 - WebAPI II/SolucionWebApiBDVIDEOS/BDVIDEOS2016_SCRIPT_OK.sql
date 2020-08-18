Use Master
Go

if exists(select * from sys.sysdatabases where name='BDVIDEOS2016')
begin
   Alter Database BDVIDEOS2016 Set Single_User With Rollback Immediate
	
   Drop Database BDVIDEOS2016
end   
Go

Create Database BDVIDEOS2016
COLLATE Modern_Spanish_CI_AI
Go

Use BDVIDEOS2016
go
SET LANGUAGE SPANISH
GO

create table Pais
(
cod_pais int not null constraint pkcod_pais primary key,
nom_pais varchar(50)
)
go

insert Pais values(1,'Estados Unidos')
insert Pais values(2,'Inglaterra')
insert Pais values(3,'España')
insert Pais values(4,'Mexico')
insert Pais values(5,'Argentina')
insert Pais values(6,'China')
insert Pais values(7,'Japon')
insert Pais values(8,'Peru')
insert Pais values(9,'Australia')
insert Pais values(10,'Italia')
insert Pais values(11,'Escocia')
insert Pais values(12,'Grecia')
insert Pais values(13,'Canada')
go

Create Table Actores
(
cod_act char(5) not null constraint pkcod_Act primary key,
nom_act varchar(50),
cod_pais int,
foto_act image
)
go

insert actores values('A0001','Sharon Stone',1,0xFFD8FFE000104A46494600010101004800480000FFDB00430007050506050407060606080707080B120B0B0A0A0B160F100D121A161B1A191619181C2028221C1E261E1819233024262A2B2D2E2D1B223235312C35282C2D2CFFDB0043010708080B090B150B0B152C1D191D2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2CFFC00011080024002403012200021101031101FFC4001B00000202030100000000000000000000000007050601030408FFC4002E1000010303030303030305000000000000010203040005110612210713312241611451710881A123325362F1FFC400190100020301000000000000000000000000030401020500FFC4002311000202010303050000000000000000000001031102041221315181132241B1F0FFDA000C03010002110311003F006FEA2BF4BB75DCC76640D812A79C0B3E96DB4A724920640F73CFB7CD232F9FA86BE357175BB1BEC98A9DC50F4C415170F383B41E07D873F3570EB9BAEDB34DEA09C26A5A7A72D98496904643471BCABF3EAAA2D8F4759AE166FA5536832DE4A544AB695608C78078C13FC54CB26C4A82451391B39ACBD7BD611838992FC2B9214A2E1FABDC8573E4254823007B0C1C536349EBF87AAE2A674790E32861B224C775EF521479FF0020DC00070AF9F030692AAD1ADC3B92A0AE329CEE289011FDCD7904FCA7EC3FD715AF40097A6B5F2ACB37730979D11DC1B8A50A493B9049047191FCD4432A6F6939C4F1564B75635FEABB5EBF9116CFA82E50A1259694869990AC0CA0124805401E7C668AABF589D53DD53BA779BEDA901A404A895100349C649DC7C7CD15D9276C1A185FA89D4115172916A8CE971FFA9438FB6559030D71C7EE2A62C779B4DC34B40BA476D0C074A779C63041F52723DF3546EBDC2427AB1733DE412F21B73685648C21239FB78AE4E9526634899D9927B0DBE3FA4E272DAF8E48FB1F14BCCF7ABEC3DA64F1CAABA8E78B263B895ADB08754467724118FC92064D23758DF5D4752CBEC11986F37BB69F2A49048FDBC536E6CB9CF5BDCC6C8FB50A210D0C6E38E01513C0FC579D52F8EF38A28538E2947739ED924E4D0225EEBEC33A8E1550DF97A9F5749B8CA76DB6D725C253CAEC3820EFF467804E0E48A2A2348CDD5532C4176DD592EDF1D2E14F653BC8CF193C1039CD14DEFC3E4CFF004247D11B3AF96E8F1FAC2A90D8505CC4A4BBCE41290903F1C55DEDF6D8902DE8623B2943684A7000F3C7934514ACAFF7935746973E3E8C4F82CCB80EB2B042719F49C7FDFC78AA6DB340D99E61898FFD4BCE3877292B77D279C780051450F16352629E4AD0C18515987183119B4B2D24F0840000A28A2AA5CFFFD9)
insert actores values('A0002','Michael Douglas',1, 0xFFD8FFE000104A46494600010101004800480000FFDB004300040303030403040404040604040406080604040608090707080707090B0909090909090B090B0B0C0B0B090E0E0F0F0E0E141414141416161616161616161616FFDB004301050505090809110B0B1114100D101418171717171818161616161616161616161616161616161616161616161616161616161616161616161616161616161616FFC00011080024002403012200021101031101FFC4001B00000202030100000000000000000000000006070802030504FFC4002B1000010303030302070101000000000000010203040005110612211331410751082232426171811582FFC400190100020301000000000000000000000000020503040601FFC40020110002010500020300000000000000000001020003041121313261051271FFDA000C03010002110311003F006EF8C4D7D218991ADD1A5265473143916396F2D36E3BBD0B592719740DAA41CFCBDEA9DDD215F2538DBF2F2A710DA79FB8FB1C8EF5653E2320CE99EA5695648DF12641086D3C7250FAFAA7F9C73517DF2F2B8B2BA4DC56D7194BD856B4BAA03FE909DB9FC66A1AB956C4B54143AE6243BA563A636FEA29C92F0C9CF233F93E2BC16F55DB4FDDE14E53495218750E24E0141520EEC73E69CEFD738D010831DA438B51E02B763B78C026B2429ABBE9AB838594F5E1252FE124E36838570B0950C67DA869B9324AD494725FCD13AEEEB7FD2567BBB32C944C8E15B5B1C20824141DC37128C6D24F7C51499E8FC75D9FD32D33141485B909125EFB0EF939779C0193858193CD14CD535C885AAEFB234F55AD72636BD8D35D69C3065361E88FAD3CA56CB5D153593F4E0E55EC722A28B9C06152F729648EFB39291EDC55A8D576CFF46C52987D961FE934E3B1DCF994EB4EA10AC11F28FD67DAAACDDE338A9CC29B77082A0B5B0BE1B771F6AC8C280E7C1A537430DE8CD1D8D50EBEC6A2EDDD88E5DD8B585951052A09E078FE576ACD1E2356EB9B4A01E0E45582724EE1EDE4F715C5BF176424B48871ADEA4FD52D879D757C1F095612338C739A74F4B6D912E3A862C39ADADE8C5B714FB683852B624AF923C6EC6EFC571339024D5CA8524CB2FE982A61D05635DCB738FB8C15345CE162395ABA015DBB35B7F9456D331384869C65080903A4AFB31C6D18E303C514D1743B330E7EC7389B5ADEB5EC538A295821438ED8FD555DB9C6696C6143E82529FD0A28A5972391BFC770C4DB8428ED84AD09DAA0BA6BD03BD771BCB89714CBB02CB365C471B3828799485215F9E4763C1A28A3B6F312CDD789FC920E83D5F77BE693B65D6674932A637BDFE9276A37648C8049C5145146C77168413FFFD9)
insert actores values('A0003','Julia Roberts',1, null)
insert actores values('A0004','Hugh Grant',2, null)
insert actores values('A0005','Colin Firth',2, null)
insert actores values('A0006','Liam Neeson',2, null)
insert actores values('A0007','Rowan Atkinson',2, null)
insert actores values('A0008','Chow Yun Fat',6, null)
insert actores values('A0009','Jet Li',6, null)
insert actores values('A0010','Jackie Chan',6, null)
insert actores values('A0011','Whoopi Goldberg',1, null)
insert actores values('A0012','Cuba Gooding Jr.',1, null)
insert actores values('A0013','Owen Wilson',1, null)
insert actores values('A0014','Ashton Kutcher',1, null)
insert actores values('A0015','Antonio Banderas',3, null)
insert actores values('A0016','Richard Gere',1, null)
insert actores values('A0017','Susan Sarandon',1, null)
insert actores values('A0018','Harrison Ford',2, null)
insert actores values('A0019','Jennifer Lopez',1, null)
insert actores values('A0020','Ernie Mac',1, null)
insert actores values('A0021','Jude Law',2, null)
insert actores values('A0022','Joseph Fiennes',2, null)
insert actores values('A0023','Rachel Weiz',1, null)
insert actores values('A0024','Brendan Fraser',1, null)
insert actores values('A0025','Daniel Radcliffe',2, null)
insert actores values('A0026','Emma Watson',2, null)
insert actores values('A0027','Rupert Grint',2, null)
insert actores values('A0028','Sandra Bulock',1, null)
insert actores values('A0029','Jennifer Aniston',1, null)
insert actores values('A0030','Charlize Theron',1, null)
insert actores values('A0031','Kate Beckinsale',1, null)
insert actores values('A0032','Nicolas Cage',1, null)
insert actores values('A0033','Gwilney Palthrow',1, null)
insert actores values('A0034','Downey Jr',1, null)
insert actores values('A0035','Arnold Schwarsnegger',1, null)
insert actores values('A0036','Lynda Hamilton',1, null)
insert actores values('A0037','Tobey Maguire',1, null)
insert actores values('A0038','Kristen Dunts',1, null)
insert actores values('A0039','Robert De Niro',10, null)
insert actores values('A0040','Demi More',1, null)
insert actores values('A0041','Chris Tucker',1, null)
go


create table Genero
(
cod_gen char(3) not null constraint pkcod_gen primary key,
des_gen varchar(80)
)
go

insert genero values('G01','Comedia')
insert genero values('G02','Terror')
insert genero values('G03','Drama')
insert genero values('G04','Accion')
insert genero values('G05','Romantica')
insert genero values('G06','Ciencia Ficcion')
go


create table Formato
(
cod_for int not null constraint pkcod_for primary key,
des_for varchar(50),
precio money
)
go

insert formato values(1,'DVD',3.5)
insert formato values(2,'VCD',2.0)
insert formato values(3,'VHS',1.5)
insert formato values(4,'Blu-Ray',5.5)
go


create table Peliculas
(
cod_pel char(5) constraint pdcod_pel primary key,
nom_pel varchar(80),
duracion int,
cod_gen char(3),
cod_for int,
cant_cop int,
año int
)
go

-- 1 Comedia
-- 2 Terror
-- 3 Drama
-- 4 Accion
-- 5 Romantica
-- 6 Ciencia Ficcion
insert peliculas values('P0001','Mujer Bonita',120,'G05',1,5,1985)
insert peliculas values('P0002','Bailamos',130,'G05',1,10,2003)
insert peliculas values('P0003','Conquistando a mi suegro',110,'G01',1,10,2005)
insert peliculas values('P0004','Los Rompebodas',110,'G01',1,15,2005)
insert peliculas values('P0005','Una suegra de cuidado',120,'G01',1,15,2005)
insert peliculas values('P0006','Enemigo al Acecho',120,'G04',1,10,2004)
insert peliculas values('P0007','Harry Potter y la Piedra Filosofal',175,'G04',1,10,2002)
insert peliculas values('P0008','Harry Potter y La Camara Secreta',180,'G04',1,10,2003)
insert peliculas values('P0009','Harry Potter y el Prisionero de Azkaban',175,'G04',1,10,2004)
insert peliculas values('P0010','Harry Potter y el Caliz de Fuego',185,'G04',1,10,2005)
insert peliculas values('P0011','Amor a Segunda Vista',105,'G05',1,10,2002)
insert peliculas values('P0012','Indiana Jones y Los Cazadores del Arca Perdida',185,'G04',1,10,1997)
insert peliculas values('P0013','Indiana Jones y El templo de la Perdicion',185,'G04',1,10,1998)
insert peliculas values('P0014','Indiana Jones y La Ultima Cruzada',185,'G04',1,10,1999)
insert peliculas values('P0015','Dicen por ahi',105,'G05',1,8,2006)
insert peliculas values('P0016','AEONFlux',125,'G04',1,10,2006)
insert peliculas values('P0017','Inframundo II',115,'G04',1,10,2006)
insert peliculas values('P0018','Señor de la Guerra',110,'G04',1,10,2006)
insert peliculas values('P0019','Indiana Jones y la Calavera de Cristal',135,'G04',1,8,2007)
insert peliculas values('P0020','IRON MAN',125,'G04',1,10,2007)
insert peliculas values('P0021','SPIDERMAN I',125,'G04',1,10,2004)
insert peliculas values('P0022','SPIDERMAN II',130,'G04',1,10,2005)
insert peliculas values('P0023','SPIDERMAN III',130,'G04',1,10,2006)
insert peliculas values('P0024','TERMINATOR I',115,'G06',1,10,1999)
insert peliculas values('P0025','TERMINATOR II',130,'G06',1,10,2001)
insert peliculas values('P0026','TERMINATOR III',120,'G06',1,10,2003)
insert peliculas values('P0027','TERMINATOR IV',115,'G06',1,10,2009)
insert peliculas values('P0028','LECCION DE HONOR',130,'G03',1,10,2002)
insert peliculas values('P0029','HOMBRES DE HONOR',120,'G03',1,10,2003)
insert peliculas values('P0030','MIENTRAS DORMIAS',115,'G03',1,10,2003)
insert peliculas values('P0031','SAW I',130,'G02',1,10,2006)
insert peliculas values('P0032','HOSTEL',120,'G02',1,10,2006)
insert peliculas values('P0033','Indiana Jones y La Calavera de Cristal',170,'G04',1,10,2008)
insert peliculas values('P0034','Harry Potter y La Orden del Fenix',180,'G04',1,10,2007)
insert peliculas values('P0035','Harry Potter y El Misterio del Principe',195,'G04',1,10,2009)
insert peliculas values('P0036','Búsqueda Implacable',165,'G04',1,8,2009)
insert peliculas values('P0037','The One',115,'G04',1,5,2008)
insert peliculas values('P0038','La Momia',165,'G06',1,8,2006)
insert peliculas values('P0039','La Momia Regresa',135,'G06',1,5,2008)
insert peliculas values('P0040','La Momia III',155,'G06',1,8,2009)
insert peliculas values('P0041','DragonBall',115,'G06',1,10,2009)
insert peliculas values('P0042','GHOST La Sombra del Amor',115,'G05',1,10,1999)
insert peliculas values('P0043','Cambio de Hábito',125,'G01',1,10,2000)
insert peliculas values('P0044','Cambio de Hábito II',125,'G01',1,10,2001)
insert peliculas values('P0045','Pareja Explosiva',125,'G01',1,5,2006)
insert peliculas values('P0046','Pareja Explosiva II',115,'G01',1,8,2008)
go


create table Clientes
(cod_cli char(5) constraint pkcod_cli primary key,
nom_cli varchar(80),
Estado int
)
go

INSERT INTO clientes VALUES ('C0001','LAURA MORENO LEE',1)
INSERT INTO clientes VALUES ('C0002','ALEJANDRO PARDO',1)
INSERT INTO clientes VALUES ('C0003','CLAUDIA LEE',1)
INSERT INTO clientes VALUES ('C0004','PERCY OBANDO',1)
INSERT INTO clientes VALUES ('C0005','MIGUEL NARVA',1)
INSERT INTO clientes VALUES ('C0006','CLAUDIO PARDO',1)
INSERT INTO clientes VALUES ('C0007','MONICA GONZALES',1)
INSERT INTO clientes VALUES ('C0008','JHON MORALES',1)
INSERT INTO clientes VALUES ('C0009','FERNANDO REDONDO',1)
INSERT INTO clientes VALUES ('C0010','GABRIELA ZAPATA',1)
INSERT INTO clientes VALUES ('C0011','SANDRA CAMPOS',1)
INSERT INTO clientes VALUES ('C0012','MIGUEL RAMIREZ',1)
INSERT INTO clientes VALUES ('C0013','RAUL MORIENTES',1)
INSERT INTO clientes VALUES ('C0014','EUGENIO CAMPOS',1)
INSERT INTO clientes VALUES ('C0015','LUCILA PARDO',1)
INSERT INTO clientes VALUES ('C0016','ROBERTO BAGGIO',1)
INSERT INTO clientes VALUES ('C0017','LUCIA FERNANDEZ TORRES',1)
INSERT INTO clientes VALUES ('C0018','JHONATAN PEÑARAN',1)
INSERT INTO clientes VALUES ('C0019','MANUEL LOPEZ',1)
INSERT INTO clientes VALUES ('C0020','JOSE RODAS',1)
INSERT INTO clientes VALUES ('C0021','PAOLA ROMANI',1)
INSERT INTO clientes VALUES ('C0022','VANESSA GONZALES',1)
INSERT INTO clientes VALUES ('C0023','CLAUDIA RAMOS',1)
INSERT INTO clientes VALUES ('C0024','ARTURO BARGARAN',1)
INSERT INTO clientes VALUES ('C0025','JORGE LUIS MORI',1)
INSERT INTO clientes VALUES ('C0026','GUSTAVO NOLAZCO',1)
INSERT INTO clientes VALUES ('C0027','PEDRO TARAZONA',1)
INSERT INTO clientes VALUES ('C0028','ENITH DE LA CRUZ',1)
go

create table Alquiler
(
num_alq int identity not null constraint pknum_al primary key,
cod_cli char(5),
fecha_pres smalldatetime,
fecha_dev smalldatetime,
estado int default 0
)
go

-----------------------------------------------------------------
insert alquiler values('C0001','12/08/2012','14/08/2012',1)
insert alquiler values('C0002','14/08/2012','16/08/2012',1)
insert alquiler values('C0004','15/08/2012','17/08/2012',1)
insert alquiler values('C0006','18/08/2012','20/08/2012',1)
insert alquiler values('C0003','20/08/2012','22/08/2012',0)
insert alquiler values('C0010','22/08/2012','24/08/2012',0)
insert alquiler values('C0008','22/08/2012','24/08/2012',1)
insert alquiler values('C0009','23/08/2012','25/08/2012',1)
insert alquiler values('C0020','23/08/2012','25/08/2012',0)
insert alquiler values('C0013','25/08/2012','27/08/2012',0)
insert alquiler values('C0016','27/08/2012','29/08/2012',1)
insert alquiler values('C0022','27/08/2012','29/08/2012',0)
go

insert alquiler values('C0005','02/09/2012','04/09/2012',1)
insert alquiler values('C0007','04/09/2012','06/09/2012',1)
insert alquiler values('C0024','09/09/2012','11/09/2012',0)
insert alquiler values('C0023','12/09/2012','14/09/2012',1)
insert alquiler values('C0025','15/09/2012','17/09/2012',1)
insert alquiler values('C0012','17/09/2012','19/09/2012',1)
insert alquiler values('C0015','19/09/2012','21/09/2012',0)
insert alquiler values('C0021','22/09/2012','24/09/2012',0)
insert alquiler values('C0011','25/09/2012','27/09/2012',1)
go

insert alquiler values('C0019','01/10/2012','03/10/2012',0)
insert alquiler values('C0026','04/10/2012','06/10/2012',1)
insert alquiler values('C0027','07/10/2012','09/10/2012',0)
insert alquiler values('C0017','10/10/2012','12/10/2012',0)
insert alquiler values('C0018','12/10/2012','14/10/2012',0)
insert alquiler values('C0028','15/10/2012','17/10/2012',0)
insert alquiler values('C0014','19/10/2012','21/10/2012',0)
insert alquiler values('C0001','22/10/2012','24/10/2012',0)
insert alquiler values('C0006','25/10/2012','27/10/2012',1)
insert alquiler values('C0007','28/10/2012','30/10/2012',0)
go

------------------------------------------------
insert alquiler values('C0017','03/11/2012','05/11/2012',0)
insert alquiler values('C0008','08/11/2012','10/11/2012',0)
insert alquiler values('C0028','10/11/2012','12/11/2012',0)
insert alquiler values('C0014','13/11/2012','15/11/2012',0)
insert alquiler values('C0019','15/11/2012','17/11/2012',0)
insert alquiler values('C0026','18/11/2012','20/11/2012',1)
insert alquiler values('C0027','21/11/2012','23/11/2012',0)
insert alquiler values('C0017','24/11/2012','26/11/2012',0)
insert alquiler values('C0018','25/11/2012','27/11/2012',0)
insert alquiler values('C0028','27/11/2012','29/11/2012',0)
insert alquiler values('C0014','28/11/2012','30/11/2012',0)
go

-- NEW 06-2009 - del 43 al 50
insert alquiler values('C0004','02/12/2012','04/12/2012',0)
insert alquiler values('C0008','08/12/2012','10/12/2012',0)
insert alquiler values('C0018','10/12/2012','12/12/2012',0)
insert alquiler values('C0014','12/12/2012','14/12/2012',0)
insert alquiler values('C0027','15/12/2012','17/12/2012',0)
insert alquiler values('C0028','19/12/2012','21/12/2012',0)
insert alquiler values('C0009','21/12/2012','23/12/2012',0)
insert alquiler values('C0024','22/12/2012','24/12/2012',0)
insert alquiler values('C0005','27/12/2012','29/12/2012',0)
insert alquiler values('C0019','28/12/2012','30/12/2012',0)
insert alquiler values('C0017','29/12/2012','31/12/2012',0)
GO

-- select * from peliculas
insert alquiler values('C0001','03/01/2013','05/01/2013',0)
insert alquiler values('C0003','07/01/2013','09/01/2013',0)
insert alquiler values('C0008','11/01/2013','13/01/2013',0)
insert alquiler values('C0021','14/01/2013','16/01/2013',0)
insert alquiler values('C0024','18/01/2013','20/01/2013',0)
insert alquiler values('C0028','21/01/2013','23/01/2013',0)
insert alquiler values('C0009','22/01/2013','24/01/2013',0)
insert alquiler values('C0024','24/01/2013','26/01/2013',0)
insert alquiler values('C0015','26/01/2013','28/01/2013',0)
insert alquiler values('C0012','27/01/2013','29/01/2013',0)
insert alquiler values('C0023','27/01/2013','29/01/2013',0)
insert alquiler values('C0002','28/01/2013','30/01/2013',0)
GO

insert alquiler values('C0003','04/02/2013','06/02/2013',0)
insert alquiler values('C0004','06/02/2013','08/02/2013',0)
insert alquiler values('C0006','07/02/2013','09/02/2013',0)
insert alquiler values('C0008','10/02/2013','12/02/2013',0)
insert alquiler values('C0010','12/02/2013','14/02/2013',0)
GO

select * from alquiler
go

create table Detalle_Alquiler
(
num_alq int,
cod_pel char(5),
cant int,
precio money,
estado int default 0,
constraint fknum_alq foreign key(num_alq)
references alquiler(num_alq)
)
go

-- TRUNCATE TABLE detalle_alquiler

insert detalle_alquiler values(1,'P0001',1,3.5,1) 
insert detalle_alquiler values(1,'P0002',2,3.5,1) 
insert detalle_alquiler values(2,'P0004',1,3.5,1) 
insert detalle_alquiler values(2,'P0001',3,3.5,1) 
insert detalle_alquiler values(3,'P0006',1,3.5,1) 
insert detalle_alquiler values(4,'P0005',2,3.5,1) 
insert detalle_alquiler values(4,'P0001',1,3.5,1) 
insert detalle_alquiler values(5,'P0002',4,3.5,default) 
insert detalle_alquiler values(6,'P0004',1,3.5,default) 
insert detalle_alquiler values(7,'P0006',2,3.5,1) 
insert detalle_alquiler values(8,'P0003',1,3.5,1) 
insert detalle_alquiler values(9,'P0005',3,3.5,default) 
insert detalle_alquiler values(10,'P0006',1,3.5,default)
insert detalle_alquiler values(11,'P0004',2,3.5,1)
insert detalle_alquiler values(12,'P0002',2,3.5,default)
insert detalle_alquiler values(12,'P0003',1,3.5,default)
go

insert detalle_alquiler values(13,'P0002',1,3.5,1)
insert detalle_alquiler values(13,'P0005',2,3.5,1)
insert detalle_alquiler values(14,'P0002',1,3.5,1)
insert detalle_alquiler values(14,'P0001',4,3.5,1)
insert detalle_alquiler values(15,'P0006',2,3.5,default)
insert detalle_alquiler values(15,'P0003',1,3.5,default)
go


insert detalle_alquiler values(16,'P0001',2,3.5,1)
insert detalle_alquiler values(16,'P0003',3,3.5,1)
insert detalle_alquiler values(17,'P0004',2,3.5,1)
insert detalle_alquiler values(17,'P0006',1,3.5,1)
insert detalle_alquiler values(18,'P0005',2,3.5,1)
insert detalle_alquiler values(18,'P0003',1,3.5,1)
go


insert detalle_alquiler values(19,'P0007',1,3.5,default)
insert detalle_alquiler values(19,'P0008',3,3.5,default)
insert detalle_alquiler values(20,'P0007',1,3.5,default)
insert detalle_alquiler values(21,'P0009',2,3.5,1)
go

-- select * from alquiler
-- select * from peliculas
insert detalle_alquiler values(22,'P0011',1,3.5,default)
insert detalle_alquiler values(22,'P0012',2,3.5,default)
insert detalle_alquiler values(23,'P0013',1,3.5,1)
insert detalle_alquiler values(24,'P0012',2,3.5,default)
insert detalle_alquiler values(24,'P0019',2,3.5,default)
go


insert detalle_alquiler values(25,'P0014',1,3.5,default)
insert detalle_alquiler values(25,'P0016',2,3.5,default)
insert detalle_alquiler values(26,'P0012',1,3.5,default)
insert detalle_alquiler values(26,'P0016',3,3.5,default)
insert detalle_alquiler values(26,'P0008',2,3.5,default)
insert detalle_alquiler values(27,'P0012',1,3.5,default)
insert detalle_alquiler values(28,'P0013',2,3.5,default)
insert detalle_alquiler values(28,'P0012',1,3.5,default)
go

-------------------------------------------------------
insert detalle_alquiler values(29,'P0013',1,3.5,default)
insert detalle_alquiler values(29,'P0016',2,3.5,1)
insert detalle_alquiler values(29,'P0012',1,3.5,default)
insert detalle_alquiler values(30,'P0016',2,3.5,default)
insert detalle_alquiler values(30,'P0008',2,3.5,default)
insert detalle_alquiler values(31,'P0012',1,3.5,default)
insert detalle_alquiler values(31,'P0013',1,3.5,default)
insert detalle_alquiler values(32,'P0012',2,3.5,default)
insert detalle_alquiler values(32,'P0022',1,3.5,default)
go
insert detalle_alquiler values(33,'P0011',1,3.5,default)
insert detalle_alquiler values(33,'P0016',3,3.5,default)
insert detalle_alquiler values(34,'P0012',1,3.5,default)
insert detalle_alquiler values(34,'P0016',1,3.5,default)
insert detalle_alquiler values(35,'P0018',2,3.5,default)
insert detalle_alquiler values(35,'P0022',2,3.5,default)
insert detalle_alquiler values(36,'P0021',3,3.5,default)
insert detalle_alquiler values(36,'P0019',1,3.5,default)
go

insert detalle_alquiler values(37,'P0014',1,3.5,default)
insert detalle_alquiler values(37,'P0016',2,3.5,default)
insert detalle_alquiler values(38,'P0012',1,3.5,default)
insert detalle_alquiler values(38,'P0016',3,3.5,default)
insert detalle_alquiler values(39,'P0008',1,3.5,default)
insert detalle_alquiler values(39,'P0012',2,3.5,default)
insert detalle_alquiler values(40,'P0015',1,3.5,default)
insert detalle_alquiler values(40,'P0021',2,3.5,default)
go

insert detalle_alquiler values(40,'P0013',1,3.5,default)
insert detalle_alquiler values(40,'P0016',2,3.5,default)
insert detalle_alquiler values(41,'P0023',1,3.5,default)
insert detalle_alquiler values(41,'P0015',2,3.5,1)
insert detalle_alquiler values(41,'P0020',1,3.5,1)
insert detalle_alquiler values(41,'P0012',1,3.5,default)
insert detalle_alquiler values(42,'P0020',1,3.5,default)
insert detalle_alquiler values(42,'P0021',2,3.5,default)
insert detalle_alquiler values(42,'P0022',1,3.5,default)
insert detalle_alquiler values(42,'P0023',2,3.5,default)
GO

-- NUEVO - del 43 al 50
insert detalle_alquiler values(43,'P0024',1,3.5,default)
insert detalle_alquiler values(43,'P0025',2,3.5,default)
insert detalle_alquiler values(44,'P0030',1,3.5,default)
insert detalle_alquiler values(44,'P0031',2,3.5,1)
insert detalle_alquiler values(44,'P0032',1,3.5,1)
insert detalle_alquiler values(45,'P0027',1,3.5,default)
insert detalle_alquiler values(45,'P0024',2,3.5,default)
insert detalle_alquiler values(46,'P0021',1,3.5,default)
insert detalle_alquiler values(46,'P0029',2,3.5,default)
insert detalle_alquiler values(47,'P0028',1,3.5,default)
insert detalle_alquiler values(47,'P0023',1,3.5,default)
insert detalle_alquiler values(47,'P0016',2,3.5,default)
insert detalle_alquiler values(48,'P0031',1,3.5,default)
insert detalle_alquiler values(48,'P0032',2,3.5,1)
insert detalle_alquiler values(49,'P0020',1,3.5,1)
insert detalle_alquiler values(49,'P0022',2,3.5,default)
insert detalle_alquiler values(49,'P0026',1,3.5,default)
insert detalle_alquiler values(50,'P0031',2,3.5,default)
insert detalle_alquiler values(50,'P0032',2,3.5,default)
insert detalle_alquiler values(50,'P0027',1,3.5,default)
GO

insert detalle_alquiler values(51,'P0028',3,3.5,1)
insert detalle_alquiler values(51,'P0012',1,3.5,default)
insert detalle_alquiler values(52,'P0030',2,3.5,default)
insert detalle_alquiler values(52,'P0028',2,3.5,default)
insert detalle_alquiler values(53,'P0028',1,3.5,default)
insert detalle_alquiler values(53,'P0027',1,3.5,default)
insert detalle_alquiler values(53,'P0031',2,3.5,default)
GO

insert detalle_alquiler values(54,'P0028',1,3.5,1)
insert detalle_alquiler values(54,'P0012',2,3.5,default)
insert detalle_alquiler values(55,'P0030',1,3.5,default)
insert detalle_alquiler values(55,'P0028',1,3.5,default)
insert detalle_alquiler values(55,'P0028',2,3.5,default)
insert detalle_alquiler values(56,'P0027',1,3.5,default)
insert detalle_alquiler values(56,'P0031',2,3.5,default)
GO

insert detalle_alquiler values(57,'P0008',2,3.5,1)
insert detalle_alquiler values(57,'P0002',1,3.5,default)
insert detalle_alquiler values(58,'P0024',1,3.5,default)
insert detalle_alquiler values(59,'P0029',3,3.5,default)
insert detalle_alquiler values(59,'P0025',2,3.5,default)
insert detalle_alquiler values(60,'P0027',1,3.5,default)
insert detalle_alquiler values(60,'P0030',1,3.5,default)
insert detalle_alquiler values(61,'P0031',3,3.5,default)
insert detalle_alquiler values(61,'P0017',1,3.5,default)
insert detalle_alquiler values(61,'P0023',2,3.5,default)
GO

insert detalle_alquiler values(62,'P0014',1,3.5,1)
insert detalle_alquiler values(62,'P0022',2,3.5,default)
insert detalle_alquiler values(62,'P0030',1,3.5,default)
insert detalle_alquiler values(63,'P0028',2,3.5,default)
insert detalle_alquiler values(63,'P0008',1,3.5,default)
insert detalle_alquiler values(64,'P0017',1,3.5,default)
insert detalle_alquiler values(64,'P0013',2,3.5,default)
insert detalle_alquiler values(65,'P0011',2,3.5,default)
insert detalle_alquiler values(65,'P0010',1,3.5,default)
insert detalle_alquiler values(65,'P0007',3,3.5,default)
GO

insert detalle_alquiler values(66,'P0001',1,3.5,1)
insert detalle_alquiler values(66,'P0021',1,3.5,default)
insert detalle_alquiler values(67,'P0003',1,3.5,default)
insert detalle_alquiler values(67,'P0008',1,3.5,default)
insert detalle_alquiler values(67,'P0028',1,3.5,default)
insert detalle_alquiler values(68,'P0017',1,3.5,default)
insert detalle_alquiler values(68,'P0023',1,3.5,default)
insert detalle_alquiler values(69,'P0011',1,3.5,default)
insert detalle_alquiler values(69,'P0010',1,3.5,default)
insert detalle_alquiler values(69,'P0017',1,3.5,default)
insert detalle_alquiler values(70,'P0021',1,3.5,default)
insert detalle_alquiler values(70,'P0030',1,3.5,default)
insert detalle_alquiler values(70,'P0014',1,3.5,default)
GO

select * from detalle_alquiler
go

---------------------------------------------------------
create table Peli_Actor
(
cod_pel char(5),
cod_act char(5),
primary key(cod_pel, cod_act)
)
go

-- select * from actores
-- select * from peliculas
-- go

-- Ingreso de Registros
Insert peli_actor values('P0001','A0003')
Insert peli_actor values('P0001','A0016')
Insert peli_actor values('P0002','A0019')
Insert peli_actor values('P0002','A0016')
Insert peli_actor values('P0002','A0017')
Insert peli_actor values('P0003','A0014')
Insert peli_actor values('P0003','A0020')
Insert peli_actor values('P0004','A0013')
Insert peli_actor values('P0005','A0019')
Insert peli_actor values('P0006','A0021')
Insert peli_actor values('P0006','A0022')
Insert peli_actor values('P0006','A0023')
go

Insert peli_actor values('P0007','A0025')
Insert peli_actor values('P0008','A0025')
Insert peli_actor values('P0009','A0025')
Insert peli_actor values('P0010','A0025')
Insert peli_actor values('P0007','A0026')
Insert peli_actor values('P0008','A0026')
Insert peli_actor values('P0009','A0026')
Insert peli_actor values('P0010','A0026')
Insert peli_actor values('P0007','A0027')
Insert peli_actor values('P0008','A0027')
Insert peli_actor values('P0009','A0027')
Insert peli_actor values('P0010','A0027')
go

Insert peli_actor values('P0011','A0004')
Insert peli_actor values('P0011','A0028')
Insert peli_actor values('P0012','A0018')
Insert peli_actor values('P0013','A0018')
Insert peli_actor values('P0014','A0018')
go

Insert peli_actor values('P0015','A0029')
Insert peli_actor values('P0016','A0030')
Insert peli_actor values('P0017','A0031')
Insert peli_actor values('P0018','A0032')
go

--------------------------------------
Insert peli_actor values('P0017','A0023')
Insert peli_actor values('P0028','A0028')
Insert peli_actor values('P0030','A0005')
Insert peli_actor values('P0017','A0016')
Insert peli_actor values('P0019','A0018')

Insert peli_actor values('P0021','A0037')
Insert peli_actor values('P0021','A0038')
Insert peli_actor values('P0022','A0037')
Insert peli_actor values('P0022','A0038')
Insert peli_actor values('P0023','A0037')
Insert peli_actor values('P0023','A0038')
Insert peli_actor values('P0030','A0031')
go

Insert peli_actor values('P0025','A0035')
Insert peli_actor values('P0025','A0036')
Insert peli_actor values('P0026','A0035')
Insert peli_actor values('P0027','A0035')
go

Insert peli_actor values('P0028','A0029')
Insert peli_actor values('P0030','A0023')
Insert peli_actor values('P0031','A0022')
go

Insert peli_actor values('P0020','A0033')
Insert peli_actor values('P0020','A0034')
Insert peli_actor values('P0024','A0035')
Insert peli_actor values('P0024','A0036')
Insert peli_actor values('P0032','A0015')
Insert peli_actor values('P0032','A0029')
Insert peli_actor values('P0033','A0018')

Insert peli_actor values('P0034','A0025')
Insert peli_actor values('P0034','A0026')
Insert peli_actor values('P0034','A0027')
Insert peli_actor values('P0035','A0025')
Insert peli_actor values('P0035','A0026')
Insert peli_actor values('P0035','A0027')
go
Insert peli_actor values('P0035','A0006')
Insert peli_actor values('P0037','A0009')

Insert peli_actor values('P0038','A0024')
Insert peli_actor values('P0039','A0024')
Insert peli_actor values('P0040','A0024')
Insert peli_actor values('P0038','A0023')
Insert peli_actor values('P0039','A0023')

Insert peli_actor values('P0029','A0012')
Insert peli_actor values('P0029','A0039')
Insert peli_actor values('P0041','A0008')

Insert peli_actor values('P0042','A0011')
Insert peli_actor values('P0042','A0040')
Insert peli_actor values('P0043','A0011')
Insert peli_actor values('P0044','A0011')
Insert peli_actor values('P0045','A0010')
Insert peli_actor values('P0046','A0010')
Insert peli_actor values('P0045','A0041')
Insert peli_actor values('P0046','A0041')
go



select * from peliculas where cod_pel in ('P0020','P0024','P0032')
go
select * from Actores

select * from Peli_Actor order by cod_pel
go

select * from clientes
go
select * from genero
go
-------------------------------------------------
SELECT * FROM ALQUILER
SELECT * FROM detalle_alquiler
-------------------------------------------------

-- ACTUALIZANDO TODOS LOS ALQUILERES Y TODOS SUS detalle_alquilerS, ESTABLECIENDO
-- EL VALOR CERO EN SU CAMPO ESTADO
--UPDATE ALQUILER SET ESTADO=0
--GO
--UPDATE detalle_alquiler SET estado=0
--GO
-- ACTUALIZANDO TAMBIEN A TODOS LOS CLIENTES CON EL VALOR CERO AL CAMPO ESTADO
-- ESTO INDICA QUE EL CLIENTE NO ESTA DEBIENDO ALQUILERES (PELICULAS X DEVOLVER)
UPDATE CLIENTES SET Estado=1
GO

-- CREANDO LA TABLA RESUMEN_CLIENTES, LA CUAL CONTENDRA LA LISTA DE LOS 
-- CLIENTES CON SU CANTIDAD DE ALQUILERES DEVUELTOS Y POR DEVOLVER (NO DEVUELTOS).
go
CREATE TABLE Resumen_Clientes
(
	NRO		INT IDENTITY PRIMARY KEY,
	COD_CLI		CHAR(5),
	NOM_CLI		VARCHAR(80),
	ALQ_DEV		INT,
	ALQ_NODEV	INT
)
GO

SELECT * FROM RESUMEN_CLIENTES
GO

-- FOREIGN KEYS
ALTER TABLE PELI_ACTOR
ADD CONSTRAINT PA_FK_COD_PEL FOREIGN KEY(COD_PEL) 
	REFERENCES PELICULAS(COD_PEL),
    CONSTRAINT PA_FK_COD_ACT FOREIGN KEY(COD_ACT) 
	REFERENCES ACTORES(COD_ACT)
GO

ALTER TABLE ACTORES
ADD FOREIGN KEY(COD_PAIS) REFERENCES PAIS(COD_PAIS)
GO

ALTER TABLE PELICULAS
ADD FOREIGN KEY(COD_FOR) REFERENCES FORMATO(COD_FOR),
    FOREIGN KEY(COD_GEN) REFERENCES GENERO(COD_GEN)
GO

ALTER TABLE ALQUILER
ADD FOREIGN KEY(COD_CLI) REFERENCES CLIENTES(COD_CLI)
GO

ALTER TABLE DETALLE_ALQUILER
ADD FOREIGN KEY(NUM_ALQ) REFERENCES ALQUILER(NUM_ALQ),
    FOREIGN KEY(COD_PEL) REFERENCES PELICULAS(COD_PEL)
GO

-----------------------------------------------------

insert into peliculas values('P0047','Batman vs Superman: Dawn of Justice',
150,'G04',4,15,2016)
insert into Actores values('A0042','Henry Cavill',2,null)
insert into Actores values('A0043','Ben Affleck',1,null)
go

insert into peliculas values('P0048','Divergente La Serie:Leal',120,'G06',4,10,2016)
insert into Actores values('A0044','Shailene Woodley', 1,null)
insert into Actores values('A0045','Theo James', 2, null)
go

insert into peliculas values('P0049','Londres Bajo Fuego',100,'G04',4,12,2016)
insert into Actores values('A0046','Gerard Butler',11,null)
insert into Actores values('A0047','Morgan Freeman',1,null)
go

insert into peliculas values('P0050','Mi Gran Boda Griega 2',100,'G01',4,10,2016)
insert into Actores values('A0048','Nia Vardalos',13,null)
insert into Actores values('A0049','John Corbett',1,null)
go

insert into peliculas values('P0051','El Bosque Siniestro',100,'G02',4,8,2016)
insert into Actores values('A0050','Natalie Dormer',2,null)
insert into Actores values('A0051','Taylor Kinney',1,null)
go
