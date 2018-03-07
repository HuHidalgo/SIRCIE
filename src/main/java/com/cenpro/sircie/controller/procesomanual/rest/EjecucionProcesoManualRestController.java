package com.cenpro.sircie.controller.procesomanual.rest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cenpro.sircie.model.criterio.CriterioBusquedaEnvioCorreo;

@RequestMapping("/procesoManual/ejecucion")
public @RestController class EjecucionProcesoManualRestController
{
    @PostMapping("accion=ejecutar")
    public void ejecutarProcesoManual(
            @RequestBody CriterioBusquedaEnvioCorreo criterioBusquedaEnvioCorreo)
    {
        
    }
}