package com.cenpro.sircie.service;

import java.util.List;

import com.cenpro.sircie.model.movimiento.ExamenMedicoLaboratorio;

public interface IExamenMedicoLaboratorioService extends IMantenibleService<ExamenMedicoLaboratorio>
{
    public int generarNumeroRegistro(ExamenMedicoLaboratorio examenMedicoLaboratorio);
    
    public List<ExamenMedicoLaboratorio> buscarPorEstadoExamenMedico(String idEstadoExamenMedico);
    
    public List<ExamenMedicoLaboratorio> buscarResultadoRegularPorNumeroRegistroAnio(Integer numeroRegistro, String anio);
    
    public void registrarExamenMedicoRegularLaboratorio(ExamenMedicoLaboratorio examenMedicoLaboratorio);
    
    public boolean existeExamenMedicoLaboratorio(Integer numeroRegistro, String anio);
}