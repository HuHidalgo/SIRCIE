package com.cenpro.sircie.service.impl.movimiento;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cenpro.sircie.mapper.IExamenMedicoRadiologicoMapper;
import com.cenpro.sircie.mapper.base.IMantenibleMapper;
import com.cenpro.sircie.model.movimiento.ExamenMedicoRadiologico;
import com.cenpro.sircie.service.IExamenMedicoRadiologicoService;
import com.cenpro.sircie.service.excepcion.MantenimientoException;
import com.cenpro.sircie.service.impl.MantenibleService;
import com.cenpro.sircie.utilitario.ConstantesExcepciones;

@Service
public class ExamenMedicoRadiologicoService extends MantenibleService<ExamenMedicoRadiologico>
        implements IExamenMedicoRadiologicoService
{
    @SuppressWarnings("unused")
    private @Autowired IExamenMedicoRadiologicoMapper examenMedicoRadiologicoMapper;

    private final static String UPDATE_TOMA_RAD = "UPDATE_TOMA_RAD";
    private static final String GET_ESTADO_EXA_MED = "GET_ESTADO_EXA_MED";
    private static final String INSERT_REG = "INSERT_REG";
    private static final String GET_UPDATE_REG = "GET_UPDATE_REG";

    public ExamenMedicoRadiologicoService(
            @Qualifier("IExamenMedicoRadiologicoMapper") IMantenibleMapper<ExamenMedicoRadiologico> mapper)
    {
        super(mapper);
        this.examenMedicoRadiologicoMapper = (IExamenMedicoRadiologicoMapper) mapper;
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public int generarNumeroRegistro(ExamenMedicoRadiologico examenMedicoRadiologico)
    {
        List<ExamenMedicoRadiologico> examenes = this
                .registrarAutoIncrementable(examenMedicoRadiologico);
        if (!examenes.isEmpty() && examenes.get(0).getNumeroRegistro() != null)
        {
            return examenes.get(0).getNumeroRegistro();
        } else
        {
            throw new MantenimientoException(ConstantesExcepciones.ERROR_REGISTRO);
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<ExamenMedicoRadiologico> buscarPorEstadoExamenMedico(String idEstadoExamenMedico)
    {
        ExamenMedicoRadiologico examenMedicoRadiologico = ExamenMedicoRadiologico.builder()
                .idEstadoExamenMedico(idEstadoExamenMedico).build();
        return this.buscar(examenMedicoRadiologico, GET_ESTADO_EXA_MED);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void actualizarTomaRadiologica(ExamenMedicoRadiologico examenMedicoRadiologico)
    {
        this.actualizar(examenMedicoRadiologico, UPDATE_TOMA_RAD);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void registrarExamenMedicoRegularRadiologico(
            ExamenMedicoRadiologico examenMedicoRadiologico)
    {
        this.registrar(examenMedicoRadiologico, INSERT_REG);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<ExamenMedicoRadiologico> buscarResultadoRegularPorNumeroRegistroAnio(
            Integer numeroRegistro, String anio)
    {
        ExamenMedicoRadiologico examenMedicoRadiologico = ExamenMedicoRadiologico.builder()
                .numeroRegistro(numeroRegistro).anio(anio).build();
        return this.buscar(examenMedicoRadiologico, GET_UPDATE_REG);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public boolean existeExamenMedicoRadiologico(Integer numeroRegistro, String anio)
    {
        ExamenMedicoRadiologico examenMedicoRadiologico = ExamenMedicoRadiologico.builder()
                .numeroRegistro(numeroRegistro).anio(anio).build();
        return this.existe(examenMedicoRadiologico);
    }
}