package com.cenpro.sircie.model.mantenimiento;

import java.util.Date;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Ingresos {
	
	private Integer idIngreso;
	
	private String codigoUnidad;
	private String nombreUnidad;
	private String nroConceptoUnidad;
	
	private String nombresCliente;
	private String apellidosCliente;
	private String tipoDocCliente;
	private String nroDocCliente;
	
	private String idConcepto;
	private String nroConceptoEsp;
	private String nomConceptoEsp;
	private Double importe;
	
	private Double importeDescontado;
	private String descDescuento;
	
	private int codigoCurso;
	private String nombreCurso;
	private int nroCuota;
	
	private String tipoMoneda;
	private Double tipoCambio;
	private String nroVoucher;
	private String nroFactura;
	
	//@NotNull(message = "{NotNull.Alumno.fechaNacimiento}")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "EST")
    private Date fechaVF;
    
    private String nroReciboIngreso;
    
    //@NotNull(message = "{NotNull.Alumno.fechaNacimiento}")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "EST")
    private Date fechaRI;

}
