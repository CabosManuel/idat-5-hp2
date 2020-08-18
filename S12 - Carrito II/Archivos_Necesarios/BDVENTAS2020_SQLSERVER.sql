-- ---------------------------------------
-- Host      : (local)
-- Database  : BDVENTAS2020
-- Version   : Microsoft SQL Server 2014

-- SCRIPT  DE  IMPLANTACION  DE  BD. MS SQL SERVER  
-- CREACION DE BASE DE DATOS  (DATA y LOG)
USE master
go
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name='BDVENTAS2020')
BEGIN
	ALTER DATABASE BDVENTAS2020 SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE BDVENTAS2020
END
GO

CREATE DATABASE BDVENTAS2020
COLLATE MODERN_SPANISH_CI_AI
GO

-- Comprobar los devices creados
--EXEC SP_HELPDB BDVENTAS2020
--go

USE BDVENTAS2020
GO

SET LANGUAGE SPANISH
GO
SET DATEFORMAT DMY
GO
SET NOCOUNT ON
GO
--
-- Definition for table Articulos : 
--

CREATE TABLE Articulos (
  art_cod char(5) COLLATE Modern_Spanish_CI_AI NOT NULL,
  art_nom varchar(50) COLLATE Modern_Spanish_CI_AI NULL,
  art_uni char(4) COLLATE Modern_Spanish_CI_AI NULL,
  art_pre money NULL,
  art_stk int NULL
)
GO

--
-- Definition for table Clientes : 
--

CREATE TABLE dbo.Clientes (
  cli_cod char(5) COLLATE Modern_Spanish_CI_AI NOT NULL,
  cli_nom varchar(50) COLLATE Modern_Spanish_CI_AI NOT NULL,
  cli_tel varchar(10) COLLATE Modern_Spanish_CI_AI NULL,
  cli_cor varchar(40) COLLATE Modern_Spanish_CI_AI NULL,
  cli_dir varchar(50) COLLATE Modern_Spanish_CI_AI NULL,
  cli_cre money NULL
)
GO

--
-- Definition for table Fac_cabe : 
--

CREATE TABLE dbo.Fac_cabe (
  fac_num char(5) COLLATE Modern_Spanish_CI_AI NOT NULL,
  fac_fec datetime NOT NULL,
  cli_cod char(5) COLLATE Modern_Spanish_CI_AI NOT NULL,
  fac_tipo char(1) COLLATE Modern_Spanish_CI_AI NOT NULL,
  fac_igv money CONSTRAINT DF_Fac_cabe_fac_igv DEFAULT 0 NULL,
  ven_cod int NOT NULL,
  fac_total money CONSTRAINT DF_Fac_cabe_fac_total DEFAULT 0 NULL
)
GO

--
-- Definition for table Fac_deta : 
--

CREATE TABLE dbo.Fac_deta (
  fac_num char(5) COLLATE Modern_Spanish_CI_AI NOT NULL,
  art_cod char(5) COLLATE Modern_Spanish_CI_AI NOT NULL,
  art_can int NULL,
  art_pre money NULL
)
GO

--
-- Definition for table Vendedor : 
--

CREATE TABLE dbo.Vendedor (
  ven_cod int NOT NULL,
  ven_nom varchar(50) COLLATE Modern_Spanish_CI_AI NOT NULL,
  ven_Fecing datetime NULL
)
GO

--
-- Data for table dbo.Articulos  (LIMIT 0,500)
--

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0001', N'MOUSE GENIOUS', N'UNI', 25, 35)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0002', N'PENTIUM IV 1.8', N'UNI', 1550, 20)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0003', N'PENTIUM IV 2.5', N'UNI', 2500, 30)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0004', N'FUNDAS NAYLON', N'UNI', 25, 35)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0005', N'MEMORIA USB 1GB', N'UNI', 20, 24)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0006', N'TINTA BJC21 B/N', N'CAJA', 20, 25)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0007', N'IMPRESORA EPSON TX1000', N'UNI', 355, 30)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0008', N'MONITOR LCD LG 17', N'UNI', 380, 10)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0009', N'MONITOR LCD SAMSUNG 19', N'UNI', 450, 12)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0010', N'PENTIUM IV CORE 2 DUO', N'UNI', 2990, 7)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0011', N'MOUSE MICROSOFT', N'UNI', 70, 32)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0012', N'MEMORIA RAM 1GB KINGSTON', N'UNI', 90, 15)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0013', N'MEMORIA RAM 2GB KINGSTON', N'UNI', 150, 25)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0014', N'IMPRESORA CANON 1000', N'UNI', 205, 200)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0015', N'IMPRESORA HP P1006 Laser Jet', N'UNI', 450, 20)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0016', N'TINTA BJC25 NEGRA', N'CAJA', 15, 10)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0017', N'TONER HP NEGRO', N'CAJA', 220, 12)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0018', N'TONER HP COLOR', N'CAJA', 400, 10)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0019', N'TECLADO EPSON 102', N'UNI', 75, 22)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0020', N'MOUSE LOGITECH', N'UNI', 30, 19)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0021', N'USB KINGSTON 16GB', N'UNI', 140, 15)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0022', N'USB KINGSTON 8GB', N'UNI', 80, 20)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0023', N'USB KINGSTON 4GB', N'UNI', 50, 25)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0024', N'AMPLIFICADOR TRINITON', N'UNI', 100, 20)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0025', N'PARLANTES DE 50 watss', N'UNI', 70, 12)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0026', N'TECLADO MICRONICS 102', N'UNI', 55, 12)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0027', N'MOUSE INALAMBRICO', N'UNI', 90, 10)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0028', N'CD PRINCO X 50', N'CONO', 25, 10)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0029', N'DVD PRINCO X 50', N'CONO', 30, 20)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0030', N'SCANNER CODIGO DE BARRAS', N'UNI', 190, 10)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0031', N'CD PRINCO X 100', N'CONO', 45, 10)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0032', N'DVD PRINCO X 100', N'CONO', 55, 20)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0033', N'LECTOR-QUEMADOR CD LG', N'UNI', 45, 10)
GO

INSERT INTO Articulos (art_cod, art_nom, art_uni, art_pre, art_stk)
VALUES 
  (N'A0034', N'LECTOR-QUEMADOR DVD LG', N'UNI', 75, 20)
GO

--
-- Data for table dbo.Clientes  (LIMIT 0,500)
--

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0001', N'Alvarez Peña, Angel', N'123-4567', N'malvarez@hotmail.com', N'Av. La Marina 1234', 3500)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0002', N'Ponte Gomez, Alejandro', N'658-4503', N'alexponte@yahoo.com', N'Av. Pardo 456', 2800)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0003', N'Zuñiga Mateo, Carlos', N'567-4566', NULL, N'Av. Principal 123', 1200)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0004', N'Tucto de Souza, Bernardo', N'567-4566', NULL, N'Av. Principal 123', 1200)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0005', N'Vilela Bustamante, Percy', NULL, N'obando@hotmail.com', N'Calle San Pedro 134', 600)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0006', N'Linares Ramos, Miguel', N'477-8410', N'mlinares@hotmail.com', N'Jr. Stravinsky 140', 1500)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0007', N'Montes Diaz, Miguel', N'567-8356', N'mmontesdiaz@hotmail.com', N'Jr. Naranjos 5689', 3100)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0008', N'Rojas Valverde, Julian', N'789-4568', N'jrvalverde@yahoo.com', N'Av. Habich 543', 2700)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0009', N'Garcia Moyoli, Guiliana', N'789-4073', N'ggarcia@yahoo.com', N'Av. Iquitos 228', 3400)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0010', N'Miranda La Torre, Kelly', N'565-0437', N'kmiranda@gmail.com', N'Calle Nueva 850', 700)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0011', N'Wong Atoccsa, Israel', N'768-5704', NULL, N'Calle Cueva 432', 800)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0012', N'Liñan Rosales, Fernando', NULL, N'flinan@hotmail.com', N'Av. Javier Prado 114', 600)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0013', N'Vergara Ruiz, Jose', N'567-8466', N'josevergara@hotmail.com', N'Jr. Pio XII 112', NULL)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0014', N'Bustamante Motta, Diego', N'567-4566', NULL, N'Av. Principal 123', 1200)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0015', N'Alvarado Cueva, Rosa', N'456-3457', N'campos@yahoo.com', N'Jr. Dominico 554', 5000)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0016', N'Antero Minaya, Gregorio', N'746-0647', N'amg@hotmail.com', N'Jr. Salavery 876', 2100)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0017', N'Diaz Mal Partida, Jose', N'567-4566', NULL, N'Av. Guardia Civil 123', 1200)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0018', N'Gutierrez Pazos, Mauricio', N'897-5783', N'mgutierrez@gmail.com', N'Av. Habich 4567', 800)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0019', N'Mendoza Ramirez, Esther', N'958-3569', N'emendozar@gmail.com', N'Av. Wilson 678', 2600)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0020', N'Salazar Santiago, Mario', N'654-6534', N'marioss@hotmail.com', N'Av. Pardo 567', 4100)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0021', N'Carrasco Lee, Laura', N'267-8958', N'lcarrasco@gmail.com', N'Av. Wilson 1267', 700)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0022', N'Rosas La Riva, Kelly', N'789-4073', N'kellyrosas@yahoo.com', N'Av. Iquitos 228', 400)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0023', N'Caceres Atoccsa, Carmen', N'768-5704', NULL, N'Calle Cueva 432', NULL)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0024', N'Sanchez Briceño, Carlos', NULL, N'csanchez@hotmail.com', N'Av. Javier Prado 114', 1600)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0025', N'Lagos Mendoza, Jose', N'567-8466', N'lagosjose@hotmail.com', N'Jr. Pio XII 112', NULL)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0026', N'Bustamante Porta, Diego', N'567-4566', NULL, N'Av. Principal 123', 1200)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0027', N'Meza Cuadra, Paola', N'456-3457', N'paolameza@gmail.com', N'Jr. Dominico 554', 2000)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0028', N'Portilla Flores, Julio', N'746-0647', N'julioportilla@gmail.com', N'Jr. Salavery 876', 2100)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0029', N'Quiroz Salvador, Jose', N'567-4566', NULL, N'Av. Guardia Civil 123', 1200)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0030', N'Sotelo Matos, Mauricio', N'897-5783', N'msotelo@yahoo.com', N'Av. Habich 4567', 800)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0031', N'Mendez Neyra, Vanessa', N'958-3569', N'vmendezn@yahoo.com', N'Av. Wilson 678', 2600)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0032', N'Inafuku Salazar, Elvira', N'654-6534', N'einafuku@hotmail.com', N'Av. Pardo 567', 4100)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0033', N'Martinez Chuquizuta, Cristina', N'267-8958', N'cristymar@hotmail.com', N'Av. Wilson 1267', 700)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0034', N'Salazar Montoya, Miguel', N'267-8958', N'msalazar@hotmail.com', N'Av. Uruguay 680', 1200)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0035', N'De la Cruz Sanabria, Enith', N'676-9751', N'edelacruz@hotmail.com', N'Av. Peru 3506', 900)
GO

INSERT INTO dbo.Clientes (cli_cod, cli_nom, cli_tel, cli_cor, cli_dir, cli_cre)
VALUES 
  (N'C0036', N'Tarazona Chicmana, Pedro', N'728-1052', N'ptarazona@yahoo.com', N'Av. Wilson 1267', 700)
GO

--
-- Data for table dbo.Fac_cabe  (LIMIT 0,500)
--

-- 2019
INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0001', '20191002', N'C0007', N'F', 178.03, 1, 1115)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0002', '20191002', N'C0005', N'F', 466.22, 2, 2920)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0003', '20191003', N'C0016', N'B', 0, 2, 200)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0004', '20191008', N'C0002', N'F', 217.94, 1, 1365)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0005', '20191018', N'C0005', N'B', 0, 3, 5115)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0006', '20191019', N'C0002', N'B', 0, 4, 4615)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0007', '20191022', N'C0016', N'B', 0, 5, 690)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0008', '20191025', N'C0005', N'F', 9.58, 5, 60)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0009', '20191028', N'C0020', N'B', 0, 6, 50)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0010', '20191030', N'C0005', N'B', 0, 7, 830)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0011', '20191031', N'C0012', N'B', 0, 10, 3380)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0012', '20191102', N'C0012', N'F', 335.29, 7, 2100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0013', '20191102', N'C0002', N'F', 687.35, 6, 4305)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0014', '20191104', N'C0011', N'F', 65.46, 11, 410)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0015', '20191106', N'C0018', N'B', 0, 12, 1065)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0016', '20191110', N'C0012', N'F', 81.43, 11, 510)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0017', '20191120', N'C0001', N'B', 0, 13, 390)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0018', '20191121', N'C0002', N'B', 0, 13, 1330)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0019', '20191124', N'C0001', N'F', 985.13, 14, 6170)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0020', '20191125', N'C0002', N'B', 0, 15, 8880)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0021', '20191125', N'C0003', N'F', 973.15, 16, 6095)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0022', '20191127', N'C0004', N'B', 0, 17, 100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0023', '20191128', N'C0005', N'F', 142.1, 19, 890)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0024', '20191128', N'C0004', N'B', 0, 19, 6865)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0025', '20191130', N'C0005', N'F', 526.89, 11, 3300)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0026', '20191130', N'C0004', N'B', 0, 14, 1030)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0027', '20191130', N'C0005', N'B', 0, 1, 200)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0028', '20191202', N'C0004', N'F', 9.58, 10, 60)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0029', '20191205', N'C0005', N'B', 0, 4, 1200)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0030', '20191205', N'C0006', N'F', 215.55, 3, 1350)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0031', '20191210', N'C0004', N'B', 0, 4, 100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0032', '20191212', N'C0007', N'B', 0, 8, 660)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0033', '20191215', N'C0008', N'F', 122.14, 7, 765)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0034', '20191215', N'C0008', N'B', 0, 6, 300)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0035', '20191218', N'C0004', N'B', 0, 7, 270)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0036', '20191220', N'C0009', N'F', 15.97, 4, 100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0037', '20191220', N'C0010', N'B', 0, 11, 900)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0038', '20191220', N'C0010', N'B', 0, 11, 125)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0039', '20191222', N'C0015', N'F', 69.45, 9, 435)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0040', '20191222', N'C0014', N'B', 0, 1, 130)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0041', '20191222', N'C0005', N'F', 57.48, 3, 360)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0042', '20191223', N'C0011', N'B', 0, 6, 760)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0043', '20191223', N'C0014', N'F', 70.25, 11, 440)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0044', '20191223', N'C0012', N'B', 0, 12, 270)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0045', '20191223', N'C0007', N'B', 0, 4, 410)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0046', '20191227', N'C0008', N'F', 14.37, 4, 90)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0047', '20191227', N'C0009', N'B', 0, 3, 1195)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0048', '20191227', N'C0011', N'F', 6.39, 7, 40)
GO

-- AÑO 2020 

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0049', '20200104', N'C0019', N'F', 113.36, 8, 710)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0050', '20200107', N'C0004', N'F', 81.43, 2, 510)
GO


----------------------------------------------------------
-- NUEVO --
INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0051', '20200110', N'C0002', N'F', 178.03, 1, 1115)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0052', '20200110', N'C0015', N'F', 466.22, 2, 2920)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0053', '20200115', N'C0021', N'B', 0, 2, 200)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0054', '20200118', N'C0022', N'F', 217.94, 1, 1365)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0055', '20200121', N'C0008', N'B', 0, 3, 5115)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0056', '20200124', N'C0012', N'B', 0, 4, 4615)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0057', '20200126', N'C0010', N'B', 0, 5, 690)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0058', '20200130', N'C0020', N'F', 9.58, 5, 60)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0059', '20200130', N'C0030', N'B', 0, 6, 50)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0060', '20200210', N'C0035', N'B', 0, 7, 830)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0061', '20200215', N'C0032', N'B', 0, 10, 3380)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0062', '20200218', N'C0022', N'F', 335.29, 7, 2100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0063', '20200220', N'C0001', N'F', 687.35, 6, 4305)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0064', '20200221', N'C0013', N'F', 65.46, 11, 410)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0065', '20200224', N'C0019', N'B', 0, 12, 1065)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0066', '20200226', N'C0022', N'F', 81.43, 11, 510)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0067', '20200227', N'C0010', N'B', 0, 13, 390)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0068', '20200227', N'C0026', N'B', 0, 13, 1330)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0069', '20200228', N'C0008', N'F', 985.13, 14, 6170)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0070', '20200305', N'C0021', N'B', 0, 15, 8880)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0071', '20200307', N'C0030', N'F', 973.15, 16, 6095)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0072', '20200310', N'C0034', N'B', 0, 17, 100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0073', '20200310', N'C0015', N'F', 142.1, 19, 890)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0074', '20200312', N'C0024', N'B', 0, 19, 6865)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0075', '20200315', N'C0014', N'F', 526.89, 11, 3300)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0076', '20200315', N'C0009', N'B', 0, 14, 1030)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0077', '20200318', N'C0013', N'B', 0, 1, 200)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0078', '20200320', N'C0034', N'F', 9.58, 10, 60)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0079', '20200322', N'C0015', N'B', 0, 4, 1200)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0080', '20200325', N'C0036', N'F', 215.55, 3, 1350)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0081', '20200328', N'C0005', N'B', 0, 4, 100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0082', '20200330', N'C0008', N'B', 0, 8, 660)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0083', '20200331', N'C0010', N'F', 122.14, 7, 765)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0084', '20200402', N'C0003', N'B', 0, 6, 300)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0085', '20200405', N'C0007', N'B', 0, 7, 270)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0086', '20200408', N'C0019', N'F', 15.97, 4, 100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0087', '20200410', N'C0020', N'B', 0, 11, 900)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0088', '20200410', N'C0018', N'B', 0, 11, 125)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0089', '20200416', N'C0025', N'F', 69.45, 9, 435)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0090', '20200420', N'C0017', N'B', 0, 1, 130)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0091', '20200423', N'C0035', N'F', 57.48, 3, 360)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0092', '20200425', N'C0016', N'B', 0, 6, 760)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0093', '20200428', N'C0024', N'F', 70.25, 11, 440)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0094', '20200428', N'C0014', N'B', 0, 12, 270)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0095', '20200430', N'C0017', N'B', 0, 4, 410)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0096', '20200430', N'C0028', N'F', 14.37, 4, 90)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0097', '20200430', N'C0030', N'B', 0, 3, 1195)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0098', '20200503', N'C0021', N'F', 6.39, 7, 40)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0099', '20200509', N'C0029', N'F', 113.36, 8, 710)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0100', '20200509', N'C0014', N'F', 81.43, 2, 510)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0101', '20200512', N'C0002', N'F', 178.03, 1, 1115)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0102', '20200515', N'C0003', N'F', 466.22, 2, 2920)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0103', '20200519', N'C0006', N'B', 0, 2, 200)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0104', '20200520', N'C0008', N'F', 217.94, 1, 1365)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0105', '20200520', N'C0012', N'B', 0, 3, 5115)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0106', '20200522', N'C0007', N'B', 0, 4, 4615)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0107', '20200524', N'C0009', N'B', 0, 5, 690)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0108', '20200525', N'C0015', N'F', 9.58, 5, 60)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0109', '20200528', N'C0023', N'B', 0, 6, 50)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0110', '20200529', N'C0035', N'B', 0, 7, 830)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0111', '20200529', N'C0032', N'B', 0, 10, 3380)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0112', '20200530', N'C0022', N'F', 335.29, 7, 2100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0113', '20200530', N'C0014', N'F', 687.35, 6, 4305)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0114', '20200531', N'C0017', N'F', 65.46, 11, 410)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0115', '20200602', N'C0008', N'B', 0, 12, 1065)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0116', '20200604', N'C0011', N'F', 81.43, 11, 510)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0117', '20200610', N'C0005', N'B', 0, 13, 390)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0118', '20200612', N'C0001', N'B', 0, 13, 1330)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0119', '20200614', N'C0010', N'F', 985.13, 14, 6170)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0120', '20200615', N'C0020', N'B', 0, 15, 8880)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0121', '20200619', N'C0030', N'F', 973.15, 16, 6095)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0122', '20200622', N'C0029', N'B', 0, 17, 100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0123', '20200624', N'C0004', N'F', 142.1, 19, 890)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0124', '20200625', N'C0027', N'B', 0, 19, 6865)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0125', '20200628', N'C0021', N'F', 526.89, 11, 3300)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0126', '20200628', N'C0014', N'B', 0, 14, 1030)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0127', '20200630', N'C0005', N'B', 0, 1, 200)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0128', '20200630', N'C0014', N'F', 9.58, 10, 60)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0129', '20200630', N'C0025', N'B', 0, 4, 1200)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0130', '20200630', N'C0036', N'F', 215.55, 3, 1350)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0131', '20200702', N'C0002', N'B', 0, 4, 100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0132', '20200703', N'C0017', N'B', 0, 8, 660)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0133', '20200707', N'C0028', N'F', 122.14, 7, 765)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0134', '20200709', N'C0018', N'B', 0, 6, 300)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0135', '20200710', N'C0024', N'B', 0, 7, 270)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0136', '20200713', N'C0019', N'F', 15.97, 4, 100)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0137', '20200713', N'C0030', N'B', 0, 11, 900)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0138', '20200715', N'C0031', N'B', 0, 11, 125)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0139', '20200717', N'C0034', N'F', 69.45, 9, 435)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0140', '20200718', N'C0004', N'B', 0, 1, 130)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0141', '20200720', N'C0015', N'F', 57.48, 3, 360)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0142', '20200722', N'C0021', N'B', 0, 6, 760)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0143', '20200724', N'C0034', N'F', 70.25, 11, 440)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0144', '20200724', N'C0022', N'B', 0, 12, 270)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0145', '20200727', N'C0017', N'B', 0, 4, 410)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0146', '20200727', N'C0028', N'F', 14.37, 4, 90)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0147', '20200730', N'C0005', N'B', 0, 3, 1195)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0148', '20200730', N'C0001', N'F', 6.39, 7, 40)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0149', '20200731', N'C0009', N'F', 113.36, 8, 710)
GO

INSERT INTO dbo.Fac_cabe (fac_num, fac_fec, cli_cod, fac_tipo, fac_igv, ven_cod, fac_total)
VALUES 
  (N'F0150', '20200731', N'C0003', N'F', 81.43, 2, 510)
GO


------ HASTA AQUI 02 -------------------

--
-- Data for table dbo.Fac_deta  (LIMIT 0,500)
--

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0001', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0001', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0002', N'A0002', 16, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0002', N'A0004', 4, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0002', N'A0005', 6, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0003', N'A0004', 5, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0004', N'A0002', 2, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0004', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0005', N'A0006', 12, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0005', N'A0010', 11, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0005', N'A0011', 4, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0005', N'A0014', 11, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0006', N'A0007', 13, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0007', N'A0020', 23, 30)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0008', N'A0020', 2, 30)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0009', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0010', N'A0005', 7, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0010', N'A0006', 8, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0010', N'A0011', 5, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0011', N'A0004', 4, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0011', N'A0005', 6, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0011', N'A0010', 13, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0012', N'A0002', 14, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0013', N'A0014', 21, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0014', N'A0014', 2, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0015', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0016', N'A0006', 5, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0016', N'A0014', 2, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0017', N'A0006', 7, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0017', N'A0011', 5, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0018', N'A0002', 1, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0018', N'A0004', 4, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0018', N'A0005', 11, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0018', N'A0012', 4, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0019', N'A0006', 7, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0019', N'A0007', 6, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0019', N'A0008', 13, 300)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0020', N'A0007', 6, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0020', N'A0009', 15, 450)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0021', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0021', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0021', N'A0009', 11, 450)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0022', N'A0001', 4, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0023', N'A0003', 5, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0023', N'A0006', 7, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0024', N'A0003', 15, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0024', N'A0007', 13, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0025', N'A0008', 11, 300)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0026', N'A0010', 4, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0026', N'A0011', 3, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0027', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0027', N'A0003', 1, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0028', N'A0006', 3, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0029', N'A0008', 4, 300)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0030', N'A0009', 3, 450)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0031', N'A0011', 2, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0032', N'A0010', 3, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0033', N'A0013', 1, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0033', N'A0014', 3, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0034', N'A0013', 2, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0035', N'A0012', 3, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0036', N'A0001', 4, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0037', N'A0003', 6, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0038', N'A0001', 5, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0039', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0039', N'A0007', 1, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0040', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0040', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0041', N'A0005', 6, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0042', N'A0007', 2, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0042', N'A0011', 1, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0043', N'A0010', 2, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0044', N'A0012', 3, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0045', N'A0014', 2, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0046', N'A0012', 1, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0047', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0047', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0047', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0048', N'A0004', 1, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0049', N'A0007', 2, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0050', N'A0011', 3, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0050', N'A0012', 4, 90)
GO

--------------------------------------------------------

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0051', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0051', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0052', N'A0002', 16, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0052', N'A0004', 4, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0052', N'A0005', 6, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0053', N'A0004', 5, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0054', N'A0002', 2, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0054', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0055', N'A0006', 12, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0055', N'A0010', 11, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0055', N'A0011', 4, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0055', N'A0014', 11, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0056', N'A0007', 13, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0057', N'A0020', 23, 30)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0058', N'A0020', 2, 30)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0059', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0060', N'A0005', 7, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0060', N'A0006', 8, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0060', N'A0011', 5, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0061', N'A0004', 4, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0061', N'A0005', 6, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0061', N'A0010', 13, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0062', N'A0002', 14, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0063', N'A0014', 21, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0064', N'A0014', 2, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0065', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0066', N'A0006', 5, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0066', N'A0014', 2, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0067', N'A0006', 7, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0067', N'A0011', 5, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0068', N'A0002', 1, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0068', N'A0004', 4, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0068', N'A0005', 11, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0068', N'A0012', 4, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0069', N'A0006', 7, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0069', N'A0007', 6, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0069', N'A0008', 13, 300)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0070', N'A0007', 6, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0070', N'A0009', 15, 450)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0071', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0071', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0071', N'A0009', 11, 450)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0072', N'A0001', 4, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0073', N'A0003', 5, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0073', N'A0006', 7, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0074', N'A0003', 15, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0074', N'A0007', 13, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0075', N'A0008', 11, 300)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0076', N'A0010', 4, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0076', N'A0011', 3, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0077', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0077', N'A0003', 1, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0078', N'A0006', 3, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0079', N'A0008', 4, 300)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0080', N'A0009', 3, 450)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0081', N'A0011', 2, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0082', N'A0010', 3, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0083', N'A0013', 1, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0083', N'A0014', 3, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0084', N'A0013', 2, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0085', N'A0012', 3, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0086', N'A0001', 4, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0087', N'A0003', 6, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0088', N'A0001', 5, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0089', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0089', N'A0007', 1, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0090', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0090', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0091', N'A0005', 6, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0092', N'A0007', 2, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0092', N'A0011', 1, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0093', N'A0010', 2, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0094', N'A0012', 3, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0095', N'A0014', 2, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0096', N'A0012', 1, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0097', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0097', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0097', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0098', N'A0004', 1, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0099', N'A0007', 2, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0100', N'A0011', 3, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0100', N'A0012', 4, 90)
GO

----- DE LA 101 A 150 ------------------

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0101', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0101', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0102', N'A0002', 16, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0102', N'A0004', 4, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0102', N'A0005', 6, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0103', N'A0004', 5, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0104', N'A0002', 2, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0104', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0105', N'A0006', 12, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0105', N'A0010', 11, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0105', N'A0011', 4, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0105', N'A0014', 11, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0106', N'A0007', 13, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0107', N'A0020', 23, 30)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0108', N'A0020', 2, 30)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0109', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0110', N'A0005', 7, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0110', N'A0006', 8, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0110', N'A0011', 5, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0111', N'A0004', 4, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0111', N'A0005', 6, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0111', N'A0010', 13, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0112', N'A0002', 14, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0113', N'A0014', 21, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0114', N'A0014', 2, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0115', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0116', N'A0006', 5, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0116', N'A0014', 2, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0117', N'A0006', 7, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0117', N'A0011', 5, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0118', N'A0002', 1, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0118', N'A0004', 4, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0118', N'A0005', 11, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0118', N'A0012', 4, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0119', N'A0006', 7, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0119', N'A0007', 6, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0119', N'A0008', 13, 300)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0120', N'A0007', 6, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0120', N'A0009', 15, 450)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0121', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0121', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0121', N'A0009', 11, 450)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0122', N'A0001', 4, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0123', N'A0003', 5, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0123', N'A0006', 7, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0124', N'A0003', 15, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0124', N'A0007', 13, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0125', N'A0008', 11, 300)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0126', N'A0010', 4, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0126', N'A0011', 3, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0127', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0127', N'A0003', 1, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0128', N'A0006', 3, 20)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0129', N'A0008', 4, 300)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0130', N'A0009', 3, 450)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0131', N'A0011', 2, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0132', N'A0010', 3, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0133', N'A0013', 1, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0133', N'A0014', 3, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0134', N'A0013', 2, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0135', N'A0012', 3, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0136', N'A0001', 4, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0137', N'A0003', 6, 150)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0138', N'A0001', 5, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0139', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0139', N'A0007', 1, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0140', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0140', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0141', N'A0005', 6, 60)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0142', N'A0007', 2, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0142', N'A0011', 1, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0143', N'A0010', 2, 220)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0144', N'A0012', 3, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0145', N'A0014', 2, 205)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0146', N'A0012', 1, 90)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0147', N'A0001', 2, 25)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0147', N'A0004', 2, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0147', N'A0007', 3, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0148', N'A0004', 1, 40)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0149', N'A0007', 2, 355)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0150', N'A0011', 3, 50)
GO

INSERT INTO dbo.Fac_deta (fac_num, art_cod, art_can, art_pre)
VALUES 
  (N'F0150', N'A0012', 4, 90)
GO

--
-- Data for table dbo.Vendedor  (LIMIT 0,500)
--

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (1, N'Diaz Vera, Ana', '19780312')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (2, N'Pardo Campos, Carlos', '19790511')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (3, N'Linares Moreno,  Claudia', '19790612')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (4, N'Mendoza Obando, Maria', '19820411')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (5, N'Narvaez Gomez, Juan Carlos', '19830615')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (6, N'Murillo Mancini, Julio', '19850511')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (7, N'Gonzales Vera, Erlinda', '19980412')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (8, N'Rosales Mendez, Paola', '19941011')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (9, N'Carrasco Lopez, Elvira', '19961011')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (10, N'Diaz Bacilio, Eva', '19961011')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (11, N'Diaz Choque, Susy', '19981211')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (12, N'Huamani Rios, Liz', '19981111')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (13, N'Colmenares Peralta, Ana', '19990210')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (14, N'Campos Diaz, Juan', '19991112')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (15, N'Ramirez Cristobal, Pedro', '20001113')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (16, N'Camarena Rios, Daniel', '20000312')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (17, N'Porras Becerra, Jenny', '20001011')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (18, N'Zamora Contreras, Flor', '20011011')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (19, N'Perez Diaz, Miguel', '20011111')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (20, N'Inga Lopez, Consuelo', '20011212')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (21, N'Cardenas Bacilio, Fernando', '20021011')
GO

INSERT INTO dbo.Vendedor (Ven_cod, Ven_nom, Ven_Fecing)
VALUES 
  (99, N'Ventas por Internet', '20021011')
GO


--
-- Definition for checks : 
--

ALTER TABLE dbo.Clientes
ADD CHECK (cli_cod like 'C[0-9][0-9][0-9][0-9]')
GO

ALTER TABLE dbo.Fac_cabe
ADD CHECK (fac_tipo='B' OR fac_tipo='F')
GO

--
-- Definition for indices : 
--

ALTER TABLE Articulos
ADD CONSTRAINT PK_ARTICULOS PRIMARY KEY CLUSTERED (art_cod)
GO

ALTER TABLE dbo.Clientes
ADD CONSTRAINT PK_CLIENTES PRIMARY KEY CLUSTERED (cli_cod)
GO

ALTER TABLE dbo.Fac_cabe
ADD CONSTRAINT PK_FAC_CABE PRIMARY KEY CLUSTERED (fac_num)
GO

ALTER TABLE dbo.Fac_deta
ADD CONSTRAINT PK_FAC_DETA PRIMARY KEY CLUSTERED (fac_num, art_cod)
GO

ALTER TABLE dbo.Vendedor
ADD CONSTRAINT PK_VENDEDOR PRIMARY KEY CLUSTERED (Ven_cod)
GO

--
ALTER TABLE dbo.Fac_cabe  WITH CHECK ADD  CONSTRAINT FK_Fac_cabe_Clientes FOREIGN KEY(cli_cod)
REFERENCES dbo.Clientes (cli_cod)
GO
ALTER TABLE dbo.Fac_cabe  WITH CHECK ADD  CONSTRAINT FK_Fac_cabe_Vendedor FOREIGN KEY(ven_cod)
REFERENCES dbo.Vendedor (Ven_cod)
GO
ALTER TABLE dbo.Fac_cabe  WITH CHECK ADD CHECK  ((fac_tipo='B' OR fac_tipo='F'))
GO
ALTER TABLE dbo.Fac_deta  WITH CHECK ADD  CONSTRAINT FK_Fac_deta_Articulos FOREIGN KEY(art_cod)
REFERENCES Articulos (art_cod)
GO
ALTER TABLE dbo.Fac_deta  WITH CHECK ADD  CONSTRAINT FK_Fac_deta_Fac_cabe FOREIGN KEY(fac_num)
REFERENCES dbo.Fac_cabe (fac_num)
GO

UPDATE Clientes
	SET cli_cre=1000
WHERE cli_cre IS NULL
GO
	
UPDATE Clientes
	SET cli_tel='5555555555'
WHERE cli_tel IS NULL
GO

SET NOCOUNT OFF
GO

SELECT 'Base de Datos BDVENTAS2020 creada correctamente' as Mensaje
go
