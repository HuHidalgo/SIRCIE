package com.cenpro.sircie.model.movimiento;

import org.hibernate.validator.constraints.Length;

import com.cenpro.sircie.utilitario.MultiTablaUtil;
import com.cenpro.sircie.validacion.MultitabDet;
import com.cenpro.sircie.validacion.NumRegPsicologico;
import com.cenpro.sircie.validacion.grupo.accion.IActualizacion;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExamenMedicoPsicologico
{
    @NumRegPsicologico(existe = true, groups = IActualizacion.class)
    private Integer numeroRegistro;

    @MultitabDet(campoIdItem = "idResultadoPsicologico", idTabla = MultiTablaUtil.TABLA_RESULTADO_PSICOLOGICO, existe = true, min = 1, max = 1)
    private String idResultadoPsicologico;

    @Length(max = 250, message = "{Length.ExamenPsicologico.observacion}")
    private String observacion;

    private String codigoAlumno;
    private String tipoAlumno;
    private String descripcionTipoAlumno;
    private String descripcionResultadoPsicologico;
    private Integer idCampania;
    private String descripcionCampania;
    private String idEstadoExamenMedico;
    private String descripcionEstadoExamenMedico;
}