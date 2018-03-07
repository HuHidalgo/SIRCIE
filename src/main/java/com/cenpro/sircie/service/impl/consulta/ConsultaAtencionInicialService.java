package com.cenpro.sircie.service.impl.consulta;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cenpro.sircie.mapper.IConsultaAtencionInicialMapper;
import com.cenpro.sircie.model.consulta.ConsultaAtencionInicial;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAtencionInicial;
import com.cenpro.sircie.service.IConsultaAtencionInicialService;

@Service
public class ConsultaAtencionInicialService implements IConsultaAtencionInicialService
{
    private @Autowired IConsultaAtencionInicialMapper consultaAtencionInicialMapper;

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<ConsultaAtencionInicial> buscarConsultaAtencionInicialLaboratorioPorCriterioBusqueda(
            CriterioBusquedaAtencionInicial criterioBusqueda)
    {
        return consultaAtencionInicialMapper
                .buscarConsultaAtencionInicialLaboratorioPorCriterioBusqueda(criterioBusqueda);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<ConsultaAtencionInicial> buscarConsultaAtencionInicialPsicologiaPorCriterioBusqueda(
            CriterioBusquedaAtencionInicial criterioBusqueda)
    {
        return consultaAtencionInicialMapper
                .buscarConsultaAtencionInicialPsicologiaPorCriterioBusqueda(criterioBusqueda);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<ConsultaAtencionInicial> buscarConsultaAtencionInicialRadiologiaPorCriterioBusqueda(
            CriterioBusquedaAtencionInicial criterioBusqueda)
    {
        return consultaAtencionInicialMapper
                .buscarConsultaAtencionInicialRadiologiaPorCriterioBusqueda(criterioBusqueda);
    }
}