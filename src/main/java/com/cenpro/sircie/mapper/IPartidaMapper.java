package com.cenpro.sircie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

import com.cenpro.sircie.mapper.base.IMantenibleMapper;
import com.cenpro.sircie.model.mantenimiento.Partida;
import com.cenpro.sircie.model.parametro.Parametro;

public interface IPartidaMapper extends IMantenibleMapper<Partida>
{
	@Select(value = { "{call MANT_PARTIDA ( "
            + "#{verbo, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.clasificador, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.descripcion, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.descDetallada, jdbcType = VARCHAR, mode = IN},"
            + "#{objeto.CodigoTarea, jdbcType = NUMERIC, mode = IN})}"})
    @Options(statementType = StatementType.CALLABLE)
    public List<Partida> mantener(Parametro parametro);
}