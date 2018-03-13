package com.cenpro.sircie.model.mantenimiento;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Tarea 
{
	private Integer codigoTarea;
    private String Unidad_idUnidad;
    private Integer Meta_nroMeta;
    private String nombreTarea;
    private String nombreUnidad;
    //private String nombreMeta;
}
