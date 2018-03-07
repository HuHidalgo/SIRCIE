package com.cenpro.sircie.service;

import java.util.List;

import com.cenpro.sircie.model.mantenimiento.Medico;

public interface IMedicoService extends IMantenibleService<Medico>
{
    public List<Medico> buscarTodos();

    public List<Medico> buscarPorTipoDocumentoNumeroDocumento(String idTipoDocumento,
            String numeroDocumento);

    public boolean existeMedico(String idTipoDocumento, String numeroDocumento);

    public void registrarMedico(Medico medico);

    public void actualizarMedico(Medico medico);

    public void eliminarMedico(Medico medico);
}