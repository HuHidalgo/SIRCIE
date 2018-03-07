package com.cenpro.sircie.controller.reporte.exportacion;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cenpro.sircie.model.criterio.CriterioBusquedaAtencionDiaria;
import com.cenpro.sircie.model.reporte.ReporteAtencionDiaria;
import com.cenpro.sircie.service.IReporteAtencionDiariaService;
import com.cenpro.sircie.utilitario.ReporteUtilYarg;

@RequestMapping("/reporte/atencion/diaria")
public @Controller class ReporteAtencionDiarioExportacionController
{
    private @Autowired IReporteAtencionDiariaService reporteAtencionDiariaService;

    @GetMapping(params = "accion=exportar")
    public ModelAndView descargarReporteAtencionDiaria(ModelMap model, ModelAndView modelAndView,
            CriterioBusquedaAtencionDiaria criterioBusquedaAtencionDiaria)
    {
        // DETALLE
        criterioBusquedaAtencionDiaria.setTipoReporte("DETALLE");
        List<ReporteAtencionDiaria> atencionDiariaDetalle = reporteAtencionDiariaService
                .buscarAtencionesDiarias(criterioBusquedaAtencionDiaria);

        // GENERAL
        criterioBusquedaAtencionDiaria.setTipoReporte("GENERAL");
        List<ReporteAtencionDiaria> atencionDiariaGeneral = reporteAtencionDiariaService
                .buscarAtencionesDiarias(criterioBusquedaAtencionDiaria);

        Map<String, Object> params = new HashMap<>();
        params.put("param1", atencionDiariaDetalle);
        params.put("param2", criterioBusquedaAtencionDiaria);
        params.put("param3", atencionDiariaGeneral);

        // HOJA DETALLE
        model.addAttribute("rb_titulo", ReporteUtilYarg.buildReportBand("Titulo"));
        model.addAttribute("rb_criterioBusqueda", ReporteUtilYarg.buildReportBand(
                "CriteriosBusqueda", "CriterioBusqueda", "parameter=param2 $", "json"));
        model.addAttribute("rb_total", ReporteUtilYarg.buildReportBand("Total"));
        model.addAttribute("rb_encabezado", ReporteUtilYarg.buildReportBand("Encabezado"));
        model.addAttribute("rb_datos",
                ReporteUtilYarg.buildReportBand("Datos", "Datos", "parameter=param1 $", "json"));

        // HOJA GENERAL
        model.addAttribute("rb_tituloGeneral", ReporteUtilYarg.buildReportBand("TituloGeneral"));
        model.addAttribute("rb_criterioBusquedaGeneral",
                ReporteUtilYarg.buildReportBand("CriteriosBusquedaGeneral",
                        "CriterioBusquedaGeneral", "parameter=param2 $", "json"));
        model.addAttribute("rb_totalGeneral", ReporteUtilYarg.buildReportBand("TotalGeneral"));
        model.addAttribute("rb_encabezadoGeneral",
                ReporteUtilYarg.buildReportBand("EncabezadoGeneral"));
        model.addAttribute("rb_datosGeneral", ReporteUtilYarg.buildReportBand("DatosGeneral",
                "DatosGeneral", "parameter=param3 $", "json"));

        model.addAttribute(ReporteUtilYarg.PARAM_TEMPLATE, "reporteAtencionDiario");
        model.addAttribute(ReporteUtilYarg.PARAM_NOMBRE_REPORTE, "Reporte de Atenciones Diario");
        model.addAttribute(ReporteUtilYarg.PARAM_REPORTE_PARAMETERS, params);
        modelAndView = new ModelAndView("yargView", model);
        return modelAndView;
    }
}