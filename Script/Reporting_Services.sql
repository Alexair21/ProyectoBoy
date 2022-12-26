USE Proyecto2

---------- REPORTING KEVIN ---------------

CREATE PROCEDURE SP_AñoLibroEdtiorial(
    @Año CHAR(04),
    @Editorial VARCHAR(30)
)
AS
BEGIN
    SELECT DISTINCT
            L.LBR_Id AS [Id],
            L.LBR_Titulo AS [Titulo],
            CP.CTP_Descripcion AS [Categoria]
        FROM LIBROS L
    INNER JOIN EDITORIALES E on L.EDT_Id = E.EDT_Id
    INNER JOIN CAT_PRIMARIA CP on L.CTP_Id = CP.CTP_Id
    WHERE YEAR(L.LBR_AñoPublicacion) = @Año
        AND E.EDT_Nombre = @Editorial
END

DROP PROCEDURE SP_AñoLibroEdtiorial

-- Vista de año

CREATE VIEW VW_Año
AS
    SELECT DISTINCT
            YEAR(L.LBR_AñoPublicacion) AS [A�O]
        FROM LIBROS L

SELECT * FROM VW_Año

-- Vista de editorial

CREATE VIEW VW_Editorial
AS
    SELECT DISTINCT
            E.EDT_Nombre AS [EDITORIAL]
        FROM EDITORIALES E

SELECT * FROM VW_Editorial





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