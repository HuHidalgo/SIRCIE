package com.cenpro.sircie.model.movimiento;

import java.util.Date;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.cenpro.sircie.utilitario.MultiTablaUtil;
import com.cenpro.sircie.validacion.Dilucion;
import com.cenpro.sircie.validacion.MultitabDet;
import com.cenpro.sircie.validacion.NumRegLaboratorio;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Dilucion
public @NumRegLaboratorio class ExamenMedicoLaboratorio
{
    private Integer numeroRegistro;
    private String anio;

    @MultitabDet(campoIdItem = "idRPR", idTabla = MultiTablaUtil.TABLA_RPR, existe = true, min = 1, max = 1)
    private String idRPR;
    private String dilucion;

    @MultitabDet(campoIdItem = "idHemograma", idTabla = MultiTablaUtil.TABLA_HEMOGRAMA, existe = true, min = 1, max = 1)
    private String idHemograma;

    @NotNull(message = "{NotNull.ExamenMedicoLaboratorio.hemoglobina}")
    @Digits(integer = 4, fraction = 2, message = "{Digits.ExamenMedicoLaboratorio.hemoglobina}")
    @Range(min = 1, max = 30, message = "{Range.ExamenMedicoLaboratorio.hemoglobina}")
    private Double hemoglobina;

    @Length(max = 250, message = "{Length.ExamenMedicoLaboratorio.observacion}")
    private String observacion;

    // DATOS ADICIONALES
    private String codigoAlumno;
    private String tipoAlumno;
    private Integer idCampania;

    private String descripcionTipoAlumno;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String nombres;
    private int edad;
    private String idSexo;
    private String descripcionSexo;
    private String descripcionFacultad;
    private String descripcionEscuela;
    private String descripcionRPR;
    private String descripcionHemograma;
    private String descripcionCampania;
    private String idEstadoExamenMedico;
    private String descripcionEstadoExamenMedico;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm", timezone = "EST")
    private Date fechaGeneracionNumeroRegistro;
}