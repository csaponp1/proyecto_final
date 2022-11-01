<%-- 
    Document   : marcas
    Created on : 24/10/2022, 17:48:11
    Author     : Sapón Pérez
--%>
<%@page import="modelo.Marca" %>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marcas</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="container">
            <header style="background-color: #ff3333">
                <h1>Formulario Marcas</h1>
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
                  <a class="nav-link disabled" href="marcas.jsp">Marcas</a>
                </li>
                
                <div class="contenidousr">
                    <a href="index.jsp">
                    <div class = "icon">
                        <span style="padding-left:10px;"></span>
                        <img src="recursos/sdwn.png" alt="foto" width="2%" style="position: absolute; float: right"><span style="padding-left: 30px">Salir</span>
                    </div>
                    </a>
                    <a href="index.jsp" target="_blank">
                     <div class = "icon">
                         <span style="padding-left:10px;"></span>
                        <img src="recursos/settings.png" alt="foto" width="2%" style="position: absolute; float: right"><span style="padding-left: 30px">Settings</span>
                     </div>
                    </a>
                    
                </div> 
                
            </ul>

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_marca" onclick="limpiar()">Nuevo</button>
        <button type="button" name="btn_productos" id="btn_productos"  onclick="location.href='productos.jsp';" class="btn btn-primary">Productos</button>
            
            
            
            
            <!-- modal -->
            
        <div class="modal" id="modal_marca">
            <div class="modal-dialog">
            <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Formulario Producto</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        
                <!-- Modal body -->
                <div class="modal-body">   
                    <form action="sr_marca" method="post" class="form-group">
                    <label for="lbl_id"><b>ID:</b></label>
                    <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                    <label for="lbl_marca"><b>Marca:</b></label>
                    <input type="text" name="txt_marca" id="txt_marca" class="form-control" placeholder="Ejemplo TOSHIBA" required>
                                
                     <br>
                     <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Guardar</button>
                     <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                     <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                     <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                    </form>
                </div>
        
            </div>
            </div>
        </div>
    <!-- comment -->
    <br><h3 style="text-align: center">Tabla marcas</h3> 
        <table class="table table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th>Marca</th>

          </tr>
        </thead>
        <tbody id="tbl_marca">
            <%
            
                Marca obj_marca= new Marca(); ;
                DefaultTableModel tabla = new DefaultTableModel();
                tabla = obj_marca.leer();
                for (int t=0;t<tabla.getRowCount();t++){
                    out.println("<tr data-id=" + tabla.getValueAt(t,0) + ">");
                    out.println("<td>" + (t+1) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function limpiar(){
            $("#txt_id").val(0);
            $("#txt_marca").val('');
              
        }
            
        $('#tbl_marca').on('click','tr td',function(evt){
        var target,id,marca;
        target = $(event.target);
        id = target.parent().data('id');
        marca = target.parent("tr").find("td").eq(1).html();
        $("#txt_id").val(id);
        $("#txt_marca").val(marca);
        $("#modal_marca").modal('show');
        });    
    </script>
    </body>
</html>
