use bdPracticaSem12
go

-- procedimiento almacenado para calculo de planilla

create proc CalculoSalario
@Annio int,
@Mes varchar(20)
as
begin
	declare 
			@SalarioBase money,
			@Comision money,
			@Deducciones money,
			@SalarioMensual money,
			@IdEmpleado int 

	declare CurEmpleados cursor for
	select a.Salario, a.Comision, a.IdEmpleado from Empleados a
	open CurEmpleados

	fetch next from CurEmpleados into 
	 @SalarioBase, @Comision, @IdEmpleado
	while @@FETCH_STATUS = 0
	Begin
	
			set @SalarioMensual = (@SalarioBase+@Comision)*0.0934
			set @Deducciones = (@SalarioBase+@Comision)*0.0934

		insert into SalarioMensual
		values (@Annio,@Mes,@SalarioBase,@Comision,
				@Deducciones,@SalarioMensual,@IdEmpleado)

		fetch next from CurEmpleados into 
		@SalarioBase, @Comision, @IdEmpleado
	END
	select * from SalarioMensual 
	close CurEmpleados
	Deallocate CurEmpleados

end
go

exec CalculoSalario 2018,'Febrero'