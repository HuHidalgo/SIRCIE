$(document).ready(function() {

	$formMantenimiento.validate({
		focusCleanup : true,
		rules : {
			nombreAlumno : {
				required : true,
				notOnlySpace : true
			},
			concepto : {
				required : true,
				notOnlySpace : true
			}
		},
		messages : {
			nombreAlumno : {
				required : "Ingrese nombre de alumno.",
				notOnlySpace : "El nombre de alumno no puede contener solo espacios en blanco."
			},
			concepto : {
				required : "Ingrese un concepto de pago",
				notOnlySpace : "El concepto de pago no puede contener solo espacios en blanco."
			}
		}
	});
});