package com.cenpro.sircie.service;

import java.util.List;

import com.cenpro.sircie.model.consulta.administrativa.ConsultaRadiologicoAdministrativo;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAdministrativaExamenMedicoRadiologico;

public interface IConsultaExamenMedicoRadiologicoService
{
    public List<ConsultaRadiologicoAdministrativo> buscarPorCriterioBusquedaAdministrativa(
            CriterioBusquedaAdministrativaExamenMedicoRadiologico criterioBusquedaAdministrativaExamenMedicoRadiologico);
}