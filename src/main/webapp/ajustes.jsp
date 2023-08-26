<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<jsp:include page="menu.jsp"></jsp:include>
    
    <title>Ajustes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.15.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }

        .menu-list {
            list-style-type: none;
            padding: 0;
            margin-top: 20px;
        }

        .menu-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f8f9fa;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .menu-item:hover {
            background-color: #e9ecef;
        }

        .slider-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .slider-label {
            margin-right: 10px;
        }

        .slider {
            width: 100%;
            max-width: 200px;
        }

        .brightness-icons {
            display: flex;
            align-items: center;
        }

        .popup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            display: none;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            z-index: 999;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: 0.4s;
            border-radius: 24px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: 0.4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: #00C853; /* Color verde para activo */
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #00C853; /* Efecto de foco */
        }

        input:checked + .slider:before {
            transform: translateX(26px);
        }

        .slider.round {
            border-radius: 24px;
        }

        .slider.round:before {
            border-radius: 50%;
        }
    </style>
    <script>
        function showChangePasswordPopup() {
            var overlay = document.getElementById('overlay');
            var popup = document.getElementById('popup');
            overlay.style.display = 'block';
            popup.style.display = 'block';
        }

        function hideChangePasswordPopup() {
            var overlay = document.getElementById('overlay');
            var popup = document.getElementById('popup');
            overlay.style.display = 'none';
            popup.style.display = 'none';
        }

        const brightnessSlider = document.getElementById('brightnessSlider');
        const soundCheckbox = document.getElementById('soundCheckbox');
        const notificationsCheckbox = document.getElementById('notificationsCheckbox');
        const overlay = document.getElementById('overlay');
        const popup = document.getElementById('popup');

        brightnessSlider.addEventListener('input', function() {
            const brightnessValue = this.value;
            const normalizedBrightness = brightnessValue / 100;
            document.body.style.filter = `brightness(${normalizedBrightness})`;
        });

        soundCheckbox.addEventListener('change', function() {
            if (this.checked) {
                // Acciones cuando se activa el sonido
            } else {
                // Acciones cuando se desactiva el sonido
            }
        });

        notificationsCheckbox.addEventListener('change', function() {
            if (this.checked) {
                // Acciones cuando se activan las notificaciones
            } else {
                // Acciones cuando se desactivan las notificaciones
            }
        });
    </script>
</head>
<body>
    <div class="container">
        <h2>Ajustes</h2>
        <ul class="menu-list">
            <li class="menu-item">
                <span>Activar Sonido</span>
                <label class="switch">
                    <input type="checkbox" id="soundCheckbox">
                    <span class="slider round"></span>
                </label>
            </li>
            <li class="menu-item">
                <span>Activar Notificaciones</span>
                <label class="switch">
                    <input type="checkbox" id="notificationsCheckbox">
                    <span class="slider round"></span>
                </label>
            </li>
            
            <li class="menu-item" onclick="showChangePasswordPopup()">
                Cambiar Contraseña
            </li>
        </ul>
    </div>
    <div class="overlay" id="overlay"></div>
    <div class="popup" id="popup">
        <h3>Cambiar Contraseña</h3>
        <form>
            <div class="mb-3">
                <label for="newPassword" class="form-label">Nueva Contraseña:</label>
                <input type="password" class="form-control" id="newPassword" required>
            </div>
            <div class="mb-3">
                <label for="repeatPassword" class="form-label">Repite Contraseña:</label>
                <input type="password" class="form-control" id="repeatPassword" required>
            </div>
            <button type="submit" class="btn btn-primary">Guardar</button>
            <button type="button" class="btn btn-secondary" onclick="hideChangePasswordPopup()">Cancelar</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw6f+ua9W2W5G3+6pR2j/c9tJ/Ajz1jzW/zvfaU8jBUp2Whw5BqE4oWrvo" crossorigin="anonymous"></script>
</body>
</html>
