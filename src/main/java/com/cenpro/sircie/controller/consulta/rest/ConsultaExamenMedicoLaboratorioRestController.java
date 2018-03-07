package com.cenpro.sircie.controller.consulta.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cenpro.sircie.model.consulta.administrativa.ConsultaLaboratorioAdministrativo;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAdministrativaExamenMedicoLaboratorio;
import com.cenpro.sircie.model.movimiento.ExamenMedicoLaboratorio;
import com.cenpro.sircie.service.IConsultaExamenMedicoLaboratorioService;
import com.cenpro.sircie.service.IExamenMedicoLaboratorioService;

@RequestMapping("/consulta/laboratorio")
public @RestController class ConsultaExamenMedicoLaboratorioRestController
{
    private @Autowired IExamenMedicoLaboratorioService examenMedicoLaboratorioService;
    private @Autowired IConsultaExamenMedicoLaboratorioService consultaExamenMedicoLaboratorioService;

    @GetMapping(value = "/administrativa", params = "accion=buscarPorCriterioBusquedaAdministrativa")
    public List<ConsultaLaboratorioAdministrativo> buscarPorCriterioBusquedaAdministrativa(
            CriterioBusquedaAdministrativaExamenMedicoLaboratorio criterioBusquedaAdministrativaExamenMedicoLaboratorio)
    {
        return consultaExamenMedicoLaboratorioService.buscarPorCriterioBusquedaAdministrativa(
                criterioBusquedaAdministrativaExamenMedicoLaboratorio);
    }

    @GetMapping(params = "accion=buscarResultadoRegularPorNumeroRegistroAnio")
    public List<ExamenMedicoLaboratorio> buscarResultadoRegularPorNumeroRegistroAnio(
            CriterioBusquedaAdministrativaExamenMedicoLaboratorio criterioBusqueda)
    {
        return examenMedicoLaboratorioService.buscarResultadoRegularPorNumeroRegistroAnio(
                criterioBusqueda.getNumeroRegistro(), criterioBusqueda.getAnio());
    }
}