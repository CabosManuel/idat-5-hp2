use Neptuno2019
go

-- proced. almacenado que liste los pedidos en base a un 
-- codigo de cliente, debiendo mostrar:
-- idpedido, fechapedido, cant_items, importe acumulado del pedido
create procedure pa_pedidos_cliente
@idcliente char(5)
as
	select p.IdPedido, 
	       p.FechaPedido,
		   count(dp.IdProducto) as cant_items,
		   sum(dp.PrecioUnidad*dp.Cantidad) as importe_pedido
	from Pedidos p inner join Detalles_Pedidos dp
		on p.IdPedido=dp.IdPedido
	where p.idcliente=@idcliente
		group by p.IdPedido, p.FechaPedido
go

execute pa_pedidos_cliente 'anatr'
go

create procedure pa_listar_clientes
as
	select IdCliente, NombreCompañia, Pais, Telefono
	from Clientes
go

create procedure pa_insertar_cliente
@idcliente char(5),@nombre varchar(40),
@pais varchar(15),@telefono varchar(24)
as
	insert into Clientes
		values(@idcliente,@nombre,'','','','','','',@pais,@telefono,'')
go

select * from Clientes
go

------------- 25/06/2020 -----------------------
create procedure pa_actualizar_cliente
@idcliente char(5),@nombre varchar(40),
@pais varchar(15),@telefono varchar(24)
as
	update Clientes
		set NombreCompañia=@nombre,
			Pais=@pais,
			Telefono=@telefono
	where IdCliente=@idcliente
go

create procedure pa_eliminar_cliente
@idcliente char(5)
as
	delete from Clientes
		where IdCliente=@idcliente
go



execute pa_eliminar_cliente 'ALFKI'
go


USE Neptuno2019
GO

CREATE PROCEDURE ProductosPorCategoria
@idcategoria int
as
SELECT P.IdProducto, NombreProducto, 
       P.PrecioUnidad as Precio,
	   P.UnidadesEnExistencia as Stock,
	   PR.NombreCompañia as NomProv
FROM Productos P INNER JOIN Proveedores PR
	ON P.IdProveedor=PR.IdProveedor
  WHERE IdCategoria=@idcategoria
GO

EXECUTE ProductosPorCategoria 5
GO



