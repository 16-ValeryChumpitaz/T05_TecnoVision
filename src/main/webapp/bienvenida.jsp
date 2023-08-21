<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
      <jsp:include page="menu.jsp"></jsp:include>
  
  <title>ALFONSO UGARTE</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    body {
      margin: 0;
      background-color: #f8f9fa; /* Fondo gris claro */
    }
    .container {
      margin-top: 50px;
      text-align: center;
    }
    .title {
      font-size: 36px;
      color: red;
      margin-bottom: 40px;
    }
    .description {
      font-size: 18px;
      color: black;
      margin-bottom: 20px;
    }
    .reloj-container {
      display: flex;
      align-items: center;
      justify-content: flex-end; /* Coloca el reloj a la derecha */
      height: 60px;
      background-color: #fff; /* Fondo blanco */
      padding-right: 20px; /* Espacio derecho */
    }
    .digitos {
      font-family: 'Segment7Standard';
      font-size: 20px; /* Tamaño de fuente reducido */
      color: #f00;
      margin: 0;
      padding: 0;
    }
    .dosPuntos {
      font-family: sans-serif;
      font-size: 20px; /* Tamaño de fuente reducido */
      color: #f00;
      margin: 0;
      padding: 0;
      transform: translateY(-5px); /* Ajuste de posición vertical */
      animation: animacionPuntos 1s steps(1) infinite;
    }
    @keyframes animacionPuntos {
      0%, 100% {
        opacity: 1;
      }
      50% {
        opacity: 0;
      }
    }
    /* ... (resto de los estilos) ... */
  .description {
    margin: 50px auto; /* Ajusta el margen superior e inferior para centrar verticalmente */
    max-width: 80%; /* Limita el ancho del contenedor para que no choque con el dashboard */
    margin-left: 20%;; /* Mueve el margen izquierdo automáticamente para centrar a la derecha */
    text-align: center; /* Centra el texto horizontalmente */
    font-size: 18px; /* Tamaño de fuente personalizado */
    color: #333; /* Color de texto personalizado */
    line-height: 1.5; /* Espaciado entre líneas */
  }
  .icon-container {
  /* ... otros estilos ... */
  display: flex;
  justify-content: center; /* Centra horizontalmente los iconos */
  align-items: center; /* Centra verticalmente los iconos */
}

.icon {
  font-size: 30px;
  margin: 0 10px; /* Espaciado horizontal entre los iconos */
  color: #333;
  transition: opacity 0.5s ease-in-out;
}
  
  </style>
  
  
</head>
<body>


  <div class="container">
    <div class="reloj-container">
      <p id="horas" class="digitos"></p>
      <p class="dosPuntos">:</p>
      <p id="minutos" class="digitos"></p>
      <p class="dosPuntos">:</p>
      <p id="segundos" class="digitos"></p>
    </div>
    <h1 class="title">Bienvenido al Software de Registro de Asistencias</h1>
    
	    <p class="description">¡Bienvenidos al Registro de Asistencia Estudiantil!
	     Registra la presencia de tus estudiantes de manera simple y eficiente, 
	     brindando un seguimiento preciso de su participación en cada actividad educativa. 
	     Mantén el control de manera sencilla y asegura un proceso de asistencia sin complicaciones.</p>	
<div class="icon-container">
  <i class="fas fa-school icon"></i>
  <i class="fas fa-pencil-alt icon"></i>
  <i class="fas fa-book icon"></i>
  <i class="fas fa-graduation-cap icon"></i>
  <i class="fas fa-clock icon"></i>
  <i class="fas fa-map-marker-alt icon"></i>
</div>





  </div>
  <script>
    function actualizarReloj() {
      const now = new Date();
      document.getElementById("horas").textContent = now.getHours().toString().padStart(2, '0');
      document.getElementById("minutos").textContent = now.getMinutes().toString().padStart(2, '0');
      document.getElementById("segundos").textContent = now.getSeconds().toString().padStart(2, '0');
    }
    setInterval(actualizarReloj, 1000);
  </script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

