package com.cenpro.sircie.controller.consulta;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cenpro.sircie.controller.excepcion.anotacion.Vista;
import com.cenpro.sircie.mapper.IParametroGeneralService;
import com.cenpro.sircie.service.ICampaniaService;
import com.cenpro.sircie.service.IFacultadService;
import com.cenpro.sircie.service.IMultiTabDetService;
import com.cenpro.sircie.utilitario.DatesUtils;
import com.cenpro.sircie.utilitario.MultiTablaUtil;

@Vista
@RequestMapping("/consulta/administrativa")
public @Controller class ConsultaAdministrativaExamenMedicoController
{
    private @Autowired IFacultadService facultadService;
    private @Autowired ICampaniaService campaniaService;
    private @Autowired IMultiTabDetService multiTabDetService;
    private @Autowired IParametroGeneralService parametroGeneralService;

    @GetMapping("/{consulta:laboratorio}")
    public String irPaginaConsultaAdministrativaExamenMedicoLaboratorio(
            @PathVariable String consulta, ModelMap model)
    {
        model.addAttribute("tiposAlumno",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_TIPO_ALUMNO));
        model.addAttribute("estadosExamenMedico",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_ESTADO_EXAMEN_MEDICO));
        model.addAttribute("campanias", campaniaService.buscarTodos());
        model.addAttribute("facultades", facultadService.buscarTodos());
        model.addAttribute("anios",
                DatesUtils.obtenerAnios(parametroGeneralService.buscarAnioInicio()));
        model.addAttribute("consulta", consulta);
        model.addAttribute("indicadoresRPR",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_RPR));
        model.addAttribute("indicadoresHemograma",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_HEMOGRAMA));
        model.addAttribute("diluciones",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_DILUCION));
        return "seguras/consulta/consultaAdministrativaExamenMedico";
    }

    @GetMapping("/{consulta:radiologico}")
    public String irPaginaConsultaAdministrativaExamenMedicoRadiologico(
            @PathVariable String consulta, ModelMap model)
    {
        model.addAttribute("tiposAlumno",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_TIPO_ALUMNO));
        model.addAttribute("estadosExamenMedico",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_ESTADO_EXAMEN_MEDICO));
        model.addAttribute("campanias", campaniaService.buscarTodos());
        model.addAttribute("facultades", facultadService.buscarTodos());
        model.addAttribute("anios",
                DatesUtils.obtenerAnios(parametroGeneralService.buscarAnioInicio()));
        model.addAttribute("resultadosRadiologico",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_RESULTADO_RADIOLOGICO));
        model.addAttribute("consulta", consulta);
        return "seguras/consulta/consultaAdministrativaExamenMedico";
    }
    
    @GetMapping("/{consulta:psicologia}")
    public String irPaginaConsultaAdministrativaExamenMedicoPsicologico(
            @PathVariable String consulta, ModelMap model)
    {
        model.addAttribute("tiposAlumno",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_TIPO_ALUMNO));
        model.addAttribute("estadosExamenMedico",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_ESTADO_EXAMEN_MEDICO));
        model.addAttribute("campanias", campaniaService.buscarTodos());
        model.addAttribute("facultades", facultadService.buscarTodos());
        model.addAttribute("resultadosPsicologico",
                multiTabDetService.buscarPorIdTabla(MultiTablaUtil.TABLA_RESULTADO_PSICOLOGICO));
        model.addAttribute("consulta", consulta);
        return "seguras/consulta/consultaAdministrativaExamenMedico";
    }
}