package com.cenpro.sircie.controller.mantenimiento.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cenpro.sircie.model.mantenimiento.Concepto;
import com.cenpro.sircie.service.IConceptoService;
import com.cenpro.sircie.utilitario.ConstantesGenerales;

@RequestMapping("/mantenimiento/concepto")
public @RestController class ConceptoRestController {
	
	private @Autowired IConceptoService conceptoService;

    @GetMapping(params = "accion=buscarTodos")
    public List<Concepto> buscarTodos()
    {
        return conceptoService.buscarTodos();
    }

    @PostMapping
    public ResponseEntity<?> registrarConcepto(@RequestBody Concepto concepto)
    {
        conceptoService.registrarConcepto(concepto);
        return ResponseEntity.ok(ConstantesGenerales.REGISTRO_EXITOSO);
    }

    @PutMapping
    public ResponseEntity<?> actualizarConcepto(@RequestBody Concepto concepto)
    {
        conceptoService.actualizarConcepto(concepto);
        return ResponseEntity.ok(ConstantesGenerales.ACTUALIZACION_EXITOSA);
    }
    
    @DeleteMapping
    public ResponseEntity<?> eliminarConcepto(@RequestBody Concepto concepto)
    {
        conceptoService.eliminarConcepto(concepto);
        return ResponseEntity.ok(ConstantesGenerales.ELIMINACION_EXITOSA);
    }
}
