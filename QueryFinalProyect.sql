CREATE DATABASE DocumentControl
use DocumentControl

CREATE TABLE Usuario(
	id int identity not null primary key,
	nombre varchar(15),
	correo varchar(30),
	idDpt int foreign key references Departamento(id),
	cargo varchar(15)
)

CREATE TABLE Departamento(
	id int identity not null primary key,
	nombre varchar(20),
	siglas varchar(10)
)

CREATE TABLE Documento(
	id int identity not null primary key,
	tipo varchar(25),
	idEmpleado int foreign key references Usuario(id),
	dptOrigen varchar(25),
	dptDestino varchar(25),
	secuencia varchar(25),
	fecha varchar(30)
)

DROP TABLE Documento

INSERT INTO Documento(tipo, idEmpleado, dptOrigen, dptDestino)
VALUES ('Memorandum', 3, 'Recursos Humanos', 'Contabilidad')

ALTER TABLE Departamento
ADD nombre varchar(30),
	siglas varchar(15)

SELECT * FROM Departamento
SELECT * FROM Usuario
SELECT * FROM Documento

INSERT INTO Usuario(nombre,correo,idDpt,cargo) 
VALUES ('Huascar','mejia@gmail.com', 11,'Desarrollador')

INSERT INTO Departamento(nombre, siglas) 
VALUES ('Recursos Humanos', 'RRHH'), ('Contabilidad','CONT')

Delete Usuario where id = 3
CREATE DATABASE LoginDB

--Documentos

--Doc-Empleado
CREATE PROCEDURE rptEmpDoc
	@name varchar(40) 
as 
SELECT Documento.tipo as 'Tipo', Usuario.nombre as 'Empleado', Documento.dptOrigen as 'Departamento de origen', Documento.dptDestino as 'Departamento de Destino', Documento.secuencia as 'Secuencia o código', Documento.fecha 'Fecha de expedio' from Documento
inner join Usuario on Documento.idEmpleado = Usuario.id
WHERE Usuario.nombre = @name

CREATE PROCEDURE rptDoc
as 
SELECT Documento.tipo as 'Tipo', Usuario.nombre as 'Empleado', Documento.dptOrigen as 'Departamento de origen', Documento.dptDestino as 'Departamento de Destino', Documento.secuencia as 'Secuencia o código', Documento.fecha 'Fecha de expedio' from Documento
inner join Usuario on Documento.idEmpleado = Usuario.id

--Documento por departamento de origen
CREATE PROCEDURE rptDocO
		@dptO varchar(40) 
as 
SELECT Documento.tipo, Documento.dptOrigen as 'Departamento de origen', Documento.dptDestino as 'Departamento de Destino', Documento.secuencia, Documento.fecha as 'Fecha de expedio' from Documento
WHERE Documento.dptOrigen = @dptO

--Documento por departamento de destino
CREATE PROCEDURE rptDocD
		@dptD varchar(40) 
as 
SELECT Documento.tipo, Documento.dptOrigen as 'Departamento de origen', Documento.dptDestino as 'Departamento de Destino', Documento.secuencia, Documento.fecha as 'Fecha de expedio' from Documento
WHERE Documento.dptDestino = @dptD

--Documento por departamento de fecha
CREATE PROCEDURE rptDocFecha
	@Fdesde varchar(10) , @Fhasta varchar(10)
as 
SELECT  Documento.fecha as 'Fecha de expedio', Documento.tipo as 'Tipo', Documento.dptOrigen as 'Departamento de origen', Documento.dptDestino as 'Departamento de Destino', Documento.secuencia as 'Secuencia o código' from Documento
WHERE Documento.fecha between @Fdesde and @Fhasta



--Empleado-Departamento
CREATE PROCEDURE rptEmpDpt
	
as 
SELECT Usuario.id, Usuario.nombre as 'Nombre', Departamento.nombre as 'Departamento', Usuario.cargo as 'Cargo', Usuario.correo as 'Correo' from Usuario
inner join Departamento on Usuario.idDpt = Departamento.id


execute rprptDocFecha '08/04/2021','08/04/2021'
execute rptEmpDoc 'Huascar'
execute rptDoc 
execute rptEmpDpt


DELETE FROM Usuario
DELETE FROM Documento
DELETE FROM Departamento

