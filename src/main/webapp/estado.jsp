<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <jsp:include page="menu.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
  <title>Cuadro de personas</title>
  <style>
    .container {
      max-width: 800px;
      margin: 50px auto;
      padding: 20px;
      background-color: #f2f2f2;
      border-radius: 5px;
      border: 2px solid #ff0000;
    }

    .section {
      margin-bottom: 20px;
    }

    .section-header {
      font-weight: bold;
      color: #ff0000;
    }

    table {
      margin-top: 10px;
      border-collapse: collapse;
      width: 100%;
    }

    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #f2f2f2;
    }

    select {
      width: 80px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="section">
      <h2 class="section-header">Gestor de Asistencia</h2>
      <table>
        <tr>
          <th>Nombre</th>
          <th>DNI</th>
          <th>Celular</th>
          <th>Correo</th>
          <th>Estado</th>
        </tr>
        <tr>
          <td>John Doe</td>
          <td>12345678</td>
          <td>123456789</td>
          <td>johndoe@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Jane Smith</td>
          <td>98765432</td>
          <td>987654321</td>
          <td>janesmith@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Michael Johnson</td>
          <td>54321678</td>
          <td>543216789</td>
          <td>michaeljohnson@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Sarah Davis</td>
          <td>87654321</td>
          <td>876543210</td>
          <td>sarahdavis@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Robert Wilson</td>
          <td>13579246</td>
          <td>135792468</td>
          <td>robertwilson@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Laura Anderson</td>
          <td>86420937</td>
          <td>864209371</td>
          <td>lauraanderson@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
      </table>
    </div>
    <div class="section">
      <h2 class="section-header">Estudiantes</h2>
      <table>
        <tr>
          <th>Nombre</th>
          <th>DNI</th>
          <th>Celular</th>
          <th>Correo</th>
          <th>Estado</th>
        </tr>
        <tr>
          <td>Emily Johnson</td>
          <td>24681357</td>
          <td>246813579</td>
          <td>emilyjohnson@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>David Brown</td>
          <td>73928546</td>
          <td>739285461</td>
          <td>davidbrown@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Amy Wilson</td>
          <td>46823579</td>
          <td>468235791</td>
          <td>amywilson@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Michael Johnson</td>
          <td>64238957</td>
          <td>642389571</td>
          <td>michaeljohnson@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Samantha Davis</td>
          <td>92835641</td>
          <td>928356411</td>
          <td>samanthadavis@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Matthew Wilson</td>
          <td>36547892</td>
          <td>365478921</td>
          <td>matthewwilson@example.com</td>
          <td>
            <select>
              <option value="activo">Activo</option>
              <option value="inactivo">Inactivo</option>
            </select>
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>

<!-- Bootstrap Bundle with Popper -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>
</html>