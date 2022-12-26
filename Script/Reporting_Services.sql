USE Proyecto2

---------- REPORTING KEVIN ---------------









---------- REPORTING DIEGO ----------------

CREATE PROCEDURE SP_Informe_Usuarios
    @Año CHAR(4)
AS
BEGIN
    SELECT
    U.USR_Id AS [ID],
    FI.FIN_Nombre AS [Nombres y Apellidos],
    FI.FIN_Email AS [EMAIL],

    --SI ESTADO CARNET ES 1, SE MUESTRA 'CARNET', SI ESTADO CARNET ES 0 SE MUESTRA 'DNI'
    CASE U.EstadoCarnet
        WHEN 1 THEN 'CARNET'
        WHEN 0 THEN 'DNI'
    END AS [Tipo de Documento de Prestamo]

    FROM USUARIOS U
    INNER JOIN FICHAS_INSCRIPCION FI on U.FIN_Id = FI.FIN_Id
    WHERE YEAR(FI.FIN_Fecha) = @Año
END

DROP PROCEDURE SP_Informe_Usuarios

CREATE VIEW  V_AñoInscripcion
AS
SELECT DISTINCT YEAR(FIN_Fecha) AS Año
FROM FICHAS_INSCRIPCION
GO

SELECT * FROM V_AñoInscripcion