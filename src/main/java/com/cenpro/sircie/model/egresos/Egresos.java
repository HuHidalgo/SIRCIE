package com.cenpro.sircie.model.egresos;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Egresos {
	
	private Integer idEgreso;
	private Integer idProgramacionGasto;
	private Integer nroProgramacionGasto;
	
	private String codigoUnidad;
	private String nombreUnidad;
	private String nroConceptoUnidad;
	
	private String nombreProveedor;
	private String tipoDocProveedor;
	private String nroDocProveedor;
		
	private String documento;
	private String docReferencia;
	private String tipoAdquisicion;
	private String estado;
	
	private String codigoCurso;
	private String nombreCurso;
	
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "EST")
    private Date fechaEnvio;
    
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "EST")
    private Date fechaRI;

}
