package com.cenpro.sircie.model.mantenimiento;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Ingresos {
	
	private Integer codigoIngreso;
	private String nombreAlumno;
	private String concepto;

}
