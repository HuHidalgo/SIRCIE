package com.cenpro.sircie.controller.procesomanual;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/procesoManual/ejecucion")
public @Controller class ProcesoManualController
{
    @GetMapping
    public String irPaginaEjecucionProcesoManual(ModelMap model)
    {
        model.addAttribute("procesosManual", "");
        return "seguras/procesoManual/ejecucion";
    }
}