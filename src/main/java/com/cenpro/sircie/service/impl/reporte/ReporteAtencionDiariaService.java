package com.cenpro.sircie.service.impl.reporte;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cenpro.sircie.mapper.IReporteAtencionDiariaMapper;
import com.cenpro.sircie.model.criterio.CriterioBusquedaAtencionDiaria;
import com.cenpro.sircie.model.reporte.ReporteAtencionDiaria;
import com.cenpro.sircie.service.IReporteAtencionDiariaService;
import com.cenpro.sircie.utilitario.StringsUtils;

@Service
public class ReporteAtencionDiariaService implements IReporteAtencionDiariaService
{
    private @Autowired IReporteAtencionDiariaMapper reporteAtencionDiariaMapper;

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<ReporteAtencionDiaria> buscarAtencionesDiarias(
            CriterioBusquedaAtencionDiaria criterioBusquedaAtencionDiaria)
    {
        String verbo = StringsUtils.concatenarCadena(
                criterioBusquedaAtencionDiaria.getIdTipoExamenMedico(), "_",
                criterioBusquedaAtencionDiaria.getTipoReporte());
        criterioBusquedaAtencionDiaria.setVerbo(verbo);
        return reporteAtencionDiariaMapper.buscarAtencionesDiarias(criterioBusquedaAtencionDiaria);
    }
}
