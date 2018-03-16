package com.cenpro.sircie.service.impl.mantenimiento;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cenpro.sircie.mapper.ICursoMapper;
import com.cenpro.sircie.mapper.base.IMantenibleMapper;
import com.cenpro.sircie.model.mantenimiento.Curso;
import com.cenpro.sircie.service.ICursoService;
import com.cenpro.sircie.service.impl.MantenibleService;
import com.cenpro.sircie.utilitario.Verbo;

@Service
public class CursoService extends MantenibleService<Curso> implements ICursoService
{
	@SuppressWarnings("unused")
    private ICursoMapper cursoMapper;
	
	public CursoService(@Qualifier("ICursoMapper") IMantenibleMapper<Curso> mapper)
    {
        super(mapper);
        this.cursoMapper = (ICursoMapper) mapper;
    }
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public List<Curso> buscarPorIdConcepto(Integer idConcepto) {
		Curso curso = Curso.builder().idConcepto(idConcepto).build();
		return this.buscar(curso, Verbo.GET);
	}
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public List<Curso> buscarTodos() {
		return this.buscar(new Curso(), Verbo.GETS);
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void registrarCurso(Curso curso) {
		this.registrar(curso);
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void actualizarCurso(Curso curso) {
		this.actualizar(curso);	
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void eliminarCurso(Curso curso) {
		this.eliminar(curso);
	}
}
