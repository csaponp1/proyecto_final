<%-- 
    Document   : puestos
    Created on : 12/10/2022, 00:40:16
    Author     : Sapón Pérez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puestos</title>      
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            
            <header style="background-color: #ff3333">
                <h1>Formulario Puestos</h1>
            </header>
            
            
            
                <ul class="nav justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Puestos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sobre nosotros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Nuestras politicas</a>
                    </li>
                </ul>
            
            <form action="sr_puesto" method="post" class="form-group">
                        <label for="lbl_id"><b>ID</b></label>
                        <input type="text" name="txt_id" id="txt_id" class="form-control" readonly="" value="0">
                        
                        <label for="lbl_nom"><b>Puesto</b></label>
                        <input type="text" name="txt_puesto" id="txt_puesto" class="form-control" placeholder="Ejemplo: Administrador" required>

                        <br><button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </form>
            
            
            
            <!-- empieza el body -->
            
            
            
            <div class="container mt-3">
                <h3 style="text-align: center"> Tabla Puestos</h3>
            <div class="table-responsive">
                <table class="table table-dark table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Puesto</th>
                    </tr>
                </thead>
                <tbody>
              
                </tbody>
                </table>
            </div>
            </div>
            
            
        <footer style="background-color: #ff3333">
            <div style="border-width: 2px; border-style: solid;border-color: #999999">
                
                <nav class="navbar navbar-expand-sm bg-light justify-content-center" style="padding-top: 15px;padding-bottom: 15px">
                     <ul class="nav nav-tabs">
                         <li class="nav item"><a class="nav-link" href="#"> Quienes Somos </a></li>
                         <li class="nav item"> <a class="nav-link" href="#"> Siguenos en Twitter</a> </li>
                         <li class="nav item"> <a class="nav-link" href="#"> Siguenos en Tiktok </a></li>
                     </ul>
                 </nav>     
            </div>
            <p style="font-family: times new roman; color: #ffffff">
                Creado por Christian Sapon (c) 2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce venenatis, nisl in viverra semper, nibh quam efficitur augue, et elementum ex dui eu libero. Maecenas pretium massa nibh, a dictum leo commodo tincidunt. Duis aliquet ornare ex ac ultricies. Aliquam ligula nibh, pellentesque a cursus nec, scelerisque ac nunc. Proin laoreet non purus et aliquet. Aenean vel euismod purus. Donec tempor diam a pretium dictum. Ut augue lacus, consectetur sit amet bibendum eget, euismod non nulla. Ut quis justo vel nibh consequat ullamcorper et et sapien. Nullam nec scelerisque nisi. Phasellus venenatis facilisis imperdiet. Vivamus ut felis non dolor pellentesque ornare.
            </p>
           
        </footer>
            
            
            
        </div>    
        
        
        
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
