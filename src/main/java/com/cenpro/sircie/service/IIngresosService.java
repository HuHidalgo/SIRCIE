package com.cenpro.sircie.service;

import java.util.List;

import com.cenpro.sircie.model.mantenimiento.Ingresos;

public interface IIngresosService extends IMantenibleService<Ingresos>{
	
	public List<Ingresos> buscarTodos();
	
	public List<Ingresos> buscarPorId(int idIngreso);
    
    public int registrarIngresos(Ingresos ingresos);
    
    public void actualizarIngresos(Ingresos ingresos);
}
