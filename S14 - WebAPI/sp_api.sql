alter procedure sp_api_listar_clientes
as
	select c.IdCliente,c.NombreCompañia,c.Direccion,c.Pais,c.Telefono 
	from Clientes as c
go