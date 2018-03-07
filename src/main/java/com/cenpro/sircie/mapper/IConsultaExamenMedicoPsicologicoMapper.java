package com.cenpro.sircie.mapper;

import java.util.List;

import com.cenpro.sircie.model.consulta.administrativa.ConsultaPsicologicoAdministrativo;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAdministrativaExamenMedicoPsicologico;

public interface IConsultaExamenMedicoPsicologicoMapper
{
    public List<ConsultaPsicologicoAdministrativo> buscarPorCriterioBusquedaAdministrativa(
            CriterioBusquedaAdministrativaExamenMedicoPsicologico criterioBusquedaAdministrativaExamenMedicoPsicologico);
}