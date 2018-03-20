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
	
	private static final String GET_CUR = "GET_CUR";
	
	public CursoService(@Qualifier("ICursoMapper") IMantenibleMapper<Curso> mapper)
    {
        super(mapper);
        this.cursoMapper = (ICursoMapper) mapper;
    }
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public List<Curso> buscarPorCodigoConcepto(Integer codigoConcepto) {
		Curso curso = Curso.builder().idConcepto(codigoConcepto).build();
		return this.buscar(curso, GET_CUR);
	}
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public List<Curso> buscarPorIdConceptoCodigoCurso(Integer idConcepto, Integer codCurso) {
		Curso curso = Curso.builder().idConcepto(idConcepto).codigoCurso(codCurso).build();
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
