$(document).ready(function() {

	var $local = {
		$tablaMantenimiento : $("#tablaMantenimiento"),
		tablaMantenimiento : "",
		$modalMantenimiento : $("#modalMantenimiento"),
		$aniadirMantenimento : $("#aniadirMantenimiento"),
		$registrarMantenimiento : $("#registrarMantenimiento"),
		$filaSeleccionada : "",
		$actualizarMantenimiento : $("#actualizarMantenimiento"),
		$tiposDocumento : $("#tiposDocumento"),
		$tiposDocumentoIdentidad : $("#tiposDocumentoIdentidad"),
		$tiposAdquisicion : $("#tiposAdquisicion"),
		$tiposEstado : $("#tiposEstado"),
		$fechaEnvio : $("#fechaEnvio"),
		codigoEgresoSeleccionado : 0,
		$unidades : $("#unidades"),
		$cursos : $("#cursos"),
		
		$tablaDetalleMantenimiento : $("#tablaDetalleMantenimiento"),
		tablaDetalleMantenimiento : "",
		$modalDetalleMantenimiento : $("#modalDetalleMantenimiento"),
		$aniadirDetalleMantenimiento : $("#aniadirDetalleMantenimiento"),
		$registrarDetalleMantenimiento : $("#registrarDetalleMantenimiento"),
		$filaDetalleSeleccionada : "",
		$actualizarDetalleMantenimiento : $("#actualizarDetalleMantenimiento"),
		$gastos : $("#gastos"),
		id_tablaSeleccionado : "" ,
	};

	$formMantenimiento = $("#formMantenimiento");
	$formDetalleMantenimiento = $("#formDetalleMantenimiento");
	
	/////////////////////////////////////////////////////////////////////////////////////////////////
	
	$funcionUtil.crearSelect2($local.$unidades, "Seleccione una Unidad");
	$funcionUtil.crearSelect2($local.$cursos, "Seleccione un Curso");
	$funcionUtil.crearSelect2($local.$tiposDocumento, "Seleccione Documento");
	$funcionUtil.crearSelect2($local.$tiposDocumentoIdentidad, "Seleccione tipo de Documento");
	$funcionUtil.crearSelect2($local.$tiposAdquisicion, "Seleccione Tipo de Adquisicion");
	$funcionUtil.crearSelect2($local.$tiposEstado, "Seleccione Estado");
	$funcionUtil.crearDatePickerSimple($local.$fechaEnvio, "DD/MM/YYYY");
	
	$.fn.dataTable.ext.errMode = 'none';

	$local.$tablaMantenimiento.on('xhr.dt', function(e, settings, json, xhr) {
		switch (xhr.status) {
		case 500:
			$local.tablaMantenimiento.clear().draw();
			break;
		}
	});

	$local.tablaMantenimiento = $local.$tablaMantenimiento.DataTable({
		"ajax" : {
			"url" : $variableUtil.root + "egresos/egresos?accion=buscarTodos",
			"dataSrc" : ""
		},
		"language" : {
			"emptyTable" : "No hay egresos registrados."
		},
		"initComplete" : function() {
			$local.$tablaMantenimiento.wrap("<div class='table-responsive'></div>");
			$tablaFuncion.aniadirFiltroDeBusquedaEnEncabezado(this, $local.$tablaMantenimiento);
		},
		"ordering" : false,
		"columnDefs" : [ {
			"targets" : [ 0, 1, 2 ],
			"className" : "all filtrable",
		}, {
			"targets" : 3,
			"className" : "all dt-center",
			"defaultContent" : $variableUtil.botonActualizar
		}, {
			"targets" : 4,
			"className" : "all dt-center",
			"defaultContent" : $variableUtil.botonActualizar + " " + $variableUtil.botonEliminar
		} ],
		"columns" : [ {
			"data" : function(row) {
				return $funcionUtil.convertirDeFormatoAFormato(row.fechaEnvio, "YYYY-MM-DD", "DD/MM/YYYY");
			},
			"title" : "Fecha"
		}, {
			"data" : "nroProgramacionGasto",
			"title" : "Programación de Gasto"
		}, {
			"data" : "estado",
			"title" : "Estado"
		}, {
			"data" : null,
			"title" : "Gastos"
		}, {
			"data" : null,
			"title" : 'Acción'
		} ]
	});

	$local.$tablaMantenimiento.find("thead").on('keyup', 'input.filtrable', function() {
		$local.tablaMantenimiento.column($(this).parent().index() + ':visible').search(this.value).draw();
	});
	
	$local.$modalMantenimiento.PopupWindow({
		title : "Mantenimiento de Egresos",
		autoOpen : false,
		modal : false,
		height : 550,
		width : 1100,
		top : 40
	});

	$local.$aniadirMantenimento.on("click", function() {
		$funcionUtil.prepararFormularioRegistro($formMantenimiento);
		$local.$actualizarMantenimiento.addClass("hidden");
		$local.$registrarMantenimiento.removeClass("hidden");
		$local.$modalMantenimiento.PopupWindow("open");
	});

	$local.$modalMantenimiento.on("open.popupwindow", function() {
		$formMantenimiento.find("input:not([disabled]):first").focus();
	});

	$local.$modalMantenimiento.on("close.popupwindow", function() {
		$local.codigoEgresoSeleccionado = 0;
	});

	$formMantenimiento.find("input").keypress(function(event) {
		if (event.which == 13) {
			if (!$local.$registrarMantenimiento.hasClass("hidden")) {
				$local.$registrarMantenimiento.trigger("click");
				return false;
			} else {
				if (!$local.$actualizarMantenimiento.hasClass("hidden")) {
					$local.$actualizarMantenimiento.trigger("click");
				}
				return false;
			}
		}
	});
	
	$local.$unidades.on("change", function(event, opcionSeleccionada) {
		var codigoUnidad = $(this).val();
		if (codigoUnidad == null || codigoUnidad == undefined) {
			$local.$cursos.find("option:not(:eq(0))").remove();
			return;
		}
		$.ajax({
			type : "GET",
			url : $variableUtil.root + "mantenimiento/curso/unidad/" + codigoUnidad,
			beforeSend : function(xhr) {
				$local.$cursos.find("option:not(:eq(0))").remove();
				$local.$cursos.parent().append("<span class='help-block cargando'><i class='fa fa-spinner fa-pulse fa-fw'></i> Cargando Cursos</span>")
			},
			statusCode : {
				400 : function(response) {
					$funcionUtil.limpiarMensajesDeError($formMantenimiento);
					$funcionUtil.mostrarMensajeDeError(response.responseJSON, $formMantenimiento);
				}
			},
			success : function(cursos) {
				$.each(cursos, function(i, curso) {
					$local.$cursos.append($("<option />").val(this.codigoCurso).text(this.codigoCurso + " - " + this.nombreCurso));
				});
				if (opcionSeleccionada != null && opcionSeleccionada != undefined) {
					$local.$cursos.val(opcionSeleccionada).trigger("change.select2");
				}
			},
			complete : function() {
				$local.$cursos.parent().find(".cargando").remove();
			}
		});
	});
		
	$local.$registrarMantenimiento.on("click", function() {
		if (!$formMantenimiento.valid()) {
			return;
		}
		var ingresos = $formMantenimiento.serializeJSON();
		ingresos.fechaVF = $local.$fechaVF.data("daterangepicker").startDate.format('YYYY-MM-DD');
		$.ajax({
			type : "POST",
			url : $variableUtil.root + "egresos/egresos",
			data : JSON.stringify(ingresos),
			beforeSend : function(xhr) {
				$local.$registrarMantenimiento.attr("disabled", true).find("i").removeClass("fa-floppy-o").addClass("fa-spinner fa-pulse fa-fw");
				xhr.setRequestHeader('Content-Type', 'application/json');
				xhr.setRequestHeader("X-CSRF-TOKEN", $variableUtil.csrf);
			},
			statusCode : {
				400 : function(response) {
					$funcionUtil.limpiarMensajesDeError($formMantenimiento);
					$funcionUtil.mostrarMensajeDeError(response.responseJSON, $formMantenimiento);
				}
			},
			success : function(ingresos) {
				$funcionUtil.notificarException($variableUtil.registroExitoso, "fa-check", "Aviso", "success");
				var ingreso = ingresos[0];
				var row = $local.tablaMantenimiento.row.add(ingreso).draw();
				row.show().draw(false);
				$(row.node()).animateHighlight();
				$local.$modalMantenimiento.PopupWindow("close");
			},
			error : function(response) {
			},
			complete : function(response) {
				$local.$registrarMantenimiento.attr("disabled", false).find("i").addClass("fa-floppy-o").removeClass("fa-spinner fa-pulse fa-fw");
			}
		});
	});

	$local.$tablaMantenimiento.children("tbody").on("click", ".actualizar", function() {
		$local.flag = 1;
		$funcionUtil.prepararFormularioActualizacion($formMantenimiento);
		$local.$filaSeleccionada = $(this).parents("tr");
		var ingresos = $local.tablaMantenimiento.row($local.$filaSeleccionada).data();
		console.log(ingresos);
		$local.codigoIngresoSeleccionado = ingresos.idIngreso;
		$local.importe = ingresos.importe;
		$local.codigoClienteSeleccionado = ingresos.nroDocCliente;
		$local.codigoCursoSeleccionado = ingresos.codigoCurso;
		$funcionUtil.llenarFormulario(ingresos, $formMantenimiento);
		$local.$unidades.trigger("change", [ ingresos.codigoCurso ]);
		$local.$importe.val(ingresos.importe);
		$local.$actualizarMantenimiento.removeClass("hidden");
		$local.$registrarMantenimiento.addClass("hidden");
		$local.$modalMantenimiento.PopupWindow("open");
	});

	$local.$actualizarMantenimiento.on("click", function() {
		if (!$formMantenimiento.valid()) {
			return;
		}
		var ingresos = $formMantenimiento.serializeJSON();
		ingresos.idIngreso = $local.codigoIngresoSeleccionado;
		ingresos.importe = $local.importe;
		ingresos.idConcepto = $local.codigoConceptoSeleccionado;
		ingresos.nroDocCliente = $local.codigoClienteSeleccionado;
		ingresos.fechaRI = $local.$fechaRI.data("daterangepicker").startDate.format('YYYY-MM-DD');
		$.ajax({
			type : "PUT",
			url : $variableUtil.root + "ingresos/ingresos",
			data : JSON.stringify(ingresos),
			beforeSend : function(xhr) {
				$local.$actualizarMantenimiento.attr("disabled", true).find("i").removeClass("fa-pencil-square").addClass("fa-spinner fa-pulse fa-fw");
				xhr.setRequestHeader('Content-Type', 'application/json');
				xhr.setRequestHeader("X-CSRF-TOKEN", $variableUtil.csrf);
			},
			statusCode : {
				400 : function(response) {
					$funcionUtil.limpiarMensajesDeError($formMantenimiento);
					$funcionUtil.mostrarMensajeDeError(response.responseJSON, $formMantenimiento);
				}
			},
			success : function(ingresos) {
				$funcionUtil.notificarException($variableUtil.actualizacionExitosa, "fa-check", "Aviso", "success");
				var row = $local.tablaMantenimiento.row($local.$filaSeleccionada).data(ingresos[0]).draw();
				row.show().draw(false);
				$(row.node()).animateHighlight();
				$local.$modalMantenimiento.PopupWindow("close");
			},
			error : function(response) {
			},
			complete : function(response) {
				$local.$actualizarMantenimiento.attr("disabled", false).find("i").addClass("fa-pencil-square").removeClass("fa-spinner fa-pulse fa-fw");
			}
		});
	});
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	$local.$tablaDetalleMantenimiento.on('xhr.dt', function(e, settings, json, xhr) {
		switch (xhr.status) {
		case 500:
			$local.tablaDetalleMantenimiento.clear().draw();
			break;
		}
	});
	
	$local.tablaDetalleMantenimiento = $local.$tablaDetalleMantenimiento.DataTable({
		"language" : {
			"emptyTable" : "No hay gastos registrados."
		},
		"initComplete" : function() {
			$tablaFuncion.aniadirFiltroDeBusquedaEnEncabezado(this, $local.$tablaDetalleMantenimiento);
		},
		"columnDefs" : [ {
			"targets" : 0,
			"className" : "all filtrable",
			"width" : "5%",
		}, {
			"targets" : 1,
			"className" : "all  filtrable",
			"width" : "5%",
		}, {
			"targets" : 2,
			"className" : "all  filtrable",
		}, {
			"targets" : 3,
			"className" : "all  filtrable",
		}, {
			"targets" : 4,
			"className" : "all  filtrable",
		}, {
			"targets" : 5,
			"className" : "all dt-center",
			"width" : "10%",
			"defaultContent" : $variableUtil.botonActualizar + " " + $variableUtil.botonEliminar
		} ],
		"columns" : [ {
			"data" : 'docReferencia',
			"title" : "Documento de Referencia"
		}, {
			"data" : 'detalleGasto',
			"title" : "Detalle"
		}, {
			"data" : 'nombreUnidad',
			"title" : "Solicitante"
		}, {
			"data" : 'clasificador',
			"title" : "Partida"
		}, {
			"data" : 'monto',
			"title" : "Monto"
		}, {
			"data" : null,
			"title" : 'Acción'
		} ]
	});
	
	$local.$tablaDetalleMantenimiento.wrap("<div class='table-responsive'></div>");

	$local.$tablaDetalleMantenimiento.find("thead").on('keyup', 'input', function() {
		$local.tablaDetalleMantenimiento.column($(this).parent().index() + ':visible').search(this.value).draw();
	});

	$local.$tablaDetalleMantenimiento.find("thead").on('change', 'select', function() {
		var val = $.fn.dataTable.util.escapeRegex($(this).val());
		$local.tablaDetalleMantenimiento.column($(this).parent().index() + ':visible').search(val ? '^' + val + '$' : '', true, false).draw();
	});

	$local.$modalDetalleMantenimiento.PopupWindow({
		title : "Mantenimiento de Gastos",
		autoOpen : false,
		modal : false,
		height : 500,
		width : 900,
	});
	
	$local.$gastos.on("click", function() {
		$funcionUtil.prepararFormularioRegistro($formDetalleMantenimiento);
		$local.$actualizarDetalleMantenimiento.addClass("hidden");
		$local.$registrarDetalleMantenimiento.removeClass("hidden");
		$local.$modalMantenimiento.PopupWindow("hidden");
		$local.$modalDetalleMantenimiento.PopupWindow("open");
	});
	
	$local.$aniadirDetalleMantenimiento.on("click", function() {
		$funcionUtil.prepararFormularioRegistro($formDetalleMantenimiento);
		$local.$actualizarDetalleMantenimiento.addClass("hidden");
		$local.$registrarDetalleMantenimiento.removeClass("hidden");
		$local.$modalDetalleMantenimiento.PopupWindow("open");
	});

	$local.$modalDetalleMantenimiento.on("open.popupwindow", function() {
		$formDetalleMantenimiento.find("input:first").focus();
	});

	$local.$modalDetalleMantenimiento.on("close.popupwindow", function() {
		$local.id_tablaSeleccionado = "";
	});

	$formDetalleMantenimiento.find("input").keypress(function(event) {
		if (event.which == 13) {
			if (!$local.$registrarDetalleMantenimiento.hasClass("hidden")) {
				$local.$registrarDetalleMantenimiento.trigger("click");
				return false;
			} else {
				if (!$local.$actualizarDetalleMantenimiento.hasClass("hidden")) {
					$local.$actualizarDetalleMantenimiento.trigger("click");
				}
				return false;
			}
		}
	});
});