package com.cenpro.sircie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

import com.cenpro.sircie.model.criterio.CriterioBusquedaEnvioCorreo;
import com.cenpro.sircie.model.procesomanual.EnvioLote;

public interface IEjecucionProcesoManualMapper
{
    @Select(value = { "{call ENVIO_CORREO ( "
            + "#{idDestinoEnvio,    jdbcType = VARCHAR, mode = IN},"
            + "#{codigoFacultad,    jdbcType = INTEGER, mode = IN},"
            + "#{idCampania,        jdbcType = INTEGER, mode = IN},"
            + "#{fechaInicio,       jdbcType = DATE, mode = IN},"
            + "#{fechaFin,          jdbcType = DATE, mode = IN})}" })
    @Options(statementType = StatementType.CALLABLE)
    public List<EnvioLote> buscarAlumnosParaEnvioCorreo(CriterioBusquedaEnvioCorreo criterioBusquedaEnvioCorreo);
}