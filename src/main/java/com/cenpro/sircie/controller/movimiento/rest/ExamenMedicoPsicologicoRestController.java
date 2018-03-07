package com.cenpro.sircie.controller.movimiento.rest;

import javax.validation.groups.Default;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cenpro.sircie.model.movimiento.ExamenMedicoPsicologico;
import com.cenpro.sircie.service.IExamenMedicoPsicologicoService;
import com.cenpro.sircie.service.excepcion.BadRequestException;
import com.cenpro.sircie.utilitario.ConstantesGenerales;
import com.cenpro.sircie.utilitario.ValidatorUtil;
import com.cenpro.sircie.validacion.grupo.accion.IActualizacion;

@RequestMapping("/examenmedico/psicologia")
public @RestController class ExamenMedicoPsicologicoRestController
{
    private @Autowired IExamenMedicoPsicologicoService examenMedicoPsicologicoService;

    @PostMapping
    public ResponseEntity<?> registrarExamenMedicoPsicologico(
            @Validated @RequestBody ExamenMedicoPsicologico examenMedicoPsicologico, Errors error)
    {
        if (error.hasErrors())
        {
            throw new BadRequestException(ValidatorUtil.obtenerMensajeValidacionError(error));
        }
        examenMedicoPsicologicoService.registrarExamenMedicoPsicologico(examenMedicoPsicologico);
        return ResponseEntity.ok(ConstantesGenerales.REGISTRO_EXITOSO);
    }

    @PutMapping
    public ResponseEntity<?> actualizarExamenMedicoPsicologico(
            @Validated({ IActualizacion.class,
                    Default.class }) @RequestBody ExamenMedicoPsicologico examenMedicoPsicologico,
            Errors error)
    {
        if (error.hasErrors())
        {
            throw new BadRequestException(ValidatorUtil.obtenerMensajeValidacionError(error));
        }
        examenMedicoPsicologicoService.actualizarExamenMedicoPsicologico(examenMedicoPsicologico);
        return ResponseEntity.ok(ConstantesGenerales.ACTUALIZACION_EXITOSA);
    }

    @DeleteMapping
    public ResponseEntity<?> eliminarExamenMedicoPsicologico(
            @Validated(IActualizacion.class) @RequestBody ExamenMedicoPsicologico examenMedicoPsicologico,
            Errors error)
    {
        if (error.hasErrors())
        {
            throw new BadRequestException(ValidatorUtil.obtenerMensajeValidacionError(error));
        }
        examenMedicoPsicologicoService.eliminarExamenMedicoPsicologico(examenMedicoPsicologico);
        return ResponseEntity.ok(ConstantesGenerales.ELIMINACION_EXITOSA);
    }

}