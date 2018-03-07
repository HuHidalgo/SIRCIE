package com.cenpro.sircie.service.impl.movimiento;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cenpro.sircie.mapper.IExamenMedicoPsicologicoMapper;
import com.cenpro.sircie.mapper.base.IMantenibleMapper;
import com.cenpro.sircie.model.movimiento.ExamenMedicoPsicologico;
import com.cenpro.sircie.service.IExamenMedicoPsicologicoService;
import com.cenpro.sircie.service.impl.MantenibleService;
import com.cenpro.sircie.utilitario.Verbo;

@Service
public class ExamenMedicoPsicologicoService extends MantenibleService<ExamenMedicoPsicologico>
        implements IExamenMedicoPsicologicoService
{
    @SuppressWarnings("unused")
    private IExamenMedicoPsicologicoMapper examenMedicoPsicologicoMapper;

    public ExamenMedicoPsicologicoService(
            @Qualifier("IExamenMedicoPsicologicoMapper") IMantenibleMapper<ExamenMedicoPsicologico> mapper)
    {
        super(mapper);
        this.examenMedicoPsicologicoMapper = (IExamenMedicoPsicologicoMapper) mapper;
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void registrarExamenMedicoPsicologico(ExamenMedicoPsicologico examenMedicoPsicologico)
    {
        this.registrar(examenMedicoPsicologico);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void actualizarExamenMedicoPsicologico(ExamenMedicoPsicologico examenMedicoPsicologico)
    {
        this.actualizar(examenMedicoPsicologico);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void eliminarExamenMedicoPsicologico(ExamenMedicoPsicologico examenMedicoPsicologico)
    {
        this.eliminar(examenMedicoPsicologico);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<ExamenMedicoPsicologico> buscarResultadoRegularPorNumeroRegistro(
            Integer numeroRegistro)
    {
        ExamenMedicoPsicologico examenMedicoPsicologico = ExamenMedicoPsicologico.builder()
                .numeroRegistro(numeroRegistro).build();
        return this.buscar(examenMedicoPsicologico, Verbo.GET);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public boolean existeExamenMedicoPsicologico(Integer numeroRegistro)
    {
        ExamenMedicoPsicologico examenMedicoPsicologico = ExamenMedicoPsicologico.builder()
                .numeroRegistro(numeroRegistro).build();
        return this.existe(examenMedicoPsicologico);
    }
}