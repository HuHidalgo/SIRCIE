package com.cenpro.sircie.controller.reporte.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cenpro.sircie.model.criterio.CriterioBusquedaAtencionDiaria;
import com.cenpro.sircie.model.reporte.ReporteAtencionDiaria;
import com.cenpro.sircie.service.IReporteAtencionDiariaService;

@RequestMapping("/reporte/atencion/diaria")
public @RestController class ReporteAtencionDiarioRestController
{
    private @Autowired IReporteAtencionDiariaService reporteAtencionDiariaService;

    @GetMapping(params = "accion=buscar")
    public List<ReporteAtencionDiaria> buscarAtencionesDiarias(
            CriterioBusquedaAtencionDiaria criterioBusquedaAtencionDiaria)
    {
        return reporteAtencionDiariaService.buscarAtencionesDiarias(criterioBusquedaAtencionDiaria);
    }
}