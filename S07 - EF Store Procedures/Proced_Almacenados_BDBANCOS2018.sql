USE BDBANCOS2018
GO

-- 
create procedure usp_Listar_Cuentas
as
	select c.num_cta, c.cod_cta, tc.desc_cta,
	       c.cli_codigo, cl.cli_nombre
	from Cuentas c inner join Tipo_Cuentas tc
		on c.cod_cta=tc.cod_cta
			inner join Clientes cl
				on c.cli_codigo=cl.cli_codigo
go

--C0003
--C06

-- procedimiento almacenado para demostrar solo la
-- actualizacion de datos de una tabla. En la vida Real
-- esta tabla Cuenta, no aceptaria actualizacion del cliente
-- o del tipo de cuenta.
create procedure usp_Actualizar_Cuenta
@num_cta char(12),@cli_codigo char(5),
@cod_cta char(3),@saldo decimal(10,2)
as
	update Cuentas
		set cli_codigo=@cli_codigo,
			cod_cta=@cod_cta,
			saldo=@saldo
	where num_cta=@num_cta
go


create procedure usp_Listar_Cuentasv2
as
	select c.num_cta, c.cod_cta, tc.desc_cta,
	       c.cli_codigo, cl.cli_nombre, cl.cli_ruc
	from Cuentas c inner join Tipo_Cuentas tc
		on c.cod_cta=tc.cod_cta
			inner join Clientes cl
				on c.cli_codigo=cl.cli_codigo
go
