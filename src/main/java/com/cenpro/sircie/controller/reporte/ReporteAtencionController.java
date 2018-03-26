package com.cenpro.sircie.controller.reporte;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cenpro.sircie.controller.excepcion.anotacion.Vista;
import com.cenpro.sircie.service.IMultiTabDetService;
import com.cenpro.sircie.utilitario.MultiTablaUtil;

@Vista
@RequestMapping("/reporte")
public @Controller class ReporteAtencionController
{
    private @Autowired IMultiTabDetService multiTabDetService;

    @GetMapping("/atencion/diaria")
    public String irPaginaReporteAtencionDiaria(ModelMap model)
    {
        model.addAttribute("tiposExamenMedico",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_TIPO_EXAMEN_MEDICO));
        return "seguras/reporte/reporteAtencionDiaria";
    }
}