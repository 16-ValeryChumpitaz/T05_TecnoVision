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
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container">
<!DOCTYPE html>
<html>
<head>
  <title>Ajustes</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      color: #333333;
      transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
    }

    .container {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      background-color: #f2f2f2;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .container h2 {
      text-align: center;
    }

    .button-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-top: 30px;
    }

    .button-container button {
      margin: 10px 0;
      padding: 10px 20px;
      font-size: 16px;
      background-color: #FF0000;
      color: white;
      border: none;
      border-radius: 3px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .button-container button .icon {
      margin-right: 5px;
      width: 20px;
      height: 20px;
    }

    .button-container button:hover {
      background-color: #CC0000;
    }

    /* Modo Oscuro */
    body.dark-mode {
      background-color: #333333;
      color: #f2f2f2;
    }

    body.dark-mode .container {
      background-color: #333333;
    }

    /* Cuadro emergente */
    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      display: flex;
      justify-content: center;
      align-items: center;
      z-index: 9999;
      visibility: hidden;
      opacity: 0;
      transition: visibility 0s, opacity 0.3s;
    }

    .overlay.active {
      visibility: visible;
      opacity: 1;
    }

    .popup {
      max-width: 400px;
      padding: 20px;
      background-color: white;
      border-radius: 5px;
      text-align: center;
    }

    .popup h3 {
      margin-top: 0;
    }

    .popup button {
      margin-top: 20px;
      padding: 10px 20px;
      font-size: 16px;
      background-color: #FF0000;
      color: white;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }
  </style>
  <script>
    function activateDarkMode() {
      var body = document.getElementsByTagName("body")[0];
      body.classList.toggle("dark-mode");
    }

    function showMaintenancePopup() {
      var overlay = document.getElementById("overlay");
      overlay.classList.add("active");
    }

    function hideMaintenancePopup() {
      var overlay = document.getElementById("overlay");
      overlay.classList.remove("active");
    }
  </script>
</head>
<body>
  <div class="container">
    <h2>Ajustes</h2>
    <div class="button-container">
      <button onclick="activateDarkMode()">
        <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
          <path d="M12 3.5a8.5 8.5 0 0 0-8.495 9h16.99A8.5 8.5 0 0 0 12 3.5zm0 15c-4.694 0-8.5-3.806-8.5-8.5S7.306 2.5 12 2.5s8.5 3.806 8.5 8.5S16.694 18.5 12 18.5z"/>
          <path d="M12 7.5a4.5 4.5 0 0 0-4.495 4h8.99A4.5 4.5 0 0 0 12 7.5z"/>
        </svg>
        Modo Oscuro
      </button>
      <button onclick="showMaintenancePopup()">
        <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
          <path d="M5.207 7.207l11.586 11.586c.39.39.902.586 1.414.586s1.024-.195 1.414-.586c.781-.781.781-2.047 0-2.828L8.828 4.379c-.781-.781-2.047-.781-2.828 0s-.781 2.047 0 2.828zm12.586-2.586c.39-.39.586-.902.586-1.414s-.195-1.024-.586-1.414L15.414.207c-.781-.781-2.047-.781-2.828 0s-.781 2.047 0 2.828l11.586 11.586c.781.781 2.047.781 2.828 0s.781-2.047 0-2.828L17.793 4.621zM2.121 22.879l4.242-4.242c1.171 1.171 3.071 1.171 4.242 0l4.242 4.242c.781.781 2.047.781 2.828 0s.781-2.047 0-2.828l-4.242-4.242c1.171-1.171 1.171-3.071 0-4.242l4.242-4.242c.781-.781.781-2.047 0-2.828s-2.047-.781-2.828 0L14.93 6.07c-1.171-1.171-3.071-1.171-4.242 0L6.446 2.828C6.063 2.445 5.579 2.25 5.086 2.25S4.109 2.445 3.726 2.828L2.121 4.433c-.781.781-.781 2.047 0 2.828l4.242 4.242c-1.171 1.171-1.171 3.071 0 4.242L2.121 22.879z"/>
        </svg>
        Mantenimiento
      </button>
    </div>
  </div>

  <div id="overlay" class="overlay">
    <div class="popup">
      <h3>Lo sentimos, estamos en mantenimiento.</h3>
      <button onclick="hideMaintenancePopup()">Aceptar</button>
    </div>
  </div>
</body>
</html>
