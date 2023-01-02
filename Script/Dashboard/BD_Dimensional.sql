USE master
GO

DROP DATABASE IF EXISTS BDD_Proyecto
GO

CREATE DATABASE BDD_Proyecto
GO

USE BDD_Proyecto
GO

CREATE TABLE dimLibros
(
	keyLibros            integer IDENTITY ( 1,1 ) ,
	Titulo               varchar(50)  NULL ,
	Cantidad             int  NULL ,
	AñoPublicacion       char(04)  NULL ,
	Editorial            varchar(30)  NULL ,
	AutorLibro           int NULL ,
	IdLibros             int  NULL
)
go



ALTER TABLE dimLibros
	ADD CONSTRAINT XPKdimLibros PRIMARY KEY  CLUSTERED (keyLibros ASC)
go



CREATE TABLE dimMultas
(
	keyMultas            integer IDENTITY ( 1,1 ) ,
	Monto                money  NULL ,
	DiaMulta             char(01)  NULL ,
	IdMulta              integer  NULL
)
go



ALTER TABLE dimMultas
	ADD CONSTRAINT XPKdimMultas PRIMARY KEY  CLUSTERED (keyMultas ASC)
go



CREATE TABLE dimPrestamos
(
	keyPrestamos         integer IDENTITY ( 1,1 ) ,
	DiaPrestamo          char(01)  NULL ,
	TipoPrestamo         varchar(20)  NULL ,
	IdPrestamos          integer  NULL
)
go



ALTER TABLE dimPrestamos
	ADD CONSTRAINT XPKdimPrestamos PRIMARY KEY  CLUSTERED (keyPrestamos ASC)
go



CREATE TABLE dimUsuarios
(
	keyUsuario           integer IDENTITY ( 1,1 ) ,
	Nombre               varchar(60)  NULL ,
	Celular              char(09)  NULL ,
	Email                varchar(40)  NULL ,
	AñoIngreso           char(04)  NULL ,
    IdUsuario            integer  NULL ,
)
go



ALTER TABLE dimUsuarios
	ADD CONSTRAINT XPKdimAutores PRIMARY KEY  CLUSTERED (keyUsuario ASC)
go



CREATE TABLE hechoOperacionPago
(
	keyPrestamos         integer  NOT NULL ,
	keyMultas            integer  NOT NULL ,
	keyLibros            integer  NOT NULL ,
	keyUsuario           integer  NOT NULL ,
	MontoTotal           money  NULL ,
	CantLibrosPrestados  smallint  NULL ,
	MultasxDias          smallint  NULL ,
	UsuariosPrestamos    char(18)  NULL,
    TotalAutorxLibros    INT  NULL
)
go



ALTER TABLE hechoOperacionPago
	ADD CONSTRAINT XPKhecho PRIMARY KEY  CLUSTERED (keyPrestamos ASC,keyMultas ASC,keyLibros ASC,keyUsuario ASC)
go




ALTER TABLE hechoOperacionPago
	ADD CONSTRAINT R_8 FOREIGN KEY (keyPrestamos) REFERENCES dimPrestamos(keyPrestamos)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE hechoOperacionPago
	ADD CONSTRAINT R_11 FOREIGN KEY (keyMultas) REFERENCES dimMultas(keyMultas)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE hechoOperacionPago
	ADD CONSTRAINT R_12 FOREIGN KEY (keyLibros) REFERENCES dimLibros(keyLibros)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE hechoOperacionPago
	ADD CONSTRAINT R_13 FOREIGN KEY (keyUsuario) REFERENCES dimUsuarios(keyUsuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

