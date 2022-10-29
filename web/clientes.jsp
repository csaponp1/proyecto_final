<%-- 
    Document   : clientes
    Created on : 21/10/2022, 00:53:50
    Author     : Sapón Pérez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page import="modelo.Cliente" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet">
    </head>
    <body>
        
        
        
    <div class="container">
    <header>
        <div class="container">
        <h1>Formulario Clientes</h1>
        </div>
    </header>
    
    <div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
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
                  <a class="nav-link disabled" href="clientes.jsp">Clientes</a>
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
            </ul>
        </div>
      </div>
    </nav>
    </div>
            
    <!-- Empieza el body-->
    
     <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_cliente" onclick="limpiar()">
        Agregar Cliente
        </button>


    <div class="modal fade" id="modal_cliente" tabindex="-1" aria-labelledby="modal_cliente" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Agregar Cliente</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.reload()"></button>
          </div>
          <div class="modal-body">
              <form class="form-group" action="sr_cliente" method="post">
                <label for="lbl_id">id</label>
                <input  type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                <label for="lbl_nombres">Nombres</label>
                <input  type="text" name="txt_nombres" id="txt_nombres" class="form-control">
                <label for="lbl_apellidos">Apellidos</label>
                <input  type="text" name="txt_apellidos" class="form-control" id="txt_apellidos">
                <label for="lbl_nit">Nit</label>   
                <input  type="text" name="txt_nit" id="txt_nit" pattern="[0-9]{0,12}" title="Ingrese el nit sin guiones" class="form-control">
                <label for="lbl_nit">Genero</label>
                <select name="drop_genero" id="drop_genero" class="form-control">
                    <option value="0" >Femenino</option>
                    <option value="1" >Masculino</option>
                </select>
                <label for="lbl_telefono">Telefono</label>
                <input  type="text" name="txt_telefono" id="txt_telefono" pattern="[0-9]{8}" class="form-control">
                <label for="lbl_nit">Correo Electronico</label>
                <input  type="text" name="txt_email" id="txt_email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="usuario@dominio.com" class="form-control">
                <label for="lbl_nit">Fecha de Ingreso</label>
                <input  type="date" name="txt_date" id="txt_date" class="form-control">
                <div class="modal-footer">
                    <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                    <button name="btn_modificar" id="btn_modificar" class="btn btn-success" value="modificar">Modificar</button>
                    <button name="btn_eliminar" id="btn_eliminar" class="btn btn-danger" value="eliminar">Eliminar</button>
                </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <!-- tabla -->
    <h3 style="text-align: center">Tabla Clientes</h3>
        <table border="1" class="table table-striped">
            <thead>
                <tr>
                <th>Id</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Nit</th>
                <th>Genero</th>
                <th>Telefono</th>
                <th>Correo Electronico</th>
                <th>Fecha de Ingreso</th>
                </tr>
            </thead>
            <tbody id="tbl_clientes">
        <% 
        Cliente obj = new Cliente();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = obj.leer();
        for (int t =0;t<tabla.getRowCount();t++){
                    out.println("<tr>");
                    out.println("<td>"+ tabla.getValueAt(t, 0) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 1) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 2) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 3) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 4) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 5) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 6) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 7) +"</td>");
                    out.println("</tr>");
            }
        %>
      
            </tbody>
    </table>
        
        
    <footer class="text-center text-white fixed-bottom" style="background-color: #BFBFBF;">
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3">
    © 2022 Copyright:
    <a class="text-white" href="https://okdiario.com/img/2022/01/21/5-rasgos-que-definen-la-personalidad-de-los-gatos.jpg" target="_blank">Grupo 3</a>
  </div>
  <!-- Copyright -->
        </footer>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_nombres").val('');
                $("#txt_apellidos").val('');
                $("#txt_nit").val('');
                $("#drop_genero").val('0');
                $("#txt_telefono").val('');
                $("#txt_email").val('');
                $("#txt_date").val('');
    }
            var table = document.getElementById('tbl_clientes');
            
                for(var i = 0; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         
                         //rIndex = this.rowIndex;
                         document.getElementById("txt_id").value = this.cells[0].innerHTML;
                         document.getElementById("txt_nombres").value = this.cells[1].innerHTML;
                         document.getElementById("txt_apellidos").value = this.cells[2].innerHTML;
                         document.getElementById("txt_nit").value = this.cells[3].innerHTML;
                         
                        if(this.cells[4].innerHTML === "FEMENINO"){
                             document.getElementById("drop_genero").value = 0;       
                         } else{
                             document.getElementById("drop_genero").value = 1;
                         }
                         
                         document.getElementById("txt_telefono").value = this.cells[5].innerHTML;
                         document.getElementById("txt_email").value = this.cells[6].innerHTML;
                         document.getElementById("txt_date").value = this.cells[7].innerHTML;
                         $("#modal_cliente").modal('show');
                    };
                }
        </script>
    </body>
</html>
