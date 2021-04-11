use BluePrint

CREATE TABLE TiposTareas(
	ID Smallint primary key identity (1,1) not null,
	Nombre varchar(40) not null
)

GO

create table Tareas(
	ID int primary key identity(1,1) not null,
	Nombre varchar(50) not null,
	Descripcion varchar(512) null,
	FechaInicio date null,
	FechaFin date null,
	CostoBase money null check(CostoBase > 0), 
	IDModulo int not null foreign key references Modulos(ID),
	IDTipoTarea smallint not null foreign key references TiposTareas(ID),
	Estado bit not null default (1)
)

GO

ALTER TABLE Colaboradores
	ADD IDTarea INT NULL foreign key references Tareas(ID)
GO


CREATE TABLE Colaboraciones(
	ID int primary key identity(1,1) not null,
	EstadoRealizacion bit not null default (0),
	CantidadHoras smallint not null check(CantidadHoras > 0),
	PrecioHora money null check(PrecioHora > 0),
	IDTarea int not null foreign key references Tareas(ID),
	IDColaborador int not null foreign key references Colaboradores(ID),
)
