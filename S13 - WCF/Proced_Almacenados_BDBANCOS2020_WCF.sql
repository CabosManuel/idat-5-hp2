use BDBANCOS2020
go

create procedure Listar_Cuentas
as
	select num_cta, cli_codigo,
	       cod_cta, saldo
	from Cuentas
go

create procedure Grabar_Cuenta
@num_cta char(12),@cli_codigo char(5),
@cod_cta char(3),@saldo money
as
	insert into Cuentas
		values(@num_cta,@cli_codigo,
		       @cod_cta,@saldo)

	insert into Movimientos 
		values(@num_cta,getdate(),'D',
		       0,@saldo,@saldo)
go


select * from cuentas 
where num_cta='100-10000-10'
go

select * from Movimientos
where num_cta='100-10000-10'
go
