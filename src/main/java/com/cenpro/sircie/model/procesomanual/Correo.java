package com.cenpro.sircie.model.procesomanual;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Correo
{
    private String correoDestino;
    private byte[] documento;
    private String contentType;
}