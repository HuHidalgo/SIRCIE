package com.cenpro.sircie.service;

import java.util.List;

import com.cenpro.sircie.model.consulta.administrativa.ConsultaLaboratorioAdministrativo;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAdministrativaExamenMedicoLaboratorio;

public interface IConsultaExamenMedicoLaboratorioService
{
    public List<ConsultaLaboratorioAdministrativo> buscarPorCriterioBusquedaAdministrativa(
            CriterioBusquedaAdministrativaExamenMedicoLaboratorio criterioBusquedaAdministrativaExamenMedicoLaboratorio);
}