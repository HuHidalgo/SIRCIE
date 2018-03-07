package com.cenpro.sircie.model.movimiento;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.cenpro.sircie.utilitario.MultiTablaUtil;
import com.cenpro.sircie.validacion.MultitabDet;
import com.cenpro.sircie.validacion.NumRegRadiologico;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public @NumRegRadiologico class ExamenMedicoRadiologico
{
    private Integer numeroRegistro;
    private String anio;

    @MultitabDet(campoIdItem = "idResultadoRadiologico", idTabla = MultiTablaUtil.TABLA_RESULTADO_RADIOLOGICO, existe = true, min = 1, max = 1)
    private String idResultadoRadiologico;

    @Length(max = 250, message = "{Length.ExamenMedicoRadiologico.observacion}")
    private String observacion;

    // DATOS ADICIONALES
    private String codigoAlumno;
    private String tipoAlumno;
    private String descripcionTipoAlumno;
    private String descripcionResultadoRadiologico;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String nombres;
    private int edad;
    private String idSexo;
    private String descripcionSexo;
    private String descripcionEscuela;
    private Integer idCampania;
    private String descripcionCampania;
    private String idEstadoExamenMedico;
    private String descripcionEstadoExamenMedico;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm", timezone = "EST")
    private Date fechaGeneracionNumeroRegistro;
}