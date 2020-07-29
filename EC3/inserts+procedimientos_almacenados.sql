use BDVIDEOS2019
go
------------
-- INSERTS
------------

-- ACTORES
--P0001
insert into Actores values('A0001','Noriko Hidaka',7,'No')
insert into Actores values('A0002','Chika Sakamoto',7,'No')
insert into Actores values('A0003','Shigesato Itoi',7,'No')
insert into Actores values('A0004','Sumi Shimamoto',7,'No')
--P0002
insert into Actores values('A0005','Ryunosuke Kamiki',7,'No')
insert into Actores values('A0006','Mone Kamishiraishi',7,'No')
--P0003
insert into Actores values('A0007','Megumi Ogata',7,'No')
insert into Actores values('A0008','Megumi Hayashibara',7,'No')
insert into Actores values('A0009','Yuko Miyamura',7,'No')
--P0004
insert into Actores values('A0010','Robin Williams',1,'No')
insert into Actores values('A0011','Ewan McGregor',2,'No')
insert into Actores values('A0012','Mel Brooks',1,'No')
--P0005
insert into Actores values('A0013','Joseph Gordon-Levitt',1,'No')
--P0006
insert into Actores values('A0014','Olivia Cooke',2,'No')
insert into Actores values('A0015','Tye Sheridan',1,'No')
insert into Actores values('A0016','Simon Pegg',2,'No')
--P0007
insert into Actores values('A0017','Rinko Kikuchi',7,'No')
insert into Actores values('A0018','Idris Elba',2,'No')
insert into Actores values('A0019','Charlie Hunnam',2,'No')
insert into Actores values('A0020','Charlie Day',1,'No')
insert into Actores values('A0021','Burn Gorman',1,'No')
--P0008
insert into Actores values('A0022','Jason Statham',2,'No')
--P0009
insert into Actores values('A0023','Asa Butterfield',2,'No')
insert into Actores values('A0024','Harrison Ford',1,'No')
insert into Actores values('A0025','Moisés Arias',1,'No')
--P0010
insert into Actores values('A0026','Jim Carrey',13,'No')
insert into Actores values('A0027','Cameron Diaz',1,'No')
insert into Actores values('A0028','Peter Greene',1,'No')

-- GENERO
insert into Genero values('G07','Animacion')
insert into Genero values('G08','Anime')

-- PELICULAS
insert into Peliculas values('P0001','Mi vecino Totoro', 88,'G08',14,1988)
insert into Peliculas values('P0002','Your Name',112,'G08',5,2016)
insert into Peliculas values('P0003','The End of Evangelion',90,'G08',10,1997)
insert into Peliculas values('P0004','Robots',91,'G07',4,2005)
insert into Peliculas values('P0005','El Planeta del Tesoro',95,'G07',12,2002)
insert into Peliculas values('P0006','Ready Player One: comienza el juego',139,'G06',3,2018)
insert into Peliculas values('P0007','Titanes del Pacífico',132,'G06',15,2013)
insert into Peliculas values('P0008','El Transportador',92,'G04',7,2002)
insert into Peliculas values('P0009','El juego de Ender',114,'G06',9,2013)
insert into Peliculas values('P0010','La Máscara',101,'G01',6,1994)

-- ACTORES
--P0001
insert into Peli_Actor values('P0001','A0001')
insert into Peli_Actor values('P0001','A0002')
insert into Peli_Actor values('P0001','A0003')
insert into Peli_Actor values('P0001','A0004')
--P0002
insert into Peli_Actor values('P0002','A0005')
insert into Peli_Actor values('P0002','A0006')
--P0003
insert into Peli_Actor values('P0003','A0007')
insert into Peli_Actor values('P0003','A0008')
insert into Peli_Actor values('P0003','A0009')
--P0004
insert into Peli_Actor values('P0004','A0010')
insert into Peli_Actor values('P0004','A0011')
insert into Peli_Actor values('P0004','A0012')
--P0005
insert into Peli_Actor values('P0005','A0013')
--P0006
insert into Peli_Actor values('P0006','A0014')
insert into Peli_Actor values('P0006','A0015')
insert into Peli_Actor values('P0006','A0016')
--P0007
insert into Peli_Actor values('P0007','A0017')
insert into Peli_Actor values('P0007','A0018')
insert into Peli_Actor values('P0007','A0019')
insert into Peli_Actor values('P0007','A0020')
insert into Peli_Actor values('P0007','A0021')
--P0008
insert into Peli_Actor values('P0008','A0022')
--P0009
insert into Peli_Actor values('P0009','A0023')
insert into Peli_Actor values('P0009','A0024')
insert into Peli_Actor values('P0009','A0025')
--P0010
insert into Peli_Actor values('P0010','A0026')
insert into Peli_Actor values('P0010','A0027')
insert into Peli_Actor values('P0010','A0028')
go

------------------------------------------------------------------
-- MODIFICACIÓN A LA TABLA Peliculas columna precio decimal(6,2)
------------------------------------------------------------------

alter table peliculas
	add precio decimal(6,2)
go

---------------------
-- STORE PROCEDURES
---------------------

-- SP para agregarle valor al precio de la Pelicula
create procedure sp_actualizar_precio
@cod_pel varchar(5), @precio decimal(6,2)
as
	update Peliculas set precio = @precio
		where cod_pel = @cod_pel
go

-- SP para buscar peliculas por genero o año
create procedure sp_buscar_peliculas
@cod_gen char(3),@año int
as
	select
		p.cod_pel,
		p.nom_pel,
		g.des_gen as genero,
		año
	from Peliculas as p inner join Genero g
		on p.cod_gen = g.cod_gen
	where
		@cod_gen = p.cod_gen or
		@año = p.año and
		p.cant_cop>0
go

-- SP para crear cabecera
create procedure sp_vta_cab
@cod_cli char(5), @total_vta decimal(8,2)
as
	insert into Venta_Cabecera values(@cod_cli,getdate(),@total_vta,'No')
	select max(num_vta) from Venta_Cabecera where eliminado like 'No'
go

-- SP para crear detalle
create procedure sp_vta_det
@num_vta int,@cod_pel char(5),@cant int,@precio decimal(6,2)
as
	declare @cod_for int
	select @cod_for = cod_for from Formatos
		where precio = @precio/@cant

	insert into Venta_Detalle 
		values(@num_vta,@cod_pel,@cant,@cod_for,@precio,'No')
	update Peliculas set cant_cop = cant_cop-@cant
		where cod_pel = @cod_pel
go

-- SPs para consultar ultimas facturas
SELECT TOP(1) F.*, C.nom_cli
   FROM Venta_Cabecera F INNER JOIN CLIENTES C
   ON F.cod_cli=C.cod_cli
   ORDER BY num_vta DESC
GO
SELECT TOP(1) WITH TIES FD.*, p.nom_pel
FROM Venta_Detalle FD INNER JOIN Peliculas p
	ON FD.cod_pel=p.cod_pel
	ORDER BY num_vta DESC
GO


select * from Peliculas