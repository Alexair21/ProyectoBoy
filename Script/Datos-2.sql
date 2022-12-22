use Proyecto2;

--Datos de editoriales
insert into EDITORIALES (EDT_Nombre) values ('Planeta');
insert into EDITORIALES (EDT_Nombre) values ('Santillana');
insert into EDITORIALES (EDT_Nombre) values ('Norma');
insert into EDITORIALES (EDT_Nombre) values ('Alfaguara');
insert into EDITORIALES (EDT_Nombre) values ('Anaya');
insert into EDITORIALES (EDT_Nombre) values ('Oceano');
insert into EDITORIALES (EDT_Nombre) values ('Penguin');
insert into EDITORIALES (EDT_Nombre) values ('Debolsillo');
insert into EDITORIALES (EDT_Nombre) values ('Piramide');
insert into EDITORIALES (EDT_Nombre) values ('Parramon');
insert into EDITORIALES (EDT_Nombre) values ('Salamandra');
insert into EDITORIALES (EDT_Nombre) values ('Minotauro');
insert into EDITORIALES (EDT_Nombre) values ('Alfaguara Infantil');
insert into EDITORIALES (EDT_Nombre) values ('Alfaguara Juvenil');
insert into EDITORIALES (EDT_Nombre) values ('Alfaguara Universitaria');
insert into EDITORIALES (EDT_Nombre) values ('Alfaguara Clasicos');
insert into EDITORIALES (EDT_Nombre) values ('Marte');
insert into EDITORIALES (EDT_Nombre) values ('El chepenano');
insert into EDITORIALES (EDT_Nombre) values ('El pacasmayino');
insert into EDITORIALES (EDT_Nombre) values ('El cusqueño');
insert into EDITORIALES (EDT_Nombre) values ('El arequipeño');

select * from EDITORIALES;

----------------------------------------------------------------

--Datos de categoria primaria
--Con subcategoria secundaria
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Matematicas');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Informatica');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Medicina');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Psicologia');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Fisica');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Quimica');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Biologia');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Economia');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Derecho');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Deportes');



--Sin Subcategoria secundaria
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Aventura');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Ciencia Ficcion');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Fantasia');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Historia');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Humor');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Novela');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Poesia');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Geografia');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Religion');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Filosofia');
insert into CAT_PRIMARIA (CTP_DESCRIPCION) values ('Musica');

select * from CAT_PRIMARIA;

--Datos de categoria secundaria
--De matematicas
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Calculo diferencial');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Calculo integral');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Calculo vectorial');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Ecuaciones diferenciales');

--De informatica
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Algoritmos');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Recursividad');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Redes');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Programacion');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Base de datos');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Sistemas operativos');

--De medicina
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Anatomia');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Fisiologia');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Patologia');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Farmacologia');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Bioquimica');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Genetica');

--De psicologia
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Psicologia clinica');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Psicologia educativa');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Psicologia social');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Psicologia industrial');

--De Fisica
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Fisica clasica');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Fisica moderna');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Fisica cuantica');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Fisica nuclear');

--De quimica
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Quimica organica');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Quimica inorganica');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Quimica analitica');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Quimica fisica');

--De biologia
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Biologia celular');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Biologia molecular');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Biologia evolutiva');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Biologia ambiental');

--De economia
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Macroeconomia');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Microeconomia');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Contabilidad');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Finanzas');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Mercadotecnia');

--De derecho
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Derecho civil');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Derecho penal');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Derecho constitucional');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Derecho administrativo');

--De deportes
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Futbol');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Basquetbol');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Voleibol');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Natacion');
insert into CAT_SECUNDARIA (CTS_DESCRIPCION) values ('Atletismo');

select * from CAT_SECUNDARIA;

--Datos de categoria
--De matematicas
insert into CATEGORIAS (CTP_Id, CTS_Id) values (1, 1);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (1, 2);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (1, 3);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (1, 4);

--De informatica
insert into CATEGORIAS (CTP_Id, CTS_Id) values (2, 5);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (2, 6);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (2, 7);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (2, 8);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (2, 9);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (2, 10);

--De medicina
insert into CATEGORIAS (CTP_Id, CTS_Id) values (3, 11);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (3, 12);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (3, 13);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (3, 14);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (3, 15);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (3, 16);

--De psicologia
insert into CATEGORIAS (CTP_Id, CTS_Id) values (4, 17);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (4, 18);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (4, 19);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (4, 20);

--De Fisica
insert into CATEGORIAS (CTP_Id, CTS_Id) values (5, 21);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (5, 22);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (5, 23);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (5, 24);

--De quimica
insert into CATEGORIAS (CTP_Id, CTS_Id) values (6, 25);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (6, 26);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (6, 27);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (6, 28);

--De biologia
insert into CATEGORIAS (CTP_Id, CTS_Id) values (7, 29);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (7, 30);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (7, 31);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (7, 32);

--De economia
insert into CATEGORIAS (CTP_Id, CTS_Id) values (8, 33);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (8, 34);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (8, 35);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (8, 36);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (8, 37);

--De derecho
insert into CATEGORIAS (CTP_Id, CTS_Id) values (9, 38);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (9, 39);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (9, 40);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (9, 41);

--De deportes
insert into CATEGORIAS (CTP_Id, CTS_Id) values (10, 42);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (10, 43);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (10, 44);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (10, 45);
insert into CATEGORIAS (CTP_Id, CTS_Id) values (10, 46);

--Categoria sin subcategoria
insert into CATEGORIAS (CTP_Id) values (11);
insert into CATEGORIAS (CTP_Id) values (12);
insert into CATEGORIAS (CTP_Id) values (13);
insert into CATEGORIAS (CTP_Id) values (14);
insert into CATEGORIAS (CTP_Id) values (15);
insert into CATEGORIAS (CTP_Id) values (16);
insert into CATEGORIAS (CTP_Id) values (17);
insert into CATEGORIAS (CTP_Id) values (18);
insert into CATEGORIAS (CTP_Id) values (19);
insert into CATEGORIAS (CTP_Id) values (20);
insert into CATEGORIAS (CTP_Id) values (21);


select * from CATEGORIAS;
select * from CAT_SECUNDARIA;
select * from CAT_PRIMARIA;
select * from LIBROS;
----------------------------------------------------------------------

--Datos de autores
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00001', 'Juan Perez', 'Calle 1', '985456987', 'juan@gmail.com', 'PE');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00002', 'Maria Lopez', 'Calle 2', '987298635', 'maria@gmail.com', 'AR');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00003', 'Pedro Gomez', 'Calle 3', '978147357', 'ejemplo1@mail.com', 'EC');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00004', 'Luisa Rodriguez', 'Calle 4', '987456123', 'ejemplo2@gmail.com', 'CH');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00005', 'Carlos Sanchez', 'Calle 5', '987456786', 'ejemplo3@gmail.com', 'PE');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00006', 'Jose Torres', 'Calle 6', '987456123', 'ejemplo4@gmail.com', 'PE');

select * from AUTORES;

----------------------------------------------------------------------
--Datos de centros de trabajo
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values ('Centro 1', '987456123');
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values ('Centro 2', '987456123');
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values ('Centro 3', '987456123');
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values ('Centro 4', '987456123');
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values ('Centro 5', '987456123');

select * from CENTROS_TRABAJO;

----------------------------------------------------------------------
--Datos de tipos de usuario
insert into TIPOS_USUARIO (TUS_Nombre) values ('Docente');
insert into TIPOS_USUARIO (TUS_Nombre) values ('Estudiante');
insert into TIPOS_USUARIO (TUS_Nombre) values ('Trabajador');
insert into TIPOS_USUARIO (TUS_Nombre) values ('Ocasional');

select * from TIPOS_USUARIO;

----------------------------------------------------------------------
--Datos de Libros

-- Categoria 1
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values ('00001', 'Limites al infinito I', '312-7281-72-1', '3', '2015', 1, 1, 1, 15);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00002', 'Integral Definida', '314-7270-80-2', '1', '2020', 2, 2, 1, 10);

-- Categoria 2
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00003', 'POO II', '342-6281-92-1', '8', '2019', 3, 8, 2, 20);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00004', N'Introducción a SQL Server', '422-5231-72-4', '3', '2020', 1,9, 2, 5);

-- Categoria 3
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00005', 'Sistema Digestivo I', '370-7281-72-5', '1', '2005', 3, 11, 3, 20);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00006', N'Farmacia Clínica I', '312-7281-72-1', '2', '2015', 2, 14, 3, 15);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00007', N'Genética II', '792-1221-72-6', '4', '2021', 1, 16, 3, 7);

-- Categoria 4
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00008', 'Psicologia: El comienzo', '360-5171-82-6', '1', '2016', 4, 17, 4, 15);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00009', N'Niños y su conducta', '212-4291-21-0', '2', '2017', 1, 18, 4, 10);

-- Categoria 5
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00010', 'Movimiento Rectilinio Uniforme', '123-9210-72-8', '1', '2018', 2, 21, 5, 9);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00011', 'Fisica II: Espejismos', '111-5165-12-1', '1', '2011', 3, 22, 5, 7);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00012', 'Fisica Cuantica en Computadoras', '301-6981-21-0', '4', '2012', 1, 23, 5, 10);

-- Categoria 6
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00013', 'Quimica Organica: Alcanos y Alquenos', '016-4131-02-1', '5', '2015', 2, 25, 6, 10);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00014', 'Quimica Inorganica: Metales y No metales', '142-5121-02-7', '1', '2019', 6, 26, 6, 11);

-- Categoria 7
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00012', 'La celula y sus partes', '312-7281-72-2', '4', '2011', 5, 29, 7, 16);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00013', 'Procariotas y Eucariotas', '311-0083-62-3', '2', '2007', 7, 30,7, 20);

-- Categoria 8
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00012', N'Economía: Macroeconomía', '312-7281-72-2', '4', '2011', 1, 33, 8, 16);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00013', N'Economía: Microeconomía', '311-0083-62-3', '2', '2007', 7, 34, 8,10);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00012', 'Finanzas Corporativas', '512-7131-02-0', '3', '2010', 1, 36, 8, 15);

-- Categoria 9
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00012', N'Derecho y Ciudadanía', '702-5101-12-0', '1', '2011', 1, 38, 9, 20);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00013', N'Constitución política del Perú', '931-7201-22-3', '6', '2012', 4, 39, 9, 10);

-- Categoria 10
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00012', N'Tácticas con balón parado', '109-1418-12-5', '6', '2020', 5, 42, 10, 12);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00013', N'El reglamento oficial', '302-1243-62-7', '1', '2015', 4, 43,10,13);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00013', N'El arte de jugar voleyball', '311-0321-12-4', '5', '2014', 1, 44,10,10);

select * from LIBROS;

-- Datos Autor_Libro
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(1, 1);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(1, 10);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(1, 20);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(2, 2);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(2, 3);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(2, 4);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(3, 5);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(3, 6);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(3, 7);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(4, 8);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(4, 9);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(4, 11);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(5, 12);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(5, 13);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(5, 14);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(5, 15);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(5, 16);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(6, 17);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(6, 18);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(6, 19);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(6, 21);

select * from AUTOR_LIBRO;

--------------------------------------------------------------------
-- Datos de tipo de prestamo
insert into TIPOS_PRESTAMO (TPR_Nombre) values('Lectura en Sala');
insert into TIPOS_PRESTAMO (TPR_Nombre) values('Prestamo a Domicilio');

select * from TIPOS_PRESTAMO;



