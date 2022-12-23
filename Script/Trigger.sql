use proyecto2;

--Trigger para llenar la tabla USUARIOS cuando se haga un registro en la tabla FICHA_INSCRIPCION

Create TRIGGER TR_USUARIOS
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
        INSERT INTO USUARIOS (FIN_Id, ESTADO_CARNET)
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


select  *  from  FICHAS_INSCRIPCION
select * from USUARIOS
select * from CARNETS
--Crear una funcion que revise si en lo

--Vista que me enseñe el nombre de cada libro con su categoria prima y secundaria
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

--EJECTUAR LA VISTA
SELECT * FROM V_LIBROS
SELECT * FROM LIBROS

--Vista que me enseñe que usuarios tiene carnet






