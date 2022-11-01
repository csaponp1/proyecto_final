<%-- 
    Document   : productos
    Created on : 24/10/2022, 17:20:42
    Author     : Sapón Pérez
--%>
<%@page import="modelo.Producto" %>
<%@page import="modelo.Marca" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <header style="background-color: #ff3333">
                <h1>Formulario Productos</h1>
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
                  <a class="nav-link disabled" href="productos.jsp">Productos</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="marcas.jsp">Marcas</a>  
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
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_producto" onclick="limpiar()">Nuevo</button>
            <button type="button" name="btn_marcas" id="btn_marcas"  onclick="location.href='marcas.jsp';" class="btn btn-primary">Marcas</button>
            
            <!-- modal -->
            <div class="modal" id="modal_producto">
            <div class="modal-dialog">
            <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Formulario Producto</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        
                <!-- Modal body -->
                    <div class="modal-body">    
                    <form action="sr_producto" method="post" class="form-group">
                    <label for="lbl_id"><b>ID:</b></label>
                    <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                    <label for="lbl_producto"><b>Producto:</b></label>
                    <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ejemplo P001" pattern="P[0-9]{3}" required>
                    <label for="lbl_drop_marcas"><b>Marca:</b></label>
                    <select name="drop_marcas" id="drop_marcas" class="form-control">
                     
                        <%
                        Marca obj_marca = new Marca();
                        HashMap<String,String> drop = obj_marca.drop_marcas();
                        for (String i: drop.keySet()){
                        out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                        }
                        %>
                    
                    
                    </select>
                    <label for="lbl_descripcion"><b>Descripcion:</b></label>
                    <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Ejemplo Laptop HP" required>
                    <label for="lbl_imagen"><b>Imagen:</b></label>
                    <input type="text" name="txt_imagen" id="txt_imagen" class="form-control" placeholder="Ejemplo Imagen">
                    <label for="lbl_precio_costo"><b>Precio Costo:</b></label>
                    <input type="text" name="txt_precio_costo" id="txt_precio_costo" class="form-control" placeholder="Ejemplo 999.99" required>
                    <label for="lbl_precio_venta"><b>Precio Venta:</b></label>
                    <input type="text" name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ejemplo 999.99" required>
                    <label for="lbl_existencia"><b>Existencia:</b></label>
                    <input type="text" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ejemplo 0001" required>
                    <label for="lbl_fecha_ingreso"><b>Fecha de Ingreso:</b></label>
                    <input type="text" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" value="" placeholder="el sistema lo agrega automatico">
                
                     <br>
                     <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary" onclick="displayDate()">Agregar</button>
                     <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success" onclick="displayDate()">Modificar</button>
                     <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                     <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                    </form>
                </div>
        
            </div>
            </div>
        </div>
        <!--empieza el body -->
        <br><h3 style="text-align: center">Tabla Productos</h3>
        <table class="table table-striped">
        <thead>
          <tr>
            <th>Producto</th>
            <th>Descripcion</th>
            <th>Imagen</th>
            <th>Precio Costo</th>
            <th>Precio Venta</th>
            <th>Existencia</th>
            <th>Fecha Ingreso</th>
            <th>Marca</th>
          </tr>
        </thead>
        <tbody id="tbl_producto">
            <%
            
                Producto obj_producto = new Producto();
                DefaultTableModel tabla = new DefaultTableModel();
                tabla = obj_producto.leer();
                for (int t=0;t<tabla.getRowCount();t++){
                    out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,9) + " >");
                    out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t,8) + "</td>");  
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
                $("#txt_producto").val('');
                $("#txt_drop_marcas").val('1');
                $("#txt_descripcion").val('');
                $("#txt_imagen").val('');
                $("#txt_precio_costo").val('');
                $("#txt_precio_venta").val('');
                $("#txt_existencia").val('');
                $("#txt_fecha_ingreso").val('');
            }
            
            $('#tbl_producto').on('click','tr td',function(evt){
                var target,id,id_p,producto,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso;
                target = $(event.target);
                id = target.parent().data('id');
                
                producto = target.parent("tr").find("td").eq(0).html();
                descripcion = target.parent("tr").find("td").eq(1).html();
                imagen = target.parent("tr").find("td").eq(2).html();
                precio_costo = target.parent("tr").find("td").eq(3).html();
                precio_venta = target.parent("tr").find("td").eq(4).html();
                existencia = target.parent("tr").find("td").eq(5).html();
                fecha_ingreso = target.parent("tr").find("td").eq(6).html();
                id_p = target.parent().data('id_p');
                $("#txt_id").val(id);
                $("#txt_producto").val(producto);
                $("#txt_descripcion").val(descripcion);
                $("#txt_imagen").val(imagen);
                $("#txt_precio_costo").val(precio_costo);
                $("#txt_precio_venta").val(precio_venta);
                $("#txt_existencia").val(existencia);
                $("#txt_fecha_ingreso").val(fecha_ingreso);
                $("#drop_marcas").val(id_p);
                $("#modal_producto").modal('show');
            });
        </script>
        <script type="text/javascript">
            function displayDate() {
            let date = new Date();
            var dateString=(date.toISOString().split('T')[0]);
            var dateString1 = date.toLocaleTimeString();
            document.getElementById("txt_fecha_ingreso").value = [dateString + " " + dateString1];
            };
        </script>
    </body>
</html>
