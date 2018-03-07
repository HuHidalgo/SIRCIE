package com.cenpro.sircie.controller.movimiento.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cenpro.sircie.model.movimiento.ExamenMedicoLaboratorio;
import com.cenpro.sircie.service.IExamenMedicoLaboratorioService;
import com.cenpro.sircie.service.excepcion.BadRequestException;
import com.cenpro.sircie.utilitario.ConstantesGenerales;
import com.cenpro.sircie.utilitario.ValidatorUtil;

@RequestMapping("/examenmedico/laboratorio")
public @RestController class ExamenMedicoLaboratorioRestController
{
    private @Autowired IExamenMedicoLaboratorioService examenMedicoLaboratorioService;

    @PostMapping(params = "accion=generar")
    public ResponseEntity<?> generarNumeroRegistro(
            @RequestBody ExamenMedicoLaboratorio examenMedicoLaboratorio)
    {
        int numeroRegistro = examenMedicoLaboratorioService
                .generarNumeroRegistro(examenMedicoLaboratorio);
        return ResponseEntity.ok(numeroRegistro);
    }

    @GetMapping(params = "accion=buscarNumeroRegistroGenerado")
    public List<ExamenMedicoLaboratorio> buscarPorEstadoExamenMedicoNumeroRegistroGenerado()
    {
        return examenMedicoLaboratorioService
                .buscarPorEstadoExamenMedico(ConstantesGenerales.ESTADO_NUMERO_REGISTRO_GENERADO);
    }

    @PostMapping(params = "accion=registrarExamenMedicoRegularLaboratorio")
    public void registrarExamenMedicoRegularLaboratorio(
            @Validated @RequestBody ExamenMedicoLaboratorio examenMedicoLaboratorio, Errors error)
    {
        if (error.hasErrors())
        {
            throw new BadRequestException(ValidatorUtil.obtenerMensajeValidacionError(error));
        }
        examenMedicoLaboratorioService
                .registrarExamenMedicoRegularLaboratorio(examenMedicoLaboratorio);
    }
}