<%-- 
    Document   : index
    Created on : 9/10/2022, 12:11:10
    Author     : Sapón Pérez
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import='modelo.Conexion' %>
<%@page import='javax.swing.table.DefaultTableModel' %>
<%@page import='modelo.Puesto' %>
<%@page import='modelo.Empleado'%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet">
        
            
    </head>
    <body>
        <div class="container">
            
            <header style="background-color: #ff3333">
                <h1>Formulario Empleados</h1>
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
                        <img src="sdwn.png" alt="foto" width="2%" style="position: absolute; float: right"><span style="padding-left: 30px">Salir</span>
                    </div>
                    </a>
                    <a href="index.jsp" target="_blank">
                     <div class = "icon">
                         <span style="padding-left:10px;"></span>
                        <img src="settings.png" alt="foto" width="2%" style="position: absolute; float: right"><span style="padding-left: 30px">Settings</span>
                     </div>
                    </a>
                    
                </div>
                
                <li>
                <a class="navbar-brand" href="aboutme.html">
                    <img src="avatar-icon-fashion-men-vector-avatar.jpg" alt="Avatar Logo" style="width:40px;" class="rounded-pill"> 
                </a>
                </li>
                
                
                
            </ul>
            
            <!-- empieza el body -->                                   
        <br>  
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalEmpleado" onclick="cls()">Agregar</button>
        <button type="button" name="btn_puestos" id="btn_puestos"  onclick="location.href='puestos.jsp';" class="btn btn-primary">Puestos</button>
        
        <div class="modal fade" id="modalEmpleado" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                <div class="modal-body">
                    <div>
                        <form action="sr_empleado" method="post" class="form-group">
                        <label for="lbl_id"><b>ID</b></label>
                        <input type="text" name="txt_id" id="txt_id" class="form-control" readonly="" value="0">

                        <label for="lbl_nom"><b>Nombres</b></label>
                        <input type="text" name="txt_nom" id="txt_nom" class="form-control" placeholder="Ejemplo: Byron Allan" required>

                        <label for="lbl_ape"><b>Apellidos</b></label>
                        <input type="text" name="txt_ape" id="txt_ape" class="form-control" placeholder="Ejemplo: Brito Delgado" required>

                        <label for="lbl_dir"><b>Direccion</b></label>
                        <input type="text" name="txt_dir" id="txt_dir" class="form-control" placeholder="Ejemplo: Ciudad zona pais" required>

                        <label for="lbl_tel"><b>Telefono</b></label>
                        <input type="txt" name="txt_tel" id="txt_tel" placeholder="Ejemplo: 33333333" class="form-control" required>
                        
                        <label for="lbl_dpi"><b>DPI</b></label>
                        <input type="txt" name="txt_dpi" id="txt_dpi" placeholder="Ejemplo: xxxxxxxxxxxxx" class="form-control" pattern=".{13}" title="ingrese 13 digitos" required>
                        
                        <lable for="lbl_sexo"><b>Genero</b></lable>
                        <select name ="drop_genero" id="drop_genero" class="form-select">
                            <option value="0">Femenino</option>
                            <option value="1">Masculino</option>
                        </select>

                        <label for="lbl_puesto"><b>Puesto</b></label>
                        <select name ="drop_puesto" id="drop_puesto" class="form-select">    
                            <%
                                Puesto obj = new Puesto();
                                HashMap<String,String> drop = obj.drop_puesto();
                                for(String i: drop.keySet()){
                                    out.println("<option value='"+i+"'>"+drop.get(i)+"</option>");
                                }

                            %>
                            
                        </select>
                        
                        <label for="lbl_fn"><b>Fecha nacimiento</b></label>
                        <input type="date" name="date_fn" id="date_fn" class="form-control">
                        
                        <label for="lbl_f-inicio"><b>Fecha inicio labores</b></label>
                        <input type="date" name="date_f-inicio" id="date_f-inicio" class="form-control">
                        
                        <label for="lbl_f-ingreso"><b>Fecha ingreso</b></label>
                        <input type="date" name="date_f-ingreso" id="date_f-ingreso" class="form-control" value="">
                       
                
                        <br><button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    
                        </form>
                    </div>
                </div>
            </div>
        </div>
       </div>
        
        <br><!-- tabla -->
        <h3 style="text-align: center">Tabla Empleados</h3>
        
        <table class="table table-hover">
            <thead class="table-dark">
                <tr>
                  <th>Nombres</th>
                  <th>Apellidos</th>
                  <th>Direccion</th>
                  <th>Telefono</th>
                  <th>DPI</th>
                  <th>Genero</th>
                  <th>Puesto</th>
                  <th>Nacimiento</th>
                  <th>Inicio labores</th>
                  <th>Ingreso</th>
                </tr>
            </thead>
            <tbody id="tbl_empleados" class="table-secondary">
                <%
                        Empleado empleado = new Empleado();
                                DefaultTableModel tabla = new DefaultTableModel();
                                tabla=empleado.leer();
                                for(int t = 0; t<tabla.getRowCount();t++){
                                    out.println("<tr data-id="+tabla.getValueAt(t, 0)+" data-id_g="+tabla.getValueAt(t,11)+" data-id_p="+ tabla.getValueAt(t,12)+">");
                                    out.println("<td>"+tabla.getValueAt(t, 1)+"</td>");
                                    out.println("<td>"+tabla.getValueAt(t, 2)+"</td>");
                                    out.println("<td>"+tabla.getValueAt(t, 3)+"</td>");
                                    out.println("<td>"+tabla.getValueAt(t, 4)+"</td>");
                                    out.println("<td>"+tabla.getValueAt(t, 5)+"</td>");
                                    out.println("<td>"+tabla.getValueAt(t, 6)+"</td>");
                                    out.println("<td>"+tabla.getValueAt(t, 7)+"</td>");
                                    out.println("<td>"+tabla.getValueAt(t, 8)+"</td>");
                                    out.println("<td>"+tabla.getValueAt(t, 9)+"</td>");
                                    out.println("<td>"+tabla.getValueAt(t, 10)+"</td>");
                                    out.println("</tr>");
                                }

                        %>
            </tbody>
        </table>
        

        
    
        
               
        </div>
    <footer class="text-center text-white fixed-bottom" style="background-color:#BFBFBF;">
    <div class="text-center p-3">
    © 2022 Copyright:
    <a class="text-white" href="https://okdiario.com/img/2022/01/21/5-rasgos-que-definen-la-personalidad-de-los-gatos.jpg" target="_blank">Grupo 3</a>
    </div>   
    </footer>
        
         <script src="https://code.jquery.com/jquery-3.6.1.slim.js" integrity="sha256-tXm+sa1uzsbFnbXt8GJqsgi2Tw+m4BLGDof6eUPjbtk=" crossorigin="anonymous"></script>           
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script type="text/javascript">
                        $('#tbl_empleados').on('click','tr td',function(evt){
                            var target,id,id_p,id_g,nom,ape,dir,tel,dpi,fn,fl,fi;
                            target = $(event.target);
                            id = target.parent().data('id');
                            id_g = target.parent().data('id_g');
                            id_p = target.parent().data('id_p');
                            
                            nom = target.parent("tr").find("td").eq(0).html();
                            ape = target.parent("tr").find("td").eq(1).html();
                            dir = target.parent("tr").find("td").eq(2).html();
                            tel = target.parent("tr").find("td").eq(3).html();
                            dpi = target.parent("tr").find("td").eq(4).html();
                            fn = target.parent("tr").find("td").eq(7).html();
                            fl = target.parent("tr").find("td").eq(8).html();
                            fi = target.parent("tr").find("td").eq(9).html();
                            $("#txt_id").val(id);
                            $("#txt_nom").val(nom);
                            $("#txt_ape").val(ape);
                            $("#txt_dir").val(dir);
                            $("#txt_tel").val(tel);
                            $("#txt_dpi").val(dpi);
                            $("#date_fn").val(fn);
                            $("#date_f-inicio").val(fl);
                            $("#date_f-ingreso").val(fi);
                            $("#drop_genero").val(id_g);
                            $("#drop_puesto").val(id_p);
                            $("#modalEmpleado").modal('show');
                        });
                    </script>
                    <script type="text/javascript">
                        function cls(){
                        $("#txt_id").val(0);
                            $("#txt_nom").val('');
                            $("#txt_ape").val('');
                            $("#txt_dir").val('');
                            $("#txt_tel").val('');
                            $("#txt_dpi").val('');
                            $("#date_fn").val('');
                            $("#date_f-inicio").val('');
                            $("#date_f-ingreso").val('');
                            $("#drop_genero").val(1);
                            $("#drop_puesto").val(1);
                 
                        }

                    </script>
    </body>
</html>
