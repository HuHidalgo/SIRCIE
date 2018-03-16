$(document).ready(function() {

	var $local = {
		$tablaMantenimiento : $("#tablaMantenimiento"),
		tablaMantenimiento : "",
		$modalMantenimiento : $("#modalMantenimiento"),
		$aniadirMantenimento : $("#aniadirMantenimiento"),
		$registrarMantenimiento : $("#registrarMantenimiento"),
		$filaSeleccionada : "",
		$tiposDocumento : $("#tiposDocumento"),
		$tiposMoneda : $("#tiposMoneda"),
		$actualizarMantenimiento : $("#actualizarMantenimiento"),
		$fechaVF : $("#fechaVF"),
		$fechaRI : $("#fechaRI"),
		codigoIngresoSeleccionado : 0,
		codigoUnidadSeleccionado : "",
		codigoConceptoSeleccionado : "",
		//codigoIngresoSeleccionado : 0,
		$unidades : $("#unidades"),
		$conceptos : $("#conceptos")
	};

	$formMantenimiento = $("#formMantenimiento");
	
	$funcionUtil.crearSelect2($local.$unidades, "Seleccione una Unidad");
	$funcionUtil.crearSelect2($local.$conceptos, "Seleccione un Concepto de pago");
	$funcionUtil.crearSelect2($local.$tiposDocumento, "Seleccione un Tipo de Documento");
	$funcionUtil.crearSelect2($local.$tiposMoneda, "Seleccione un Tipo de Moneda");
	$funcionUtil.crearDatePickerSimple($local.$fechaVF, "DD/MM/YYYY");
	$funcionUtil.crearDatePickerSimple($local.$fechaRI, "DD/MM/YYYY");
	
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
			"url" : $variableUtil.root + "mantenimiento/ingresos?accion=buscarTodos",
			"dataSrc" : ""
		},
		"language" : {
			"emptyTable" : "No hay ingresos registrados."
		},
		"initComplete" : function() {
			$local.$tablaMantenimiento.wrap("<div class='table-responsive'></div>");
			$tablaFuncion.aniadirFiltroDeBusquedaEnEncabezado(this, $local.$tablaMantenimiento);
		},
		"columnDefs" : [ {
			"targets" : [ 0, 1, 2, 3, 4, 5 ],
			"className" : "all filtrable",
		}, {
			"targets" : 6,
			"className" : "all dt-center",
			"defaultContent" : $variableUtil.botonActualizar
		} ],
		"columns" : [ {
			"data" : "fechaVF",
			"title" : "Fecha"
		}, {
			"data" : function(row) {
				return $funcionUtil.unirCodigoDescripcion(row.nroConceptoUnidad, row.nombreUnidad);
			},
			"title" : "Unidad"
		}, {
			"data" : function(row) {
				return $funcionUtil.unirCodigoDescripcion(row.nroConceptoEsp, row.nomConceptoEsp);
			},
			"title" : "Concepto"
		}, {
			"data" : "importe",
			"title" : "Importe"
		}, {
			"data" : "importeDescontado",
			"title" : "Descuento"
		}, {
			"data" : "nombreCurso",
			"title" : "Curso"
		}, {
			"data" : null,
			"title" : 'Acción'
		} ]
	});

	$local.$tablaMantenimiento.find("thead").on('keyup', 'input.filtrable', function() {
		$local.tablaMantenimiento.column($(this).parent().index() + ':visible').search(this.value).draw();
	});

	$local.$modalMantenimiento.PopupWindow({
		title : "Mantenimiento de Ingresos",
		autoOpen : false,
		modal : false,
		height : 550,
		width : 1000
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
		$local.codigoIngresoSeleccionado = 0;
		$codigoUnidadSeleccionado : "";
		$codigoConceptoSeleccionado : "";
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
			$local.$conceptos.find("option:not(:eq(0))").remove();
			return;
		}
		$.ajax({
			type : "GET",
			url : $variableUtil.root + "mantenimiento/concepto/unidad/" + codigoUnidad,
			beforeSend : function(xhr) {
				$local.$conceptos.find("option:not(:eq(0))").remove();
				$local.$conceptos.parent().append("<span class='help-block cargando'><i class='fa fa-spinner fa-pulse fa-fw'></i> Cargando Conceptos</span>")
			},
			statusCode : {
				400 : function(response) {
					$funcionUtil.limpiarMensajesDeError($formMantenimiento);
					$funcionUtil.mostrarMensajeDeError(response.responseJSON, $formMantenimiento);
				}
			},
			success : function(conceptos) {
				$.each(conceptos, function(i, concepto) {
					$local.$conceptos.append($("<option />").val(this.idConcepto).text(this.nroConceptoEsp + " - " + this.nomConceptoEsp + " - " + this.importe));
				});
				if (opcionSeleccionada != null && opcionSeleccionada != undefined) {
					$local.$conceptos.val(opcionSeleccionada).trigger("change.select2");
				}
			},
			complete : function() {
				$local.$conceptos.parent().find(".cargando").remove();
			}
		});
	});
	
	$local.$registrarMantenimiento.on("click", function() {
		if (!$formMantenimiento.valid()) {
			return;
		}
		var ingresos = $formMantenimiento.serializeJSON();
		ingresos.fechaVF = $local.$fechaVF.data("daterangepicker").startDate.format('YYYY-MM-DD');
		ingresos.fechaRI = $local.$fechaRI.data("daterangepicker").startDate.format('YYYY-MM-DD');
		$.ajax({
			type : "POST",
			url : $variableUtil.root + "mantenimiento/ingresos",
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
		$funcionUtil.prepararFormularioActualizacion($formMantenimiento);
		$local.$filaSeleccionada = $(this).parents("tr");
		var ingresos = $local.tablaMantenimiento.row($local.$filaSeleccionada).data();
		$local.codigoIngresoSeleccionado = ingresos.codigoIngreso;
		$local.codigoUnidadSeleccionado = ingresos.codigoUnidad;
		$local.codigoConceptoSeleccionado = ingresos.idConcepto;
		$funcionUtil.llenarFormulario(ingresos, $formMantenimiento);
		$local.$actualizarMantenimiento.removeClass("hidden");
		$local.$registrarMantenimiento.addClass("hidden");
		$local.$modalMantenimiento.PopupWindow("open");
	});

	$local.$actualizarMantenimiento.on("click", function() {
		if (!$formMantenimiento.valid()) {
			return;
		}
		var ingresos = $formMantenimiento.serializeJSON();
		ingresos.codigoIngreso = $local.codigoIngresoSeleccionado;
		ingresos.codigoUnidad = $local.codigoUnidadSeleccionado;
		ingresos.idConcepto = $local.codigoConceptoSeleccionado;
		$.ajax({
			type : "PUT",
			url : $variableUtil.root + "mantenimiento/ingresos",
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
			success : function(response) {
				$funcionUtil.notificarException(response, "fa-check", "Aviso", "success");
				var row = $local.tablaMantenimiento.row($local.$filaSeleccionada).data(ingresos).draw();
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
});