USE Proyecto2

--Datos de editoriales
insert into EDITORIALES (EDT_Nombre) values ('Planeta');
insert into EDITORIALES (EDT_Nombre) values ('Santillana');
insert into EDITORIALES (EDT_Nombre) values ('Norma');
insert into EDITORIALES (EDT_Nombre) values ('Alfaguara');
insert into EDITORIALES (EDT_Nombre) values ('Anaya');



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

----------------------------------------------------------------------

--Datos de autores
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00001', 'Juan Perez', 'Av. Mariposas #31', '985456987', 'juan@gmail.com', N'Perú');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00002', 'Maria Lopez', 'Av.Girasoles #42', '987298635', 'maria@gmail.com', 'Argentina');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00003', 'Pedro Gomez', 'Av. Tulipanes #10', '978147357', 'pedro1@mail.com', 'Ecuador');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00004', 'Luisa Rodriguez', 'Calle San Francisco', '987456123', 'luisa3@gmail.com', 'Colombia');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00005', 'Carl Muller', N'Av. Hormigón #21', '987456786', 'carlos1@gmail.com', 'Alemania');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00006', 'Jose Terrones', N'Plaza Sésamo', '987456123', 'jose21@gmail.com', N'Perú');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00007', N'Claudia Méndez', 'Calle Rosales #10', '987456123', 'claudia12@gmail.com', 'Chile');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00008', N'Albert Frankz', 'Av. Rosales #15', '957675612', 'albert12@gmail.com', 'Estados Unidos');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00009', N'Rocío Casillas', 'Calle Platanos #11', '987456123', 'rocio11@gmail.com', N'España');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00010', N'Wendy Ortinola', 'Av. Pamplona #15', '957575712', 'wen_orti1@gmail.com', N'Perú');
insert into AUTORES (AUT_Codigo, AUT_NombreCompleto, AUT_Direccion, AUT_Telefono, AUT_Email, AUT_Nacionalidad) values ('00011', N'Mario Vargas Llosa', 'Calle Zapallo #11', '917156923', 'mario_var12@gmail.com', N'Perú');


----------------------------------------------------------------------
--Datos de centros de trabajo
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values (N'Producción Industrial', '989563214');
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values (N'Diseño y Fabricación', '956987412');
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values (N'Servicios Técnicos', '995234876');
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values (N'Reparación y Mantenimiento', '965478231');
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values ('Desarrollo de Software', '998712347');
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values ('Manteniemiento de Hardware', '995175324');
insert into CENTROS_TRABAJO (CEN_Nombre,CEN_Telefono) values ('Aplicaciones', '987456210');


----------------------------------------------------------------------
--Datos de tipos de usuario
insert into TIPOS_USUARIO (TUS_Nombre) values ('Docente');
insert into TIPOS_USUARIO (TUS_Nombre) values ('Estudiante');
insert into TIPOS_USUARIO (TUS_Nombre) values ('Trabajador');
insert into TIPOS_USUARIO (TUS_Nombre) values ('Ocasional');


----------------------------------------------------------------------
--Datos de Libros

-- Categoria 1
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values ('00001', 'Limites al infinito I', '312-7281-72-1', '3', '2010', 1, 1, 1, 15);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00002', 'Integral Definida', '314-7270-80-2', '1', '2011', 2, 2, 1, 10);

-- Categoria 2
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00003', 'POO II', '342-6281-92-1', '8', '2012', 3, 8, 2, 20);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00004', N'Introducción a SQL Server', '422-5231-72-4', '3', '2013', 4,9, 2, 5);

-- Categoria 3
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00005', 'Sistema Digestivo I', '370-7281-72-5', '1', '2014', 5, 11, 3, 20);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00006', N'Farmacia Clínica I', '312-7281-72-1', '2', '2015', 1, 14, 3, 15);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00007', N'Genética II', '792-1221-72-6', '4', '2010', 2, 16, 3, 7);

-- Categoria 4
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00008', 'Psicologia: El comienzo', '360-5171-82-6', '1', '2011', 3, 17, 4, 15);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00009', N'Niños y su conducta', '212-4291-21-0', '2', '2012', 4, 18, 4, 10);

-- Categoria 5
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00010', 'Movimiento Rectilinio Uniforme', '123-9210-72-8', '1', '2013', 5, 21, 5, 9);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00011', 'Fisica II: Espejismos', '111-5165-12-1', '1', '2014', 1, 22, 5, 7);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00012', 'Fisica Cuantica en Computadoras', '301-6981-21-0', '4', '2015', 2, 23, 5, 10);

-- Categoria 6
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00013', 'Quimica Organica: Alcanos y Alquenos', '016-4131-02-1', '5', '2010', 3, 25, 6, 10);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00014', 'Quimica Inorganica: Metales y No metales', '142-5121-02-7', '1', '2011', 4, 26, 6, 11);

-- Categoria 7
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00015', 'La celula y sus partes', '312-7281-72-2', '4', '2012', 5, 29, 7, 16);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00016', 'Procariotas y Eucariotas', '311-0083-62-3', '2', '2013', 1, 30,7, 20);

-- Categoria 8
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00017', N'Economía: Macroeconomía', '312-7281-72-2', '4', '2014', 2, 33, 8, 16);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00018', N'Economía: Microeconomía', '311-0083-62-3', '2', '2015', 3, 34, 8,10);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00019', 'Finanzas Corporativas', '512-7131-02-0', '3', '2010', 4, 36, 8, 15);

-- Categoria 9
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00020', N'Derecho y Ciudadanía', '702-5101-12-0', '1', '2011', 1, 38, 9, 20);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00021', N'Constitución política del Perú', '931-7201-22-3', '6', '2012', 2, 39, 9, 10);

-- Categoria 10
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00022', N'Tácticas con balón parado', '109-1418-12-5', '6', '2013', 3, 42, 10, 12);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00023', N'El reglamento oficial', '302-1243-62-7', '1', '2014', 4, 43,10,13);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00024', N'El arte de jugar voleyball', '311-0321-12-4', '5', '2015', 5, 44,10,10)

insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00025', N'Las Aventuras del principe David', '109-1418-12-5', '6', '2010', 1, 42, 10, 12);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00026', N'Pelear con dinosarios: EL regreso de T-rex', '302-1243-62-7', '1', '2011', 2, 48,12,13);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00027', N'Hadas: El universo mágico', '311-0321-12-4', '5', '2012', 3, 49,13,10);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00028', N'La historia del Perú', '109-1418-12-5', '6', '2013', 4, 50, 14, 12);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00029', N'Condorito 3: La juerga', '302-1243-62-7', '1', '2014', 5, 51,15,13);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00030', N'Big mouth: El cofre magico', '311-0321-12-4', '5', '2015', 1, 47,11,10);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00031', N'Rayos Láser', '109-1418-12-5', '6', '2010', 2, 48, 12, 12);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00032', N'Pandas Voladores: El regreso', '302-1243-62-7', '1', '2011', 3, 49,13,13);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00033', N'Historia de la república Argentina', '311-0321-12-4', '5', '2012', 4, 50,14,10);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00034', N'Condorito 2', '109-1418-12-5', '6', '2013', 5, 51, 15, 12);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00035', N'La aventura de Jaimito', '302-1243-62-7', '1', '2014', 1, 47,11,13);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00036', N'Teletransportación', '311-0321-12-4', '5', '2015', 2, 48,12,10);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00037', N'Unicornios: My Little pony', '109-1418-12-5', '6', '2010', 3, 49, 13, 12);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00038', N'La historia de José de San Martin', '302-1243-62-7', '1', '2011', 4, 50,14,13);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00039', N'Condorito: El ñato', '311-0321-12-4', '5', '2012', 5, 51,15,10);


insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00040', N'Romeo y Julieta', '109-1418-12-5', '6', '2013', 1, 52,16,12);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00041', N'Antología', '302-1243-62-7', '1', '2014', 2, 53,17,13);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00042', N'Gegografía y biodiversidad del Perú', '311-0321-12-4', '5', '2015', 3, 54,18,10);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00043', N'Reina Valera: Antiguo Testamento', '109-1418-12-5', '6', '2010', 4, 55,19,12);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00044', N'Platón: Su filosofía desde el inicio', '302-1243-62-7', '1', '2011', 5, 56,20,13);
insert into LIBROS (LBR_Codigo, LBR_Titulo, LBR_ISBN, LBR_Edicion, LBR_AñoPublicacion, EDT_Id, CAT_Id, CTP_Id, LBR_Cantidad) values('00045', N'Introducción al piano', '311-0321-12-4', '5', '2012', 1, 57,21,10);


-- Datos Autor_Libro
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(1, 1);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(1, 2);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(1, 3);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(1, 4);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(2, 5);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(2, 6);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(2, 7);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(2, 8);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(2, 9);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(3, 10);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(3, 1);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(3, 12);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(3, 13);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(4, 14);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(4, 15);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(4, 16);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(4, 17);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(5, 18);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(5, 19);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(5, 20);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(5, 22);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(6, 23);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(6, 24);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(6, 25);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(6, 26);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(7, 27);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(7, 28);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(7, 29);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(7, 30);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(8, 31);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(8, 32);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(8, 33);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(8, 34);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(9, 35);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(9, 36);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(9, 37);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(9, 38);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(10, 39);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(10, 40);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(10, 41);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(10, 42);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(11, 43);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(11, 44);
insert into AUTOR_LIBRO (AUT_Id, LBR_Id) values(11, 45);
--------------------------------------------------------------------
-- Datos de tipo de prestamo
insert into TIPOS_PRESTAMO (TPR_Nombre) values('Lectura en Sala');
insert into TIPOS_PRESTAMO (TPR_Nombre) values('Prestamo a Domicilio');

--Datos de ESTADO_TIPO_PRESTAMO
insert into ESTADO_TIPO_PRESTAMO (ETP_Descripcion) values('En sala');
insert into ESTADO_TIPO_PRESTAMO (ETP_Descripcion) values('En domicilio');

--Datos de ficha inscripcion; ANTES EJECUTAR EL TRIGGER QUE SE ENCUENTRA EN EL SCRIPT: TRIGGER

--ingresame datos en el SP_Ficha_Inscripcion
EXEC SP_Ingreso_Ficha 'Juan Rodriguez Diaz', 'Avenida Revolución #15',  'Sec. completa', 2
EXEC SP_Ingreso_Ficha 'Maria Garcia Aponte', 'Carretera Central #25', 'Primaria',  1
EXEC SP_Ingreso_Ficha 'Carlos Diaz Diaz', 'Calle del Sol #35','Bachiller', 5
EXEC SP_Ingreso_Ficha 'Laura Moreno Mendoza', 'Avenida de los Pinos #45','Sec. completa', 1
EXEC SP_Ingreso_Ficha 'Fernando Lopez Garcia', 'Carretera Nacional #55','Bachiller', 5
EXEC SP_Ingreso_Ficha 'Marta Perez Suarez', 'Calle de la Luna #65', 'Primaria', 1
EXEC SP_Ingreso_Ficha 'David Jimenez Perez', 'Avenida del Mar #75', 'Sec. completa', 5
EXEC SP_Ingreso_Ficha 'Beatriz Suarez Diaz', 'Carretera del Rio #85', 'Bachiller',  1
EXEC SP_Ingreso_Ficha 'Jose Gonzalez Guerrero', 'Calle de las Estrellas #95','Primaria',  2
EXEC SP_Ingreso_Ficha 'Elena Martinez Suarez', 'Avenida de los Árboles #105','Sec. completa', 1
EXEC SP_Ingreso_Ficha 'Andres Soto Palomino', 'Carretera del Monte #115','Bachiller',  1
EXEC SP_Ingreso_Ficha 'Cristina Ruiz Rodriguez', 'Calle del Cielo #125', 'Primaria',  3
EXEC SP_Ingreso_Ficha 'Mario Ortiz Suarez', 'Avenida de las Flores #135',  'Sec. completa',  1
EXEC SP_Ingreso_Ficha 'Rocio Rodriguez Carrera', 'Carretera del Valle #145' ,'Bachiller',  5
EXEC SP_Ingreso_Ficha 'Samuel Gonzalez Castillo', 'Calle de la Montaña #155','Sec. completa',  1
EXEC SP_Ingreso_Ficha 'Alba Moreno Suarez', 'Avenida de los Ríos #165','Primaria',  4
EXEC SP_Ingreso_Ficha 'Jorge Lopez Mostacero', 'Carretera del Océano #175','Sec. completa',  1
EXEC SP_Ingreso_Ficha 'Victoria Jimenez Camacho', 'Calle de la Pradera #185',  'Bachiller',  2
EXEC SP_Ingreso_Ficha 'Juan Carlos Martinez', 'Avenida de los Bosques #195',  'Bachiller', 1
EXEC SP_Ingreso_Ficha 'Maria Elena Perez', 'Carretera del Desierto #205', 'Sec. completa',  1
EXEC SP_Ingreso_Ficha 'Bruno Suarez Suarez', 'Calle de la Sierra #215',  'Bachiller',  2
EXEC SP_Ingreso_Ficha 'Laura Diaz Rodriguez', 'Avenida de los Lagos #225',  'Sec. completa', 1
EXEC SP_Ingreso_Ficha 'Maria Gonzalez Perez', 'Carretera del Volcán #235',  'Bachiller',  1
EXEC SP_Ingreso_Ficha 'Fernando Moreno Diaz', 'Calle de la Playa #245', 'Sec. completa', 2
EXEC SP_Ingreso_Ficha 'Cristina Lopez Ruiz', 'Avenida de las Colinas #255',  'Primaria',  1
EXEC SP_Ingreso_Ficha 'Mario Perez Ortiz', 'Carretera del Bosque #265',  'Bachiller',  5
EXEC SP_Ingreso_Ficha 'Rocio Rodriguez Jimenez', 'Calle del Risco #275',  'Sec. completa', 1
EXEC SP_Ingreso_Ficha 'Samuel Gonzalez Ruiz', 'Avenida de las Cascadas #285', 'Bachiller',  5
EXEC SP_Ingreso_Ficha 'Alba Moreno Gonzalez', 'Carretera del Cañón #295', 'Primaria',  1
EXEC SP_Ingreso_Ficha 'Jorge Lopez Ortiz', 'Calle de la Cueva #305',  'Sec. completa',  5
EXEC SP_Ingreso_Ficha 'Victoria Jimenez Perez', 'Avenida del Faro #315', 'Bachiller', 1
EXEC SP_Ingreso_Ficha 'Juan Carlos Martinez Moreno', 'Carretera del Monte #325','Primaria',  2
EXEC SP_Ingreso_Ficha 'Maria Elena Perez Diaz', 'Calle de la Selva #335',  'Sec. completa',  1
EXEC SP_Ingreso_Ficha 'Bruno Suarez Lopez', 'Avenida de los Vientos #345', 'Bachiller',  1
EXEC SP_Ingreso_Ficha 'Laura Diaz Garcia', 'Carretera del Risco #355', 'Primaria',  3
EXEC SP_Ingreso_Ficha 'Carlos Hernandez Ruiz', 'Calle del Lago #365', 'Sec. completa',  1
EXEC SP_Ingreso_Ficha 'Elena Garcia Soto', 'Avenida de las Rocas #375',  'Bachiller',  5
EXEC SP_Ingreso_Ficha 'David Ruiz Ortiz', 'Carretera del Bosque #385','Sec. completa',  1
EXEC SP_Ingreso_Ficha 'Beatriz Soto Jimenez', 'Calle de la Playa #395', 'Primaria',  4
EXEC SP_Ingreso_Ficha 'Jose Ortiz Gonzalez', 'Avenida de las Dunas #405', 'Sec. completa',  1
EXEC SP_Ingreso_Ficha 'Marta Jimenez Lopez', 'Avenida 28 de julio #678', 'Bachiller',  2
EXEC SP_Ingreso_Ficha 'Maria Gonzalez Perez', 'Calle Cerro Prieto #456',  'Bachiller', 1
EXEC SP_Ingreso_Ficha 'Fernando Moreno Diaz', 'Carretera de los alamos #987', 'Sec. completa',  1
EXEC SP_Ingreso_Ficha 'Rocio Rodriguez Jimenez', 'Avenida 2 de mayo #123','Bachiller', 2
EXEC SP_Ingreso_Ficha 'Diego Huamanjulca Guerrero', 'Calle 16', 'Sec. completa',1
EXEC SP_Ingreso_Ficha 'Kevin Carrera Yzquierdo', 'Avenida 28 de julio #678', 'Primaria',  2


-- Insertar datos en la tabla INSPECCION
INSERT  INTO INSPECCION (INS_Estado) VALUES ('Ok')
INSERT  INTO INSPECCION (INS_Estado) VALUES ('ROTO')
INSERT  INTO INSPECCION (INS_Estado) VALUES ('FALTAN HOJAS')
INSERT  INTO INSPECCION (INS_Estado) VALUES ('PERDIDO')
INSERT  INTO INSPECCION (INS_Estado) VALUES ('MANCHADO')

--- Insertar datos en la tabla PRESTAMOS

EXEC SP_InsertarPrestamo 1,  '2022-12-25', '2022-12-27',1
EXEC SP_InsertarPrestamo 2,  '2022-12-26', '2022-12-28',2
EXEC SP_InsertarPrestamo 3,  '2022-12-27', '2022-12-29',3
EXEC SP_InsertarPrestamo 4,  '2022-12-28', '2022-12-30',4
EXEC SP_InsertarPrestamo 5,  '2022-12-29', '2022-12-31',5
EXEC SP_InsertarPrestamo 6,  '2022-12-30', '2023-01-01',6
EXEC SP_InsertarPrestamo 7,  '2022-12-25', '2022-12-27',7
EXEC SP_InsertarPrestamo 8,  '2022-12-26', '2022-12-28',8
EXEC SP_InsertarPrestamo 9,  '2022-12-27', '2022-12-29',9
EXEC SP_InsertarPrestamo 10, '2022-12-28', '2022-12-30',10

EXEC SP_InsertarPrestamo 1,  '2022-12-29', '2022-12-31',1
EXEC SP_InsertarPrestamo 2,  '2022-12-30', '2023-01-01',2
EXEC SP_InsertarPrestamo 3,  '2022-12-25', '2022-12-27',3
EXEC SP_InsertarPrestamo 4,  '2022-12-26', '2022-12-28',4
EXEC SP_InsertarPrestamo 5,  '2022-12-27', '2022-12-29',5
EXEC SP_InsertarPrestamo 6,  '2022-12-28', '2022-12-30',6
EXEC SP_InsertarPrestamo 7,  '2022-12-29', '2022-12-31',7
EXEC SP_InsertarPrestamo 8,  '2022-12-30', '2023-01-01',8
EXEC SP_InsertarPrestamo 9,  '2022-12-25', '2022-12-27',9
EXEC SP_InsertarPrestamo 10, '2022-12-26', '2022-12-28',10

EXEC SP_InsertarPrestamo 11, '2022-12-27', '2022-12-29',11
EXEC SP_InsertarPrestamo 12, '2022-12-28', '2022-12-30',12
EXEC SP_InsertarPrestamo 13, '2022-12-29', '2022-12-31',13
EXEC SP_InsertarPrestamo 14, '2022-12-30', '2023-01-01',14
EXEC SP_InsertarPrestamo 15, '2022-12-25', '2022-12-27',15

EXEC SP_InsertarPrestamo 16,  '2022-12-26', '2022-12-28',16
EXEC SP_InsertarPrestamo 17,  '2022-12-27', '2022-12-29',17
EXEC SP_InsertarPrestamo 18,  '2022-12-28', '2022-12-30',18
EXEC SP_InsertarPrestamo 19,  '2022-12-29', '2022-12-31',19
EXEC SP_InsertarPrestamo 20,  '2022-12-30', '2023-01-01',20
EXEC SP_InsertarPrestamo 21,  '2022-12-25', '2022-12-27',21
EXEC SP_InsertarPrestamo 22,  '2022-12-26', '2022-12-28',22
EXEC SP_InsertarPrestamo 23,  '2022-12-27', '2022-12-29',23
EXEC SP_InsertarPrestamo 24,  '2022-12-28', '2022-12-30',24
EXEC SP_InsertarPrestamo 25, '2022-12-29', '2023-01-31',25
EXEC SP_InsertarPrestamo 26, '2022-12-30', '2023-01-01',26
EXEC SP_InsertarPrestamo 27, '2022-12-25', '2022-12-27',27
EXEC SP_InsertarPrestamo 28, '2022-12-26', '2022-12-28',28
EXEC SP_InsertarPrestamo 29, '2022-12-27', '2022-12-29',29
EXEC SP_InsertarPrestamo 30, '2022-12-28', '2022-12-30',30
EXEC SP_InsertarPrestamo 31, '2022-12-29', '2022-12-31',31
EXEC SP_InsertarPrestamo 32, '2022-12-30', '2022-12-31',32

EXEC SP_InsertarPrestamo 33,  '2022-12-30', '2023-01-01',16
EXEC SP_InsertarPrestamo 34,  '2022-12-25', '2022-12-27',17
EXEC SP_InsertarPrestamo 35,  '2022-12-26', '2022-12-28',18
EXEC SP_InsertarPrestamo 36,  '2022-12-27', '2022-12-29',19
EXEC SP_InsertarPrestamo 37,  '2022-12-28', '2022-12-30',20
EXEC SP_InsertarPrestamo 38, '2022-12-29', '2022-12-31',21
EXEC SP_InsertarPrestamo 39, '2022-12-30', '2023-01-01',22
EXEC SP_InsertarPrestamo 40, '2022-12-25', '2022-12-27',1
EXEC SP_InsertarPrestamo 41, '2022-12-26', '2022-12-28',2
EXEC SP_InsertarPrestamo 42, '2022-12-27', '2022-12-29',3
EXEC SP_InsertarPrestamo 43, '2022-12-28', '2022-12-30',4
EXEC SP_InsertarPrestamo 44, '2022-12-29', '2022-12-31',5
EXEC SP_InsertarPrestamo 45, '2022-12-30', '2023-01-01',6


-- INSERTAMOS DEVOLUCIONES
EXEC SP_InsertarDevolucion 1, 1,'2023-01-02'
EXEC SP_InsertarDevolucion 2, 2,'2023-01-03'
EXEC SP_InsertarDevolucion 3, 3,'2023-01-04'
EXEC SP_InsertarDevolucion 4, 4,'2023-01-05'
EXEC SP_InsertarDevolucion 5, 5,'2023-01-06'
EXEC SP_InsertarDevolucion 6, 1,'2023-01-02'
EXEC SP_InsertarDevolucion 7, 2,'2023-01-03'
EXEC SP_InsertarDevolucion 8, 3,'2023-01-04'
EXEC SP_InsertarDevolucion 9, 4,'2023-01-05'
EXEC SP_InsertarDevolucion 10,5,'2023-01-06'
EXEC SP_InsertarDevolucion 11,1,'2023-01-02'
EXEC SP_InsertarDevolucion 12,2,'2023-01-03'
EXEC SP_InsertarDevolucion 13,3,'2023-01-04'
EXEC SP_InsertarDevolucion 14,4,'2023-01-05'
EXEC SP_InsertarDevolucion 15,5,'2023-01-06'
EXEC SP_InsertarDevolucion 16,1,'2023-01-02'
EXEC SP_InsertarDevolucion 17,2,'2023-01-03'
EXEC SP_InsertarDevolucion 18,3,'2023-01-04'
EXEC SP_InsertarDevolucion 19,4,'2023-01-05'
EXEC SP_InsertarDevolucion 20,5,'2023-01-06'
EXEC SP_InsertarDevolucion 21,1,'2023-01-02'
EXEC SP_InsertarDevolucion 22,2,'2023-01-03'
EXEC SP_InsertarDevolucion 23,3,'2023-01-04'
EXEC SP_InsertarDevolucion 24,4,'2023-01-05'
EXEC SP_InsertarDevolucion 25,5,'2023-01-06'
EXEC SP_InsertarDevolucion 26,1,'2023-01-02'
EXEC SP_InsertarDevolucion 27,2,'2023-01-03'
EXEC SP_InsertarDevolucion 28,3,'2023-01-04'
EXEC SP_InsertarDevolucion 29,4,'2023-01-05'
EXEC SP_InsertarDevolucion 30,5,'2023-01-06'
EXEC SP_InsertarDevolucion 31,1,'2023-01-02'
EXEC SP_InsertarDevolucion 32,2,'2023-01-03'
EXEC SP_InsertarDevolucion 33,3,'2023-01-04'
EXEC SP_InsertarDevolucion 34,4,'2023-01-05'
EXEC SP_InsertarDevolucion 35,5,'2023-01-06'
EXEC SP_InsertarDevolucion 36,1,'2023-01-02'
EXEC SP_InsertarDevolucion 37,2,'2023-01-03'
EXEC SP_InsertarDevolucion 38,3,'2023-01-04'
EXEC SP_InsertarDevolucion 39,4,'2023-01-05'
EXEC SP_InsertarDevolucion 40,5,'2023-01-06'

-- INSERTAR DATOS EN LA TABLA CON INSERT INTO
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (1, 1, '2022-12-30')
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (2, 2, '2022-12-31')
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (3, 3, '2022-12-30')
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (4, 4, '2022-12-31')
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (5, 5, '2022-12-30')
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (6, 6, '2022-12-31')
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (7, 7, '2022-12-30')
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (8, 8, '2022-12-31')
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (9, 9, '2022-12-30')
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (10,10, '2022-12-31')
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (11,11, '2022-12-30')
INSERT INTO RESERVA(USR_Id,LBR_Id,RES_Inicio) VALUES (12,12, '2022-12-31')



