package com.cenpro.sircie.service.excepcion;

public class ListaVaciaException extends SimpException
{
    private static final long serialVersionUID = 1L;

    public ListaVaciaException(String mensaje)
    {
        super(mensaje);
    }
}