<%-- 
    Document   : compras
    Created on : 29/10/2022, 20:24:31
    Author     : Sapón Pérez
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.proveedores" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="container">
            <header style="">
                <h3 id="cabecera">Compras</h3>
            </header>
            
            <ul class="nav justify-content-center">
                <li class="nav-item">
                  <a class="nav-link disabled" href="empleados.jsp">Empleados</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="puestos.jsp">Puestos</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="proveedores.jsp">Proveedores</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="clientes.jsp">Clientes</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="productos.jsp">Productos</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="marcas.jsp">Marcas</a>
                </li>
                
                <div class="contenidousr">
                    <a href="index.jsp">
                    <div class = "icon">
                        <span style="padding-left:10px;"></span>
                        <img src="" alt="foto" width="2%" style="position: absolute; float: right"><span style="padding-left: 30px">Salir</span>
                    </div>
                    </a>
                    <a href="index.jsp" target="_blank">
                     <div class = "icon">
                         <span style="padding-left:10px;"></span>
                        <img src="" alt="foto" width="2%" style="position: absolute; float: right"><span style="padding-left: 30px">Settings</span>
                     </div>
                    </a>
                    
                </div>
                
                <li>
                <a class="navbar-brand" href="aboutme.html">
                    <img src="" alt="Avatar Logo" style="width:40px;" class="rounded-pill"> 
                </a>
                </li>
            </ul>
                        
            <label><b>Fecha de la orden</b></label>            
            <p id="f_orden" onclick="this.innerHTML = displayDate();">hola</p>
 
            <!-- maestro -->
            <form action="#" method="post" class="form-group">
                            
                        <label for="lbl_puesto"><b>Seleccione proveedor</b></label>
                        <select name ="drop_proveedores" id="drop_proveedores" class="form-select">    
                            <%
                                proveedores obj = new proveedores();
                                HashMap<String,String> drop = obj.drop_proveedor();
                                for(String i: drop.keySet()){
                                    out.println("<option value='"+i+"'>"+drop.get(i)+"</option>");
                                }
                            %>
                        </select>
                        <div>
                            <p>
                                <a href="proveedores.jsp" style="text-decoration: none" target="_blank" >Agregar Proveedor</a>
                            </p>
                        </div>

                        <br><button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary" onclick="displayDate()">Agregar</button>
                           
                    
            </form>
                        
                        <form action="#" method="post">
                            <div class="form-group">
                                <table class="table table-bordered">
                                    <tr>
                                        <td><b>Cantidad</b></td>
                                        <td><b>Codigo</b></td>
                                        <td><b>Descripcion</b></td>
                                        <td><b>Precio</b></td>
                                        <td><b>Subtotal</b></td>
                                    </tr>
                                </table>
                            </div>
                            
                            
                            
                            
                            
            </form>
                            
                          
            
            
            <!-- footer -->
            <footer style="padding-top: 50px">
                <div style="background-color: yellow ">
                    <h4 style="text-align: center">Wuate-Facturas &copy;</h4>
                    <p style="background-color: grey">lorem ipsum dolor asit amet conspiqua</p>
                </div>
                
            </footer>
        </div>
    <script src="https://code.jquery.com/jquery-3.6.1.slim.js" integrity="sha256-tXm+sa1uzsbFnbXt8GJqsgi2Tw+m4BLGDof6eUPjbtk=" crossorigin="anonymous"></script>           
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script type="text/javascript">
                       function displayDate() {
                        let date = new Date();
                        var dateString=(date.toISOString().split('T')[0]);
                        var dateString1 = date.toLocaleTimeString();
                        return "Fecha: "+dateString+" \nHora: "+dateString1;
                        
                        };
                        
                        
                    </script>
    </body>
</html>
