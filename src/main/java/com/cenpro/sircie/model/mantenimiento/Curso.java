package com.cenpro.sircie.model.mantenimiento;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Curso 
{
	private Integer codigoCurso;
	private String nombreCurso;
	private Integer nroSemestres;
	
	private Integer idConcepto;
	private String nomConceptoEsp;
	private String nroConceptoEsp;
	private Double importe;
}
