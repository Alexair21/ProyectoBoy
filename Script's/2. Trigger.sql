USE Proyecto2
GO
--Procedimiento almacenado para registrar una FICHA DE INCRIPCION

CREATE PROCEDURE SP_Ingreso_Ficha(
    @FIN_Nombre VARCHAR(60),
    @FIN_Direccion VARCHAR(60),
    @FIN_GradoEstudios VARCHAR(30),
    @FIN_Foto VARCHAR(100),
    @CEN_Id INT
)
AS
    BEGIN
        DECLARE
            @FIN_DNI CHAR(8),
            @FIN_Telefono CHAR(10),
            @FIN_Celular CHAR(9),
            @FIN_Email VARCHAR(40),
            @FIN_Fecha date



        SET @FIN_DNI = (SELECT CAST(RAND() * (80000000 - 70000000) + 70000000 AS INT))
        SET @FIN_Telefono = CONCAT('044','-', FLOOR(RAND()*(999999-100000)+100000))
        SET @FIN_Celular = (SELECT CAST(RAND() * 100000000 AS INT) + 900000000)
        SET @FIN_Email =SUBSTRING(@FIN_Nombre,1,4)+CAST(FLOOR(RAND()*(2022-1950)+1950) AS VARCHAR)+'@gmail.com'
        SET @FIN_Fecha =DATEADD(day, FLOOR(RAND()*(8000-0)+0), '2000-01-01')
        INSERT INTO FICHAS_INSCRIPCION(FIN_Nombre,FIN_Direccion,FIN_Telefono,FIN_DNI,FIN_Celular,FIN_Email,FIN_GradoEstudios,FIN_Foto,FIN_Fecha,CEN_Id)
        VALUES(@FIN_Nombre,@FIN_Direccion,@FIN_Telefono,@FIN_DNI,@FIN_Celular,@FIN_Email,@FIN_GradoEstudios,@FIN_Foto,@FIN_Fecha,@CEN_Id)
end
GO

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
GO

-- TRIGGER PARA INSERTAR UN USUARIO
--Trigger para llenar la tabla USUARIOS cuando se haga un registro en la tabla FICHA_INSCRIPCION
CREATE TRIGGER TR_USUARIOS
    ON FICHAS_INSCRIPCION
    FOR INSERT
AS
    BEGIN
        DECLARE @FIN_Id INT
        DECLARE @Estado int
        select @FIN_Id = FIN_Id from inserted
        DECLARE @CARNET VARCHAR(15)
        --generar un numero entre 1 y 0 para el carnet
        SET
        @Estado = (SELECT CAST(RAND() * 2 AS INT))
        IF @Estado = 1 BEGIN
            SET @CARNET = 'CON CARNET'
        END
        ELSE BEGIN
            SET @CARNET = 'SIN CARNET'
        END
        --insertar en la tabla USUARIOS
        INSERT INTO USUARIOS (FIN_Id, EstadoCarnet)
        VALUES (@FIN_Id, @CARNET)

        IF @CARNET = 'CON CARNET'
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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---TRIGGER DE JONATHAN
--TRIGGER DE PRESTAMO

CREATE PROCEDURE SP_InsertarPrestamo(
    @LBR_Id INT,
    @PRS_FechaPrestamo DATE,
    @PRS_FechaDevolucion DATE,
    @USR_Id CHAR(18),
	@DPR_Cantidad INT,
	@DPR_CantidadHrs INT,
	@TPR_Id INT,
	@ETP_Id INT
    )
AS
BEGIN
    DECLARE
        @DocumentoPrestamo char(18)


    IF EXISTS (SELECT * FROM USUARIOS WHERE USR_Id = @USR_Id AND EstadoCarnet = 'CON CARNET')
        BEGIN
            --traemos el CAR_Id de la tabla CARNET de ese usuario y lo almacenamos en una variable @DocumentoPrestamo
            SET @DocumentoPrestamo = (SELECT CAR_Id FROM CARNETS WHERE USR_Codigo = @USR_Id)
        end

    ELSE
        BEGIN
            --traemos el DNI de la tabla FICHAS_INSCRIPCION de ese usuario y lo almacenamos en una variable @DocumentoPrestamo
            SET @DocumentoPrestamo = (SELECT FIN_DNI FROM FICHAS_INSCRIPCION WHERE FIN_Id = @USR_Id)

        end
        INSERT INTO PRESTAMOS (TPR_Id,USR_Id,PRS_FechaPrestamo,ETP_Id,PRS_DocumentosPrestados,PRS_FechaDevolucion )
        VALUES (@TPR_Id,@USR_Id,@PRS_FechaPrestamo, @ETP_Id, @DocumentoPrestamo,@PRS_FechaDevolucion)

		INSERT INTO DETALLE_PRESTAMO(LBR_Id, PRS_Id, DPR_Cantidad,DPR_CantidadHrs)
		VALUES (@LBR_Id, (SELECT PRS_Id FROM PRESTAMOS WHERE PRS_FechaPrestamo = @PRS_FechaPrestamo AND USR_Id = @USR_Id), @DPR_Cantidad,@DPR_CantidadHrs)

    END
GO

--TRIGGER DE DETALLE PRESTAMO

CREATE TRIGGER TRG_DETALLE_PRESTAMOS
    ON DETALLE_PRESTAMO
    FOR INSERT
AS
BEGIN
    BEGIN TRANSACTION
        DECLARE @LBR_Id  INT
        DECLARE @LBR_Cantidad  INT
		DECLARE @Cantidad		INT

        -- Hacer que el stock del libro disminuya
        SELECT
            @LBR_Id = LBR_Id,
            @LBR_Cantidad = LBR_Cantidad
        FROM LIBROS WHERE LBR_Id = (SELECT LBR_Id FROM inserted)

		-- Almacenamos la cantidad de libros a prestar en la variable @Cantidad

		SELECT
			@Cantidad = DPR_Cantidad
		 FROM DETALLE_PRESTAMO WHERE DPR_Cantidad = (SELECT DPR_Cantidad FROM inserted)

        IF @LBR_Cantidad > 0
            BEGIN
                UPDATE LIBROS
                SET LBR_Cantidad = @LBR_Cantidad - @Cantidad
                WHERE LBR_Id = @LBR_Id
                COMMIT TRANSACTION
            END
        ELSE
            BEGIN
                --sacar en consola el error
                PRINT 'No hay libros disponibles'
                ROLLBACK TRANSACTION
            END
    END
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TRIGGER DE DIEGO
--Procedimiento almacenado para registrar una RESERVA

CREATE PROCEDURE SP_Ingreso_Reserva(
    @USR_Id INT,
    @TPR_Id INT,
    @RES_FechaInicio DATE,
    @ERE_Id INT,
    @RES_Nota VARCHAR(100),
    @RES_CantidadTotalLibros INT
)
    AS
    BEGIN
        DECLARE
            @RES_FechaFinal DATE,
            @RES_DocumentoUsuario CHAR(18)


        --sumarle 2 horas a la fecha de inicio y guardarlo en una variable @FechaFinal
        SET @RES_FechaFinal = DATEADD(day ,1, @RES_FechaInicio)


        IF EXISTS (SELECT * FROM USUARIOS WHERE USR_Id = @USR_Id AND EstadoCarnet = 'CON CARNET')
        BEGIN
            --traemos el CAR_Id de la tabla CARNET de ese usuario y lo almacenamos en una variable @DocumentoPrestamo
            SET @RES_DocumentoUsuario = (SELECT CAR_Id FROM CARNETS WHERE USR_Codigo = @USR_Id)
        end

    ELSE
        BEGIN
            --traemos el DNI de la tabla FICHAS_INSCRIPCION de ese usuario y lo almacenamos en una variable @DocumentoPrestamo
            SET @RES_DocumentoUsuario = (SELECT FIN_DNI FROM FICHAS_INSCRIPCION WHERE FIN_Id = @USR_Id)

        end

    end


        INSERT INTO RESERVA(USR_Id,TPR_Id,RES_FechaInicio,RES_FechaFinal,ERE_Id,RES_Nota,RES_DocumentoUsuario,RES_CantidadTotalLibros)
        VALUES(@USR_Id,@TPR_Id,@RES_FechaInicio,@RES_FechaFinal,@ERE_Id,@RES_Nota,@RES_DocumentoUsuario,@RES_CantidadTotalLibros)
end
GO
-------------------------------------------------------------------------------------------------------------------------
--TRIGGER DE KEVIN
--Procedimiento almacenado para insertar una multa

CREATE PROCEDURE SP_InsertarMulta
(
    @MUL_Id             CHAR(03),
    @USR_Id             INT,
    @MUL_FECHA          DATE,
    @MUL_Descripcion    VARCHAR(100)
)
AS
BEGIN

    INSERT INTO MULTAS (MUL_Id,USR_Id,MUL_Fecha,MUL_Descripcion)
    VALUES (@MUL_Id,@USR_Id,@MUL_FECHA,@MUL_Descripcion)
END
GO


--Procedimiento almacenado para insertar un detalle de multa

CREATE PROCEDURE SP_InsertarDetalleMulta
(
    @MUL_Id                 CHAR(03),
    @PRS_Id                 INT,
    @DMU_Estado             CHAR(15)
)
AS
BEGIN

    DECLARE
        @DEV_FechaDevolucion    DATE,
        @Resta_Fechas           INT,
        @DMU_Monto              MONEY,
        @DMU_ImporteTotal       MONEY

    SELECT  @DEV_FechaDevolucion = DEV_FechaDevolucion FROM DEVOLUCIONES WHERE PRS_Id = @PRS_Id
    SELECT  @Resta_Fechas = DATEDIFF(DAY, (SELECT PRS_FechaDevolucion FROM PRESTAMOS WHERE PRS_Id = @PRS_Id), @DEV_FechaDevolucion)
    SET @DMU_Monto = 30
    SET @DMU_Monto =@DMU_Monto + (@Resta_Fechas * 2)
    SET @DMU_ImporteTotal = @DMU_Monto * @Resta_Fechas

    INSERT INTO DETALLE_MULTA (PRS_Id,MUL_Id, DMU_Monto, DMU_ImporteTotal, DMU_Estado)
    VALUES (@PRS_Id,@MUL_Id, @DMU_Monto, @DMU_ImporteTotal, @DMU_Estado)
END
GO














--TRIGER PARA LLENAR LA TABLA RETENCION EN BASE A LA TABLA DEVOLUCIONES

/*
CREATE TRIGGER TRG_RETENCION
    ON DEVOLUCIONES
    FOR INSERT
AS
    DECLARE @INS_Id INT
    SELECT @INS_Id = INS_Id FROM inserted
    DECLARE @INS_Estado VARCHAR(60)
    BEGIN

        DECLARE
            @CAR_Id INT,
            @DEV_Id INT,

            @PRS_Id INT,
            @MUL_Monto MONEY,
            @MUL_Fecha DATE,
            @USR_Id INT,
            @DEV_FechaDevolucion DATE,
            @Resta_Fechas INT
        ----------------------------------------------------------------------------------------------
        --Si la inpeccion esta entre 2 a 5
            IF @INS_Id  >=2 AND @INS_Id  <= 5
                BEGIN
                    --SI EstadoCarnet del Usuario es igual a 1 entonces se toma el CAR_Id de la tabla CARNETS
                    IF EXISTS (SELECT * FROM USUARIOS WHERE USR_Id = (SELECT USR_Id FROM PRESTAMOS WHERE PRS_Id = (SELECT PRS_Id FROM inserted)) AND EstadoCarnet = 'CON CARNET')
                        BEGIN
                            SET @CAR_Id = (SELECT CAR_Id FROM CARNETS WHERE USR_Codigo = (SELECT USR_Id FROM PRESTAMOS WHERE PRS_Id = (SELECT PRS_Id FROM inserted)))
                        END
                    ELSE
                        BEGIN
                            SET @CAR_Id = NULL
                        END
                    --INSERTAMOS
                    SELECT @DEV_Id = DEV_Id FROM inserted
                    INSERT INTO RETENCION (DEV_Id,CAR_Id)  VALUES (@DEV_Id,@CAR_Id)
                END


                -- Insercion de multas
                SELECT @DEV_FechaDevolucion = DEV_FechaDevolucion FROM inserted
                SELECT @PRS_Id = PRS_Id FROM inserted
                SELECT @Resta_Fechas = DATEDIFF(DAY, (SELECT PRS_FechaDevolucion FROM PRESTAMOS WHERE PRS_Id = @PRS_Id), @DEV_FechaDevolucion)
                SET @MUL_Fecha = @DEV_FechaDevolucion
                SET @USR_Id = (SELECT USR_Id FROM PRESTAMOS WHERE PRS_Id = @PRS_Id)
                SET @MUL_Monto = 0
                IF @INS_Id  >=2 AND @INS_Id  <= 5
                    BEGIN
                        SET @MUL_Monto = 30
                    END

                IF @Resta_Fechas >= 1
                    BEGIN
                        SET @MUL_Monto =@MUL_Monto + (@Resta_Fechas * 2)
                    END
                IF(@INS_Id  >=2 AND @INS_Id  <= 5) OR (@Resta_Fechas >=1)
                    BEGIN
                        INSERT INTO MULTAS (PRS_Id, MUL_Monto,MUL_Fecha,USR_Id) VALUES (@PRS_Id, @MUL_Monto, @MUL_Fecha,@USR_Id)
                    END
            END
        --------------------------------------------------------------------------------------------------------------------------------

        --SI EstadoCarnet del Usuario es igual a 1 entonces actualizamos el estado del carnet a 1

        IF EXISTS (SELECT * FROM USUARIOS WHERE USR_Id = (SELECT USR_Id FROM PRESTAMOS WHERE PRS_Id = (SELECT PRS_Id FROM inserted)) AND EstadoCarnet = 'CON CARNET')
            BEGIN
                UPDATE CARNETS
                SET CAR_Retenido = 1
                WHERE USR_Codigo = (SELECT USR_Id FROM PRESTAMOS WHERE PRS_Id = (SELECT PRS_Id FROM inserted))
            END

        IF (@INS_Id=1)
            BEGIN
                SET @INS_Estado = 'OK'
            end
        IF (@INS_Id=2)
            BEGIN
                SET @INS_Estado = 'ROTO'
            end
        IF (@INS_Id=3)
            BEGIN
                SET @INS_Estado = 'FALTAN HOJAS'
            end
        IF (@INS_Id=4)
            BEGIN
                SET @INS_Estado = 'PERDIDO'
            end
        IF (@INS_Id=5)
             BEGIN
                SET @INS_Estado = 'MANCHADO'
            end


        UPDATE LIBROS
        SET LBR_Cantidad = LBR_Cantidad + 1
        WHERE LBR_Id = (SELECT LBR_Id FROM PRESTAMOS WHERE PRS_Id = (SELECT PRS_Id FROM inserted))
        --actualizar el estado del libro
        UPDATE LIBROS
        SET LBR_Estado = @INS_Estado
        WHERE LBR_Id = (SELECT LBR_Id FROM PRESTAMOS WHERE PRS_Id = (SELECT PRS_Id FROM inserted))
GO
*/

