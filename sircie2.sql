

/*Creación de tablas de mantenimiento*/

CREATE TABLE sie_meta (
    nroMeta INTEGER,
    nomMeta VARCHAR(45),
    desMeta VARCHAR(255),
    PRIMARY KEY (nroMeta)
);
    

CREATE TABLE sie_tarea (
    CodigoTarea INTEGER,
    Unidad_idUnidad VARCHAR(10),
    Meta_nroMeta INTEGER,
    nomTarea VARCHAR(255),
    PRIMARY KEY (CodigoTarea),
    FOREIGN KEY (Meta_nroMeta)
        REFERENCES sie_meta (nroMeta)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (Unidad_idUnidad)
        REFERENCES sie_unidad (codigoUnidad)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE sie_partida (
  clasificador VARCHAR(20),
  descripcion VARCHAR(45),
  descDetallada VARCHAR(255),
  PRIMARY KEY(clasificador)
);

CREATE TABLE sie_tarea_partida (
  Partida_clasificador VARCHAR(20),
  Tarea_CodigoTarea INTEGER,
  PRIMARY KEY(Partida_clasificador, Tarea_CodigoTarea),
  FOREIGN KEY(Tarea_CodigoTarea)
    REFERENCES sie_tarea(CodigoTarea)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Partida_clasificador)
    REFERENCES sie_partida(clasificador)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

/*Creación de los procedimientos almacenados*/

DELIMITER //
CREATE PROCEDURE MANT_META(
	IN pVerbo VARCHAR(10),
    IN pNroMeta INTEGER,
    IN pNomMeta VARCHAR(45),
    IN pDesMeta VARCHAR(255) 
)
BEGIN
	IF pVerbo = 'GETS' THEN
		SELECT nroMeta,
			   nomMeta,
               desMeta
        FROM sie_meta;       
    END IF;
    
    IF pVerbo = 'GET' THEN
		SELECT nroMeta,
			   nomMeta,
               desMeta
        FROM sie_meta where pNroMeta = nroMeta;    
    END IF;
    
    IF pVerbo = 'EXIST' THEN
		SELECT nroMeta,
			   nomMeta,
               desMeta
        FROM sie_meta where pNroMeta = nroMeta; 
    END IF;
    
    IF pVerbo = 'CARGAR' THEN
		SELECT	@CONTADOR := COUNT(1) FROM	sie_meta;
		IF @CONTADOR = 0 THEN
			INSERT INTO sie_meta(nroMeta, nomMeta, desMeta) values (pNroMeta, pNomMeta,pDesMeta);			
        ELSE
			UPDATE sie_meta SET nomMeta = pNomMeta, desMeta = pDesMeta WHERE nroMeta = pNroMeta;
        END IF;
    END IF;
    
    IF pVerbo = 'INSERT' THEN
		INSERT INTO sie_meta(nroMeta, nomMeta, desMeta) values (pNroMeta, pNomMeta,pDesMeta);
    END IF;
    
	IF pVerbo = 'UPDATE' THEN
		UPDATE sie_meta SET nomMeta = pNomMeta, desMeta = pDesMeta WHERE nroMeta = pNroMeta;
    END IF;
    
    IF pVerbo = 'REMOVE' THEN
		DELETE FROM sie_meta WHERE nroMeta = pNroMeta;
    END IF;
    
END //


DELIMITER //
CREATE PROCEDURE MANT_TAREA(
	IN pVerbo VARCHAR(10),
    IN pCodigoTarea INTEGER,
    IN pUnidad_idUnidad VARCHAR(10),
    IN pMeta_nroMeta INTEGER, 
    IN pNomTarea VARCHAR(255)
)
BEGIN
	IF pVerbo = 'GETS' THEN
		SELECT tarea.CodigoTarea as codigoTarea,
			   tarea.nomTarea as nombreTarea,
               unidad.nombreUnidad as nombreUnidad
        FROM sie_tarea tarea INNER JOIN sie_unidad unidad ON tarea.Unidad_idUnidad = unidad.idUnidad;       
    END IF;
    
    IF pVerbo = 'GET' THEN
		SELECT tarea.CodigoTarea as codigoTarea,
			   tarea.nomTarea as nombreTarea,
               unidad.nombreUnidad as nombreUnidad
        FROM sie_tarea tarea INNER JOIN sie_unidad unidad ON tarea.Unidad_idUnidad = unidad.idUnidad where pCodigoTarea = tarea.CodigoTarea;    
    END IF;
    
    IF pVerbo = 'EXIST' THEN
		SELECT tarea.CodigoTarea as codigoTarea,
			   tarea.nomTarea as nombreTarea,
               unidad.nombreUnidad as nombreUnidad
        FROM sie_tarea tarea INNER JOIN sie_unidad unidad ON tarea.Unidad_idUnidad = unidad.idUnidad where pCodigoTarea = tarea.CodigoTarea; 
    END IF;

    IF pVerbo = 'CARGAR' THEN
		SELECT	@CONTADOR := COUNT(1) FROM	sie_tarea;
		IF @CONTADOR = 0 THEN
			INSERT INTO sie_tarea(CodigoTarea, Unidad_idUnidad, Meta_nroMeta, nomTarea) values (pCodigoTarea, pUnidad_idUnidad, pMeta_nroMeta, pNomTarea);			
        ELSE
			UPDATE sie_tarea SET nomTarea = pNomTarea, Unidad_idUnidad = pUnidad_idUnidad, Meta_nroMeta = pMeta_nroMeta WHERE pCodigoTarea = CodigoTarea;
        END IF;
    END IF;
    
    IF pVerbo = 'INSERT' THEN
		INSERT INTO sie_tarea(CodigoTarea, Unidad_idUnidad, Meta_nroMeta, nomTarea) values (pCodigoTarea, pUnidad_idUnidad, pMeta_nroMeta, pNomTarea);
    END IF;
    
	IF pVerbo = 'UPDATE' THEN
		UPDATE sie_tarea SET nomTarea = pNomTarea, Unidad_idUnidad = pUnidad_idUnidad, Meta_nroMeta = pMeta_nroMeta WHERE pCodigoTarea = CodigoTarea;
    END IF;
    
    IF pVerbo = 'REMOVE' THEN
		DELETE FROM sie_tarea WHERE pCodigoTarea = CodigoTarea;
    END IF;
    
END //

DELIMITER //
CREATE PROCEDURE MANT_PARTIDA(
	IN pVerbo VARCHAR(10),
    IN pClasificador VARCHAR(20),
    IN pDescripcion VARCHAR(45),
    IN pDescDetallada VARCHAR(255),
    IN pCodigoTarea INTEGER
)
BEGIN
	IF pVerbo = 'GETS' THEN
		SELECT partida.clasificador as clasificador,
			   partida.descripcion as descripcion,
			   tarea.nomTarea as nombreTarea
        FROM sie_partida partida
			INNER JOIN sie_tarea_partida thp on thp.Partida_clasificador = partida.clasificador
			INNER JOIN sie_tarea tarea on tarea.CodigoTarea = thp.Tarea_CodigoTarea;       
    END IF;
    
    IF pVerbo = 'GET' THEN
		SELECT partida.clasificador as clasificador,
			   partida.descripcion as descripcion,
			   tarea.nomTarea as nombreTarea
        FROM sie_partida partida
			INNER JOIN sie_tarea_partida thp on thp.Partida_clasificador = partida.clasificador
			INNER JOIN sie_tarea tarea on tarea.CodigoTarea = thp.Tarea_CodigoTarea;      
    END IF;
    
    IF pVerbo = 'EXIST' THEN
		SELECT partida.clasificador as clasificador,
			   partida.descripcion as descripcion,
			   tarea.nomTarea as nombreTarea
        FROM sie_partida partida
			INNER JOIN sie_tarea_partida thp on thp.Partida_clasificador = partida.clasificador
			INNER JOIN sie_tarea on tarea.CodigoTarea = thp.Tarea_CodigoTarea;      
    END IF;
    
    IF pVerbo = 'CARGAR' THEN
		SELECT	@CONTADOR := COUNT(1) FROM	Partida;
		IF @CONTADOR = 0 THEN
			INSERT INTO sie_partida(clasificador, descripcion, descDetallada) values (pClasificador, pDescripcion, pDescDetallada);	
            INSERT INTO sie_tarea_partida(Partida_clasificador, Tarea_CodigoTarea) values (pClasificador, pCodigoTarea);
        ELSE
			UPDATE sie_partida SET descripcion = pDescripcion, descDetallada = pDescDetallada WHERE pClasificador = clasificador;
        END IF;
    END IF;
    
    IF pVerbo = 'INSERT' THEN
		INSERT INTO sie_partida(clasificador, descripcion, descDetallada) values (pClasificador, pDescripcion, pDescDetallada);	
        INSERT INTO sie_tarea_partida(Partida_clasificador, Tarea_CodigoTarea) values (pClasificador, pCodigoTarea);
    END IF;
    
	IF pVerbo = 'UPDATE' THEN
		UPDATE sie_partida SET descripcion = pDescripcion, descDetallada = pDescDetallada WHERE pClasificador = clasificador;
    END IF;
    
    IF pVerbo = 'REMOVE' THEN
		DELETE FROM sie_partida WHERE pClasificador = clasificador;
    END IF;
    
END //