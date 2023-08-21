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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha384-integrity" crossorigin="anonymous">

<title>Alfonso Ugarte</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="container">
			<h1 class="text-center">JUSTIFICACION</h1>
		<!-- Card de datos de entrada -->
<div class="card" style="margin-left:190px;">


    <div class="table-responsive">
        <table class="table table-striped" id="tblEstudiante" style="width: 60%; margin: 0 auto;">
            <thead>
                <tr>
                    <th>id</th>
                    <th>Fecha</th>
                    <th>Tipo</th>
                    <th>Estudiante</th>
                    <th>Gestor asistencia</th>
                    <th class="no-export">accion</th>
                </tr>
            </thead>
            <tbody id="listJustificacion">
                <!-- Contenido de las filas de la tabla -->
            </tbody>
        </table>
    </div>
</div>




		<div class="modal fade" id="justificarModal" tabindex="-1"
			role="dialog" aria-labelledby="justificarModal" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Justificación</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="mb-10 row">
							<form method="post" action="#">
								<input type="text" hidden class="form-control" id="idAsistencia"
									name="idAsistencia">
								<div class="col-sm-8">
									<label for="Descripcion" class="form-label">Descripción</label>
									<textarea class="form-control" id="Descripcion"></textarea>
								</div>
								<br> <label for="date" class="form-label">Start
									date:</label> <input type="date" class="form-control" id="date"
									name="trip-start" value="2018-07-22" min="2018-01-01">
						</div>
						<br>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" id="btnCloseModificar">Close</button>
							<button type="button" class="btn btn-primary"
								id="btnJustificacion">Enviar</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Bootstrap Bundle with Popper -->
	<style>
.btn-rojo {
	background-color: red;
	color: white;
}
</style>
	<script>
		$(document).ready(function() {
			event.preventDefault();
			listar();
		})

		function listar() {

			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", "AsistenciaListar", true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					lstEstudiante = arreglo;
					console.log(arreglo);
					var out = "";
					var i;
					for (i = 0; i < arreglo.length; i++) {
						console.log(arreglo[i]);
						out += '<tr><td scope="row">' + arreglo[i].id + '</td>'
								+ '<td>' + arreglo[i].Fecha + '</td>' + '<td>'
								+ arreglo[i].Tipo + '</td>' + '<td>'
								+ arreglo[i].IdEstudiante + '</td>' + '<td>'
								+ arreglo[i].IdGestorAsistencia + '</td>'
								+ '<td class="no-export">'
								+ "<a href='javascript:fnJustificarModal("
								+ arreglo[i].id + ");'>Justificar</a>"
								+ '</td>'
					}
					document.getElementById("listJustificacion").innerHTML = out;
				}
			};
			xhttp.send();
		}

		function fnJustificarModal(idAsistencia) {
			console.log("idAsistencia:" + idAsistencia);
			document.getElementById('idAsistencia').value = idAsistencia
			var myModal = new bootstrap.Modal(document
					.getElementById('justificarModal'))
			myModal.show();
		}

		let btnJustificacion = document.getElementById("btnJustificacion");
		btnJustificacion.addEventListener("click", fnbtnJustificacion);
		function fnbtnJustificacion() {

			// Datos
			let datos = "dates=" + document.getElementById("date").value;
			datos += "&descripcion="+ document.getElementById("Descripcion").value;
			datos += "&idAsistencia=" + document.getElementById("idAsistencia").value;
			console.log("datos:" + datos)
			// La llama AJAX
			let xhttp = new XMLHttpRequest();
			xhttp.open("POST", "Justificacion", true);
			xhttp.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			xhttp.onreadystatechange = function() {
				if (this.readyState === 4 && this.status === 200) {
					alert("justificacion exitosa!!!");
					console.log(xhttp.responseText);
					alert(xhttp.responseText);
				}
				if (this.readyState === 4 && this.status === 500) {
					alert("justificacion error!!!");
				}
				
			};
			$('#btnCloseJustificacion').click();
			xhttp.send(datos);

			$(".modal").modal('hide');
		}
	</script>


</body>
</html>