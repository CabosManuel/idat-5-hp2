use BDVIDEOS2016
go

create procedure Listar_Anios_Alquiler
as
select distinct YEAR(fecha_dev) as anio
 from Alquiler_Peliculas
go

execute Listar_Anios_Alquiler
go


create procedure Top_Peliculas_Alquiler_Anio
@n    int,
@anio int
as
	select top(@n) p.cod_pel, p.nom_pel, g.des_gen,
	       COUNT(dap.num_alq) as Cant_Alquileres
	from Peliculas p inner join Genero g
		on p.cod_gen=g.cod_gen
			inner join Detalle_Alquiler_Peliculas dap
				on p.cod_pel=dap.cod_pel
					inner join Alquiler_Peliculas ap
						on dap.num_alq=ap.num_alq
	where YEAR(ap.fecha_pres)=@anio
		 group by p.cod_pel, p.nom_pel, g.des_gen
		    order by Cant_Alquileres desc
go

execute Top_Peliculas_Alquiler_Anio 4, 2015
go

