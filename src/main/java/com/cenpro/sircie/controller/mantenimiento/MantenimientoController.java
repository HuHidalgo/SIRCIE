package com.cenpro.sircie.controller.mantenimiento;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cenpro.sircie.aspecto.anotacion.Audit;
import com.cenpro.sircie.aspecto.enumeracion.Accion;
import com.cenpro.sircie.aspecto.enumeracion.Comentario;
import com.cenpro.sircie.aspecto.enumeracion.Tipo;
import com.cenpro.sircie.controller.excepcion.anotacion.Vista;
import com.cenpro.sircie.service.IFacultadService;
import com.cenpro.sircie.service.IMultiTabDetService;
import com.cenpro.sircie.service.IPersonaService;
import com.cenpro.sircie.utilitario.MultiTablaUtil;

@Vista
@Audit(accion = Accion.Visita, comentario = Comentario.Visita)
@RequestMapping("/mantenimiento")
public @Controller class MantenimientoController
{
    private @Autowired IPersonaService personaService;
    private @Autowired IFacultadService facultadService;
    private @Autowired IMultiTabDetService multiTabDetService;

    @Audit(tipo = Tipo.Persona)
    @GetMapping("/{mantenimiento:persona}")
    public String irPaginaMantenimientoPersona(@PathVariable String mantenimiento, ModelMap model)
    {
        model.addAttribute("mantenimiento", mantenimiento);
        model.addAttribute("tiposDocumento",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_TIPO_DOCUMENTO));
        model.addAttribute("sexos", multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_SEXO));
        return "seguras/mantenimiento/mantenimiento";
    }

    @Audit(tipo = Tipo.Medico)
    @GetMapping("/{mantenimiento:medico}")
    public String irPaginaMantenimientoMedico(@PathVariable String mantenimiento, ModelMap model)
    {
        model.addAttribute("personas", personaService.buscarTodos());
        model.addAttribute("mantenimiento", mantenimiento);
        return "seguras/mantenimiento/mantenimiento";
    }

    @Audit(tipo = Tipo.Alumno)
    @GetMapping("/{mantenimiento:alumno}")
    public String irPaginaMantenimientoAlumno(@PathVariable String mantenimiento, ModelMap model)
    {
        model.addAttribute("mantenimiento", mantenimiento);
        model.addAttribute("tiposDocumento",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_TIPO_DOCUMENTO));
        model.addAttribute("sexos", multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_SEXO));
        model.addAttribute("tiposAlumno",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_TIPO_ALUMNO));
        model.addAttribute("discapacidades",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_DISCAPACIDAD));
        model.addAttribute("facultades", facultadService.buscarTodos());
        return "seguras/mantenimiento/mantenimiento";
    }

    @Audit(tipo = Tipo.Campania)
    @GetMapping("/{mantenimiento:campania}")
    public String irPaginaMantenimientoCampania(@PathVariable String mantenimiento, ModelMap model)
    {
        model.addAttribute("mantenimiento", mantenimiento);
        model.addAttribute("tiposCertificado",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_TIPO_CERTIFICADO));
        return "seguras/mantenimiento/mantenimiento";
    }

    @Audit(tipo = Tipo.MulTabCab)
    @GetMapping("/{mantenimiento:multitabcab}")
    public String irPaginaMantenimientoTabladeTabla(@PathVariable String mantenimiento, ModelMap model)
    {
        model.addAttribute("mantenimiento", mantenimiento);
        return "seguras/mantenimiento/multiTabla";
    }

    @GetMapping("/{mantenimiento:facultad}")
    public String irPaginaMantenimientoFacultad(@PathVariable String mantenimiento, ModelMap model)
    {
        model.addAttribute("mantenimiento", mantenimiento);
        return "seguras/mantenimiento/mantenimiento";
    }
    
    //@Audit(tipo = Tipo.Ingresos)
    @GetMapping("/{mantenimiento:ingresos}")//////////////////////////////////////
    public String irPaginaMantenimientoIngresos(@PathVariable String mantenimiento, ModelMap model)
    {
        model.addAttribute("mantenimiento", mantenimiento);
        return "seguras/mantenimiento/mantenimiento";
    }
    
    @GetMapping("/{mantenimiento:escuela}")
    public String irPaginaMantenimientoEscuela(@PathVariable String mantenimiento, ModelMap model)
    {
        model.addAttribute("mantenimiento", mantenimiento);
        model.addAttribute("facultades", facultadService.buscarTodos());
        return "seguras/mantenimiento/mantenimiento";
    }
    
    @GetMapping("/{mantenimiento:procesoAutomatico}")
    public String irPaginaMantenimientoProcesoAutomatico(@PathVariable String mantenimiento, ModelMap model)
    {
        model.addAttribute("mantenimiento", mantenimiento);
        return "seguras/mantenimiento/mantenimiento";
    }
}