package com.cenpro.sircie.controller.carga;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.cenpro.sircie.controller.excepcion.anotacion.Vista;
import com.cenpro.sircie.service.IMultiTabDetService;
import com.cenpro.sircie.utilitario.MultiTablaUtil;

@Vista
public @Controller class CargaController
{
    private @Autowired IMultiTabDetService multiTabDetService;

    @GetMapping("/carga/alumno")
    public String irPaginaCargaAlumno(ModelMap model)
    {
        model.addAttribute("tiposAlumno",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_ESTADO));
        return "seguras/carga/alumno";
    }
}