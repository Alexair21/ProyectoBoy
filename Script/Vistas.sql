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
    U.USR_Id as [Codigo],
    --si ESTADO_CARNET = 1, entonces 'CON CARNET', si no 'SIN CARNET'
    CASE WHEN U.EstadoCarnet= 1 THEN 'CON CARNET' ELSE 'SIN CARNET' END as [Estado Carnet]

    FROM FICHAS_INSCRIPCION FI
    INNER JOIN USUARIOS U on FI.FIN_Id = U.FIN_Id
GO

DROP VIEW V_USUARIOS_CARNET
Select * from V_USUARIOS_CARNET

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

--------------------------------------------------------------------------------
CREATE VIEW V_DOCUMENTO_NUMERO
AS
    SELECT
    FI.FIN_Nombre as [Nombre],
    U.USR_Id as [Codigo],
    --si ESTADO_CARNET = 1, entonces 'CON CARNET', si no 'SIN CARNET'
    CASE WHEN U.EstadoCarnet= 1 THEN 'CON CARNET' ELSE 'CON DNI' END as [Estado Carnet],
    CASE WHEN U.EstadoCarnet= 1 THEN C.CAR_Id ELSE FI.FIN_DNI END as [Numero]


    FROM FICHAS_INSCRIPCION FI
    INNER JOIN USUARIOS U on FI.FIN_Id = U.FIN_Id
    INNER JOIN CARNETS C on U.USR_Id= C.CAR_Id
GO


DROP VIEW V_DOCUMENTO_NUMERO
SELECT * FROM V_DOCUMENTO_NUMERO



-- VISTA DEVOLUCIONES_USUARIO E INSPECCION_LIBROS Y PRESTAMOS
CREATE VIEW V_DEVOLUCIONES_USUARIO
AS
    SELECT
    FI.FIN_Nombre as [Nombre],
    L.LBR_Titulo as [LIBRO],
    P.PRS_FechaPrestamo as [Fecha_Prestamo],
    P.PRS_FechaDevolucion as [Fecha_Devolucion],
    CASE WHEN INS_Estado = 1 THEN 'OK'
            WHEN INS_Estado = 2 THEN 'ROTO'
            WHEN INS_Estado = 3 THEN 'FALTAN HOJAS'
            WHEN INS_Estado = 4 THEN 'PERDIDO'
            ELSE 'MANCHADO' END as [Estado]

    FROM DEVOLUCIONES D, FICHAS_INSCRIPCION FI
    INNER JOIN USUARIOS U on FI.FIN_Id = U.FIN_Id
    INNER JOIN PRESTAMOS P on U.USR_Id = P.USR_Id
    INNER JOIN LIBROS L on P.LBR_Id = L.LBR_Id
    INNER JOIN INSPECCION I on L.LBR_Id = I.LBR_Id
GO

DROP VIEW V_DEVOLUCIONES_USUARIO
SELECT * FROM V_DEVOLUCIONES_USUARIO















CREATE TRIGGER TR_USUARIOS
    ON FICHAS_INSCRIPCION
    FOR INSERT
AS
    BEGIN
        DECLARE @FIN_Id INT
        select @FIN_Id = FIN_Id from inserted
        DECLARE @CARNET SMALLINT
        --generar un numero entre 1 y 0 para el carnet
        SET
        @CARNET = (SELECT CAST(RAND() * 2 AS INT))
        --insertar en la tabla USUARIOS
        INSERT INTO USUARIOS (FIN_Id, EstadoCarnet)
        VALUES (@FIN_Id, @CARNET)

        IF @CARNET = 1
        BEGIN
            DECLARE @USR_Codigo CHAR(18)
            DECLARE @CAR_NombreCompleto VARCHAR(60)
            DECLARE @TUS_Id INT
            DECLARE @CAR_FechaInscripcion DATE
            DECLARE @CAR_FechaCaducidad DATE
            DECLARE @CAR_Retenido BIT

            select  @USR_Codigo = USR_Id from USUARIOS where FIN_Id = @FIN_Id
            select  @CAR_NombreCompleto = FIN_Nombre from FICHAS_INSCRIPCION where FIN_Id = @FIN_Id

             --tome un valor random entre 1 y 4 para el tipo de usuario
            SET @TUS_Id = (SELECT FLOOR(RAND()*(4-1)+1))

            --tome la fecha actual
            SET @CAR_FechaInscripcion = GETDATE()

            --tome la fecha actual y le sume 2 años
            SET @CAR_FechaCaducidad = DATEADD(YEAR, 2, GETDATE())

            --defaul 0
            SET @CAR_Retenido = 0
            --insertar en la tabla CARNET
            INSERT INTO CARNETS (USR_Codigo, CAR_NombreCompleto, TUS_Id, CAR_FechaInscripcion, CAR_FechaCaducidad, CAR_Retenido)
            VALUES (@USR_Codigo, @CAR_NombreCompleto, @TUS_Id, @CAR_FechaInscripcion, @CAR_FechaCaducidad, @CAR_Retenido)
        END
    END
GO