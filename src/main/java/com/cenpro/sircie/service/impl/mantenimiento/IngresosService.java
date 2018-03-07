package com.cenpro.sircie.service.impl.mantenimiento;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cenpro.sircie.mapper.IIngresosMapper;
import com.cenpro.sircie.mapper.base.IMantenibleMapper;
import com.cenpro.sircie.model.mantenimiento.Ingresos;
import com.cenpro.sircie.service.IIngresosService;
import com.cenpro.sircie.service.excepcion.MantenimientoException;
import com.cenpro.sircie.service.impl.MantenibleService;
import com.cenpro.sircie.utilitario.ConstantesExcepciones;
import com.cenpro.sircie.utilitario.Verbo;

@Service
public class IngresosService extends MantenibleService<Ingresos> implements IIngresosService{
	
	@SuppressWarnings("unused")
	private IIngresosMapper ingresosMapper;
	
	public IngresosService(@Qualifier("IIngresosMapper") IMantenibleMapper<Ingresos> mapper) {
		
		super(mapper);
		this.ingresosMapper = (IIngresosMapper) mapper;
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public List<Ingresos> buscarTodos() {
		
		return this.buscar(new Ingresos(), Verbo.GETS);
	}
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<Ingresos> buscarPorId(int idIngreso)
    {
		Ingresos ingreso = Ingresos.builder().codigoIngreso(idIngreso).build();
        return this.buscar(ingreso, Verbo.GET);
    }

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public int registrarIngresos(Ingresos ingresos) {
		
		List<Ingresos> ingreso = this.registrarAutoIncrementable(ingresos);
        if (!ingreso.isEmpty() && ingreso.get(0).getCodigoIngreso() != null)
        {
            return ingreso.get(0).getCodigoIngreso();
        } else
        {
            throw new MantenimientoException(ConstantesExcepciones.ERROR_REGISTRO);
        }	
	}
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void actualizarIngresos(Ingresos ingresos) {
		
		this.actualizar(ingresos);
	}

}
