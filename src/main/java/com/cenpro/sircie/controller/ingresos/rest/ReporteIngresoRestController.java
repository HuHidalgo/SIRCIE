package com.cenpro.sircie.controller.ingresos.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cenpro.sircie.model.criterio.CriterioBusquedaIngresos;
import com.cenpro.sircie.model.ingresos.ReporteIngresos;
import com.cenpro.sircie.service.IReporteIngresosService;

@RequestMapping("/ingresos/reporte")
public @RestController class ReporteIngresoRestController {
	
	private @Autowired IReporteIngresosService reporteIngresosService;
	
	@GetMapping(params = "accion=buscar")
    public List<ReporteIngresos> buscarIngresosDiarios(CriterioBusquedaIngresos criterioBusquedaIngresos)
    {
		System.out.println("REPORTE: "+criterioBusquedaIngresos);
        return reporteIngresosService.buscarIngresosDiarios(criterioBusquedaIngresos);
    }
}
