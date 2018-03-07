package com.cenpro.sircie.mapper;

import java.util.List;

import com.cenpro.sircie.model.consulta.administrativa.ConsultaRadiologicoAdministrativo;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAdministrativaExamenMedicoRadiologico;

public interface IConsultaExamenMedicoRadiologicoMapper
{
    public List<ConsultaRadiologicoAdministrativo> buscarPorCriterioBusquedaAdministrativa(
            CriterioBusquedaAdministrativaExamenMedicoRadiologico criterioBusquedaAdministrativaExamenMedicoRadiologico);
}