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
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
    }

    .login-container {
      width: 300px;
      margin: 100px auto;
      padding: 20px;
      background-color: white;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .login-container h2 {
      text-align: center;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
    }

    .form-group input {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    .form-group input[type="submit"] {
      background-color: #FF0000;
      color: white;
      cursor: pointer;
    }

    .social-buttons {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }

    .social-buttons a {
      display: inline-block;
      padding: 8px 16px;
      background-color: #f2f2f2;
      border: 1px solid #ccc;
      border-radius: 3px;
      text-decoration: none;
      color: black;
      transition: background-color 0.3s ease-in-out;
    }

    .social-buttons a:hover {
      background-color: #e0e0e0;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>Login</h2>
    <form>
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
      </div>
      <div class="form-group">
        <input type="submit" value="Login">
      </div>
    </form>
    <div class="social-buttons">
      <a href="https://www.facebook.com"><i class="fab fa-facebook-f"></i></a>
      <a href="mailto:example@example.com"><i class="far fa-envelope"></i></a>
      <a href="https://www.linkedin.com"><i class="fab fa-linkedin-in"></i></a>
    </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>



<!-- Bootstrap Bundle with Popper -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>
</html>