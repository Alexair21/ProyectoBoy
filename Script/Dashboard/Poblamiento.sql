USE BDD_Proyecto
GO

-- DIM: LIBRO
MERGE BDD_Proyecto.dbo.dimLibros as dim
    USING
        (   SELECT
                L.LBR_Titulo                AS Titulo,
                L.LBR_Cantidad              AS Cantidad,
                E.EDT_Nombre                AS Editorial,
                YEAR(L.LBR_AñoPublicacion)  AS AñoPublicacion,
                AL.AUT_Id                   AS AutorLibro,
                L.LBR_Id                    AS IdLibros
            FROM Proyecto2.dbo.LIBROS L
            INNER JOIN Proyecto2.dbo.EDITORIALES E ON L.EDt_Id = E.EDT_Id
            INNER JOIN Proyecto2.dbo.AUTOR_LIBRO AL on L.LBR_Id = AL.LBR_Id
            ) AS oltp -- origen de los datos
    ON (dim.IdLibros = oltp.IdLibros)
WHEN NOT MATCHED THEN
    INSERT (Titulo, Cantidad, Editorial, AñoPublicacion, AutorLibro, IdLibros)
    VALUES (Titulo, Cantidad, Editorial, AñoPublicacion, AutorLibro, IdLibros);


-- DIM: PRESTAMOS
MERGE BDD_Proyecto.dbo.dimPrestamos as dim
    USING
        (SELECT
             --convertir a integer diaprestamo
            DiaPrestamo = DATEPART(dw, P.PRS_FechaPrestamo),
            TP.TPR_Nombre AS TipoPrestamo,
            P.PRS_Id AS IdPrestamos
            FROM Proyecto2.dbo.PRESTAMOS P
            INNER JOIN Proyecto2.dbo.TIPOS_PRESTAMO TP ON P.TPR_Id = TP.TPR_Id
            ) AS oltp -- origen de los datos
    ON (dim.IdPrestamos = oltp.IdPrestamos)
WHEN NOT MATCHED THEN
    INSERT (DiaPrestamo, TipoPrestamo, IdPrestamos)
    VALUES (DiaPrestamo, TipoPrestamo, IdPrestamos);


-- DIM: MULTAS
MERGE BDD_Proyecto.dbo.dimMultas as dim
    USING
        (SELECT
            M.MUL_Id            AS IdMulta,
            M.MUL_Monto         AS Monto,
            DiaMulta = DATEPART(DAY, M.MUL_Fecha)
            FROM Proyecto2.dbo.MULTAS M
            ) AS oltp -- origen de los datos
    ON (dim.IdMulta = oltp.IdMulta)
WHEN NOT MATCHED THEN
    INSERT (Monto, DiaMulta, IdMulta)
    VALUES (Monto, DiaMulta, IdMulta);


-- DIM: USUARIOS
MERGE BDD_Proyecto.dbo.dimUsuarios as dim
    USING
        (SELECT
            U.USR_Id                AS IdUsuario,
            FI.FIN_Nombre           AS Nombre,
            FI.FIN_Celular          AS Celular,
            FI.FIN_Email            AS Email,
            year(FI.FIN_Fecha)      AS AñoIngreso
            FROM Proyecto2.dbo.USUARIOS U
            INNER JOIN Proyecto2.dbo.FICHAS_INSCRIPCION FI ON U.FIN_Id = FI.FIN_Id
            ) AS oltp -- origen de los datos
    ON (dim.IdUsuario = oltp.IdUsuario)
WHEN NOT MATCHED THEN
    INSERT (Nombre, Celular, Email, AñoIngreso, IdUsuario)
    VALUES (Nombre, Celular, Email, AñoIngreso, IdUsuario);


--HECHO: OPERACION_PAGO
MERGE BDD_Proyecto.dbo.hechoOperacionPago as dim
    USING
        (SELECT
            keyPrestamos  = DP.keyPrestamos,
            keyMultas    = DM.keyMultas,
            keyLibros    = DL.keyLibros,
            keyUsuario  = DU.keyUsuario,
            MontoTotal = SUM(DM.Monto),
            CantLibrosPrestados = COUNT(DP.IdPrestamos),
            -- convertir date a integer
            MultasxDias = COUNT(DM.DiaMulta),
            UsuariosPrestamos = SUM(DU.IdUsuario),
            TotalAutorxLibros = COUNT(AL.AUT_Id)
            FROM Proyecto2.dbo.MULTAS M
            INNER JOIN Proyecto2.dbo.PRESTAMOS P ON M.PRS_Id = P.PRS_Id
            INNER JOIN BDD_Proyecto.dbo.dimPrestamos DP   ON  M.PRS_Id = DP.IdPrestamos
            INNER JOIN BDD_Proyecto.dbo.dimMultas DM      ON  M.MUL_Id = DM.IdMulta
            INNER JOIN BDD_Proyecto.dbo.dimLibros DL      ON  P.LBR_Id = DL.IdLibros
            INNER JOIN BDD_Proyecto.dbo.dimUsuarios DU    ON  M.USR_Id = DU.IdUsuario
            INNER JOIN Proyecto2.dbo.AUTOR_LIBRO AL       on  DL.IdLibros = AL.LBR_Id
            GROUP BY DP.keyPrestamos, DM.keyMultas, DL.keyLibros, DU.keyUsuario
            ) AS oltp -- origen de los datos
    ON (dim.keyPrestamos = oltp.keyPrestamos
    AND dim.keyMultas = oltp.keyMultas
    AND dim.keyLibros = oltp.keyLibros
    AND dim.keyUsuario = oltp.keyUsuario)
WHEN NOT MATCHED THEN
    INSERT (keyPrestamos, keyMultas, keyLibros, keyUsuario, MontoTotal, CantLibrosPrestados, MultasxDias, UsuariosPrestamos, TotalAutorxLibros)
    VALUES (keyPrestamos, keyMultas, keyLibros, keyUsuario, MontoTotal, CantLibrosPrestados, MultasxDias, UsuariosPrestamos, TotalAutorxLibros);

SELECT * FROM BDD_Proyecto.dbo.hechoOperacionPago