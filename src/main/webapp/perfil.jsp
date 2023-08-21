<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="menu.jsp"></jsp:include>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Administración de Usuarios</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
  <style>
    .profile-container {
      display: flex;
      align-items: center;
      padding: 10px;
    }

    .profile-icon {
      width: 30px;
      height: 30px;
      border-radius: 50%;
      background-color: #e74c3c;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 10px;
    }

    .profile-icon i {
      color: white;
    }

    .profile-info h2 {
      margin: 0;
      font-size: 18px;
    }

    .profile-info p {
      margin: 0;
      font-size: 14px;
    }

    .create-button {
      background-color: #e74c3c;
      color: white;
    }
  </style>
</head>
<body>
<h1 class="text-center">ADMINISTRACION DE USUARIOS</h1>
 

  <div class="container mt-4">
    <div class="row">
      <div class="col-6 offset-3">
        <div class="card">
          <div class="card-header">
            <h5 class="mb-0">Nuevo Usuario</h5>
          </div>
          <div class="card-body">
            <form id="user-form">
              <div class="form-group">
                <label for="username">Nombre de Usuario</label>
                <input type="text" class="form-control" id="username" required>
              </div>
              <div class="form-group">
                <label for="email">Correo Electrónico</label>
                <input type="email" class="form-control" id="email" required>
              </div>
              <div class="form-group">
                <label for="phone">Número de Celular</label>
                <input type="text" class="form-control" id="phone" required>
              </div>
              <button type="submit" class="btn create-button">Crear</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="user-list-modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Usuarios</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <ul id="user-list-ul" class="list-group"></ul>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script>
    let usuarios = [];

    document.getElementById('user-form').addEventListener('submit', function(event) {
      event.preventDefault();

      const username = document.getElementById('username').value;
      const email = document.getElementById('email').value;
      const celular = document.getElementById('phone').value;

      const usuario = {
        username: username,
        email: email,
        celular: celular
      };

      usuarios.push(usuario);

      listar();

      document.getElementById('user-form').reset();
    });

    function listar() {
      let userListModal = document.getElementById('user-list-modal');
      let userListUL = document.getElementById('user-list-ul');

      userListUL.innerHTML = '';

      usuarios.forEach((usuario, index) => {
        let li = document.createElement('li');
        li.classList.add('list-group-item');

        let div = document.createElement('div');
        div.classList.add('profile-container');

        let icon = document.createElement('div');
        icon.classList.add('profile-icon');
        icon.innerHTML = '<i class="fas fa-user"></i>';

        let info = document.createElement('div');
        info.classList.add('profile-info');

        let username = document.createElement('h2');
        username.textContent = usuario.username;

        let email = document.createElement('p');
        email.textContent = usuario.email;

        let celular = document.createElement('p');
        celular.textContent = usuario.celular;

        info.appendChild(username);
        info.appendChild(email);
        info.appendChild(celular);

        div.appendChild(icon);
        div.appendChild(info);

        li.appendChild(div);

        let actionsDiv = document.createElement('div');
        actionsDiv.classList.add('d-flex', 'justify-content-end');

        let editarButton = document.createElement('button');
        editarButton.classList.add('btn', 'btn-primary', 'mr-2');
        editarButton.textContent = 'Editar';
        editarButton.addEventListener('click', function() {
          editar(index);
        });

        let eliminarButton = document.createElement('button');
        eliminarButton.classList.add('btn', 'btn-danger');
        eliminarButton.textContent = 'Eliminar';
        eliminarButton.addEventListener('click', function() {
          eliminar(index);
        });

        actionsDiv.appendChild(editarButton);
        actionsDiv.appendChild(eliminarButton);

        li.appendChild(actionsDiv);

        userListUL.appendChild(li);
      });

      $(userListModal).modal('show');
    }

    function editar(index) {
      let usuario = usuarios[index];

      let editUsername = document.getElementById('username');
      let editEmail = document.getElementById('email');
      let editPhone = document.getElementById('phone');

      editUsername.value = usuario.username;
      editEmail.value = usuario.email;
      editPhone.value = usuario.celular;

      document.getElementById('user-form').addEventListener('submit', function(event) {
        event.preventDefault();

        usuario.username = editUsername.value;
        usuario.email = editEmail.value;
        usuario.celular = editPhone.value;

        $('#user-list-modal').modal('hide');
        listar();

        document.getElementById('user-form').reset();
      });

      $('#user-list-modal').modal('hide');
    }

    function eliminar(index) {
      if (confirm('¿Estás seguro de eliminar este usuario?')) {
        usuarios.splice(index, 1);
        listar();
      }
    }
  </script>
</body>
</html>