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

import com.cenpro.sircie.model.mantenimiento.Tarea;
import com.cenpro.sircie.service.ITareaService;
import com.cenpro.sircie.utilitario.ConstantesGenerales;

@RequestMapping("/mantenimiento/tarea")
public @RestController class TareaRestController 
{
	private @Autowired ITareaService tareaService;
	
	@GetMapping(params = "accion=buscarTodos")
    public List<Tarea> buscarTodos()
    {
        return tareaService.buscarTodos();
    }

    @PostMapping
    public ResponseEntity<?> registrarUnidad(@RequestBody Tarea tarea)
    {
        tareaService.registrarTarea(tarea);
        return ResponseEntity.ok(ConstantesGenerales.REGISTRO_EXITOSO);
    }

    @PutMapping
    public ResponseEntity<?> actualizarTarea(@RequestBody Tarea tarea)
    {
        tareaService.actualizarTarea(tarea);
        return ResponseEntity.ok(ConstantesGenerales.ACTUALIZACION_EXITOSA);
    }
    
    @DeleteMapping
    public ResponseEntity<?> eliminarUnidad(@RequestBody Tarea tarea)
    {
    	tareaService.eliminarTarea(tarea);
        return ResponseEntity.ok(ConstantesGenerales.ELIMINACION_EXITOSA);
    }
}
