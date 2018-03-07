package com.cenpro.sircie.service;

import java.util.List;

import com.cenpro.sircie.model.criterio.CriterioBusquedaAtencionDiaria;
import com.cenpro.sircie.model.reporte.ReporteAtencionDiaria;

public interface IReporteAtencionDiariaService
{
    public List<ReporteAtencionDiaria> buscarAtencionesDiarias(
            CriterioBusquedaAtencionDiaria criterioBusquedaAtencionDiaria);
}