create Database bdComercio
go
Use bdComercio


Create Table Ciudad
(
idCiudad int primary key identity(1,1),
NombreCiudad varchar (300) not null,
)
go

Create Table TipoProveedor
(
idTpoProveedor int primary key identity(1,1),
Tipo varchar(300) not null,
)
go

Create Table TipoPago
(
idTpoPago int primary key identity(1,1),
Tipo varchar(300) not null,
)
go

Create Table Proveedor
(
idProveedor int primary key identity(1,1),
RazonSocial varchar(300) not null,
Telefono varchar(30) not null,
Direccion varchar(300) not null,
idTpoProveedor int not null foreign key references TipoProveedor (idTpoProveedor),
idCiudad int not null foreign key references Ciudad (idCiudad)

)
go

Create Table Factura
(
idFactura int primary key identity(1,1),
FechaIngreso date not null,
Valor money not null check (Valor >=0),
idProveedor int not null foreign key references Proveedor (idProveedor),

)
go


Create Table FacturaPago
(
idTransaccion int primary key identity(1,1),
FechaEjecucion date not null,
Valor money not null check (Valor >=0),
idTpoPago int not null foreign key references TipoPago (idTpoPago),
idFactura int not null foreign key references Factura (idFactura),

)
go
