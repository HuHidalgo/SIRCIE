package com.cenpro.sircie.mapper;

import java.util.List;

import com.cenpro.sircie.model.consulta.administrativa.ConsultaLaboratorioAdministrativo;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAdministrativaExamenMedicoLaboratorio;

public interface IConsultaExamenMedicoLaboratorioMapper
{
    public List<ConsultaLaboratorioAdministrativo> buscarPorCriterioBusquedaAdministrativa(
            CriterioBusquedaAdministrativaExamenMedicoLaboratorio criterioBusquedaAdministrativaExamenMedicoLaboratorio);
}