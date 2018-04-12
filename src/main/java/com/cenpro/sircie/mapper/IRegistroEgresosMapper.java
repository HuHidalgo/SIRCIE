package com.cenpro.sircie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

import com.cenpro.sircie.mapper.base.IMantenibleMapper;
import com.cenpro.sircie.model.egresos.Egresos;
import com.cenpro.sircie.model.ingresos.Ingresos;
import com.cenpro.sircie.model.parametro.Parametro;

public interface IRegistroEgresosMapper extends IMantenibleMapper<Egresos>{
	
	@Select(value = { "{call MANT_INGRESOS ( "
            + "#{verbo, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.idEgreso, jdbcType = INTEGER, mode = IN},"
            + "#{objeto.codigoUnidad, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.nroDocProveedor, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.nombreProveedor, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.tipoDocProveedor, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.documento, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.docReferencia, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.estado, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.importe, jdbcType = NUMERIC, mode = IN},"
            + "#{objeto.codigoCurso, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.nroProgramacionGasto, jdbcType = INTEGER, mode = IN},"
            + "#{objeto.fechaEnvio, jdbcType = DATE, mode = IN},"
            + "#{userAudit, jdbcType = VARCHAR, mode = IN})}" })
    @Options(statementType = StatementType.CALLABLE)
	public List<Egresos> mantener(Parametro parametro);
	
}
