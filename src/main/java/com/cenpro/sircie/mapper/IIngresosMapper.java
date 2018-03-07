package com.cenpro.sircie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

import com.cenpro.sircie.mapper.base.IMantenibleMapper;
import com.cenpro.sircie.model.mantenimiento.Ingresos;
import com.cenpro.sircie.model.parametro.Parametro;

public interface IIngresosMapper extends IMantenibleMapper<Ingresos>{
	
	@Select(value = { "{call MANT_INGRESOS ( "
            + "#{verbo, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.codigoIngreso, jdbcType = INTEGER, mode = IN},"
            + "#{objeto.nombreAlumno, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.concepto, jdbcType = VARCHAR, mode = IN},"
            + "#{userAudit, jdbcType = VARCHAR, mode = IN})}" })
    @Options(statementType = StatementType.CALLABLE)
	public List<Ingresos> mantener(Parametro parametro);
	
}
