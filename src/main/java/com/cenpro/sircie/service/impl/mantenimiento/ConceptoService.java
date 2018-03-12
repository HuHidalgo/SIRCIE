package com.cenpro.sircie.service.impl.mantenimiento;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cenpro.sircie.mapper.IConceptoMapper;
import com.cenpro.sircie.mapper.base.IMantenibleMapper;
import com.cenpro.sircie.model.mantenimiento.Concepto;
import com.cenpro.sircie.service.IConceptoService;
import com.cenpro.sircie.service.impl.MantenibleService;
import com.cenpro.sircie.utilitario.Verbo;

@Service
public class ConceptoService extends MantenibleService<Concepto> implements IConceptoService {

	@SuppressWarnings("unused")
	private IConceptoMapper conceptoMapper;
	
	public ConceptoService(@Qualifier("IConceptoMapper") IMantenibleMapper<Concepto> mapper) {
		super(mapper);
		this.conceptoMapper = (IConceptoMapper) mapper;
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public List<Concepto> buscarTodos() {
		
		return this.buscar(new Concepto(), Verbo.GETS);
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void registrarConcepto(Concepto concepto) {
		
		this.registrar(concepto);
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void actualizarConcepto(Concepto concepto) {
		
		this.actualizar(concepto);
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void eliminarConcepto(Concepto concepto) {
		
		this.eliminar(concepto);
	}	

}
