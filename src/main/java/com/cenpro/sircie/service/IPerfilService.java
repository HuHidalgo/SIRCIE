package com.cenpro.sircie.service;

import java.util.List;

import com.cenpro.sircie.model.seguridad.Perfil;

public interface IPerfilService extends IMantenibleService<Perfil>
{
    public List<Perfil> buscarTodos();
}