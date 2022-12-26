use master;

drop database if exists BD_Dimensional;

create database BD_Dimensional;

use BD_Dimensional;

CREATE TABLE dimEditoriales
(
	IdEditoriales        int IDENTITY ( 1,1 ) ,
	E_Nombre             char(18)  NOT NULL ,
	E_Pais               char(18)  NOT NULL
)
go



ALTER TABLE dimEditoriales
	ADD CONSTRAINT XPKdimEditoriales PRIMARY KEY  CLUSTERED (IdEditoriales ASC)
go



CREATE TABLE dimLibros
(
	IdLibro              int IDENTITY ( 1,1 ) ,
	L_Titulo             varchar(30)  NOT NULL ,
	L_Autor              varchar(30)  NOT NULL ,
	L_Añopublicacion     date  NOT NULL ,
	l_Idioma             char(18)  NOT NULL
)
go



ALTER TABLE dimLibros
	ADD CONSTRAINT XPKdimLibros PRIMARY KEY  CLUSTERED (IdLibro ASC)
go



CREATE TABLE dimUsuarios
(
	IdUsuarios           int IDENTITY ( 1,1 ) ,
	U_Nombre             char(18)  NOT NULL ,
	U_Correo             char(18)  NOT NULL ,
	U_TipoMembresia      char(18)  NOT NULL ,
	U_FechaNacimiento    date  NOT NULL ,
	U_DNI                char(18)  NOT NULL
)
go



ALTER TABLE dimUsuarios
	ADD CONSTRAINT XPKdimUsuarios PRIMARY KEY  CLUSTERED (IdUsuarios ASC)
go



CREATE TABLE hechosLiborsEditoriales
(
	IdLibro              int  NOT NULL ,
	IdEditoriales        int  NOT NULL
)
go



ALTER TABLE hechosLiborsEditoriales
	ADD CONSTRAINT XPKhechosLiborsEditoriales PRIMARY KEY  CLUSTERED (IdLibro ASC,IdEditoriales ASC)
go



CREATE TABLE hechosPrestamos
(
	IdLibro              int  NOT NULL ,
	IdUsuarios           int  NOT NULL ,
	P_FechaInicio        date  NOT NULL ,
	P_FechaFin           date  NOT NULL ,
	IdPrestamo           int IDENTITY ( 1,1 )
)
go



ALTER TABLE hechosPrestamos
	ADD CONSTRAINT XPKhechosPrestamos PRIMARY KEY  CLUSTERED (IdPrestamo ASC,IdLibro ASC,IdUsuarios ASC)
go




ALTER TABLE hechosLiborsEditoriales
	ADD CONSTRAINT R_3 FOREIGN KEY (IdLibro) REFERENCES dimLibros(IdLibro)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE hechosLiborsEditoriales
	ADD CONSTRAINT R_4 FOREIGN KEY (IdEditoriales) REFERENCES dimEditoriales(IdEditoriales)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE hechosPrestamos
	ADD CONSTRAINT R_1 FOREIGN KEY (IdLibro) REFERENCES dimLibros(IdLibro)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE hechosPrestamos
	ADD CONSTRAINT R_2 FOREIGN KEY (IdUsuarios) REFERENCES dimUsuarios(IdUsuarios)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

---------------------DATOS---------------------
INSERT INTO dimEditoriales (E_Nombre, E_Pais) VALUES ('Anaya', 'España');
INSERT INTO dimEditoriales (E_Nombre, E_Pais) VALUES ('McGraw-Hill', 'Estados Unidos');
INSERT INTO dimEditoriales (E_Nombre, E_Pais) VALUES ('Pearson', 'Reino Unido');
INSERT INTO dimEditoriales (E_Nombre, E_Pais) VALUES ('Santillana', 'España');
INSERT INTO dimEditoriales (E_Nombre, E_Pais) VALUES ('Oxford', 'Reino Unido');

SELECT * FROM dimEditoriales;

INSERT INTO dimLibros(L_Titulo,L_Autor ,L_Añopublicacion , l_Idioma) VALUES ( 'Álgebra lineal', 'Gilbert Strang', '2009-05-12', 'español')
INSERT INTO dimLibros(L_Titulo,L_Autor ,L_Añopublicacion , l_Idioma) VALUES ( 'Cálculo diferencial', 'James Stewart', '2012-05-14', 'español')
INSERT INTO dimLibros(L_Titulo,L_Autor ,L_Añopublicacion , l_Idioma) VALUES ( 'Gramática del español', 'Javier Gallego', '2014-11-23', 'español')
INSERT INTO dimLibros(L_Titulo,L_Autor ,L_Añopublicacion , l_Idioma) VALUES ( 'Diccionario de sinónimos', 'José Martínez', '2008-05-19', 'español')
INSERT INTO dimLibros(L_Titulo,L_Autor ,L_Añopublicacion , l_Idioma) VALUES ( 'Historia de España', 'Pedro García Cabrera', '2010-11-25', 'español')
INSERT INTO dimLibros(L_Titulo,L_Autor ,L_Añopublicacion , l_Idioma) VALUES ( 'Historia de la filosofía', 'José Luis Martín Descalzo', '2012-08-27', 'español')
INSERT INTO dimLibros(L_Titulo,L_Autor ,L_Añopublicacion , l_Idioma) VALUES ( 'Historia de la ciencia', 'José Luis Martín Descalzo', '2012-03-05', 'español')
INSERT INTO dimLibros(L_Titulo,L_Autor ,L_Añopublicacion , l_Idioma) VALUES ( 'El universo', 'Stephen Hawking', '2010-08-24', 'español')

SELECT * FROM dimLibros

INSERT INTO dimUsuarios(U_Nombre,U_Correo,U_TipoMembresia,U_FechaNacimiento,U_DNI) VALUES ('Juan','juan@gmail.com','Premium','1990-05-12','72899283')
INSERT INTO dimUsuarios(U_Nombre,U_Correo,U_TipoMembresia,U_FechaNacimiento,U_DNI) VALUES ('Pedro','pedro@gmail.com','Premium','1990-05-12','14796384')
INSERT INTO dimUsuarios(U_Nombre,U_Correo,U_TipoMembresia,U_FechaNacimiento,U_DNI) VALUES ('Luis','luis@gmail.com','Premium','1990-05-12','73164892')
INSERT INTO dimUsuarios(U_Nombre,U_Correo,U_TipoMembresia,U_FechaNacimiento,U_DNI) VALUES ('Ana','ana@gmail.com','Premium','1990-05-12','95175386')
INSERT INTO dimUsuarios(U_Nombre,U_Correo,U_TipoMembresia,U_FechaNacimiento,U_DNI) VALUES ('Maria','maria@gmail.com','Premium','1990-05-12','35715926')
INSERT INTO dimUsuarios(U_Nombre,U_Correo,U_TipoMembresia,U_FechaNacimiento,U_DNI) VALUES ('Laura','laura@gmail.com','Premium','1990-05-12','91738426')
INSERT INTO dimUsuarios(U_Nombre,U_Correo,U_TipoMembresia,U_FechaNacimiento,U_DNI) VALUES ('Pablo','pablo@gmail.com','Premium','1990-05-12','13792648')

SELECT * FROM dimUsuarios

INSERT INTO hechosLiborsEditoriales(IdLibro,IdEditoriales) VALUES (1,1)
INSERT INTO hechosLiborsEditoriales(IdLibro,IdEditoriales) VALUES (2,1)
INSERT INTO hechosLiborsEditoriales(IdLibro,IdEditoriales) VALUES (3,3)
INSERT INTO hechosLiborsEditoriales(IdLibro,IdEditoriales) VALUES (4,3)
INSERT INTO hechosLiborsEditoriales(IdLibro,IdEditoriales) VALUES (5,5)

SELECT * FROM hechosLiborsEditoriales

INSERT INTO hechosPrestamos(IdLibro,IdUsuarios,P_FechaInicio,P_FechaFin) VALUES (1,1,'2019-05-12','2019-05-19')
INSERT INTO hechosPrestamos(IdLibro,IdUsuarios,P_FechaInicio,P_FechaFin) VALUES (2,2,'2018-11-20','2018-11-21')
INSERT INTO hechosPrestamos(IdLibro,IdUsuarios,P_FechaInicio,P_FechaFin) VALUES (3,2,'2019-02-14','2019-02-15')
INSERT INTO hechosPrestamos(IdLibro,IdUsuarios,P_FechaInicio,P_FechaFin) VALUES (4,4,'2020-10-10','2020-10-11')
