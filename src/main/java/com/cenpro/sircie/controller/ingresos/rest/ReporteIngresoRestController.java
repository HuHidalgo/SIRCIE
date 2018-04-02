package com.cenpro.sircie.controller.ingresos.rest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cenpro.sircie.mapper.IReporteIngresosMapper;
import com.cenpro.sircie.model.criterio.CriterioBusquedaIngresos;
import com.cenpro.sircie.model.ingresos.ReporteIngresos;
import com.cenpro.sircie.service.IReporteIngresosService;

@RequestMapping("/ingresos/reporte")
public @RestController class ReporteIngresoRestController {

	private @Autowired IReporteIngresosService reporteIngresosService;

	private List<ReporteIngresos> listIngresos = new ArrayList<ReporteIngresos>();

	@GetMapping(params = "accion=buscar")
	public List<ReporteIngresos> buscarIngresosDiariosDetalle(CriterioBusquedaIngresos criterioBusquedaIngresos) {
		System.out.println("REPORTE: " + criterioBusquedaIngresos);
		return reporteIngresosService.buscarIngresosDiarios(criterioBusquedaIngresos);
	}

	@GetMapping(params = "accion=buscar2")
    public List<ReporteIngresos> buscarIngresosDiariosGeneral(CriterioBusquedaIngresos criterioBusquedaIngresos)
    {
		listIngresos = reporteIngresosService.buscarIngresosDiarios(criterioBusquedaIngresos);
		for(ReporteIngresos ri : listIngresos){
			switch (ri.getMes()) {
				case "1":	ri.setImporteEnero(ri.getIngresoTotal());
					break;
				case "2":	ri.setImporteFebrero(ri.getIngresoTotal());
					break;
				case "3":	ri.setImporteMarzo(ri.getIngresoTotal());
					break;
				case "4":	ri.setImporteAbril(ri.getIngresoTotal());
					break;
				case "5":	ri.setImporteMayo(ri.getIngresoTotal());
					break;
				case "6":	ri.setImporteJunio(ri.getIngresoTotal());
					break;
				case "7":	ri.setImporteJulio(ri.getIngresoTotal());
					break;
				case "8":	ri.setImporteAgosto(ri.getIngresoTotal());
					break;
				case "9":	ri.setImporteSetiembre(ri.getIngresoTotal());
					break;
				case "10":	ri.setImporteOctubre(ri.getIngresoTotal());
					break;
				case "11":	ri.setImporteNoviembre(ri.getIngresoTotal());
					break;
				case "12":	ri.setImporteDiciembre(ri.getIngresoTotal());
					break;
			}		
		}
		System.out.println(listIngresos.get(0));
		System.out.println(listIngresos.get(1));
        return listIngresos;
    }
}
