USE PROYECTO2
GO
-----------------MAESTROS DETALLE DIEGO-----------------
SELECT
    R.RES_Id AS [ID DE LA RESERVA],
    FI.FIN_Nombre AS [NOMBRE DEL USUARIO],
    TR.TPR_Descripcion AS [TIPO DE RESERVA],
    R.RES_FechaInicio AS [FECHA DE INICIO],
    R.RES_FechaFin AS [FECHA DE FIN],

    FROM RESERVA R
    INNER JOIN USUARIOS U ON R.USR_Id = U.USR_Id
    INNER JOIN FICHAS_INSCRIPCION FI on U.FIN_Id = FI.FIN_Id
    INNER JOIN TIPO_RESERVA TR on R.TPR_Id = TR.TPR_Id


--------------MAESTRO DETALLE JONATHAN-----------------
--MAESTRO
Select P.PRS_Id			AS Codigo,
		FI.FIN_Nombre	AS	[Nombre Completo],
		P.PRS_FechaPrestamo AS [Fecha Prestamo],
		P.PRS_FechaDevolucion AS [Fecha Devolución],
		TP.TPR_Nombre	AS [Tipo Prestamo]
	from PRESTAMOS P
	INNER JOIN USUARIOS U				ON P.USR_Id = U.USR_Id
	INNER JOIN FICHAS_INSCRIPCION FI	ON U.FIN_Id = FI.FIN_Id
	INNER JOIN TIPOS_PRESTAMO TP		ON P.TPR_Id = TP.TPR_Id

--DETALLE
Select DP.PRS_Id	AS Codigo, L.LBR_Titulo	AS Libro, DP.Cantidad AS Cantidad , DP.CantidadHrs AS [N° Hrs]
	from DETALLE_PRESTAMO DP
	INNER JOIN PRESTAMOS P ON DP.PRS_Id = P.PRS_Id
	INNER JOIN LIBROS L ON DP.LBR_Id = DP.LBR_Id
	group by DP.PRS_Id, L.LBR_Titulo, DP.Cantidad ,DP.CantidadHrs
