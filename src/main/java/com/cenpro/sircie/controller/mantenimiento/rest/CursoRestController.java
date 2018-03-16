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

import com.cenpro.sircie.model.mantenimiento.Curso;
import com.cenpro.sircie.service.ICursoService;
import com.cenpro.sircie.utilitario.ConstantesGenerales;

@RequestMapping("/mantenimiento/curso")
public @RestController class CursoRestController 
{
private @Autowired ICursoService cursoService;
	
	@GetMapping(params = "accion=buscarTodos")
    public List<Curso> buscarTodos()
    {
        return cursoService.buscarTodos();
    }

    @PostMapping
    public ResponseEntity<?> registrarCurso(@RequestBody Curso curso)
    {
    	System.out.println(curso);
    	cursoService.registrarCurso(curso);
        return ResponseEntity.ok(cursoService.buscarPorIdConcepto(curso.getIdConcepto()));
    }

    @PutMapping
    public ResponseEntity<?> actualizarCurso(@RequestBody Curso curso)
    {
    	cursoService.actualizarCurso(curso);
        return ResponseEntity.ok(ConstantesGenerales.ACTUALIZACION_EXITOSA);
    }
    
    @DeleteMapping
    public ResponseEntity<?> eliminarCurso(@RequestBody Curso curso)
    {
    	cursoService.eliminarCurso(curso);
        return ResponseEntity.ok(ConstantesGenerales.ELIMINACION_EXITOSA);
    }
}
