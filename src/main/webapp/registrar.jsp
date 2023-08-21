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
<script src="https://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<style>
.asistencia-check:checked{
background-color:green!important
}
.falta-check:checked{
background-color:red!important
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="container">
			<h1 class="text-center">REGISTRAR ASISTENCIA</h1>
		<!-- Card de datos de entrada -->
			<div class="card mx-auto" style="max-width: 750px;">
			<div class="card-header">Criterios de busqueda</div>
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
						<div class="col-sm-2">
							<button type="button" class="btn btn-primary mb-3 btn-rojo"
								id="btnBuscar" name="btnBuscar">Buscar</button>
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-primary mb-3 btn-rojo"
								id="btnNuevo" name="btnNuevo" data-toggle="modal"
								data-target="#exampleModal">Nuevo</button>
								
						<button type="button" class="btn btn-primary mb-3 btn-rojo" id="btnRegistrar" name="btnRegistrar" >Registrar</button>
						
						<div class="btn-group">
						
					 <button type="button" class="btn btn-rojo">GRADO</button>
							 
					 <button type="button" class="btn btn-rojo dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
						 
					 <span class="visually-hidden">Toggle Dropdown</span>
						 
	        		 </button>
					<ul class="dropdown-menu">
   					<li><a class="dropdown-item" href="PRIMERO">PRIMERO</a></li>
   					<li><a class="dropdown-item" href="SEGUNDO">SEGUNDO</a></li>
   					 <li><a class="dropdown-item" href="TERCERO">TERCERO</a></li>
   					<li><a class="dropdown-item" href="CUARTO">CUARTO</a></li>
  					</ul>
					</div>
	
<style>
  .btn-justificar {
    background-color: #FF0000;
    color: #FFFFFF;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
  }
  
  .btn-justificar:hover {
    background-color: #CC0000;
  }
</style>



						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<br />
	
	
	
	<div class="container custom-container">
			<!-- Agregamos la clase custom-container -->
			<div class="row justify-content-end mt-4">
				<div class="col-md-10 text-right" style="margin-right: 20px;">
					<table class="table table-striped" id="tblRegistrar">
					<thead>
						<tr>
							<th>N°</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>Grado</th>
							<th>Asistencia</th>
							<th>Justificacion</th>
							<th>Falta</th>
						</tr>
					</thead>
					<tbody id="listattendance">	
					</tbody>
				</table>
			<div class="col-sm-12">
		</div>

	
	<button class="exportToExcel btn btn-primary mb-3 btn-rojo" style="background-color: #FF4136; 
	border: none; color: white; text-align: center; 
	text-decoration: none; display: inline-block; font-size: 14px;
	 margin-right: 6px; cursor: pointer; border-radius: 4px;">
  	<i class="fas fa-file-excel"></i> Exportar Excel
	</button>
	
	<button id="exportBtn" class="btn btn-primary mb-3 btn-rojo" style="background-color: #FF4136; border: none; 
	color: white; text-align: center; text-decoration: none; display: inline-block; 
	font-size: 14px; margin-right: 6px; cursor: pointer; border-radius: 4px;">Exportar PDF</button>
	
	<button type="button" class="cancel-button btn btn-primary mb-3 btn-rojo" onclick="window.location.href='reporteCsv.jsp'" 
	style="background-color: #FF4136; border: none; color: white; text-align: center; 
	text-decoration: none; display: inline-block; font-size: 14px; margin-right: 6px;
	cursor: pointer; border-radius: 4px;">Exportar Cvs</button>
	
	<button class="btn-justificar" style="background-color: #FF4136; border: none; color: white; text-align: center; 
	text-decoration: none; display: inline-block; font-size: 14px; margin-right: 6px;
	cursor: pointer; border-radius: 4px;" class="btn btn-primary mb-3 btn-rojo" onclick="window.open('https://docs.google.com/forms/d/e/1FAIpQLSe_VUneLyeBdtB2bQEnXTXo3OW6nHILHFv9-SHk0tmEx39ikg/viewform?usp=sf_link')">Justificar</button>

</div>
</div>
</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Nuevo
						Registro</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mb-10 row">
						<form method="post" action="#">
							<div class="col-sm-8">
								<input type="text" class="form-control" id="Fecha_n"
									name="Fecha" placeholder="Ingrese Fecha">
							</div>
							<br>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="Tipo_n"
									name="Tipo" placeholder="Ingrese Tipo">
							</div>
							<br>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="IdEstudiante_n"
									name="IdEstudiante" placeholder="Ingrese IdEstudiante">
							</div>
							<br>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="IdGestorAsistencia_n"
									name="IdGestorAsistencia" placeholder="Ingrese IdGestorAsistencia">
							</div>
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
							Registro</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="mb-10 row">
							<form method="post" action="#">
							<input type="text" hidden class="form-control" id="id_m"
										name="id" >
								<div class="col-sm-8">
									<input type="text" class="form-control" id="Fecha_m"
										name="Fecha" placeholder="Ingrese Fecha">
								</div>
								<br>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="Tipo_m"
										name="Tipo" placeholder="Ingrese Tipo">
								</div>
									<br>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="IdEstudiante_m" name="IdEstudiante"
										placeholder="Ingrese IdEstudiante">
								</div>
								<br>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="IdGestorAsistencia_m" name="IdGestorAsistencia"
										placeholder="Ingrese IdGestorAsistencia">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" id="btnModificar">Modificar</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<style>
.btn-rojo {
	background-color: red;
	color: white;
}
</style>
	<script>
	let lstRegistro;
	
	$( document ).ready(function() {
		listar();
		
	});
	
	$(".exportToExcel").click(function() {
	    $("#tableRegistrar").table2excel({
	      exclude: ".no-export", // Add CSS class "no-export" to exclude specific elements from export
	      filename: "Registrar" // Specify the filename for the exported file
	    });
	  });
	
	$('#exportBtn').click(function() {
		  var doc = document.getElementById("tableRegistrar");
		  newWin= window.open("");
	      newWin.document.write(doc.outerHTML);
	      newWin.print();
	 });	
	
	
		let btnBuscar = document.getElementById("btnBuscar");
		btnBuscar.addEventListener("click", fnBtnBuscar);
		function fnBtnBuscar() {
			// Datos
			let apellidoVar = document.getElementById("apellido").value;
			let nombreVar = document.getElementById("nombre").value;
			// Preparar la URL
			let url = "AsistenciaBuscar?apellido=" + apellidoVar + "&nombre="
					+ nombreVar;
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
								+ arreglo[i].Fecha + '</td>' + '<td>'
								+ arreglo[i].Tipo + '</td>' + '<td>'
								'<td class="no-export">'+"<a href='javascript:fnModalModificar("+ arreglo[i].id+ ");'>Modificar</a>" +  " | "+"<a href='javascript:fnEliminar("+ arreglo[i].id + ");'>Eliminar</a>" + '</td>'
					}
					document.getElementById("listattendance").innerHTML = out;
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
			let datos = "Fecha="+ document.getElementById("Fecha_n").value;
			datos += "&Tipo=" + document.getElementById("Tipo_n").value;
			datos += "&IdEstudiante="+ document.getElementById("IdEstudiante_n").value;
			datos += "&IdGestorAsistencia=" + document.getElementById("IdGestorAsistencia_n").value;
			console.log("datos:" + datos)
			// La llama AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("POST", "Registro", true);
			xhttp.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			xhttp.onreadystatechange = function() {
				if (this.readyState === 4 && this.status === 200) {
					// La solicitud se completó correctamente
					console.log(xhttp.responseText);
					alert(xhttp.responseText);
				}
			};
			xhttp.send(datos);

		}
		function fnEliminar(id) {
			if (confirm('¿Estás seguro de eliminar este Asistencia?')) {
				console.log("id:" + id)
				let xhttp = new XMLHttpRequest();
				let url = "AsistenciaEliminar?id=" + id ;
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
		
		function listar() {
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", "EstudianteListar?estado=1", true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					console.log(arreglo);
					var out = "";
					var i;
					for (i = 0; i < arreglo.length; i++) {
						console.log(arreglo[i]);
						out += '<tr>'+
						'<th>'+  arreglo[i].id+'</th>'+
						'<th>'+ arreglo[i].nombre +'</th>'+
						'<th>'+ arreglo[i].apellido +'</th>'+
						'<th>'+ arreglo[i].grado +'</th>'+
						'<th>'+ '<input class="form-check-input asistencia-check" type="checkbox" value="" id="asistenciaCheckId" onchange="asistenciaChange('+i+')"'+'>'+'</th>'+
						'<th>'+ '<input class="form-check-input tardanza-check" type="checkbox" value="" id="tardanzaCheckId" onchange="tardanzaChange('+i+')"'+'>'+'</th>'+
						'<th>'+ '<input class="form-check-input falta-check" type="checkbox" value="" id="faltaCheckId" onchange="faltaChange('+i+')"'+'>'+'</th>'+
						'</tr>'
					}
					document.getElementById("listattendance").innerHTML = out;
		
					
				}
			};
			xhttp.send();
		}
		function asistenciaChange(position)
		 {
			var row =document.getElementById("listattendance").querySelectorAll('tr')[position];
			var checkIn = row.cells[4].getElementsByTagName("input")[0]
			var justificacion = row.cells[5].getElementsByTagName("input")[0];
			var falta = row.cells[6].getElementsByTagName("input")[0];
			 
			if(checkIn.checked){
				justificacion.disabled = true;
				 falta.disabled = true;
			}else{
				justificacion.disabled = false;
				 falta.disabled = false;
			}
			
		 }
		
		function tardanzaChange(position)
		{
			var row =document.getElementById("listattendance").querySelectorAll('tr')[position];
			var checkIn = row.cells[5].getElementsByTagName("input")[0]
			var asistencia = row.cells[4].getElementsByTagName("input")[0];
			var falta = row.cells[6].getElementsByTagName("input")[0];
			 
			if(checkIn.checked){
				asistencia.disabled = true;
				 falta.disabled = true;
			}else{
				asistencia.disabled = false;
				 falta.disabled = false;
			}
			
		 }
		
		function faltaChange(position)
		{
			var row =document.getElementById("listattendance").querySelectorAll('tr')[position];
			var checkIn = row.cells[6].getElementsByTagName("input")[0]
			var asistencia = row.cells[4].getElementsByTagName("input")[0];
			var justificacion = row.cells[5].getElementsByTagName("input")[0];
			 
			if(checkIn.checked){
				asistencia.disabled = true;
				justificacion.disabled = true;
			}else{
				asistencia.disabled = false;
				justificacion.disabled = false;
			}
			
		 }
		
			function fnModalModificar(id){
				let filterList = lstAsistencia.filter(item => item.id == id)[0]
				console.log("Registro: " +JSON.stringify(filterList));
				console.log("filter: " + filterList.id);
				console.log("filter: " + filterList.grado);
				document.getElementById('Fecha_m').value  = filterList.Fecha
				document.getElementById('Tipo_m').value  = filterList.Tipo
				document.getElementById('IdEstudiante_m').value  = filterList.IdEstudiante
				document.getElementById('IdGestorAsistencia_m').value  = filterList.IdGestorAsistencia
				document.getElementById('id_m').value  = filterList.id
				var myModal = new bootstrap.Modal(document.getElementById('modalModificar'))
				myModal.show();
			}
			$("button[data-dismiss=modal]").click(function(){
				$(".modal").modal('hide');
			});
			
			
			let btnModificar = document.getElementById("btnModificar");
			btnModificar.addEventListener("click", fnBtnModificar);
			function fnBtnModificar(){
				let datos = "Fecha=" + document.getElementById("Fecha_m").value;
				datos += "&Tipo=" + document.getElementById("Tipo_m").value;
				datos += "&IdEstudiante=" + document.getElementById("IdEstudiante_m").value;
				datos += "&IdGestorAsistencia=" + document.getElementById("IdGestorAsistencia_m").value;
				datos += "&id=" + document.getElementById("id_m").value;
				console.log("datos:" + datos)
				// La llama AJAX
				let xhttp = new XMLHttpRequest();
				xhttp.open("POST", "Asistenciamodificar", true);
				xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				xhttp.onreadystatechange = function() {
					if (this.readyState === 4 && this.status === 200) {
						// La solicitud se completó correctamente
						console.log(xhttp.responseText);
						alert(xhttp.responseText);
						listar()
					}
					
				};
				xhttp.send(datos);
				$('#btnCloseModificar').click();
				$(".modal").modal('hide');
				
		}
			
			let btnRegistrar = document.getElementById("btnRegistrar");
			btnRegistrar.addEventListener("click", fnRegistrar);
			function fnRegistrar(){
				const date = new Date().toLocaleDateString().split('/').reverse().join('');
				console.log("leer tabla")
				console.log("date"+date)
				var rows =document.getElementById("listattendance").querySelectorAll('tr')
				for(i=0;i< rows.length;i++){
					var tipo= null;
					var row = rows[i];
					let asistencia = row.cells[4].getElementsByTagName("input")[0]
					let justificacion = row.cells[5].getElementsByTagName("input")[0]
					let falta = row.cells[6].getElementsByTagName("input")[0]
					if(asistencia.checked){
						tipo='A'
					}
					if(justificacion.checked){
						tipo='J'
					}
					if(falta.checked){
						tipo='F'
					}
					let datos = "idEstudiante=" + row.cells[0].innerHTML;			
					datos += "&fecha=" + date;
					datos += "&tipo=" + tipo;
					datos += "&idGestorAsistencia=" + 1;
					console.log("datos:" + datos)
					// La llama AJAX
					let xhttp = new XMLHttpRequest();
					xhttp.open("POST", "Asistencia", true);
					xhttp.setRequestHeader('Content-type',
							'application/x-www-form-urlencoded');
					xhttp.onreadystatechange = function() {
						if (this.readyState === 4 && this.status === 200) {
							// La solicitud se completó correctamente
							console.log(xhttp.responseText);
						}
					};
				xhttp.send(datos);
				
				}
				alert("ASISTENCIAS REGISTRADAS");
				console.log("alerta de confirmacion")
			}
	</script>
</body>
</html>