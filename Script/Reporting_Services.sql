USE Proyecto2

---------- REPORTING KEVIN ---------------

CREATE PROCEDURE SP_A�oLibroEdtioria(
    @A�o            AS [A�o_Publicacion],
    @Editorial      AS [Editorial]
)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Libro WHERE A�o_Publicacion = @A�o AND Editorial = @Editorial
END








---------- REPORTING DIEGO ----------------
