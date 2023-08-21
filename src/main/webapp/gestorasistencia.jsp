<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Alfonso Ugarte</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="https://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<script src="https://unpkg.com/jspdf-autotable"></script>
<script src="https://unpkg.com/jspdf "></script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="container">
		<h1 class="text-center">CRUD DE GESTOR ASISTENCIA</h1>
		<!-- Card de datos de entrada -->
		<div class="card mx-auto" style="max-width: 600px;">
			<div class="card-header">Criterios de búsqueda</div>
			<div class="card-body">
				<form method="post" action="#">
					<div class="mb-3 row">
						<div class="col-sm-4">
							<input type="text" class="form-control" id="apellido"
								name="apellido" placeholder="Ingrese apellido">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="nombre" name="nombre"
								placeholder="Ingrese nombre">
						</div>

						<div class="col-sm-4">
							<input type="text" class="form-control" id="numeroDocumento"
								name="numeroDocumento" placeholder="Ingrese DNI">
						</div>

						<div class="col-sm-2">
							<button type="button" class="btn btn-primary mb-3 btn-rojo"
								id="btnBuscar" name="btnBuscar">Buscar</button>
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-primary mb-3 btn-rojo"
								id="btnNuevo" name="btnNuevo" data-toggle="modal"
								data-target="#exampleModal">Nuevo</button>
							<!-- Custom CSS -->
							<style>
.btn-rojo {
	background-color: red;
	color: white;
}
</style>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br />
	<div class="card-body text-center">
		<div class="row justify-content-end">
			<div class="col-md-6">
				<div
					class="form-check form-switch mt-3 d-flex justify-content-end align-items-center">

					<input class="form-check-input" type="checkbox" role="switch"
						id="flexSwitchCheckDefault" checked> <label
						class="form-check-label ms-2 mb-0" for="flexSwitchCheckDefault"
						id="labelSwitch">Activo </label>

				</div>
			</div>
		</div>
	</div>

	<div class="container custom-container">
		<div class="row justify-content-end mt-4">
			<div class="col-md-10">
				<div class="text-right" style="margin-right: 50px;">
					<table class="table table-striped" id="tblGestorAsistencia">
						<thead>
							<tr>
								<th>id</th>
								<th>nombre</th>
								<th>apellido</th>
								<th>celular</th>
								<th>dni</th>
								<th>email</th>
								<th>fecha</th>
								<th class="no-export">accion</th>
							</tr>
						</thead>
						<tbody id="listassistance_manager">
							<!-- Agrega aquí las filas de datos si es necesario -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<div style="text-align: center;">
		<button class="exportToExcel"
			style="background-color: #FF4136; border: none; color: white; text-align: center; text-decoration: none; display: inline-block; font-size: 14px; margin-right: 6px; cursor: pointer; border-radius: 4px;">
			<i class="fas fa-file-excel"></i> Exportar Excel
		</button>

		<button id="exportBtn"
			style="background-color: #FF4136; border: none; color: white; text-align: center; text-decoration: none; display: inline-block; font-size: 14px; margin-right: 6px; cursor: pointer; border-radius: 4px;">Exportar
			PDF</button>

		<button type="button" class="cancel-button"
			onclick="window.location.href='reporteCsv.jsp'"
			style="background-color: #FF4136; border: none; color: white; text-align: center; text-decoration: none; display: inline-block; font-size: 14px; margin-right: 6px; cursor: pointer; border-radius: 4px;">Exportar
			Csv</button>
	</div>


	<!-- Modal  crear-->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Nuevo
						GestorAsistencia</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mb-10 row">
						<form method="post" action="#">
							<div class="col-sm-8">
								<label for="validationCustom01" class="form-label">Ingrese
									Apellido</label> <input type="text" class="form-control"
									id="apellido_n" name="apellido" oninput="lettersOnly(this)"
									onblur="campoRequerido(this)">
								<div class="invalid-feedback">El campo Apellido es
									obligatorio</div>
							</div>
							<br>
							<div class="col-sm-8">
								<label for="validationCustom01" class="form-label">Ingrese
									Nombre</label> <input type="text" class="form-control" id="nombre_n"
									name="nombre" oninput="lettersOnly(this)"
									onblur="campoRequerido(this)">
								<div class="invalid-feedback">El campo de Nombre es
									obligatorio</div>
							</div>
							<br>
							<div class="col-sm-8">
								<label for="validationCustom01" class="form-label">Selecione
									el tipo de Documento DNI</label> <select class="form-select"
									onblur="campoRequerido(this)" id="tipoDocumento_n"
									aria-label="Default select example">
									<option selected>Seleccione el tipo de documento</option>
									<option value="DNI">DNI</option>
								</select>
								<div class="invalid-feedback">El campo de tipo es
									obligatorio</div>
							</div>
							<br>
							<div class="col-sm-8">
								<label for="validationCustom01" class="form-label">Numero
									Documento</label> <input type="number" class="form-control"
									id="numeroDocumento_n" name="numeroDocumento" type="number"
									oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
									maxlength="8" onblur="campoRequerido(this)">
								<div class="invalid-feedback">El campo de Numero Documento
									es obligatorio</div>
							</div>
							<br>
							<div class="col-md-8">
								<label for="validationDefaultUsername" class="form-label">Correo
									Electronico</label> <input type="email" class="form-control"
									onblur="campoRequerido(this)" oninput="replaceSpace(this)"
									id="email_n" name="email">
								<div class="invalid-feedback">El campo Correo es
									obligatorio</div>
							</div>
							<br>
							<div class="col-sm-8">
								<label for="validationCustom01" class="form-label">Numero
									Celular</label> <input type="number" class="form-control"
									id="celular_n" name="celular" type="number"
									oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
									maxlength="9" onblur="campoRequerido(this)">
								<div class="invalid-feedback">El campo Numero de cel es
									obligatorio</div>
							</div>
							<br>
							<div class="col-sm-8">
								<label for="date" class="form-label"> Fecha:</label> <input
									type="date" class="form-control" id="fecha_n" name="trip-start"
									onblur="campoRequerido(this)" value="02-04-2018"
									min="01-01-2018">
								<div class="invalid-feedback">El campo Fecha es
									obligatorio</div>
							</div>
							<br>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary" id="btnCrear">Crear</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal  Modificar-->
	<div class="modal fade" id="modalModificar" tabindex="-1" role="dialog"
		aria-labelledby="modalModificar" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modificar
						GestorAsistencia</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mb-10 row">
						<form method="post" action="#">
							<input type="text" hidden class="form-control" id="id_m"
								name="id">
							<div class="col-sm-8">
								<label for="validationCustom01" class="form-label">Modifique
									Apellido</label> <input type="text" class="form-control"
									id="apellido_m" name="apellido" onkeyup="lettersOnly(this)">
							</div>
							<br>
							<div class="col-sm-8">
								<label for="validationCustom01" class="form-label">Modifique
									nombre</label> <input type="text" class="form-control" id="nombre_m"
									name="nombre" onkeyup="lettersOnly(this)"
									placeholder="Ingrese mombre">
							</div>
							<br>
							<div class="col-sm-8">
								<label for="validationCustom01" class="form-label">Selecione
									el tipo de Documento DNI</label> <select class="form-select"
									id="tipoDocumento_m" aria-label="Default select example">
									<option selected>Seleccione el tipo de documento</option>
									<option value="DNI">DNI</option>
								</select>
							</div>
							<br>
							<div class="col-sm-8">
								<label for="validationCustom01" class="form-label">Modifique
									numeroDocumento</label> <input type="text" class="form-control"
									id="numeroDocumento_m" name="numeroDocumento" type="number"
									oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
									maxlength="8" placeholder="Ingrese numeroDocumento">
							</div>
							<br>
							<div class="col-sm-8">
								<label for="validationCustom01" class="form-label">Modifique
									Email</label> <input type="text" class="form-control"
									oninput="replaceSpace(this)" id="email_m" name="email"
									placeholder="Ingrese email">
							</div>
							<br>
							<div class="col-sm-8">
								<label for="validationCustom01" class="form-label">Modifique
									celular</label> <input type="text" class="form-control" id="celular_m"
									name="celular" type="number"
									oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
									maxlength="9" placeholder="Ingrese celular">
							</div>
							<br>
							<div class="col-sm-8">
								<label for="date" class="form-label"> Fecha:</label> <input
									type="date" class="form-control" id="fecha_m" name="trip-start"
									value="02-04-2018" min="01-01-2018">
							</div>
							<br>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal" id="btnCloseModificar">Close</button>
								<button type="button" class="btn btn-primary" id="btnModificar">Modificar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Resto del código... -->
	<!-- Bootstrap Bundle with Popper -->
	<script>
	let lstGestionAsistencia;
	function replaceSpace(input){
		var lettersOnly = input.value.replace(' ','');
		 if (input.value !== lettersOnly) {
			input.value = lettersOnly;
			    
		}	    
	}
	
	
	
	function lettersOnly(input) {
		var lettersOnly = input.value.replace(/[^a-zA-Z, ]/, '');

		  if (input.value !== lettersOnly) {
		    input.value = lettersOnly;
		    
		  }	    
	}
	
	function campoRequerido(input) {
		let btn = document.getElementById("btnCrear");
		console.log(btn)
		if(input.value === '') {
			input.classList.add('is-invalid');
			btn.setAttribute("disabled", "disabled");
		} else {
			input.classList.remove('is-invalid');
			input.classList.add('is-valid');
			btn.removeAttribute("disabled");
		}
	}
	
	
	$( document ).ready(function() {
		event.preventDefault();
		listar();
		let switchActive = document.getElementById("flexSwitchCheckDefault");
		let switchLabel= document.getElementById("labelSwitch");
		switchActive.addEventListener('change', function() {
			  if (switchActive.checked) {
				switchLabel.textContent = 'Activo';
				listar();
			  } else {
				 switchLabel.textContent = 'Inactivo';
				 listar(0);
			  }			 	
			});
			
			
		$(".exportToExcel").click(function() {
		    $("#tblGestorAsistencia").table2excel({
		      exclude: ".no-export", // Add CSS class "no-export" to exclude specific elements from export
		      filename: "GestorAsistencia" // Specify the filename for the exported file
		    });
		  });
	});
	
	$('#exportBtn').click(function() {
		  var doc = document.getElementById("tblGestorAsistencia");
		  newWin= window.open("");
	      newWin.document.write(doc.outerHTML);
	      newWin.print();
	 });	
	
		let btnBuscar = document.getElementById("btnBuscar");
		btnBuscar.addEventListener("click", fnBtnBuscar);
		function fnBtnBuscar() {
			$("#listassistance_manager tr").remove(); 
			// Datos
			let apellidoVar = document.getElementById("apellido").value;
			let nombreVar = document.getElementById("nombre").value;
			let NumeroDocumentoVar = document.getElementById("numeroDocumento").value;
			console.log("apellido:" + apellidoVar)
			console.log("nombre:" + nombreVar)
			console.log("NumeroDocumento:" + NumeroDocumentoVar)
			// Preparar la URL
			let url = "GestorAsistenciaBuscar?apellido=" + apellidoVar
					+ "&nombre=" + nombreVar + "&NumeroDocumento=" + NumeroDocumentoVar;
			// La llama AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", url, true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					console.log(arreglo);
					var out = "";
					var i;
					for (i = 0; i < arreglo.length; i++) {
						console.log(arreglo[i]);
						out += '<tr><td>' + arreglo[i].id + '</td>' + '<td>'
								+ arreglo[i].nombre + '</td>' + '<td>'
								+ arreglo[i].apellido + '</td>' + '<td>'
								+ arreglo[i].celular + '</td>' + '<td>'
								+ arreglo[i].numeroDocumento + '</td>' + '<td>'
								+ arreglo[i].email + '</td>' + '<td>'
								+ arreglo[i].fecha + '</td>' +
								'<td>'+"<a href='javascript:fnModalModificar("+ arreglo[i]+ ");'>Eliminar</a>" +  " | "+"<a href='javascript:fnEliminar("+ arreglo[i].id + ");'>Eliminar</a>" + '</td></tr>'
					}
					document.getElementById("listassistance_manager").innerHTML = out;
				}
			};
			xhttp.send();
		}
		function showEditPopup() {
			var overlay = document.getElementById("popup-overlay");
			overlay.classList.add("active");
		}
		
		let btnCrear = document.getElementById("btnCrear");
		btnCrear.addEventListener("click", fnBtnCrear);
		function fnBtnCrear() {
			// Datos
			let datos = "apellido=" + document.getElementById("apellido_n").value;
			datos += "&nombre=" + document.getElementById("nombre_n").value;
			datos += "&numeroDocumento=" + document.getElementById("numeroDocumento_n").value;
			datos += "&celular=" + document.getElementById("celular_n").value;
			datos += "&tipoDocumento=" + document.getElementById("tipoDocumento_n").value;
			datos += "&email=" + document.getElementById("email_n").value;
			datos += "&fecha=" + document.getElementById("fecha_n").value;
			console.log("datos:" + datos)
			// La llama AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("POST", "GestorAsistencia", true);
			xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhttp.onreadystatechange = function() {
				if (this.readyState === 4 && this.status === 200) {
					// La solicitud se completó correctamente
					console.log(xhttp.responseText);
					alert(xhttp.responseText);
					listar();
				}
				
				if (this.readyState === 4 && this.status === 500) {
					alert("Error al crear registro!!!");
				}
				
			};
			xhttp.send(datos);
			
			$(".modal").modal('hide');
			
		}
		
		
		function fnEliminar(id) {
			if (confirm('¿Estás seguro de eliminar este GestorAsistencia?')) {
				console.log("id:" + id)
				let xhttp = new XMLHttpRequest();
				let url = "GestorAsistenciaEliminar?id=" + id ;
				xhttp.open("DELETE", url, true);
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						alert('Registro eliminado')
						// listar nuevamente
						listar()
					}
				}
				xhttp.send();
			}
		}
		
		function fnActivar(id) {
			if (confirm('¿Estás seguro de Activar este GestorAsistencia?')) {
				console.log("id:" + id)
				let xhttp = new XMLHttpRequest();
				let url = "GestorAsistenciaActivar?id=" + id ;
				xhttp.open("UPDATE", url, true);
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						alert('Registro activado')
						// listar nuevamente
						listar()
					}
				}
				xhttp.send();
			}
		}
		

		
		function listar(estado) {
			let varEstado = 1;
			if(estado != null){
				varEstado = estado;
			}
			let xhttp = new XMLHttpRequest();
			let url = "GestorAsistenciaListar?estado=" + varEstado ;
			xhttp.open("GET", url, true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					lstGestionAsistencia = arreglo;
					console.log(arreglo);

					var out = "";
					var i;
					for (i = 0; i < arreglo.length; i++) {
						console.log(arreglo[i]);
						out += '<tr><td scope="row">' + arreglo[i].id + '</td>' +
						'<td>' + arreglo[i].nombre + '</td>' 
						+ '<td>' + arreglo[i].apellido + '</td>'
						+ '<td>'+ arreglo[i].celular + '</td>'
						+ '<td>' + arreglo[i].numeroDocumento + '</td>'
						+ '<td>'+ arreglo[i].email + '</td>'
						+ '<td>'+ arreglo[i].fecha + '</td>' +
						'<td class="no-export">'+"<a href='javascript:fnModalModificar("+ arreglo[i].id+ ");'>Modificar</a>" +  " | "+"<a href='javascript:fnEliminar("+ arreglo[i].id + ");'>Eliminar</a>" +  " | "+"<a href='javascript:fnActivar("+ arreglo[i].id + ");'>Activar</a>" + '</td>'
					}
					document.getElementById("listassistance_manager").innerHTML = out;
				}
			};
			xhttp.send();
			
		}
		
		function fnModalModificar(id){
			let filterList = lstGestionAsistencia.filter(item => item.id == id)[0]
			console.log("gestorAsistencia: " +JSON.stringify(filterList));
			console.log("filter: " + filterList.id);
			console.log("filter: " + filterList.apellido);
			console.log("fecha:"+filterList.fecha)
			document.getElementById('apellido_m').value  = filterList.apellido
			document.getElementById('nombre_m').value  = filterList.nombre
			document.getElementById('tipoDocumento_m').value  = filterList.tipoDocumento
			document.getElementById('numeroDocumento_m').value  = filterList.numeroDocumento
			document.getElementById('email_m').value  = filterList.email
			document.getElementById('celular_m').value  = filterList.celular
			document.getElementById('fecha_m').value  = filterList.fecha
			document.getElementById('id_m').value  = filterList.id
			var myModal = new bootstrap.Modal(document.getElementById('modalModificar'))
			myModal.show();
		}
		
			
		let btnModificar = document.getElementById("btnModificar");
		btnModificar.addEventListener("click", fnBtnModificar);
		function fnBtnModificar(){
			let datos = "apellido=" + document.getElementById("apellido_m").value;
			datos += "&nombre=" + document.getElementById("nombre_m").value;
			datos += "&numeroDocumento=" + document.getElementById("numeroDocumento_m").value;
			datos += "&celular=" + document.getElementById("celular_m").value;
			datos += "&tipoDocumento=" + document.getElementById("tipoDocumento_m").value;
			datos += "&email=" + document.getElementById("email_m").value;
			datos += "&fecha=" + document.getElementById("fecha_m").value;
			datos += "&id=" + document.getElementById("id_m").value;
			console.log("datos:" + datos)
			// La llama AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("POST", "GestorAsistenciamodificar", true);
			xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhttp.onreadystatechange = function() {
				if (this.readyState === 4 && this.status === 200) {
					// La solicitud se completó correctamente
					console.log(xhttp.responseText);
					alert(xhttp.responseText);
					listar()
				}
				$('#btnCloseModificar').click();
				
				if (this.readyState === 4 && this.status === 500) {
					alert("Erro al Mofificar registro!!!");
				}
			};
			$('#btnCloseModificar').click();
			xhttp.send(datos);
			
			
		}
		</script>
</body>
</html>