package com.cenpro.sircie.controller.movimiento.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cenpro.sircie.model.movimiento.ExamenMedicoRadiologico;
import com.cenpro.sircie.service.IExamenMedicoRadiologicoService;
import com.cenpro.sircie.service.excepcion.BadRequestException;
import com.cenpro.sircie.utilitario.ConstantesGenerales;
import com.cenpro.sircie.utilitario.ValidatorUtil;

@RequestMapping("/examenmedico/radiologico")
public @RestController class ExamenMedicoRadiologicoRestController
{
    private @Autowired IExamenMedicoRadiologicoService examenMedicoRadiologicoService;

    @PostMapping(params = "accion=generar")
    public ResponseEntity<?> generarNumeroRegistro(
            @RequestBody ExamenMedicoRadiologico examenMedicoRadiologico)
    {
        int numeroRegistro = examenMedicoRadiologicoService
                .generarNumeroRegistro(examenMedicoRadiologico);
        return ResponseEntity.ok(numeroRegistro);
    }

    @GetMapping(params = "accion=buscarNumeroRegistroGenerado")
    public List<ExamenMedicoRadiologico> buscarPorEstadoExamenMedicoNumeroRegistroGenerado()
    {
        return examenMedicoRadiologicoService
                .buscarPorEstadoExamenMedico(ConstantesGenerales.ESTADO_NUMERO_REGISTRO_GENERADO);
    }

    @GetMapping(params = "accion=buscarTomaRadiologica")
    public List<ExamenMedicoRadiologico> buscarPorEstadoExamenMedicoTomaRadiologica()
    {
        return examenMedicoRadiologicoService
                .buscarPorEstadoExamenMedico(ConstantesGenerales.ESTADO_TOMA_RADIOLOGICA);
    }

    @PutMapping(params = "accion=actualizarTomaRadiologica")
    public void actualizarTomaRadiologica(
            @RequestBody ExamenMedicoRadiologico examenMedicoRadiologico)
    {
        examenMedicoRadiologicoService.actualizarTomaRadiologica(examenMedicoRadiologico);
    }

    @PostMapping(params = "accion=registrarExamenMedicoRegularRadiologico")
    public void registrarExamenMedicoRegularRadiologico(
            @Validated @RequestBody ExamenMedicoRadiologico examenMedicoRadiologico, Errors error)
    {
        if (error.hasErrors())
        {
            throw new BadRequestException(ValidatorUtil.obtenerMensajeValidacionError(error));
        }
        examenMedicoRadiologicoService
                .registrarExamenMedicoRegularRadiologico(examenMedicoRadiologico);
    }
}