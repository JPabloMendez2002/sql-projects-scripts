use bdClase12
go

-- procedimiento almacenado para calculo de planilla

create proc CalculoPlanilla
as
begin
	declare @SalarioBruto money,
			@SalarioNeto money,
			@Nombre varchar(200),
			@Departamento varchar(100),
			@Cedula varchar(20),
			@Puesto varchar(100),
			@Salario money

	declare @Resultado table
	(Nombre varchar(200),
	Departamento varchar(200),
	Cedula varchar(20),
	Puesto varchar(100),
	Salario money,
	SalarioBruto money,
	SalarioNeto money)

	declare CurEmpleados cursor for
	select a.Nombre, a.Cedula,a.Puesto, a.Salario, b.Nombre
	from Empleados a
	join Departamentos b on (a.IdDepto = b.IdDepto)

	open CurEmpleados

	fetch next from CurEmpleados into 
	@Nombre, @Cedula, @Puesto, @Salario, @Departamento
	while @@FETCH_STATUS = 0
	Begin
		if @Puesto like '%jefe%' or @Puesto like '%gerente%'
		begin
			set @SalarioBruto = @Salario+ @Salario*0.20
		end
		else
		Begin
			set @SalarioBruto = @Salario
		end
		set @SalarioNeto = @SalarioBruto - @SalarioBruto*0.09324 
						- @SalarioBruto*0.05
		insert into @Resultado
		values (@Nombre,@Departamento,@Cedula,@Puesto,@Salario,
				@SalarioBruto,@SalarioNeto)

		fetch next from CurEmpleados into 
		@Nombre, @Cedula, @Puesto, @Salario, @Departamento
	end -- Cierra el ciclo while
	select * from @Resultado
	close CurEmpleados
	Deallocate CurEmpleados

end
go

exec CalculoPlanilla