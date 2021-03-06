package com.cenpro.sircie.validacion.grupo.secuencia;

import javax.validation.GroupSequence;

import com.cenpro.sircie.validacion.grupo.ILlave;
import com.cenpro.sircie.validacion.grupo.accion.IActualizacion;

@GroupSequence({ ILlave.class, IActualizacion.class })
public interface ISecuenciaValidacionEliminacion
{

}