package com.cenpro.sircie.service.impl.mantenimiento;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cenpro.sircie.mapper.IMedicoMapper;
import com.cenpro.sircie.mapper.base.IMantenibleMapper;
import com.cenpro.sircie.model.mantenimiento.Medico;
import com.cenpro.sircie.service.IMedicoService;
import com.cenpro.sircie.service.impl.MantenibleService;
import com.cenpro.sircie.utilitario.Verbo;

@Service
public class MedicoService extends MantenibleService<Medico> implements IMedicoService
{
    @SuppressWarnings("unused")
    private IMedicoMapper medicoMapper;

    public MedicoService(@Qualifier("IMedicoMapper") IMantenibleMapper<Medico> mapper)
    {
        super(mapper);
        this.medicoMapper = (IMedicoMapper) mapper;
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<Medico> buscarTodos()
    {
        return this.buscar(new Medico(), Verbo.GETS);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public List<Medico> buscarPorTipoDocumentoNumeroDocumento(String idTipoDocumento,
            String numeroDocumento)
    {
        Medico medico = Medico.builder().idTipoDocumento(idTipoDocumento)
                .numeroDocumento(numeroDocumento).build();
        return this.buscar(medico, Verbo.GET);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public boolean existeMedico(String idTipoDocumento, String numeroDocumento)
    {
        Medico medico = Medico.builder().idTipoDocumento(idTipoDocumento)
                .numeroDocumento(numeroDocumento).build();
        return this.existe(medico);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void registrarMedico(Medico medico)
    {
        this.registrar(medico);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void actualizarMedico(Medico medico)
    {
        this.actualizar(medico);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void eliminarMedico(Medico medico)
    {
        this.eliminar(medico);
    }
}