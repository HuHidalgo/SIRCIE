$(document).ready(function() {

	$formResultadoExamenMedico.validate({
		focusCleanup : true,
		rules : {
			idRPR : {
				required : true,
				lettersonly : true,
				selectlength : [ 1, 1 ]
			},
			dilucion : {
				required : true,
				digits : true,
				range : [ 2, 256 ]
			},
			idHemograma : {
				required : true,
				lettersonly : true,
				selectlength : [ 1, 1 ]
			},
			hemoglobina : {
				required : true,
				number : true,
				range : [ 1, 30 ]
			},
			observacion : {
				required : true,
				notOnlySpace : true,
				rangelength : [ 3, 250 ]
			}
		},
		messages : {
			idRPR : {
				required : "Seleccione un RPR.",
				lettersonly : "El valor de RPR debe contener solo car&aacute;cteres.",
				selectlength : "El valor de RPR debe contener 1 car&aacute;cter."
			},
			dilucion : {
				required : "Seleccione una Diluci&oacute;n.",
				digits : "La Diluci&oacute;n debe contener solo d&iacute;gitos.",
				range : "La Diluci&oacute;n debe estar entre 2 y 256."
			},
			idHemograma : {
				required : "Seleccione un Hemograma.",
				lettersonly : "El valor de Hemograma debe contener solo car&aacute;cteres.",
				selectlength : "El valor de Hemograma debe contener 1 car&aacute;cter.",
			},
			hemoglobina : {
				required : "Ingrese un valor de Hemoglobina.",
				number : "El valor de Hemoglobina debe contener solo n&uacute;meros.",
				range : "El valor de Hemoglobina debe estar entre 1 y 30."
			},
			observacion : {
				required : "Ingrese una Observaci&oacute;n.",
				notOnlySpace : "La Observaci&oacute;n no debe contener solo espacios en blanco.",
				rangelength : "La Observaci&oacute;n debe contener entre 3 y 250 car&aacute;cteres."
			}
		}
	});
});