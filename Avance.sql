
/*ateración de la tabla seg_perfil*/
ALTER TABLE `sircie`.`seg_perfil` 
ADD COLUMN `vNombre` VARCHAR(40) NULL COMMENT '' AFTER `vDescripcion`,
ADD COLUMN `usuarioModificacion` VARCHAR(20) NULL COMMENT '' AFTER `vNombre`,
ADD COLUMN `fechaModificacion` DATETIME NULL COMMENT '' AFTER `usuarioModificacion`;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_PERFILES`(
	 IN pVERBO 			VARCHAR(10)
    ,IN pID_PERFIL 		TINYINT
    ,IN pDESCRIPCION	VARCHAR(50)
    ,IN pNOMBRE			VARCHAR(40)
    ,IN pUSUARIO		VARCHAR(20)
)
BEGIN

	IF pVERBO = 'GETS' THEN
		SELECT 	nIdPerfil		AS idPerfil,
				vDescripcion 	AS descripcion,
				vNombre			AS nombrePerfil
        FROM seg_perfil;
    END IF;
    
    IF pVERBO = 'GET' THEN
		SELECT	nIdPerfil		AS idPerfil,
				vDescripcion 	AS descripcion,
				vNombre			AS nombrePerfil
		FROM	seg_perfil  			
		WHERE 		nIdPerfil 		= pID_PERFIL;
				
    END IF;
    
    IF pVERBO = 'EXIST' THEN
		SELECT	nIdPerfil		AS idPerfil				
		FROM	seg_perfil  			
        WHERE 		nIdPerfil 		= pID_PERFIL;				
    END IF;
    
    IF pVERBO = 'INSERT' THEN
		INSERT INTO seg_perfil (nIdPerfil, vDescripcion,vnombre) 
				VALUES (pID_PERFIL, pDESCRIPCION, pNOMBRE, pUSUARIO,
						NOW());
	END IF;
    
    IF pVERBO = 'UPDATE' THEN
		UPDATE  seg_perfil
        SET		 vDescripcion			= 	pNOMBRES
                ,vNombre		= 	pAPELLIDO_PATERNO
                ,UsuarioModificacion	=  	pUSUARIO
                ,fechaModificacion		=	NOW()
		WHERE 		nIdPerfil 		= pID_PERFIL;	
    END IF;
    
    IF pVERBO = 'REMOVE' THEN
		DELETE FROM seg_perfil
		WHERE 		nIdPerfil 		= pID_PERFIL;
    END IF;
    
END

//


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_USUARIOS`(
  IN pVERBO 	 		VARCHAR(10)
 ,IN pID_USUARIO 		VARCHAR(20)
 ,IN pCONTRASENIA		VARCHAR(70)
 ,IN pACTIVO			BIT
 ,IN pTIPO_DOCUMENTO 	VARCHAR(5)
 ,IN pNUMERO_DOCUMENTO  VARCHAR(12)
 ,IN pID_PERFIL 		TINYINT
 ,IN pUSUARIO 			VARCHAR(20)
)
BEGIN
	IF pVERBO = 'LOGIN' THEN
		SELECT	vIdUsuario		AS idUsuario,  
				vContrasenia	AS contrasenia,
				bActivo			AS activo,
                nIdPerfil		AS idPerfil
		FROM	seg_usuario
		WHERE 	vIdUsuario = pID_USUARIO;
    END IF;
    
    IF pVERBO = 'GETS' THEN
		SELECT	usuario.vIdUsuario				AS idUsuario, 
				usuario.bActivo					AS activo,
                usuario.vTipoDocumento			AS idTipoDocumento,
                tipoDocumento.vDescripcionItem	AS descripcionTipoDocumento,
                usuario.vNumeroDocumento		AS numeroDocumento,
                persona.vNombres 				AS nombres,
                persona.vApellidoPaterno		AS apellidoPaterno,
                persona.vApellidoMaterno		AS apellidoMaterno,
                usuario.nIdPerfil				AS idPerfil,
                perfil.vNombre				AS nombrePerfil
		FROM	seg_usuario usuario 
				INNER JOIN sie_persona persona 					ON (usuario.vTipoDocumento = persona.vTipoDocumento
																	AND usuario.vNumeroDocumento = persona.vNumeroDocumento)
				INNER JOIN sie_multitabladet tipoDocumento		ON	(usuario.vTipoDocumento = tipoDocumento.vIdItem 
																	AND tipoDocumento.nIdTabla = 1)
				INNER JOIN seg_perfil perfil 					ON (usuario.nIdPerfil = perfil.nIdPerfil);
    END IF;
    
    IF pVERBO = 'GET' THEN
		SELECT	usuario.vIdUsuario				AS idUsuario,  
				usuario.bActivo					AS activo,
                usuario.vTipoDocumento			AS idTipoDocumento,
                tipoDocumento.vDescripcionItem	AS descripcionTipoDocumento,
                usuario.vNumeroDocumento		AS numeroDocumento,
                persona.vNombres 				AS nombres,
                persona.vApellidoPaterno		AS apellidoPaterno,
                persona.vApellidoMaterno		AS apellidoMaterno,
                usuario.nIdPerfil				AS idPerfil,
                perfil.vNombre				AS nombrePerfil
		FROM	seg_usuario usuario 
				INNER JOIN sie_persona persona 					ON (usuario.vTipoDocumento = persona.vTipoDocumento
																	AND usuario.vNumeroDocumento = persona.vNumeroDocumento)
				INNER JOIN sie_multitabladet tipoDocumento		ON	(usuario.vTipoDocumento = tipoDocumento.vIdItem 
																	AND tipoDocumento.nIdTabla = 1)
				INNER JOIN seg_perfil perfil 					ON (usuario.nIdPerfil = perfil.nIdPerfil)
		WHERE 	usuario.vIdUsuario = pID_USUARIO;
    END IF;
    
    IF pVERBO = 'EXIST' THEN
		SELECT	vIdUsuario		AS idUsuario
		FROM	seg_usuario
        WHERE 	vIdUsuario = pID_USUARIO;
    END IF;
    
    IF pVERBO = 'INSERT' THEN
		INSERT INTO seg_usuario (vIdUsuario, vTipoDocumento, vNumeroDocumento, vContrasenia, bActivo, nIdPerfil,
								vUsuarioAdicion, dFechaAdicion) 
				VALUES (pID_USUARIO, pTIPO_DOCUMENTO, pNUMERO_DOCUMENTO, pCONTRASENIA, pACTIVO, pID_PERFIL, pUSUARIO,
						NOW());
    END IF;
    
    IF pVERBO = 'UPDATE' THEN
		UPDATE  seg_usuario
        SET		 vTipoDocumento 		= 	pTIPO_DOCUMENTO
				,vNumeroDocumento 		=	pNUMERO_DOCUMENTO
                ,bActivo				= 	pACTIVO
                ,nIdPerfil				=	pID_PERFIL
                ,vUsuarioModificacion	=  	pUSUARIO
                ,dFechaModificacion		=	NOW()
		WHERE 	vIdUsuario = pID_USUARIO;
    END IF;
    
    IF pVERBO = 'UPDATE_CONT' THEN
		UPDATE  seg_usuario
        SET		 vContrasenia			=  	pCONTRASENIA	
                ,vUsuarioModificacion	=  	pUSUARIO
                ,dFechaModificacion		=	NOW()
		WHERE 	vIdUsuario = pID_USUARIO;
    END IF;
    
    IF pVERBO = 'REMOVE' THEN
		DELETE 
        FROM  	seg_usuario
		WHERE 	vIdUsuario = pID_USUARIO;
    END IF;
END

//