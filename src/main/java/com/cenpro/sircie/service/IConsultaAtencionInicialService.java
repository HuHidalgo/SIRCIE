package com.cenpro.sircie.service;

import java.util.List;

import com.cenpro.sircie.model.consulta.ConsultaAtencionInicial;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAtencionInicial;

public interface IConsultaAtencionInicialService
{
    public List<ConsultaAtencionInicial> buscarConsultaAtencionInicialLaboratorioPorCriterioBusqueda(
            CriterioBusquedaAtencionInicial criterioBusqueda);
    
    public List<ConsultaAtencionInicial> buscarConsultaAtencionInicialPsicologiaPorCriterioBusqueda(
            CriterioBusquedaAtencionInicial criterioBusqueda);
    
    public List<ConsultaAtencionInicial> buscarConsultaAtencionInicialRadiologiaPorCriterioBusqueda(
            CriterioBusquedaAtencionInicial criterioBusqueda);
}