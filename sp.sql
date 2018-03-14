CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_PARTIDAS`(
	IN pVerbo 			VARCHAR(10),
    IN pClasificador 	VARCHAR(20),
    IN pDescripcion 	VARCHAR(100),
    IN pDescDetallada 	VARCHAR(255),
    IN pCodigoTarea 	INTEGER,
    IN pUSUARIO			VARCHAR(20)
)
BEGIN
	DECLARE NOM_TAREA VARCHAR(255);

	IF pVerbo = 'GETS' THEN
		SELECT *
        FROM sie_tarea_partida;       
    END IF;
    
    IF pVerbo = 'GET' THEN
		SELECT *
        FROM sie_tarea_partida
        WHERE codigoTarea = pCodigoTarea;     
    END IF;
    
    IF pVerbo = 'EXIST' THEN
		SELECT partida.clasificador as clasificador,
			   partida.descripcion as descripcion,
			   tarea.nomTarea as nombreTarea
        FROM sie_partida partida
			INNER JOIN sie_tarea_partida thp on thp.Partida_clasificador = partida.clasificador
			INNER JOIN sie_tarea on tarea.CodigoTarea = thp.Tarea_CodigoTarea;      
    END IF;
        
    IF pVerbo = 'INSERT' THEN
		SELECT nomTarea
        INTO NOM_TAREA
        FROM sie_tarea
        WHERE codigoTarea = pCodigoTarea;
        
		INSERT INTO sie_partida(clasificador, descripcion, descDetallada, usuarioAdicion, fechaAdicion) 
						values (pClasificador, pDescripcion, pDescDetallada, pUSUARIO, NOW());
                        
        INSERT INTO sie_tarea_partida(clasificador, codigoTarea, nomTarea, descripcion, descDetallada) 
								values (pClasificador, pCodigoTarea, NOM_TAREA, pDescripcion, pDescDetallada);
    END IF;
    
	IF pVerbo = 'UPDATE' THEN
		UPDATE sie_partida 
        SET descripcion = pDescripcion, 
			descDetallada = pDescDetallada 
		WHERE pClasificador = clasificador;
        
        UPDATE sie_tarea_partida 
        SET descripcion		 	= pDescripcion, 
			descDetallada 	 	= pDescDetallada
		WHERE pClasificador = clasificador;
    END IF;
    
    IF pVerbo = 'REMOVE' THEN
		DELETE 
        FROM sie_partida 
        WHERE pClasificador = clasificador;
        
        DELETE 
        FROM sie_tarea_partida 
        WHERE clasificador = pClasificador;
    END IF;
END
--***********************************************************************************************
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_TAREAS`(
	IN pVerbo 			VARCHAR(10),
    IN pCodigoTarea 	INTEGER,
    IN pUnidad_idUnidad VARCHAR(10),
    IN pMeta_nroMeta 	INTEGER, 
    IN pNomTarea 		VARCHAR(255),
    IN pUSUARIO			VARCHAR(20)
)
BEGIN

	IF pVerbo = 'GETS' THEN
		SELECT tarea.codigoTarea as codigoTarea,
			   tarea.nomTarea as nomTarea,
               unidad.codigoUnidad as codigoUnidad,
               unidad.nombreUnidad as nombreUnidad, 
               meta.nroMeta as nroMeta,
               meta.nomMeta as nomMeta
        FROM sie_tarea tarea 
			INNER JOIN sie_unidad unidad ON tarea.codigoUnidad = unidad.codigoUnidad
            INNER JOIN sie_meta meta ON tarea.nroMeta = meta.nroMeta;       
    END IF;
    
    IF pVerbo = 'GET' THEN
		SELECT tarea.codigoTarea as codigoTarea,
			   tarea.nomTarea as nomTarea,
               unidad.codigoUnidad as codigoUnidad,
               unidad.nombreUnidad as nombreUnidad, 
               meta.nroMeta as nroMeta,
               meta.nomMeta as nomMeta
        FROM sie_tarea tarea 
			INNER JOIN sie_unidad unidad ON tarea.codigoUnidad = unidad.codigoUnidad
            INNER JOIN sie_meta meta ON tarea.nroMeta = meta.nroMeta 
        WHERE unidad.codigoUnidad = pUnidad_idUnidad AND 
				meta.nroMeta = pMeta_nroMeta;    
    END IF;
    
    IF pVerbo = 'EXIST' THEN
		SELECT tarea.CodigoTarea as codigoTarea,
			   tarea.nomTarea as nombreTarea,
               unidad.nombreUnidad as nombreUnidad
        FROM sie_tarea tarea INNER JOIN sie_unidad unidad ON tarea.Unidad_idUnidad = unidad.idUnidad
        where pCodigoTarea = tarea.CodigoTarea; 
    END IF;
    
    IF pVerbo = 'INSERT' THEN
		INSERT INTO sie_tarea(codigoTarea, codigoUnidad, nroMeta, nomTarea, usuarioAdicion, fechaAdicion) 
				values (pCodigoTarea, pUnidad_idUnidad, pMeta_nroMeta, pNomTarea, pUSUARIO, NOW());
    END IF;
    
	IF pVerbo = 'UPDATE' THEN
		UPDATE sie_tarea 
        SET nomTarea 			= pNomTarea, 
			codigoUnidad 		= pUnidad_idUnidad, 
			nroMeta 			= pMeta_nroMeta,
            usuarioModificacion	= pUSUARIO,
            fechaModificacion	= NOW()
		WHERE codigoTarea = pCodigoTarea;
        
        UPDATE sie_tarea_partida
        SET 	nomTarea = pNomTarea
		WHERE codigoTarea = pCodigoTarea;
    END IF;
    
    IF pVerbo = 'REMOVE' THEN
		DELETE 
        FROM sie_tarea 
        WHERE codigoTarea = pCodigoTarea;
    END IF;

END
