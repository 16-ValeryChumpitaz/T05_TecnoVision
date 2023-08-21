<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
    body {
        background-color: #red;
    }

    .container {
        margin-top: 100px;
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

    .btn-custom {
        background-color: red;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn-custom:hover {
        background-color: darkred;
    }
    
    .login-container {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 999;
    }

    .login-content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 24px;
        color: #888;
        cursor: pointer;
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
        background-color: red;
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
<title>ALFONSO UGARTE</title>
</head>
<body>
    <jsp:include page="login.jsp"></jsp:include>
    
    
    <div class="login-container" id="loginContainer">
        <div class="login-content">
            <span class="close-btn" onclick="closeLogin()">&times;</span>
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
    </div>

<script>
    function showLogin() {
        document.getElementById("loginContainer").style.display = "block";
    }

    function closeLogin() {
        document.getElementById("loginContainer").style.display = "none";
    }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
</body>