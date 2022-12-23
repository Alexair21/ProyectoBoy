use proyecto2;

--Trigger para llenar la tabla USUARIOS cuando se haga un registro en la tabla FICHA_INSCRIPCION

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


CREATE TRIGGER TRG_PRESTAMOS
    ON PRESTAMOS
    FOR INSERT
AS
BEGIN
    BEGIN TRANSACTION TR_PRESTAMOS
        DECLARE @LBR_Id  INT
        DECLARE @LBR_Cantidad INT

        -- Hacer que la cantidad de libros disminuya
        SELECT
            @LBR_Id = LBR_Id,
            @LBR_Cantidad = LBR_Cantidad
        FROM LIBROS WHERE LBR_Id = (SELECT LBR_Id FROM inserted)

        IF @LBR_Cantidad > 0
            BEGIN
                UPDATE LIBROS
                SET LBR_Cantidad = @LBR_Cantidad -1
                WHERE LBR_Id = @LBR_Id
                COMMIT TRANSACTION TR_PRESTAMOS
            END
        ELSE
            BEGIN
            ROLLBACK TRANSACTION TR_PRESTAMOS
            RAISERROR ('No hay libros disponibles', 16, 1)
        END
END

-- EJECUCION DE LA FUNCION



INSERT INTO PRESTAMOS (LBR_Id, TPR_Id, PRS_FechaPrestamo, PRS_FechaDevolucion, USR_Id, CAR_Id, ETP_Id )
VALUES
    (1, 1, GETDATE(), DATEADD(DAY, 3,GETDATE()), 1, 4, NULL);

    --Agregar 2 años a la fecha actual
    --DATEADD(YEAR, 2, GETDATE())
SELECT * FROM LIBROS
SELECT * FROM TIPOS_PRESTAMO
SELECT * FROM PRESTAMOS
SELECT * FROM CARNETS
SELECT * FROM FICHAS_INSCRIPCION


