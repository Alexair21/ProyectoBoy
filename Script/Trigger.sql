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

-------------------------------------------------------------------------------------------------------------------------
--Trigger para actualizar La cantidad de libros prestados en la tabla USUARIOS

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
                --sacar en consola el error
                 PRINT 'No hay libros disponibles'
            END
    END
GO

-------------------------------------------------------------------------------------------------------------------------
-- Procedimiento almacenado para Insertar un prestamo

CREATE PROCEDURE SP_InsertarPrestamo(
    @LBR_Id INT,
    @PRS_FechaPrestamo DATE,
    @PRS_FechaDevolucion DATE,
    @USR_Id CHAR(18)
    )
AS
BEGIN
    DECLARE
        @TPR_Id INT,
        @ETP_Id INT,
        @DocumentoPrestamo char(18)


    IF EXISTS (SELECT * FROM USUARIOS WHERE USR_Id = @USR_Id AND EstadoCarnet = 1)
        BEGIN
            --traemos el CAR_Id de la tabla CARNET de ese usuario y lo almacenamos en una variable @DocumentoPrestamo
            SET @DocumentoPrestamo = (SELECT CAR_Id FROM CARNETS WHERE USR_Codigo = @USR_Id)
            SET @TPR_Id = (SELECT FLOOR(RAND()*(2-1)+1))
            SET @ETP_Id = (SELECT FLOOR(RAND()*(2-1)+1))
        end

    ELSE
        BEGIN
            --traemos el DNI de la tabla FICHAS_INSCRIPCION de ese usuario y lo almacenamos en una variable @DocumentoPrestamo
            SET @DocumentoPrestamo = (SELECT FIN_DNI FROM FICHAS_INSCRIPCION WHERE FIN_Id = @USR_Id)
            SET @TPR_Id = 1
            SET @ETP_Id = (SELECT FLOOR(RAND()*(2-1)+1))
        end
        INSERT INTO PRESTAMOS (LBR_Id, PRS_FechaPrestamo, PRS_FechaDevolucion, USR_Id, TPR_Id, ETP_Id, PRS_DocumentosPrestados)
        VALUES (@LBR_Id, @PRS_FechaPrestamo, @PRS_FechaDevolucion, @USR_Id, @TPR_Id, @ETP_Id, @DocumentoPrestamo)
    END
GO

-------------------------------------------------------------------------------------------------------------------------



-- Procedimiento almacenado para la tabla DEVOLUCIONES


CREATE PROCEDURE SP_InsertarDevolucion(
    @PRS_Id INT,
    @INS_Id INT,
    @DEV_Fecha DATE
)
AS
BEGIN
    IF EXISTS (SELECT * FROM PRESTAMOS WHERE PRS_Id = @PRS_Id)
        BEGIN
            INSERT INTO DEVOLUCIONES (PRS_Id, INS_Id, DEV_FechaDevolucion)
            VALUES (@PRS_Id, @INS_Id,@DEV_Fecha)
        END
    ELSE
        BEGIN
            PRINT 'NO EXISTE EL PRESTAMO'
        END
END
-------------------------------------------------------------------------------------------------------------------------
--TRIGER PARA LLENAR LA TABLA RETENCION EN BASE A LA TABLA DEVOLUCIONES

CREATE TRIGGER TRG_RETENCION
    ON DEVOLUCIONES
    FOR INSERT
AS
    DECLARE @INS_Id INT
    SELECT @INS_Id = INS_Id FROM inserted
    BEGIN

        DECLARE
            @CAR_Id INT,
            @DEV_Id INT,

            @PRS_Id INT,
            @MUL_Monto MONEY,
            @MUL_Fecha DATE,
            @USR_Id INT,
            @DEV_FechaDevolucion DATE,
            @Resta_Fechas INT,
            @MUL_MONTO2 MONEY
        ----------------------------------------------------------------------------------------------
        --Si la inpeccion esta entre 2 a 5
        IF @INS_Id  >=2 AND @INS_Id  <= 5
            BEGIN
                --SI EstadoCarnet del Usuario es igual a 1 entonces se toma el CAR_Id de la tabla CARNETS
                IF EXISTS (SELECT * FROM USUARIOS WHERE USR_Id = (SELECT USR_Id FROM PRESTAMOS WHERE PRS_Id = (SELECT PRS_Id FROM inserted)) AND EstadoCarnet = 1)
                    BEGIN
                        SET @CAR_Id = (SELECT CAR_Id FROM CARNETS WHERE USR_Codigo = (SELECT USR_Id FROM PRESTAMOS WHERE PRS_Id = (SELECT PRS_Id FROM inserted)))
                    END
                ELSE
                    BEGIN
                        SET @CAR_Id = NULL
                    END

                SELECT @DEV_Id = DEV_Id FROM inserted
                INSERT INTO RETENCION (DEV_Id,CAR_Id)  VALUES (@DEV_Id,@CAR_Id)

                -- Insercion de multas

                SELECT @DEV_FechaDevolucion = DEV_FechaDevolucion FROM inserted
                SELECT @PRS_Id = PRS_Id FROM inserted
                SELECT @Resta_Fechas = DATEDIFF(DAY, (SELECT PRS_FechaPrestamo FROM PRESTAMOS WHERE PRS_Id = @PRS_Id), @DEV_FechaDevolucion)

                SET @MUL_Monto = 30

                IF @Resta_Fechas >= 1
                    BEGIN
                        SET @MUL_Monto =@MUL_Monto + (@Resta_Fechas * 2)
                    END

                SET @MUL_Fecha = GETDATE()
                SET @USR_Id = (SELECT USR_Id FROM PRESTAMOS WHERE PRS_Id = @PRS_Id)

                INSERT INTO MULTAS (PRS_Id, MUL_Monto, MUL_Fecha, USR_Id) VALUES (@PRS_Id, @MUL_Monto, @MUL_Fecha, @USR_Id)
            END
        --------------------------------------------------------------------------------------------------------------------------------

        --SI EstadoCarnet del Usuario es igual a 1 entonces actualizamos el estado del carnet a 1

        IF EXISTS (SELECT * FROM USUARIOS WHERE USR_Id = (SELECT USR_Id FROM PRESTAMOS WHERE PRS_Id = (SELECT PRS_Id FROM inserted)) AND EstadoCarnet = 1)
            BEGIN
                UPDATE CARNETS
                SET CAR_Retenido = 1
                WHERE USR_Codigo = (SELECT USR_Id FROM PRESTAMOS WHERE PRS_Id = (SELECT PRS_Id FROM inserted))
            END

        UPDATE LIBROS
        SET LBR_Cantidad = LBR_Cantidad + 1
        WHERE LBR_Id = (SELECT LBR_Id FROM PRESTAMOS WHERE PRS_Id = (SELECT PRS_Id FROM inserted))

    END
GO

DROP TRIGGER TRG_RETENCION