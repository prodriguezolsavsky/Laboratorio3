CREATE DATABASE actividad1_1
GO
USE actividad1_1
GO
CREATE TABLE Carreras (
	ID varchar(4) not null unique,
	Nombre varchar(50) not null,
	Fecha_creación date not null check(Fecha_creación<GETDATE()),
	Mail varchar(100) not null,
	Nivel varchar(11) not null check(nivel = 'Diplomatura' or nivel = 'Pregrado' or nivel = 'Grado' or nivel = 'Posgrado'),
)
GO
CREATE TABLE Alumnos (
	Legajo int not null primary key identity(1000, 1),
	IDCarrera varchar(4) not null foreign key references Carreras(ID),
	Nombres varchar(50) not null,
	Apellidos varchar(50) not null,
	Fecha_de_nacimiento date not null check(Fecha_de_nacimiento<GETDATE()),
	Mail varchar(100) not null unique,
	Teléfono varchar(20) null
)
GO
CREATE TABLE Materias (
	ID int not null primary key identity(1, 1),
	IDCarrera varchar(4) not null foreign key references Carreras(ID),
	Nombre varchar(50) not null,
	Carga_horaria int not null check (Carga_horaria>0)
	)
	GO
