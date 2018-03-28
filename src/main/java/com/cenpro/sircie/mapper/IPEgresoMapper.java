package com.cenpro.sircie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

import com.cenpro.sircie.mapper.base.IMantenibleMapper;
import com.cenpro.sircie.model.parametro.Parametro;
import com.cenpro.sircie.model.presupuesto.PresupuestoEgreso;


public interface IPEgresoMapper  extends IMantenibleMapper<PresupuestoEgreso>
{
	@Select(value = { "{call MANT_PRE_EGRESOS( "
            + "#{verbo, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.idPEgreso, jdbcType = NUMERIC, mode = IN},"
            + "#{objeto.codigoUnidad, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.codigoTarea, jdbcType = NUMERIC, mode = IN},"
            + "#{objeto.clasificador, jdbcType = VARCHAR, mode = IN},"
            
            + "#{objeto.idMes, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.año, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.importe, jdbcType = DOUBLE, mode = IN},"
            + "#{objeto.inicial, jdbcType = DOUBLE, mode = IN},"
			+ "#{userAudit, jdbcType = VARCHAR, mode = IN})}" })
    @Options(statementType = StatementType.CALLABLE)
    public List<PresupuestoEgreso> mantener(Parametro parametro);
}
