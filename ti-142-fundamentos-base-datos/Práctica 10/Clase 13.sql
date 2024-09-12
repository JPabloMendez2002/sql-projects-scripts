create database Prueba;

use Prueba;

create table Departamentos
(
IdDepto int auto_increment primary key,
Nombre varchar(100) not null,
Siglas varchar(10) not null,
Edificio varchar(100) not null
);

create table Funcionarios
(
IdFuncionario int auto_increment primary key,
Nombre varchar(100) not null,
Cedula varchar(20) not null unique,
Telefono varchar(20) null,
Direccion varchar(100) not null,
Provincia varchar(20) not null,
Correo varchar(100) null,
Salario decimal,
Puesto varchar(100) not null,
FechaNac date,
IdJefe int null,
IdDepto int null,
foreign key (IdJefe) references Funcionarios(IdFuncionario),
foreign key (IdDepto) references Departamentos(IdDepto)
);


INSERT INTO Departamentos(Nombre, Siglas, Edificio) values
('Gerencia','GE','Principal'),
('Tecnologias de la Informacion','TI','Anexo 1'),
('Recursos Humanos','RH','Anexo 2');

select * FROM Departamentos


INSERT INTO Funcionarios(Nombre, Cedula, Telefono, Direccion, Provincia, Correo, Salario, Puesto, FechaNac, IdJefe, IdDepto)
values
('Carol Vargas' ,'11848030','87253542','San Rafael','Cartago',' vargas@gmail.com' ,'500000','Gerente', '19851005',null, 1),
('Luis Porras' ,'334847434','67678544','Cot','Cartago',' porras@gmail.com' ,'450000','Jefe TI', '19801005',1, 2),
('Laura Arrieta' ,'3954854673','73535363','Tejar','Cartago',' arrieta@gmail.com' ,'470000','Jefe RH', '19881205',1, 3);

select  count(*) FROM Funcionarios

create procedure InsertarDepto
(
in pNombre varchar(100),
in pSiglas varchar(10),
in pEdificio varchar(100)
)

	INSERT INTO Departamentos (Nombre, Siglas, Edificio) values (pNombre, pSiglas, pEdificio);
	
call InsertarDepto('Contabilidad','CO','Anexo 2');

delimiter $$
create procedure BuscarFuncionario
(
in pTexto varchar(100)

)
	if(pTexto is not null) then
	begin
		select Nombre, Cedula, Salario, Provincia, Direccion FROM Funcionarios 
        where Nombre like concat('%',pTexto,'%')
		or Provincia like concat('%',pTexto,'%')
		or Cedula like concat('%',pTexto,'%');
	end;
	else 
    Begin
		select Nombre, Cedula, Salario, Provincia, Direccion FROM Funcionarios;
	end;
    end if;
end;
delimiter;

CALL BuscarFuncionario ('Luis');

