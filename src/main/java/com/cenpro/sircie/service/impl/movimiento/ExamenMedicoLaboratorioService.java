package com.cenpro.sircie.service.impl.movimiento;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cenpro.sircie.mapper.IExamenMedicoLaboratorioMapper;
import com.cenpro.sircie.mapper.base.IMantenibleMapper;
import com.cenpro.sircie.model.movimiento.ExamenMedicoLaboratorio;
import com.cenpro.sircie.service.IExamenMedicoLaboratorioService;
import com.cenpro.sircie.service.excepcion.MantenimientoException;
import com.cenpro.sircie.service.impl.MantenibleService;
import com.cenpro.sircie.utilitario.ConstantesExcepciones;

@Service
public class ExamenMedicoLaboratorioService extends MantenibleService<ExamenMedicoLaboratorio>
        implements IExamenMedicoLaboratorioService
{
    @SuppressWarnings("unused")
    private IExamenMedicoLaboratorioMapper examenMedicoLaboratorioMapper;

    private static final String GET_ESTADO_EXA_MED = "GET_ESTADO_EXA_MED";
    private static final String GET_UPDATE_REG = "GET_UPDATE_REG";
    private static final String INSERT_REG = "INSERT_REG";

    public ExamenMedicoLaboratorioService(
            @Qualifier("IExamenMedicoLaboratorioMapper") IMantenibleMapper<ExamenMedicoLaboratorio> mapper)
    {
        super(mapper);
        this.examenMedicoLaboratorioMapper = (IExamenMedicoLaboratorioMapper) mapper;
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public int generarNumeroRegistro(ExamenMedicoLaboratorio examenMedicoLaboratorio)
    {
        List<ExamenMedicoLaboratorio> examenes = this
                .registrarAutoIncrementable(examenMedicoLaboratorio);
        if (!examenes.isEmpty() && examenes.get(0).getNumeroRegistro() != null)
        {
            return examenes.get(0).getNumeroRegistro();
        } else
        {
            throw new MantenimientoException(ConstantesExcepciones.ERROR_REGISTRO);
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<ExamenMedicoLaboratorio> buscarPorEstadoExamenMedico(String idEstadoExamenMedico)
    {
        ExamenMedicoLaboratorio examenMedicoLaboratorio = ExamenMedicoLaboratorio.builder()
                .idEstadoExamenMedico(idEstadoExamenMedico).build();
        return this.buscar(examenMedicoLaboratorio, GET_ESTADO_EXA_MED);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void registrarExamenMedicoRegularLaboratorio(
            ExamenMedicoLaboratorio examenMedicoLaboratorio)
    {
        this.registrar(examenMedicoLaboratorio, INSERT_REG);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<ExamenMedicoLaboratorio> buscarResultadoRegularPorNumeroRegistroAnio(
            Integer numeroRegistro, String anio)
    {
        ExamenMedicoLaboratorio examenMedicoLaboratorio = ExamenMedicoLaboratorio.builder()
                .numeroRegistro(numeroRegistro).anio(anio).build();
        return this.buscar(examenMedicoLaboratorio, GET_UPDATE_REG);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public boolean existeExamenMedicoLaboratorio(Integer numeroRegistro, String anio)
    {
        ExamenMedicoLaboratorio examenMedicoLaboratorio = ExamenMedicoLaboratorio.builder()
                .numeroRegistro(numeroRegistro).anio(anio).build();
        return this.existe(examenMedicoLaboratorio);
    }
}