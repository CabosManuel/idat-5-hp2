use Neptuno2020
go

create procedure Listar_Productos_API
as
	select IdProducto, NombreProducto
	from Productos
go

set language spanish
go

create procedure PedidosProductoFechas_API
@idproducto int,
@fecha1  date,
@fecha2  date
as
	select p.IdPedido, p.FechaPedido,
		c.NombreCompañia, c.Pais,
		dp.Cantidad, dp.PrecioUnidad,
		dp.PrecioUnidad*dp.Cantidad as Importe
	from Clientes c inner join Pedidos p
		on c.IdCliente=p.IdCliente
			inner join Detalles_Pedidos dp
				on p.IdPedido=dp.IdPedido
	where dp.IdProducto=@idproducto
		and p.FechaPedido between @fecha1 and @fecha2
go

execute PedidosProductoFechas_API
   12, '30/04/2018','23/10/2018'
go