package com.cenpro.sircie.service.excepcion;

public class CargaArchivoException extends SimpException
{
    private static final long serialVersionUID = 1L;

    public CargaArchivoException(String mensaje)
    {
        super(mensaje);
    }
}