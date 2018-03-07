package com.cenpro.sircie.controller.movimiento;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cenpro.sircie.controller.excepcion.anotacion.Vista;
import com.cenpro.sircie.service.IMultiTabDetService;
import com.cenpro.sircie.utilitario.MultiTablaUtil;

@Vista
@RequestMapping("/examenmedico")
public @Controller class ResultadoExamenMedicoController
{
    private @Autowired IMultiTabDetService multiTabDetService;

    @GetMapping(value = "/{examen:laboratorio}/resultado")
    public String irPaginaRegistroResultadoExamenMedicoLaboratorio(@PathVariable String examen,
            ModelMap model)
    {
        model.addAttribute("examen", examen);
        model.addAttribute("indicadoresRPR",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_RPR));
        model.addAttribute("indicadoresHemograma",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_HEMOGRAMA));
        model.addAttribute("diluciones",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_DILUCION));
        return "seguras/resultado/registroResultado";
    }

    @GetMapping(value = "/radiologico/tomaRadiologica")
    public String irPaginaTomaRadiologico(ModelMap model)
    {
        model.addAttribute("resultadosRadiologico",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_RESULTADO_RADIOLOGICO));
        return "seguras/tomaRadiologica";
    }

    @GetMapping(value = "/{examen:radiologico}/resultado")
    public String irPaginaRegistroResultadoExamenMedicoRadiologico(@PathVariable String examen,
            ModelMap model)
    {
        model.addAttribute("examen", examen);
        model.addAttribute("resultadosRadiologico",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_RESULTADO_RADIOLOGICO));
        return "seguras/resultado/registroResultado";
    }
}