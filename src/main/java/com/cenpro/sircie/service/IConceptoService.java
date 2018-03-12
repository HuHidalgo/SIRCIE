package com.cenpro.sircie.service;

import java.util.List;

import com.cenpro.sircie.model.mantenimiento.Concepto;

public interface IConceptoService extends IMantenibleService<Concepto>{
	
	public List<Concepto> buscarTodos();
    
	public List<Concepto> buscarPorId(int idConcepto);
	
    //public List<Concepto> buscarTodosT();
    
    public void registrarConcepto(Concepto concepto);
    
    public void actualizarConcepto(Concepto concepto);
    
    public void eliminarConcepto(Concepto concepto);
}
