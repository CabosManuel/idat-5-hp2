use BDVIDEOS2019
go

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

--select*from Peliculas
--exec sp_buscar_peliculas 'G04',0


alter procedure sp_insertar_vta_cab
@cod_cli char(5)
as
	declare @total_vta decimal(8,2)

	/*select @total_vta=sum(d.precio*d.cant) 
	from Venta_Detalle as d inner join Venta_Cabecera as c
	on d.num_vta = c.num_vta*/
	
	insert into Venta_Cabecera values(@cod_cli,getdate(),@total_vta,'No')
	select max(num_vta) from Venta_Cabecera where eliminado like 'No'
go

--exec sp_insertar_vta_cab 'C0002',
--select * from Venta_Cabecera

alter procedure sp_insertar_vta_det
@num_vta int,@cod_pel char(5),@cant int,@cod_for int
as
	declare @precio decimal(6,2)
	select @precio=f.precio
	from Venta_Detalle vd inner join Formatos f
	on vd.cod_for=f.cod_for

	insert into Venta_Detalle 
		values(@num_vta,@cod_pel,@cant,@cod_for,@precio,'No')
	update Peliculas set cant_cop = cant_cop-@cant
		where cod_pel = @cod_pel
go

exec sp_insertar_vta_det 1,'P0003',1,102

--select*from Venta_Detalle
/*
update vc
	set total_vta=(select SUM(precio*cant) from Venta_Detalle where num_vta=vc.num_vta)
	from Venta_Cabecera vc
go
	
update Venta_Detalle
	set precio=f.precio
	from Venta_Detalle vd inner join Formatos f
		on vd.cod_for=f.cod_for

*/

