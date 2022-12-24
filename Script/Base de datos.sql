use master;

drop database if exists proyecto2;

create database Proyecto2;

use Proyecto2;

CREATE TABLE AUTOR_LIBRO
(
	AUT_Id               int  NOT NULL ,
	LBR_Id               int  NOT NULL
)
go



ALTER TABLE AUTOR_LIBRO
	ADD CONSTRAINT XPKLIBRO_AUTOR PRIMARY KEY  CLUSTERED (AUT_Id ASC,LBR_Id ASC)
go



CREATE TABLE AUTORES
(
	AUT_Id               int IDENTITY ( 1,1 ) ,
	AUT_Codigo           char(05)  NOT NULL ,
	AUT_NombreCompleto   varchar(60)  NOT NULL ,
	AUT_Direccion        varchar(40)  NOT NULL ,
	AUT_Telefono         char(10)  NOT NULL ,
	AUT_Email            varchar(40)  NOT NULL ,
	AUT_Nacionalidad     char(02)  NOT NULL
)
go



ALTER TABLE AUTORES
	ADD CONSTRAINT XPKAUTORES PRIMARY KEY  CLUSTERED (AUT_Id ASC)
go



CREATE TABLE CARNETS
(
	CAR_Id               int IDENTITY ( 1,1 ) ,
	CAR_NombreCompleto   varchar(60)  NOT NULL ,
	TUS_Id               int  NOT NULL ,
	CAR_FechaInscripcion date  NOT NULL ,
	CAR_FechaCaducidad   date  NOT NULL ,
	CAR_Retenido         bit  NOT NULL ,
	USR_Codigo           char(18)  NOT NULL
)
go



ALTER TABLE CARNETS
	ADD CONSTRAINT XPKCARNETS PRIMARY KEY  CLUSTERED (CAR_Id ASC)
go



CREATE TABLE CAT_PRIMARIA
(
	CTP_Descripcion      char(18)  NOT NULL ,
	CTP_Id               int IDENTITY ( 1,1 )
)
go



ALTER TABLE CAT_PRIMARIA
	ADD CONSTRAINT XPKCAT_PRIMARIA PRIMARY KEY  CLUSTERED (CTP_Id ASC)
go



CREATE TABLE CAT_SECUNDARIA
(
	CTS_Descripcion      char(30)  NOT NULL ,
	CTS_Id               int IDENTITY ( 1,1 )
)
go



ALTER TABLE CAT_SECUNDARIA
	ADD CONSTRAINT XPKCAT_SECUNDARIA PRIMARY KEY  CLUSTERED (CTS_Id ASC)
go



CREATE TABLE CATEGORIAS
(
	CAT_Id               int IDENTITY ( 1,1 ) ,
	CTP_Id               int  NOT NULL ,
	CTS_Id               int  NULL
)
go



ALTER TABLE CATEGORIAS
	ADD CONSTRAINT XPKCATEGORIAS PRIMARY KEY  CLUSTERED (CAT_Id ASC,CTP_Id ASC)
go



CREATE TABLE CENTROS_TRABAJO
(
	CEN_Id               int IDENTITY ( 1,1 ) ,
	CEN_Nombre           varchar(30)  NOT NULL ,
	CEN_Telefono         varchar(10)  NOT NULL
)
go



ALTER TABLE CENTROS_TRABAJO
	ADD CONSTRAINT XPK_CENTROS_TRABAJO PRIMARY KEY  CLUSTERED (CEN_Id ASC)
go



CREATE TABLE DEVOLUCIONES
(
	DEV_Id               int IDENTITY ( 1,1 ) ,
	PRS_Id               int  NOT NULL ,
	INS_Id               int  NOT NULL ,
	DEV_Fecha            char(18)  NULL
)
go



ALTER TABLE DEVOLUCIONES
	ADD CONSTRAINT XPKDEVOLUCIONES PRIMARY KEY  CLUSTERED (DEV_Id ASC)
go



CREATE TABLE EDITORIALES
(
	EDT_Id               int IDENTITY ( 1,1 ) ,
	EDT_Nombre           varchar(30)  NOT NULL
)
go



ALTER TABLE EDITORIALES
	ADD CONSTRAINT XPKEDITORIALES PRIMARY KEY  CLUSTERED (EDT_Id ASC)
go



CREATE TABLE ESTADO_TIPO_PRESTAMO
(
	ETP_Id               int IDENTITY ( 1,1 ) ,
	ETP_Descripcion      char(20)  NULL
)
go



ALTER TABLE ESTADO_TIPO_PRESTAMO
	ADD CONSTRAINT XPKESTADO_TIPO_PRESTAMO PRIMARY KEY  CLUSTERED (ETP_Id ASC)
go



CREATE TABLE FICHAS_INSCRIPCION
(
	FIN_Id               int IDENTITY ( 1,1 ) ,
	FIN_Nombre           varchar(60)  NOT NULL ,
	FIN_Direccion        varchar(50)  NOT NULL ,
	FIN_Telefono         char(10)  NOT NULL ,
	FIN_Celular          char(09)  NOT NULL ,
	FIN_Email            varchar(40)  NOT NULL ,
	FIN_GradoEstudios    varchar(30)  NOT NULL ,
	FIN_Foto             varchar(100)  NOT NULL ,
	FIN_Fecha            date  NOT NULL ,
	CEN_Id               int  NULL ,
	FIN_Dni              char(8)  NOT NULL
)
go



ALTER TABLE FICHAS_INSCRIPCION
	ADD CONSTRAINT XPKFICHAS_INSCRIPCION PRIMARY KEY  CLUSTERED (FIN_Id ASC)
go



CREATE TABLE INSPECCION
(
	INS_Id               int IDENTITY ( 1,1 ) ,
	LBR_Id               int  NOT NULL ,
	INS_Estado           char(01)  NOT NULL
)
go



ALTER TABLE INSPECCION
	ADD CONSTRAINT XPKINSPECCION PRIMARY KEY  CLUSTERED (INS_Id ASC)
go



CREATE TABLE LIBROS
(
	LBR_Id               int IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	LBR_Codigo           char(10)  NOT NULL ,
	LBR_Titulo           varchar(50)  NOT NULL ,
	LBR_ISBN             char(15)  NULL ,
	LBR_Edicion          char(03)  NOT NULL ,
	LBR_AņoPublicacion   date  NOT NULL ,
	EDT_Id               int  NOT NULL ,
	CAT_Id               int  NULL ,
	LBR_Cantidad         char(18)  NULL ,
	CTP_Id               int  NULL
)
go



ALTER TABLE LIBROS
	ADD CONSTRAINT XPKLIBROS PRIMARY KEY  CLUSTERED (LBR_Id ASC)
go



CREATE TABLE MULTAS
(
	MUL_Id               int IDENTITY ( 1,1 ) ,
	MUL_Monto            money  NOT NULL ,
	MUL_Fecha            date  NOT NULL ,
	USR_Id               int  NOT NULL ,
	PRS_Id               int  NULL
)
go



ALTER TABLE MULTAS
	ADD CONSTRAINT XPKMULTAS PRIMARY KEY  CLUSTERED (MUL_Id ASC)
go



CREATE TABLE PRESTAMOS
(
	PRS_Id               int IDENTITY ( 1,1 ) ,
	LBR_Id               int  NOT NULL ,
	TPR_Id               int  NOT NULL ,
	PRS_FechaDevolucion  date  NOT NULL ,
	USR_Id               int  NOT NULL ,
	PRS_FechaPrestamo    date  NULL ,
	ETP_Id               int  NOT NULL ,
	DocumentoPrestamo    char(18)  NULL
)
go



ALTER TABLE PRESTAMOS
	ADD CONSTRAINT XPKPRESTAMOS PRIMARY KEY  CLUSTERED (PRS_Id ASC)
go



CREATE TABLE RESERVA
(
	RES_Id               int IDENTITY ( 1,1 ) ,
	USR_Id               int  NULL ,
	LBR_Id               int  NULL ,
	RES_Inicio           datetime  NOT NULL
)
go



ALTER TABLE RESERVA
	ADD CONSTRAINT XPKRESERVA PRIMARY KEY  CLUSTERED (RES_Id ASC)
go



CREATE TABLE RETENCION
(
	INS_Id               int  NOT NULL ,
	RTN_Id               int IDENTITY ( 1,1 ) ,
	RTN_Estado           char(18)  NOT NULL ,
	CAR_Id               int  NOT NULL
)
go



ALTER TABLE RETENCION
	ADD CONSTRAINT XPKRETENCION PRIMARY KEY  CLUSTERED (INS_Id ASC,RTN_Id ASC,CAR_Id ASC)
go



CREATE TABLE TIPOS_PRESTAMO
(
	TPR_Id               int IDENTITY ( 1,1 ) ,
	TPR_Nombre           varchar(20)  NOT NULL
)
go



ALTER TABLE TIPOS_PRESTAMO
	ADD CONSTRAINT XPKTIPOS_PRESTAMO PRIMARY KEY  CLUSTERED (TPR_Id ASC)
go



CREATE TABLE TIPOS_USUARIO
(
	TUS_Id               int IDENTITY ( 1,1 ) ,
	TUS_Nombre           varchar(20)  NOT NULL
)
go



ALTER TABLE TIPOS_USUARIO
	ADD CONSTRAINT XPKTIPOS_USUARIO PRIMARY KEY  CLUSTERED (TUS_Id ASC)
go



CREATE TABLE USUARIOS
(
	USR_Id               int IDENTITY ( 1,1 ) ,
	FIN_Id               int  NOT NULL ,
	EstadoCarnet         smallint  NULL
)
go



ALTER TABLE USUARIOS
	ADD CONSTRAINT XPKUSUARIOS PRIMARY KEY  CLUSTERED (USR_Id ASC)
go




ALTER TABLE AUTOR_LIBRO
	ADD CONSTRAINT R_7 FOREIGN KEY (AUT_Id) REFERENCES AUTORES(AUT_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE AUTOR_LIBRO
	ADD CONSTRAINT R_8 FOREIGN KEY (LBR_Id) REFERENCES LIBROS(LBR_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE CARNETS
	ADD CONSTRAINT R_38 FOREIGN KEY (TUS_Id) REFERENCES TIPOS_USUARIO(TUS_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE CATEGORIAS
	ADD CONSTRAINT R_87 FOREIGN KEY (CTP_Id) REFERENCES CAT_PRIMARIA(CTP_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE CATEGORIAS
	ADD CONSTRAINT R_90 FOREIGN KEY (CTS_Id) REFERENCES CAT_SECUNDARIA(CTS_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE DEVOLUCIONES
	ADD CONSTRAINT R_46 FOREIGN KEY (PRS_Id) REFERENCES PRESTAMOS(PRS_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE DEVOLUCIONES
	ADD CONSTRAINT R_47 FOREIGN KEY (INS_Id) REFERENCES INSPECCION(INS_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE FICHAS_INSCRIPCION
	ADD CONSTRAINT R_67 FOREIGN KEY (CEN_Id) REFERENCES CENTROS_TRABAJO(CEN_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE INSPECCION
	ADD CONSTRAINT R_45 FOREIGN KEY (LBR_Id) REFERENCES LIBROS(LBR_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE LIBROS
	ADD CONSTRAINT R_11 FOREIGN KEY (EDT_Id) REFERENCES EDITORIALES(EDT_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE LIBROS
	ADD CONSTRAINT R_58 FOREIGN KEY (CAT_Id,CTP_Id) REFERENCES CATEGORIAS(CAT_Id,CTP_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE MULTAS
	ADD CONSTRAINT R_50 FOREIGN KEY (USR_Id) REFERENCES USUARIOS(USR_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE MULTAS
	ADD CONSTRAINT R_94 FOREIGN KEY (PRS_Id) REFERENCES PRESTAMOS(PRS_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE PRESTAMOS
	ADD CONSTRAINT R_40 FOREIGN KEY (LBR_Id) REFERENCES LIBROS(LBR_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE PRESTAMOS
	ADD CONSTRAINT R_41 FOREIGN KEY (TPR_Id) REFERENCES TIPOS_PRESTAMO(TPR_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE PRESTAMOS
	ADD CONSTRAINT R_42 FOREIGN KEY (USR_Id) REFERENCES USUARIOS(USR_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE PRESTAMOS
	ADD CONSTRAINT R_93 FOREIGN KEY (ETP_Id) REFERENCES ESTADO_TIPO_PRESTAMO(ETP_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE RESERVA
	ADD CONSTRAINT R_53 FOREIGN KEY (USR_Id) REFERENCES USUARIOS(USR_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE RESERVA
	ADD CONSTRAINT R_54 FOREIGN KEY (LBR_Id) REFERENCES LIBROS(LBR_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE RETENCION
	ADD CONSTRAINT R_75 FOREIGN KEY (INS_Id) REFERENCES INSPECCION(INS_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE RETENCION
	ADD CONSTRAINT R_76 FOREIGN KEY (CAR_Id) REFERENCES CARNETS(CAR_Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

