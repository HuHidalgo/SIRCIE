package com.cenpro.sircie.model.mantenimiento;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Concepto {
	private Integer idConcepto;
	private Integer nroConceptoEsp;
	private String nomConceptoEsp;
	private String descConceptoEsp;
	private Double importe;
	
	private String codigoUnidad;

}
