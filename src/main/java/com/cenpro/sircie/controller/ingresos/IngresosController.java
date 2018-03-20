package com.cenpro.sircie.controller.ingresos;

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
import com.cenpro.sircie.service.IConceptoService;
import com.cenpro.sircie.service.IFacultadService;
import com.cenpro.sircie.service.IMetaService;
import com.cenpro.sircie.service.IMultiTabDetService;
import com.cenpro.sircie.service.IPersonaService;
import com.cenpro.sircie.service.ITareaService;
import com.cenpro.sircie.service.IUnidadService;
import com.cenpro.sircie.utilitario.MultiTablaUtil;
//seguridad
@Vista
@Audit(accion = Accion.Visita, comentario = Comentario.Visita)
@RequestMapping("/ingresos")
public @Controller class IngresosController
{
    private @Autowired IMultiTabDetService multiTabDetService;
    private @Autowired IUnidadService unidadService;
    private @Autowired IConceptoService conceptoService;
    
    //@Audit(tipo = Tipo.Ingresos)
    @GetMapping(value = "/{mantenimiento:ingresos}")
    public String irPaginaMantenimientoIngresos(@PathVariable String mantenimiento, ModelMap model)
    {
        model.addAttribute("mantenimiento", mantenimiento);
        model.addAttribute("tiposDocumento",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_TIPO_DOCUMENTO));
        model.addAttribute("tiposMoneda",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_TIPO_MONEDA));
        model.addAttribute("unidades", unidadService.buscarTodos());
        model.addAttribute("conceptos", conceptoService.buscarTodos());
        return "seguras/ingresos/mantenimiento";
    }
    
}