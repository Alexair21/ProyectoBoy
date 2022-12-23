USE Proyecto2
GO

-- Vista que me enseñe el nombre de cada libro con su categoria prima y secundaria
CREATE VIEW V_LIBROS
AS
    SELECT
    L.LBR_Titulo AS [TITULO],
    CP.CTP_Descripcion AS [CATEGORIA PRINCIPAL],
    CS.CTS_Descripcion AS [CATEGORIA SECUNDARIA]


    FROM LIBROS L
    inner join CATEGORIAS C on L.CAT_Id = C.CAT_Id
    inner join CAT_PRIMARIA CP on C.CTP_Id = CP.CTP_Id
    inner join CAT_SECUNDARIA CS on C.CTS_Id = CS.CTS_Id
GO

DROP VIEW V_LIBROS
SELECT * FROM V_LIBROS

-- Vista que me enseñe que usuarios tiene carnet
CREATE VIEW V_USUARIOS_CARNET
AS
    SELECT
    FI.FIN_Nombre as [Nombre],
    C.USR_Codigo as [Codigo],
    --si ESTADO_CARNET = 1, entonces 'CON CARNET', si no 'SIN CARNET'
    CASE WHEN U.ESTADO_CARNET = 1 THEN 'CON CARNET' ELSE 'SIN CARNET' END as [Estado Carnet]

    FROM FICHAS_INSCRIPCION FI
    INNER JOIN USUARIOS U on FI.FIN_Id = U.FIN_Id
    INNER JOIN CARNETS C on U.USR_Id = C.CAR_Id
GO

DROP VIEW V_USUARIOS_CARNET
SELECT * FROM V_USUARIOS_CARNET

-- Vista para ver que Usuario presto que libro
CREATE VIEW V_USUARIOS_LIBROS
AS
    SELECT DISTINCT
    FI.FIN_Nombre as [Nombre],
    L.LBR_Titulo as [LIBRO],
    P.PRS_FechaPrestamo as [Fecha_Prestamo],
    P.PRS_FechaDevolucion as [Fecha_Devolucion]

    FROM FICHAS_INSCRIPCION FI
    INNER JOIN USUARIOS U on FI.FIN_Id = U.FIN_Id
    INNER JOIN PRESTAMOS P on U.USR_Id = P.USR_Id
    INNER JOIN LIBROS L on P.LBR_Id = L.LBR_Id
GO

DROP VIEW V_USUARIOS_LIBROS
SELECT * FROM V_USUARIOS_LIBROS