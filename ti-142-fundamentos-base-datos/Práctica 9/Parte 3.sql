use bdClase12
go

-- procedimiento almacenado para calculo de planilla

create proc CalculoPlanillaSinCursor
as
begin
	declare @SalarioBruto money,
			@SalarioNeto money,
			@Nombre varchar(200),
			@Departamento varchar(100),
			@Cedula varchar(20),
			@Puesto varchar(100),
			@Salario money,
			@Indice int -- 1 Ajuste crear variable

	declare @Resultado table
	(id int identity(1,1) primary key, --2 agregar llave
	Nombre varchar(200),
	Departamento varchar(200),
	Cedula varchar(20),
	Puesto varchar(100),
	Salario money,
	SalarioBruto money,
	SalarioNeto money)

	-- eliminar todos los rastros del cursor
	insert into @Resultado
	select a.Nombre, b.Nombre, a.Cedula,a.Puesto, a.Salario,0,0
	from Empleados a
	join Departamentos b on (a.IdDepto = b.IdDepto)

	-- agregamos un total de filas de resultado
	select @Indice =  COUNT(*) from @Resultado
	-- cambiamos el while
	while @Indice > 0
	Begin
		-- extraer la fila correspondiente
		select @Puesto = Puesto, @Salario = salario
		from @Resultado
		where id = @Indice

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
		update @Resultado
		set SalarioBruto =  @SalarioBruto,
		    SalarioNeto = @SalarioNeto
		where id = @Indice

		set @Indice -= 1

	end -- Cierra el ciclo while
	select * from @Resultado

end
go

exec CalculoPlanillaSinCursor