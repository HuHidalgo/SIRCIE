package com.cenpro.sircie.controller.mantenimiento.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cenpro.sircie.aspecto.anotacion.Audit;
import com.cenpro.sircie.aspecto.enumeracion.Accion;
import com.cenpro.sircie.aspecto.enumeracion.Comentario;
import com.cenpro.sircie.aspecto.enumeracion.Dato;
import com.cenpro.sircie.aspecto.enumeracion.Tipo;
import com.cenpro.sircie.model.mantenimiento.Escuela;
import com.cenpro.sircie.model.mantenimiento.Ingresos;
import com.cenpro.sircie.service.IIngresosService;
import com.cenpro.sircie.utilitario.ConstantesGenerales;

//@Audit(tipo = Tipo.Ingresos, datos = Dato.Ingresos)
@RequestMapping("/mantenimiento/ingresos")
public @RestController class IngresosRestController {
	
	private @Autowired IIngresosService ingresosService;
		
	//@Audit(accion = Accion.Consulta, comentario = Comentario.ConsultaTodos)
	@GetMapping(params = "accion=buscarTodos")
	public List<Ingresos> buscarTodos(){
		
		return ingresosService.buscarTodos();
	}
	
	//@Audit(accion = Accion.Registro, comentario = Comentario.Registro)
	@PostMapping
	public ResponseEntity<?> registrarIngresos(@RequestBody Ingresos ingresos){
		//System.out.println("1 ----> "+ingresos);
		int idIngreso = ingresosService.registrarIngresos(ingresos);
		//System.out.println("2 ----> "+ResponseEntity.ok(ingresosService.buscarPorId(idIngreso)));
		return ResponseEntity.ok(ingresosService.buscarPorId(idIngreso));
	}
	
	//@Audit(accion = Accion.Actualizacion, comentario = Comentario.Actualizacion)
	@PutMapping
	public ResponseEntity<?> actualizarIngresos(@RequestBody Ingresos ingresos){
		
		ingresosService.actualizarIngresos(ingresos);
		return ResponseEntity.ok(ConstantesGenerales.ACTUALIZACION_EXITOSA);
	}

}
