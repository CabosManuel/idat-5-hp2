Use Master
Go

if exists(select * from sys.sysdatabases where name='BDVIDEOS2019')
begin
   Alter Database BDVIDEOS2019 Set Single_User With Rollback Immediate
	
   Drop Database BDVIDEOS2019
end   
Go

Create Database BDVIDEOS2019
COLLATE Modern_Spanish_CI_AI
Go

Use BDVIDEOS2019
go
SET LANGUAGE SPANISH
GO

create table Pais
(
	cod_pais int not null constraint pkcod_pais primary key,
	nom_pais varchar(50)
)
go

insert into Pais values(1,'Estados Unidos')
insert into Pais values(2,'Inglaterra')
insert into Pais values(3,'España')
insert into Pais values(4,'Mexico')
insert into Pais values(5,'Argentina')
insert into Pais values(6,'China')
insert into Pais values(7,'Japon')
insert into Pais values(8,'Peru')
insert into Pais values(9,'Australia')
insert into Pais values(10,'Italia')
insert into Pais values(11,'Escocia')
insert into Pais values(12,'Grecia')
insert into Pais values(13,'Canada')
go

Create Table Actores
(
	cod_act char(5) not null constraint pkcod_Act primary key,
	nom_act varchar(50) not null,
	cod_pais int references Pais,
	eliminado char(2) default('No')
)
go

insert into Actores values('A0001','Sharon Stone',1,'No')
insert into Actores values('A0002','Michael Douglas',1, 'No')
insert into Actores values('A0003','Julia Roberts',1, 'No')
insert into Actores values('A0004','Hugh Grant',2, 'No')
insert into Actores values('A0005','Colin Firth',2, 'No')
insert into Actores values('A0006','Liam Neeson',2, 'No')
insert into Actores values('A0007','Rowan Atkinson',2, 'No')
insert into Actores values('A0008','Chow Yun Fat',6, 'No')
insert into Actores values('A0009','Jet Li',6, 'No')
insert into Actores values('A0010','Jackie Chan',6, 'No')
insert into Actores values('A0011','Whoopi Goldberg',1, 'No')
insert into Actores values('A0012','Cuba Gooding Jr.',1, 'No')
insert into Actores values('A0013','Owen Wilson',1, 'No')
insert into Actores values('A0014','Ashton Kutcher',1, 'No')
insert into Actores values('A0015','Antonio Banderas',3, 'No')
insert into Actores values('A0016','Richard Gere',1, 'No')
insert into Actores values('A0017','Susan Sarandon',1, 'No')
insert into Actores values('A0018','Harrison Ford',2, 'No')
insert into Actores values('A0019','Jennifer Lopez',1, 'No')
insert into Actores values('A0020','Ernie Mac',1, 'No')
insert into Actores values('A0021','Jude Law',2, 'No')
insert into Actores values('A0022','Joseph Fiennes',2, 'No')
insert into Actores values('A0023','Rachel Weiz',1, 'No')
insert into Actores values('A0024','Brendan Fraser',1, 'No')
insert into Actores values('A0025','Daniel Radcliffe',2, 'No')
insert into Actores values('A0026','Emma Watson',2, 'No')
insert into Actores values('A0027','Rupert Grint',2, 'No')
insert into Actores values('A0028','Sandra Bulock',1, 'No')
insert into Actores values('A0029','Jennifer Aniston',1, 'No')
insert into Actores values('A0030','Charlize Theron',1, 'No')
insert into Actores values('A0031','Kate Beckinsale',1, 'No')
insert into Actores values('A0032','Nicolas Cage',1, 'No')
insert into Actores values('A0033','Gwilney Palthrow',1, 'No')
insert into Actores values('A0034','Downey Jr',1, 'No')
insert into Actores values('A0035','Arnold Schwarsnegger',1, 'No')
insert into Actores values('A0036','Lynda Hamilton',1, 'No')
insert into Actores values('A0037','Tobey Maguire',1, 'No')
insert into Actores values('A0038','Kristen Dunts',1, 'No')
insert into Actores values('A0039','Robert De Niro',10, 'No')
insert into Actores values('A0040','Demi More',1, 'No')
insert into Actores values('A0041','Chris Tucker',1, 'No')
go

insert into Actores values('A0042','Henry Cavill',2,'No')
insert into Actores values('A0043','Ben Affleck',1,'No')
insert into Actores values('A0044','Shailene Woodley', 1,'No')
insert into Actores values('A0045','Theo James', 2, 'No')
insert into Actores values('A0046','Gerard Butler',11,'No')
insert into Actores values('A0047','Morgan Freeman',1,'No')
insert into Actores values('A0048','Nia Vardalos',13,'No')
insert into Actores values('A0049','John Corbett',1,'No')
insert into Actores values('A0050','Natalie Dormer',2,'No')
insert into Actores values('A0051','Taylor Kinney',1,'No')
go


create table Genero
(
	cod_gen char(3) not null constraint pkcod_gen primary key,
	des_gen varchar(50) not null
)
go

insert into Genero values('G01','Comedia')
insert into Genero values('G02','Terror')
insert into Genero values('G03','Drama')
insert into Genero values('G04','Accion')
insert into Genero values('G05','Romantica')
insert into Genero values('G06','Ciencia Ficcion')

insert into Genero values('G07','Animacion')
insert into Genero values('G08','Anime')
go


create table Peliculas
(
	cod_pel char(5) constraint pdcod_pel primary key,
	nom_pel varchar(80),
	duracion int default(60),
	cod_gen char(3) references Genero,
	cant_cop int default(1),
	año int default(2019)
)
go

create table Formatos
(
	cod_for int constraint pkcod_for primary key,
	descrip	varchar(30),
	precio decimal(6,2)
)
go

insert into Formatos values(101,'DVD', 15.90)
insert into Formatos values(102,'Blu Ray', 38.50)
insert into Formatos values(103,'DVD Doble', 25.90)
insert into Formatos values(104,'Blu Ray Doble', 68.90)
go


/*insert into Peliculas values('P0001','Mujer Bonita',120,'G05',5,1985)
insert into Peliculas values('P0002','Bailamos',130,'G05',10,2003)
insert into Peliculas values('P0003','Conquistando a mi suegro',110,'G01',10,2005)
insert into Peliculas values('P0004','Los Rompebodas',110,'G01',15,2005)
insert into Peliculas values('P0005','Una suegra de cuidado',120,'G01',15,2005)
insert into Peliculas values('P0006','Enemigo al Acecho',120,'G04',10,2004)
insert into Peliculas values('P0007','Harry Potter y la Piedra Filosofal',175,'G04',10,2002)
insert into Peliculas values('P0008','Harry Potter y La Camara Secreta',180,'G04',10,2003)
insert into Peliculas values('P0009','Harry Potter y el Prisionero de Azkaban',175,'G04',10,2004)
insert into Peliculas values('P0010','Harry Potter y el Caliz de Fuego',185,'G04',10,2005)
insert into Peliculas values('P0011','Amor a Segunda Vista',105,'G05',10,2002)
insert into Peliculas values('P0012','Indiana Jones y Los Cazadores del Arca Perdida',185,'G04',10,1997)
insert into Peliculas values('P0013','Indiana Jones y El templo de la Perdicion',185,'G04',10,1998)
insert into Peliculas values('P0014','Indiana Jones y La Ultima Cruzada',185,'G04',10,1999)
insert into Peliculas values('P0015','Dicen por ahi',105,'G05',8,2006)
insert into Peliculas values('P0016','AEONFlux',125,'G04',10,2006)
insert into Peliculas values('P0017','Inframundo II',115,'G04',10,2006)
insert into Peliculas values('P0018','Señor de la Guerra',110,'G04',10,2006)
insert into Peliculas values('P0019','Indiana Jones y la Calavera de Cristal',135,'G04',8,2007)
insert into Peliculas values('P0020','IRON MAN',125,'G04',10,2007)
insert into Peliculas values('P0021','SPIDERMAN I',125,'G04',15,2004)
insert into Peliculas values('P0022','SPIDERMAN II',130,'G04',10,2005)
insert into Peliculas values('P0023','SPIDERMAN III',130,'G04',12,2006)
insert into Peliculas values('P0024','TERMINATOR I',115,'G06',10,1999)
insert into Peliculas values('P0025','TERMINATOR II',130,'G06',20,2001)
insert into Peliculas values('P0026','TERMINATOR III',120,'G06',10,2003)
insert into Peliculas values('P0027','TERMINATOR IV',115,'G06',15,2009)
insert into Peliculas values('P0028','LECCION DE HONOR',130,'G03',10,2002)
insert into Peliculas values('P0029','HOMBRES DE HONOR',120,'G03',10,2003)
insert into Peliculas values('P0030','MIENTRAS DORMIAS',115,'G03',10,2003)
insert into Peliculas values('P0031','SAW I',130,'G02',10,2006)
insert into Peliculas values('P0032','HOSTEL',120,'G02',10,2006)
insert into Peliculas values('P0033','Indiana Jones y La Calavera de Cristal',170,'G04',10,2008)
insert into Peliculas values('P0034','Harry Potter y La Orden del Fenix',180,'G04',10,2007)
insert into Peliculas values('P0035','Harry Potter y El Misterio del Principe',195,'G04',10,2009)
insert into Peliculas values('P0036','Búsqueda Implacable',165,'G04',8,2009)
insert into Peliculas values('P0037','The One',115,'G04',5,2008)
insert into Peliculas values('P0038','La Momia',165,'G06',8,2006)
insert into Peliculas values('P0039','La Momia Regresa',135,'G06',5,2008)
insert into Peliculas values('P0040','La Momia III',155,'G06',8,2009)
insert into Peliculas values('P0041','DragonBall',115,'G06',10,2009)
insert into Peliculas values('P0042','GHOST La Sombra del Amor',115,'G05',10,1999)
insert into Peliculas values('P0043','Cambio de Hábito',125,'G01',10,2000)
insert into Peliculas values('P0044','Cambio de Hábito II',125,'G01',10,2001)
insert into Peliculas values('P0045','Pareja Explosiva',125,'G01',5,2006)
insert into Peliculas values('P0046','Pareja Explosiva II',115,'G01',8,2008)
insert into Peliculas values('P0047','Batman vs Superman: Dawn of Justice',150,'G04',15,2016)
insert into Peliculas values('P0048','Divergente La Serie:Leal',120,'G06',10,2016)
insert into Peliculas values('P0049','Londres Bajo Fuego',100,'G04',12,2016)
insert into Peliculas values('P0050','Mi Gran Boda Griega 2',100,'G01',10,2016)
insert into Peliculas values('P0051','El Bosque Siniestro',100,'G02',8,2016)*/
go





create table Clientes
(
	cod_cli char(5) constraint pkcod_cli primary key,
	nom_cli varchar(80) not null,
	celu_cli varchar(12) default('Sin Celular'),
	email_cli varchar(50) default('Sim Email'),
	Eliminado char(2) default('No')
)
go

insert into Clientes values ('C0001','LAURA MORENO LEE',default, default,'No')
insert into Clientes values ('C0002','ALEJANDRO PARDO',default, default,'No')
insert into Clientes values ('C0003','CLAUDIA LEE',default, default,'No')
insert into Clientes values ('C0004','PERCY OBANDO',default, default,'No')
insert into Clientes values ('C0005','MIGUEL NARVA',default, default,'No')
insert into Clientes values ('C0006','CLAUDIO PARDO',default, default,'No')
insert into Clientes values ('C0007','MONICA GONZALES',default, default,'No')
insert into Clientes values ('C0008','JHON MORALES',default, default,'No')
insert into Clientes values ('C0009','FERNANDO REDONDO',default, default,'No')
insert into Clientes values ('C0010','GABRIELA ZAPATA',default, default,'No')
insert into Clientes values ('C0011','SANDRA CAMPOS',default, default,'No')
insert into Clientes values ('C0012','MIGUEL RAMIREZ',default, default,'No')
insert into Clientes values ('C0013','RAUL MORIENTES',default, default,'No')
insert into Clientes values ('C0014','EUGENIO CAMPOS',default, default,'No')
insert into Clientes values ('C0015','LUCILA PARDO',default, default,'No')
insert into Clientes values ('C0016','ROBERTO BAGGIO',default, default,'No')
insert into Clientes values ('C0017','LUCIA FERNANDEZ TORRES',default, default,'No')
insert into Clientes values ('C0018','JHONATAN PEÑARAN',default, default,'No')
insert into Clientes values ('C0019','MANUEL LOPEZ',default, default,'No')
insert into Clientes values ('C0020','JOSE RODAS',default, default,'No')
insert into Clientes values ('C0021','PAOLA ROMANI',default, default,'No')
insert into Clientes values ('C0022','VANESSA GONZALES',default, default,'No')
insert into Clientes values ('C0023','CLAUDIA RAMOS',default, default,'No')
insert into Clientes values ('C0024','ARTURO BARGARAN',default, default,'No')
insert into Clientes values ('C0025','JORGE LUIS MORI',default, default,'No')
insert into Clientes values ('C0026','GUSTAVO NOLAZCO',default, default,'No')
insert into Clientes values ('C0027','PEDRO TARAZONA',default, default,'No')
insert into Clientes values ('C0028','ENITH DE LA CRUZ',default, default,'No')
go

create table Venta_Cabecera
(
	num_vta int identity(1, 1) not null 
		constraint pkVenta_Cabecera primary key,
	cod_cli char(5) references Clientes,
	fecha_vta smalldatetime,
	total_vta decimal(8,2) default 0,
	eliminado char(2) default('No')
)
go

-----------------------------------------------------------------
insert into Venta_Cabecera  values('C0001','12/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0002','14/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0004','15/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0006','18/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0003','20/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0010','22/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0008','22/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0009','23/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0020','23/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0013','25/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0016','27/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0022','27/08/2018',0, 'No')
insert into Venta_Cabecera  values('C0005','02/09/2018',0, 'No')
insert into Venta_Cabecera  values('C0007','04/09/2018',0, 'No')
insert into Venta_Cabecera  values('C0024','09/09/2018',0, 'No')
insert into Venta_Cabecera  values('C0023','12/09/2018',0, 'No')
insert into Venta_Cabecera  values('C0025','15/09/2018',0, 'No')
insert into Venta_Cabecera  values('C0012','17/09/2018',0, 'No')
insert into Venta_Cabecera  values('C0015','19/09/2018',0, 'No')
insert into Venta_Cabecera  values('C0021','22/09/2018',0, 'No')
insert into Venta_Cabecera  values('C0011','25/09/2018',0, 'No')
insert into Venta_Cabecera  values('C0019','01/10/2018',0, 'No')
insert into Venta_Cabecera  values('C0026','04/10/2018',0, 'No')
insert into Venta_Cabecera  values('C0027','07/10/2018',0, 'No')
insert into Venta_Cabecera  values('C0017','10/10/2018',0, 'No')
insert into Venta_Cabecera  values('C0018','12/10/2018',0, 'No')
insert into Venta_Cabecera  values('C0028','15/10/2018',0, 'No')
insert into Venta_Cabecera  values('C0014','19/10/2018',0, 'No')
insert into Venta_Cabecera  values('C0001','22/10/2018',0, 'No')
insert into Venta_Cabecera  values('C0006','25/10/2018',0, 'No')
insert into Venta_Cabecera  values('C0007','28/10/2018',0, 'No')
insert into Venta_Cabecera  values('C0017','03/11/2018',0, 'No')
insert into Venta_Cabecera  values('C0008','08/11/2018',0, 'No')
insert into Venta_Cabecera  values('C0028','10/11/2018',0, 'No')
insert into Venta_Cabecera  values('C0014','13/11/2018',0, 'No')
insert into Venta_Cabecera  values('C0019','15/11/2018',0, 'No')
insert into Venta_Cabecera  values('C0026','18/11/2018',0, 'No')
insert into Venta_Cabecera  values('C0027','21/11/2018',0, 'No')
insert into Venta_Cabecera  values('C0017','24/11/2018',0, 'No')
insert into Venta_Cabecera  values('C0018','25/11/2018',0, 'No')
insert into Venta_Cabecera  values('C0028','27/11/2018',0, 'No')
insert into Venta_Cabecera  values('C0014','28/11/2018',0, 'No')
go

-- NEW 06-2009 - del 43 al 50
insert into Venta_Cabecera  values('C0004','02/12/2018',0, 'No')
insert into Venta_Cabecera  values('C0008','08/12/2018',0, 'No')
insert into Venta_Cabecera  values('C0018','10/12/2018',0, 'No')
insert into Venta_Cabecera  values('C0014','12/12/2018',0, 'No')
insert into Venta_Cabecera  values('C0027','15/12/2018',0, 'No')
insert into Venta_Cabecera  values('C0028','19/12/2018',0, 'No')
insert into Venta_Cabecera  values('C0009','21/12/2018',0, 'No')
insert into Venta_Cabecera  values('C0024','22/12/2018',0, 'No')
insert into Venta_Cabecera  values('C0005','27/12/2018',0, 'No')
insert into Venta_Cabecera  values('C0019','28/12/2018',0, 'No')
insert into Venta_Cabecera  values('C0017','29/12/2018',0, 'No')
insert into Venta_Cabecera  values('C0001','03/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0003','07/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0008','11/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0021','14/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0024','18/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0028','21/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0009','22/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0024','24/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0015','26/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0012','27/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0023','27/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0002','28/01/2019',0, 'No')
insert into Venta_Cabecera  values('C0003','04/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0004','06/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0006','07/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0008','10/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0010','12/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0014','13/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0019','15/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0026','18/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0027','21/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0017','24/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0005','27/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0019','28/02/2019',0, 'No')
insert into Venta_Cabecera  values('C0019','02/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0026','03/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0027','08/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0017','11/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0018','13/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0028','15/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0014','18/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0001','20/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0006','22/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0007','24/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0009','25/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0024','27/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0005','28/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0019','29/03/2019',0, 'No')
insert into Venta_Cabecera  values('C0017','30/03/2019',0, 'No')
go


create table Venta_Detalle
(
	num_vta int not null references Venta_Cabecera,
	cod_pel char(5) not null references Peliculas,
	cant int default(1),
	cod_for int references Formatos,
	precio decimal(6,2) default(0),
	eliminado char(2) default('No'),
	   constraint pkVenta_Detalle Primary Key(num_vta, cod_pel)
)
go

-- TRUNCATE TABLE Venta_Detalle
insert into Venta_Detalle values(1,'P0001',1,101,0,'No') 
insert into Venta_Detalle values(1,'P0002',2,101,0,'No') 
insert into Venta_Detalle values(2,'P0004',1,102,0,'No') 
insert into Venta_Detalle values(2,'P0001',3,102,0,'No') 
insert into Venta_Detalle values(3,'P0006',1,102,0,'No') 
insert into Venta_Detalle values(4,'P0005',2,101,0,'No') 
insert into Venta_Detalle values(4,'P0001',1,102,0,'No') 
insert into Venta_Detalle values(5,'P0002',4,101,0,'No') 
insert into Venta_Detalle values(6,'P0004',1,101,0,'No') 
insert into Venta_Detalle values(7,'P0006',2,102,0,'No') 
insert into Venta_Detalle values(8,'P0003',1,101,0,'No') 
insert into Venta_Detalle values(9,'P0005',3,102,0,'No') 
insert into Venta_Detalle values(10,'P0006',1,102,0,'No')
insert into Venta_Detalle values(11,'P0004',2,101,0,'No')
insert into Venta_Detalle values(12,'P0002',2,101,0,'No')
insert into Venta_Detalle values(12,'P0003',1,102,0,'No')
insert into Venta_Detalle values(13,'P0002',1,101,0,'No')
insert into Venta_Detalle values(13,'P0005',2,101,0,'No')
insert into Venta_Detalle values(14,'P0002',1,102,0,'No')
insert into Venta_Detalle values(14,'P0001',4,102,0,'No')
insert into Venta_Detalle values(15,'P0006',2,101,0,'No')
insert into Venta_Detalle values(15,'P0003',1,102,0,'No')
insert into Venta_Detalle values(16,'P0001',2,101,0,'No')
insert into Venta_Detalle values(16,'P0003',3,102,0,'No')
insert into Venta_Detalle values(17,'P0004',2,101,0,'No')
insert into Venta_Detalle values(17,'P0006',1,102,0,'No')
insert into Venta_Detalle values(18,'P0005',2,102,0,'No')
insert into Venta_Detalle values(18,'P0003',1,101,0,'No')
insert into Venta_Detalle values(19,'P0007',1,102,0,'No')
insert into Venta_Detalle values(19,'P0008',3,101,0,'No')
insert into Venta_Detalle values(20,'P0007',1,102,0,'No')
insert into Venta_Detalle values(21,'P0009',2,101,0,'No')
insert into Venta_Detalle values(22,'P0011',1,102,0,'No')
insert into Venta_Detalle values(22,'P0012',2,101,0,'No')
insert into Venta_Detalle values(23,'P0013',1,102,0,'No')
insert into Venta_Detalle values(24,'P0012',2,102,0,'No')
insert into Venta_Detalle values(24,'P0019',2,101,0,'No')
insert into Venta_Detalle values(25,'P0014',1,101,0,'No')
insert into Venta_Detalle values(25,'P0016',2,101,0,'No')
insert into Venta_Detalle values(26,'P0012',1,101,0,'No')
insert into Venta_Detalle values(26,'P0016',3,102,0,'No')
insert into Venta_Detalle values(26,'P0008',2,102,0,'No')
insert into Venta_Detalle values(27,'P0012',1,101,0,'No')
insert into Venta_Detalle values(28,'P0013',2,101,0,'No')
insert into Venta_Detalle values(28,'P0012',1,101,0,'No')
insert into Venta_Detalle values(29,'P0013',1,101,0,'No')
insert into Venta_Detalle values(29,'P0016',2,102,0,'No')
insert into Venta_Detalle values(29,'P0012',1,101,0,'No')
insert into Venta_Detalle values(30,'P0016',2,102,0,'No')
insert into Venta_Detalle values(30,'P0008',2,102,0,'No')
insert into Venta_Detalle values(31,'P0012',1,102,0,'No')
insert into Venta_Detalle values(31,'P0013',1,101,0,'No')
insert into Venta_Detalle values(32,'P0012',2,101,0,'No')
insert into Venta_Detalle values(32,'P0022',1,102,0,'No')
insert into Venta_Detalle values(33,'P0011',1,101,0,'No')
insert into Venta_Detalle values(33,'P0016',3,102,0,'No')
insert into Venta_Detalle values(34,'P0012',1,101,0,'No')
insert into Venta_Detalle values(34,'P0016',1,101,0,'No')
insert into Venta_Detalle values(35,'P0018',2,102,0,'No')
insert into Venta_Detalle values(35,'P0022',2,101,0,'No')
insert into Venta_Detalle values(36,'P0021',3,102,0,'No')
insert into Venta_Detalle values(36,'P0019',1,102,0,'No')
insert into Venta_Detalle values(37,'P0014',1,101,0,'No')
insert into Venta_Detalle values(37,'P0016',2,101,0,'No')
insert into Venta_Detalle values(38,'P0012',1,102,0,'No')
insert into Venta_Detalle values(38,'P0016',3,102,0,'No')
insert into Venta_Detalle values(39,'P0008',1,101,0,'No')
insert into Venta_Detalle values(39,'P0012',2,102,0,'No')
insert into Venta_Detalle values(40,'P0015',1,102,0,'No')
insert into Venta_Detalle values(40,'P0021',2,101,0,'No')
insert into Venta_Detalle values(40,'P0013',1,102,0,'No')
insert into Venta_Detalle values(40,'P0016',2,101,0,'No')
insert into Venta_Detalle values(41,'P0023',1,102,0,'No')
insert into Venta_Detalle values(41,'P0015',2,101,0,'No')
insert into Venta_Detalle values(41,'P0020',1,101,0,'No')
insert into Venta_Detalle values(41,'P0012',1,102,0,'No')
insert into Venta_Detalle values(42,'P0020',1,102,0,'No')
insert into Venta_Detalle values(42,'P0021',2,101,0,'No')
insert into Venta_Detalle values(42,'P0022',1,101,0,'No')
insert into Venta_Detalle values(42,'P0023',2,102,0,'No')
insert into Venta_Detalle values(43,'P0024',1,101,0,'No')
insert into Venta_Detalle values(43,'P0025',2,102,0,'No')
insert into Venta_Detalle values(44,'P0030',1,102,0,'No')
insert into Venta_Detalle values(44,'P0031',2,101,0,'No')
insert into Venta_Detalle values(44,'P0032',1,102,0,'No')
insert into Venta_Detalle values(45,'P0027',1,101,0,'No')
insert into Venta_Detalle values(45,'P0024',2,102,0,'No')
insert into Venta_Detalle values(46,'P0021',1,101,0,'No')
insert into Venta_Detalle values(46,'P0029',2,101,0,'No')
insert into Venta_Detalle values(47,'P0028',1,102,0,'No')
insert into Venta_Detalle values(47,'P0023',1,101,0,'No')
insert into Venta_Detalle values(47,'P0016',2,101,0,'No')
insert into Venta_Detalle values(48,'P0031',1,102,0,'No')
insert into Venta_Detalle values(48,'P0032',2,102,0,'No')
insert into Venta_Detalle values(49,'P0020',1,101,0,'No')
insert into Venta_Detalle values(49,'P0022',2,102,0,'No')
insert into Venta_Detalle values(49,'P0026',1,102,0,'No')
insert into Venta_Detalle values(50,'P0031',2,101,0,'No')
insert into Venta_Detalle values(50,'P0032',2,101,0,'No')
insert into Venta_Detalle values(50,'P0027',1,102,0,'No')
GO

insert into Venta_Detalle values(51,'P0028',3,101,0,'No')
insert into Venta_Detalle values(51,'P0012',1,102,0,'No')
insert into Venta_Detalle values(52,'P0030',2,101,0,'No')
insert into Venta_Detalle values(52,'P0028',2,103,0,'No')
insert into Venta_Detalle values(53,'P0028',1,101,0,'No')
insert into Venta_Detalle values(53,'P0027',1,104,0,'No')
insert into Venta_Detalle values(53,'P0031',2,101,0,'No')
insert into Venta_Detalle values(54,'P0028',1,101,0,'No')
insert into Venta_Detalle values(54,'P0012',2,101,0,'No')
insert into Venta_Detalle values(55,'P0030',1,102,0,'No')
insert into Venta_Detalle values(55,'P0028',1,101,0,'No')
insert into Venta_Detalle values(55,'P0029',2,103,0,'No')
insert into Venta_Detalle values(56,'P0027',1,101,0,'No')
insert into Venta_Detalle values(56,'P0031',2,101,0,'No')
insert into Venta_Detalle values(57,'P0008',2,101,0,'No')
insert into Venta_Detalle values(57,'P0002',1,104,0,'No')
insert into Venta_Detalle values(58,'P0024',1,101,0,'No')
insert into Venta_Detalle values(59,'P0029',3,101,0,'No')
insert into Venta_Detalle values(59,'P0025',2,102,0,'No')
insert into Venta_Detalle values(60,'P0027',1,101,0,'No')
insert into Venta_Detalle values(60,'P0030',1,103,0,'No')
insert into Venta_Detalle values(61,'P0031',3,101,0,'No')
insert into Venta_Detalle values(61,'P0017',1,102,0,'No')
insert into Venta_Detalle values(61,'P0023',2,101,0,'No')
insert into Venta_Detalle values(62,'P0014',1,104,0,'No')
insert into Venta_Detalle values(62,'P0022',2,101,0,'No')
insert into Venta_Detalle values(62,'P0030',1,103,0,'No')
insert into Venta_Detalle values(63,'P0028',2,101,0,'No')
insert into Venta_Detalle values(63,'P0008',1,101,0,'No')
insert into Venta_Detalle values(64,'P0017',1,102,0,'No')
insert into Venta_Detalle values(64,'P0013',2,102,0,'No')
insert into Venta_Detalle values(65,'P0011',2,102,0,'No')
insert into Venta_Detalle values(65,'P0010',1,101,0,'No')
insert into Venta_Detalle values(65,'P0007',3,101,0,'No')
insert into Venta_Detalle values(66,'P0001',1,103,0,'No')
insert into Venta_Detalle values(66,'P0021',1,101,0,'No')
insert into Venta_Detalle values(67,'P0003',1,104,0,'No')
insert into Venta_Detalle values(67,'P0008',1,101,0,'No')
insert into Venta_Detalle values(67,'P0028',1,104,0,'No')
insert into Venta_Detalle values(68,'P0017',1,104,0,'No')
insert into Venta_Detalle values(68,'P0023',1,101,0,'No')
insert into Venta_Detalle values(69,'P0011',1,102,0,'No')
insert into Venta_Detalle values(69,'P0010',1,102,0,'No')
insert into Venta_Detalle values(69,'P0017',1,101,0,'No')
insert into Venta_Detalle values(70,'P0021',1,103,0,'No')
insert into Venta_Detalle values(70,'P0030',1,101,0,'No')
insert into Venta_Detalle values(70,'P0014',1,103,0,'No')
GO

-- 71 al 92
insert into Venta_Detalle values(71,'P0031',2,101,0,'No')
insert into Venta_Detalle values(71,'P0032',1,102,0,'No')
insert into Venta_Detalle values(72,'P0027',1,101,0,'No')
insert into Venta_Detalle values(72,'P0024',2,102,0,'No')
insert into Venta_Detalle values(73,'P0021',1,101,0,'No')
insert into Venta_Detalle values(73,'P0029',2,101,0,'No')
insert into Venta_Detalle values(74,'P0028',1,102,0,'No')
insert into Venta_Detalle values(74,'P0023',1,101,0,'No')
insert into Venta_Detalle values(74,'P0016',2,101,0,'No')
insert into Venta_Detalle values(75,'P0030',1,103,0,'No')
insert into Venta_Detalle values(76,'P0028',2,101,0,'No')
insert into Venta_Detalle values(76,'P0008',1,101,0,'No')
insert into Venta_Detalle values(77,'P0017',1,102,0,'No')
insert into Venta_Detalle values(77,'P0013',2,102,0,'No')
insert into Venta_Detalle values(78,'P0011',2,102,0,'No')
insert into Venta_Detalle values(79,'P0024',1,101,0,'No')
insert into Venta_Detalle values(79,'P0025',2,102,0,'No')
insert into Venta_Detalle values(80,'P0030',1,102,0,'No')
insert into Venta_Detalle values(80,'P0031',2,101,0,'No')
insert into Venta_Detalle values(80,'P0032',1,102,0,'No')
insert into Venta_Detalle values(81,'P0027',1,101,0,'No')
insert into Venta_Detalle values(81,'P0024',2,102,0,'No')
insert into Venta_Detalle values(82,'P0021',1,101,0,'No')
insert into Venta_Detalle values(82,'P0029',2,101,0,'No')
insert into Venta_Detalle values(83,'P0028',1,102,0,'No')
insert into Venta_Detalle values(83,'P0023',1,101,0,'No')
insert into Venta_Detalle values(84,'P0016',2,101,0,'No')
insert into Venta_Detalle values(85,'P0014',1,101,0,'No')
insert into Venta_Detalle values(85,'P0016',2,101,0,'No')
insert into Venta_Detalle values(85,'P0012',1,101,0,'No')
insert into Venta_Detalle values(86,'P0016',3,102,0,'No')
insert into Venta_Detalle values(86,'P0008',2,102,0,'No')
insert into Venta_Detalle values(87,'P0012',1,101,0,'No')
insert into Venta_Detalle values(88,'P0013',2,101,0,'No')
insert into Venta_Detalle values(88,'P0012',1,101,0,'No')
insert into Venta_Detalle values(89,'P0013',1,101,0,'No')
insert into Venta_Detalle values(89,'P0016',2,102,0,'No')
insert into Venta_Detalle values(89,'P0012',1,101,0,'No')
insert into Venta_Detalle values(90,'P0016',2,102,0,'No')
insert into Venta_Detalle values(90,'P0008',2,102,0,'No')
insert into Venta_Detalle values(91,'P0012',1,102,0,'No')
insert into Venta_Detalle values(91,'P0013',1,101,0,'No')
insert into Venta_Detalle values(92,'P0012',2,101,0,'No')
insert into Venta_Detalle values(92,'P0022',1,102,0,'No')
go

---------------------------------------------------------
create table Peli_Actor
(
	cod_pel char(5) references Peliculas,
	cod_act char(5) references Actores,
	primary key(cod_pel, cod_act)
)
go


-- Ingreso de Registros
insert into Peli_Actor values('P0001','A0003')
insert into Peli_Actor values('P0001','A0016')
insert into Peli_Actor values('P0002','A0019')
insert into Peli_Actor values('P0002','A0016')
insert into Peli_Actor values('P0002','A0017')
insert into Peli_Actor values('P0003','A0014')
insert into Peli_Actor values('P0003','A0020')
insert into Peli_Actor values('P0004','A0013')
insert into Peli_Actor values('P0005','A0019')
insert into Peli_Actor values('P0006','A0021')
insert into Peli_Actor values('P0006','A0022')
insert into Peli_Actor values('P0006','A0023')
insert into Peli_Actor values('P0007','A0025')
insert into Peli_Actor values('P0008','A0025')
insert into Peli_Actor values('P0009','A0025')
insert into Peli_Actor values('P0010','A0025')
insert into Peli_Actor values('P0007','A0026')
insert into Peli_Actor values('P0008','A0026')
insert into Peli_Actor values('P0009','A0026')
insert into Peli_Actor values('P0010','A0026')
insert into Peli_Actor values('P0007','A0027')
insert into Peli_Actor values('P0008','A0027')
insert into Peli_Actor values('P0009','A0027')
insert into Peli_Actor values('P0010','A0027')
insert into Peli_Actor values('P0011','A0004')
insert into Peli_Actor values('P0011','A0028')
insert into Peli_Actor values('P0012','A0018')
insert into Peli_Actor values('P0013','A0018')
insert into Peli_Actor values('P0014','A0018')
insert into Peli_Actor values('P0015','A0029')
insert into Peli_Actor values('P0016','A0030')
insert into Peli_Actor values('P0017','A0031')
insert into Peli_Actor values('P0018','A0032')
insert into Peli_Actor values('P0017','A0023')
insert into Peli_Actor values('P0028','A0028')
insert into Peli_Actor values('P0030','A0005')
insert into Peli_Actor values('P0017','A0016')
insert into Peli_Actor values('P0019','A0018')
insert into Peli_Actor values('P0021','A0037')
insert into Peli_Actor values('P0021','A0038')
insert into Peli_Actor values('P0022','A0037')
insert into Peli_Actor values('P0022','A0038')
insert into Peli_Actor values('P0023','A0037')
insert into Peli_Actor values('P0023','A0038')
insert into Peli_Actor values('P0030','A0031')
insert into Peli_Actor values('P0025','A0035')
insert into Peli_Actor values('P0025','A0036')
insert into Peli_Actor values('P0026','A0035')
insert into Peli_Actor values('P0027','A0035')
insert into Peli_Actor values('P0028','A0029')
insert into Peli_Actor values('P0030','A0023')
insert into Peli_Actor values('P0031','A0022')
insert into Peli_Actor values('P0020','A0033')
insert into Peli_Actor values('P0020','A0034')
insert into Peli_Actor values('P0024','A0035')
insert into Peli_Actor values('P0024','A0036')
insert into Peli_Actor values('P0032','A0015')
insert into Peli_Actor values('P0032','A0029')
insert into Peli_Actor values('P0033','A0018')
insert into Peli_Actor values('P0034','A0025')
insert into Peli_Actor values('P0034','A0026')
insert into Peli_Actor values('P0034','A0027')
insert into Peli_Actor values('P0035','A0025')
insert into Peli_Actor values('P0035','A0026')
insert into Peli_Actor values('P0035','A0027')
insert into Peli_Actor values('P0035','A0006')
insert into Peli_Actor values('P0037','A0009')
insert into Peli_Actor values('P0038','A0024')
insert into Peli_Actor values('P0039','A0024')
insert into Peli_Actor values('P0040','A0024')
insert into Peli_Actor values('P0038','A0023')
insert into Peli_Actor values('P0039','A0023')
insert into Peli_Actor values('P0029','A0012')
insert into Peli_Actor values('P0029','A0039')
insert into Peli_Actor values('P0041','A0008')
insert into Peli_Actor values('P0042','A0011')
insert into Peli_Actor values('P0042','A0040')
insert into Peli_Actor values('P0043','A0011')
insert into Peli_Actor values('P0044','A0011')
insert into Peli_Actor values('P0045','A0010')
insert into Peli_Actor values('P0046','A0010')
insert into Peli_Actor values('P0045','A0041')
insert into Peli_Actor values('P0046','A0041')
go
insert into Peli_Actor values('P0047','A0042')
insert into Peli_Actor values('P0047','A0043')
insert into Peli_Actor values('P0048','A0044')
insert into Peli_Actor values('P0048','A0045')
insert into Peli_Actor values('P0049','A0046')

insert into Peli_Actor values('P0049','A0047')
insert into Peli_Actor values('P0050','A0048')
insert into Peli_Actor values('P0050','A0049')
insert into Peli_Actor values('P0051','A0050')
insert into Peli_Actor values('P0051','A0051')
-----------------------------------------------------



-------------Calculos Precio y Total_Vta ------------------------
update Venta_Detalle
	set precio=f.precio
	from Venta_Detalle vd inner join Formatos f
		on vd.cod_for=f.cod_for
go

--select * from Venta_Detalle
--go

update vc
	set total_vta=(select SUM(precio*cant) from Venta_Detalle where num_vta=vc.num_vta)
	from Venta_Cabecera vc
go
	
--select * from Venta_Cabecera
--go	
---------------------------------------------------------------------
	
select 'Base de Datos BDVIDEOS2019 creada correctamente' as Mensaje
go

SET NOCOUNT OFF
GO
