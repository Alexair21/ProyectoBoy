USE Proyecto2

---------- REPORTING KEVIN ---------------

CREATE PROCEDURE SP_AñoLibroEdtiorial(
    @Editorial VARCHAR(30)
)
AS
BEGIN
    SELECT DISTINCT
            L.LBR_Id AS [Id],
            L.LBR_Titulo AS [Titulo],
            CP.CTP_Descripcion AS [Categoria],
           YEAR( L.LBR_AñoPublicacion) AS [Año_Publicacion]
        FROM LIBROS L
    INNER JOIN EDITORIALES E on L.EDT_Id = E.EDT_Id
    INNER JOIN CAT_PRIMARIA CP on L.CTP_Id = CP.CTP_Id
    WHERE E.EDT_Nombre = @Editorial
END
GO

DROP PROCEDURE SP_AñoLibroEdtiorial

---------- REPORTING GRAFIC ----------------
CREATE PROCEDURE SP_ResumenLibroEditorial(
    @Editorial VARCHAR(30)
)
AS
BEGIN
    SELECT
        COUNT(L.LBR_Id) AS [Cantidad_Libros],
        YEAR( L.LBR_AñoPublicacion) AS [Año_Publicacion]
    FROM LIBROS L
    INNER JOIN EDITORIALES E on L.EDT_Id = E.EDT_Id
    WHERE E.EDT_Nombre = @Editorial
    GROUP BY YEAR( L.LBR_AñoPublicacion)
END
go

DROP PROCEDURE SP_ResumenLibroEditorial

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

---------- REPORTING GRAFIC ----------------
CREATE PROCEDURE SP_ResumenUsuarios
    @Año CHAR(4)
AS
    BEGIN
        SELECT
            --CONTAR LOS USUARIOS QUE TIENEN ESTADO CARNET 1
            CASE WHEN U.EstadoCarnet = 1 THEN COUNT(U.USR_Id) END AS [Carnet],
            --CONTAR LOS USUARIOS QUE TIENEN ESTADO CARNET 0
            CASE WHEN U.EstadoCarnet = 0 THEN COUNT(U.USR_Id) END AS [DNI]

            FROM USUARIOS U
            INNER JOIN FICHAS_INSCRIPCION FI on U.FIN_Id = FI.FIN_Id
            WHERE YEAR(FI.FIN_Fecha) = @Año
        GROUP BY U.EstadoCarnet

    end

DROP PROCEDURE SP_ResumenUsuarios
---------------------------------------------
