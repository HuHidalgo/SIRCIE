package com.cenpro.sircie.service.impl.consulta;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cenpro.sircie.mapper.IConsultaExamenMedicoPsicologicoMapper;
import com.cenpro.sircie.model.consulta.administrativa.ConsultaPsicologicoAdministrativo;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAdministrativaExamenMedicoPsicologico;
import com.cenpro.sircie.service.IConsultaExamenMedicoPsicologicoService;

@Service
public class ConsultaExamenMedicoPsicologicoService
        implements IConsultaExamenMedicoPsicologicoService
{
    private @Autowired IConsultaExamenMedicoPsicologicoMapper consultaExamenMedicoPsicologicoMapper;

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<ConsultaPsicologicoAdministrativo> buscarPorCriterioBusquedaAdministrativa(
            CriterioBusquedaAdministrativaExamenMedicoPsicologico criterioBusquedaAdministrativaExamenMedicoPsicologico)
    {
        return consultaExamenMedicoPsicologicoMapper.buscarPorCriterioBusquedaAdministrativa(
                criterioBusquedaAdministrativaExamenMedicoPsicologico);
    }
}