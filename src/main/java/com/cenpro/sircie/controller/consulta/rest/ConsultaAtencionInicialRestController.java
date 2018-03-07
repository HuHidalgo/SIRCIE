package com.cenpro.sircie.controller.consulta.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cenpro.sircie.model.consulta.ConsultaAtencionInicial;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAtencionInicial;
import com.cenpro.sircie.service.IConsultaAtencionInicialService;

@RequestMapping("/consulta/atencion")
public @RestController class ConsultaAtencionInicialRestController
{
    private @Autowired IConsultaAtencionInicialService consultaAtencionInicialService;

    @GetMapping(value = "/laboratorio", params = "accion=buscar")
    public List<ConsultaAtencionInicial> buscarConsultaAtencionInicialLaboratorioPorCriterioBusqueda(
            CriterioBusquedaAtencionInicial criterioBusqueda)
    {
        return consultaAtencionInicialService
                .buscarConsultaAtencionInicialLaboratorioPorCriterioBusqueda(criterioBusqueda);
    }

    @GetMapping(value = "/psicologia", params = "accion=buscar")
    public List<ConsultaAtencionInicial> buscarConsultaAtencionInicialPsicologiaPorCriterioBusqueda(
            CriterioBusquedaAtencionInicial criterioBusqueda)
    {
        return consultaAtencionInicialService
                .buscarConsultaAtencionInicialPsicologiaPorCriterioBusqueda(criterioBusqueda);
    }

    @GetMapping(value = "/radiologia", params = "accion=buscar")
    public List<ConsultaAtencionInicial> buscarConsultaAtencionInicialRadiologiaPorCriterioBusqueda(
            CriterioBusquedaAtencionInicial criterioBusqueda)
    {
        return consultaAtencionInicialService
                .buscarConsultaAtencionInicialRadiologiaPorCriterioBusqueda(criterioBusqueda);
    }
}