package com.cenpro.sircie.controller.consulta;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cenpro.sircie.controller.excepcion.anotacion.Vista;
import com.cenpro.sircie.service.ICampaniaService;
import com.cenpro.sircie.service.IFacultadService;
import com.cenpro.sircie.service.IMultiTabDetService;
import com.cenpro.sircie.utilitario.MultiTablaUtil;

@Vista
@RequestMapping("/consulta/atencion")
public @Controller class ConsultaAtencionInicialController
{
    private @Autowired IFacultadService facultadService;
    private @Autowired ICampaniaService campaniaService;
    private @Autowired IMultiTabDetService multiTabDetService;

    @GetMapping("/{consulta:psicologia}")
    public String irPaginaConsultaAtencionInicialPsicologia(@PathVariable String consulta,
            ModelMap model)
    {
        model.addAttribute("facultades", facultadService.buscarTodos());
        model.addAttribute("campanias", campaniaService.buscarPorEstadoActivo(true));
        model.addAttribute("resultadosPsicologico",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_RESULTADO_PSICOLOGICO));
        return "seguras/consulta/consultaAtencionInicial";
    }

    @GetMapping("/{consulta:laboratorio}")
    public String irPaginaConsultaAtencionInicialLaboratorio(@PathVariable String consulta,
            ModelMap model)
    {
        model.addAttribute("facultades", facultadService.buscarTodos());
        model.addAttribute("campanias", campaniaService.buscarPorEstadoActivo(true));
        return "seguras/consulta/consultaAtencionInicial";
    }

    @GetMapping("/{consulta:radiologia}")
    public String irPaginaConsultaAtencionInicialRadiologia(@PathVariable String consulta,
            ModelMap model)
    {
        model.addAttribute("facultades", facultadService.buscarTodos());
        model.addAttribute("campanias", campaniaService.buscarPorEstadoActivo(true));
        return "seguras/consulta/consultaAtencionInicial";
    }
}