<%-- 
    Document   : compras
    Created on : 29/10/2022, 20:24:31
    Author     : Sapón Pérez
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Proveedor" %>
<%@page import="modelo.Compra" %>
<%@page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="container">
            <header style="">
                <h3 id="cabecera">Compras</h3>
            </header>
            
            <ul class="nav justify-content-center">
                <li class="nav-item">
                  <a class="nav-link" href="empleados.jsp">Empleados</a>
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
                
                <li class="nav-item">
                  <a class="nav-link disabled" href="compras.jsp">Compras</a>
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
                                Proveedor obj = new Proveedor();
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
            <br/>
            
            <!-- empieza el modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalCompras_det">
		  Agregar
		</button>

		<!-- Modal -->
                <div class="modal fade" id="ModalCompras_det" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" style="max-width: fit-content;overflow-x: auto">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">SELECCIONA UN ARTICULO PARA ACTUALIZAR SU CANTIDAD Y PRECIO COMPRA</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
                          <form action="#" method="post">
                              <label><b>Producto</b></label>
                              <input type="text" name="txt_producto" id="txt_producto" class="form-control">
                              
                              <label><b>Marca</b></label>
                              <input type="text" name="txt_marca" id="txt_marca" class="form-control">
                              
                              <label><b>Descripcion</b></label>
                              <input type="text" name="txt_descript" id="txt_descript" class="form-control">
                              
                              <label><b>Existencia</b></label>
                              <input type="number" name="txt_existencia" id="txt_existencia" class="form-control">
                              
                              <label><b>Fecha_ingreso</b></label>
                              <input type="text" name="date_fi" id="date_fi" class="form-control">
                              
                              <label><b>Precio Costo</b></label>
                              <input type="text" name="txt_pcosto" id="txt_pcosto" class="form-control">
                              
                              <div class="modal-footer">
                              <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar item</button>
                              
                                </div>

                          </form>
                          <div id="tabbla">
                              <table border="1" class="table table-striped">
                                    <thead>
                                        <tr>
                                        <th>Producto</th>
                                        <th>marca</th>
                                        <th>descrip</th>
                                        <th>existencia</th>
                                        <th>fecha_ingreso</th>
                                        <th>Precio_costo</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbl_clientes">
                                    <% 
                                    Compra compra = new Compra();
                                    DefaultTableModel tabla = new DefaultTableModel();
                                    tabla = compra.leer();
                                    for (int t =0;t<tabla.getRowCount();t++){
                                                out.println("<tr data-id="+tabla.getValueAt(t, 0)+">");
                                                out.println("<td>"+ tabla.getValueAt(t, 1) +"</td>");
                                                out.println("<td>"+ tabla.getValueAt(t, 2) +"</td>");
                                                out.println("<td>"+ tabla.getValueAt(t, 3) +"</td>");
                                                out.println("<td>"+ tabla.getValueAt(t, 4) +"</td>");
                                                out.println("<td>"+ tabla.getValueAt(t, 5) +"</td>");
                                                out.println("<td>"+ tabla.getValueAt(t, 6) +"</td>");
                                                out.println("</tr>");
                                        }
                                    %>

                                    </tbody>
                                </table>
                              
                          </div>
		      </div>
		      
		    </div>
		  </div>
		</div>
            
                        
                        
                        
                        
                            
                          
            
            
            <!-- footer -->
            <footer style="padding-top: 50px">
                <div style="background-color: yellow ">
                    <h4 style="text-align: center">Wuate-Facturas &copy;</h4>
                    <p style="background-color: grey">lorem ipsum dolor asit amet conspiqua</p>
                </div>
                
            </footer>
        </div>
    <script src="https://code.jquery.com/jquery-3.6.1.slim.js" integrity="sha256-tXm+sa1uzsbFnbXt8GJqsgi2Tw+m4BLGDof6eUPjbtk=" crossorigin="anonymous"></script>           
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
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
