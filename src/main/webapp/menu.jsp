<!DOCTYPE html>
<html>
<head>
  <title>Alfonso Ugarte - Dashboard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="icon" type="image/kg" href="insignia.jpg">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    #sidebar {
      height: 100vh;
      width: 250px;
      position: fixed;
      top: 0;
      left: 0;
      background-color: #343a40;
      padding-top: 20px;
    }
    #content {
      margin-left: 250px;
      padding: 20px;
    }
    .sidebar-link {
      color: #ffffff;
      text-decoration: none;
      padding: 10px 20px;
      display: block;
    }
    .sidebar-link:hover {
      background-color: #4d5256;
    }

    /* Media query for responsiveness */
    @media (max-width: 768px) {
      #sidebar {
        left: -250px;
      }
      #content {
        margin-left: 0;
        padding: 20px;
      }
    }
  </style>
</head>
<body>
  <div id="sidebar">
    <a class="navbar-brand" href="#">
      <img src="https://2.bp.blogspot.com/-oSXnRpYTW6w/V-2pa-4Xs_I/AAAAAAAA1Jg/EifT_Ct1euwsyUygVAGehmMwx7bfYqIGQCLcB/s1600/ie-20191-alfonso-ugarte-insignia.jpg" style="width: 30px; height: 30px; margin-right: 10px;">
      ALFONSO UGARTE
    </a>
    <hr style="background-color: #6c757d;">
    <a class="sidebar-link" href="bienvenida.jsp">Inicio</a>
    <a class="sidebar-link" href="estudiante.jsp">Estudiante</a>
    <a class="sidebar-link" href="gestorasistencia.jsp">Gestor Asistencia</a>
    <a class="sidebar-link" href="registrar.jsp">Registrar</a>
    <a class="sidebar-link" href="Justificacion.jsp">Justificacion</a>
    <a class="sidebar-link" href="perfil.jsp">Usuario</a>
    <a class="sidebar-link" href="ajustes.jsp">Ajustes</a>
    <a class="sidebar-link" href="t05.jsp">T05</a>
  </div>
  <div id="content">

<footer style="text-align: center; padding: 10px; background-color: #343a40; color: #ffffff;">
  &copy; 2023 Alfonso Ugarte. Todos los derechos reservados.
</footer>  </div>
  <script>
    const sidebar = document.getElementById('sidebar');
    const content = document.getElementById('content');

    function toggleSidebar() {
      if (sidebar.style.left === '0px') {
        sidebar.style.left = '-250px';
        content.style.marginLeft = '0';
      } else {
        sidebar.style.left = '0';
        content.style.marginLeft = '250px';
      }
    }
  </script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
