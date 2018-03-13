package com.cenpro.sircie.service;

import java.util.List;

import com.cenpro.sircie.model.mantenimiento.Escuela;

public interface IEscuelaService extends IMantenibleService<Escuela>
{
    public List<Escuela> buscarTodos();

    public List<Escuela> buscarPorCodigoFacultadCodigoEscuela(Integer codigoFacultad, Integer codigoEscuela);

    public List<Escuela> buscarPorCodigoFacultad(Integer codigoFacultad);

    public void registrarEscuela(Escuela escuela);

    public void actualizarEscuela(Escuela escuela);

    public void eliminarEscuela(Escuela escuela);
}