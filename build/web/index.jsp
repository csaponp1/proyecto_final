<%-- 
    Document   : index
    Created on : 27/10/2022, 00:03:12
    Author     : Sapón Pérez
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Login" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet">
    </head>
    <body>
        <section class="vh-100">
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-6 text-black">
                <div class="px-5 ms-xl-4">
                  <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
                  <img src="despensafeliz.png" class="rounded mx-auto d-block"  width="200" height="200" alt="Imagen no encontrada">
                </div>
                <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

                    <form class="container" style="width: 28rem;" action="sr_login" method="post">
                      <input id="txt_usuario" name ="txt_usuario" class="form-control"/>  
                      <lable class="form-label" for="txt_usuario">Usuario</lable>
                        
                      <input type="password" id="txt_contrasena" name ="txt_contrasena" class="form-control"/>
                      <label  for="txt_contrasena">Contraseña</label>
                      <div class="pie-form">
                        <a href="#">¿Perdiste tu contraseña?</a>
                        <a href="#">¿No tienes Cuenta? Registrate</a>
                        

                        </div>
                      <div>                     
                          <button class="btn btn-outline-secondary btn-sm btn-block" id="btn_login" name="btn_login" value="login">Iniciar Sesion</button>
                      </div>
                  </form>
                    <button onclick="displayDate()">The time is?</button>
                    <p id="demo"></p>
                        
                   </div>

              </div>
              <div class="col-sm-6 px-0 d-none d-sm-block">
                <img src="tienda.jpg" alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
              </div>
            </div>
          </div>
        </section>
        
        
        
        
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>    
    <script src="C:\Users\willy\Documents\NetBeansProjects\web_proyecto_final\web\js\moment.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
    function displayDate() {
    let date = new Date();
    var dateString=(date.toISOString().split('T')[0]);
    var dateString1 = date.toLocaleTimeString();
    
    document.getElementById("demo").innerHTML = [dateString + " " + dateString1];
    }
    </script>
    
    </body>
    <footer class="text-center text-white fixed-bottom" style="background-color: #7ACBEB">
          <!-- Grid container -->
          <div class="container p-4"></div>
          <!-- Grid container -->

          <!-- Copyright -->
          <div class="text-center p-3">
            © 2022 Copyright:
            <a class="text-white" href="https://okdiario.com/img/2022/01/21/5-rasgos-que-definen-la-personalidad-de-los-gatos.jpg">Sergio Bay</a>
          </div>
          <!-- Copyright -->
    </footer>
</html>
