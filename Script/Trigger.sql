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
        @CARNET = (SELECT CAST(RAND() * 1 AS INT))
        --insertar en la tabla USUARIOS
        INSERT INTO USUARIOS (FIN_Id, ESTADO_CARNET)
        VALUES (@FIN_Id, @CARNET)
    end
    go

--ejectuar el trigger
INSERT INTO FICHAS_INSCRIPCION (FIN_Nombre, FIN_Direccion, FIN_Telefono, FIN_Celular, FIN_Email, FIN_GradoEstudios, FIN_Foto, FIN_Fecha, CEN_Id) values ('Juan', 'Calle 1', '1234567', '7654321', 'a@gmailcom', 'Bachiller', 'fotojpg', '2019-01-01', 1)


