package com.cenpro.sircie.service;

import java.util.List;

import com.cenpro.sircie.model.consulta.administrativa.ConsultaPsicologicoAdministrativo;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAdministrativaExamenMedicoPsicologico;

public interface IConsultaExamenMedicoPsicologicoService
{
    public List<ConsultaPsicologicoAdministrativo> buscarPorCriterioBusquedaAdministrativa(
            CriterioBusquedaAdministrativaExamenMedicoPsicologico criterioBusquedaAdministrativaExamenMedicoPsicologico);
}