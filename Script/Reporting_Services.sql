USE Proyecto2

---------- REPORTING KEVIN ---------------

CREATE PROCEDURE SP_AñoLibroEdtioria(
    @Año            AS [Año_Publicacion],
    @Editorial      AS [Editorial]
)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Libro WHERE Año_Publicacion = @Año AND Editorial = @Editorial
END








---------- REPORTING DIEGO ----------------
