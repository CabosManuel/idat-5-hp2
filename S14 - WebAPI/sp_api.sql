alter procedure sp_api_listar_clientes
as
	select c.IdCliente,c.NombreCompaņia,c.Direccion,c.Pais,c.Telefono 
	from Clientes as c
go