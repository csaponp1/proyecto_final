<%-- 
    Document   : compras
    Created on : 29/10/2022, 20:24:31
    Author     : Sapón Pérez
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Proveedor" %>
<%@page import="modelo.Compra" %>
<%@page import="modelo.Producto" %>
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
        
        
            
            
            
            
            
                        
            <form class="container" action="#" method="post">
                
                <div class="row">
            <div class="col">
                    <label class="form-label">Id Compra</label>
                    <%
                        Compra compra = new Compra();
                        out.println("<input class='form-control' id='txt_id_venta_' name='txt_id_venta_' value='" +compra.id_compra()+ "' readonly>");
                    %>
                    <p></p>
                    <label class="form-label">No. Orden Compra</label>
                    <input type="text" class="form-control" id="txt_orden_compra" name="txt_orden_compra">
                    <p></p>
                    
                    <label class="form-label">Fecha</label>
                    <input type="date" class="form-control" id="txt_date" name="txt_date">
            </div>
                    
            <div class="col">
                <div>
                    <label class="form-label">Proveedor</label>
                        <div class="input-group mb-3">
                            <select id="slc_cliente" name="slc_cliente" class="form-select">
                                <option>--  Elija Proveedor --</option>
                                <%
                                  Proveedor obj = new Proveedor();
                                  HashMap<String, String> drop = obj.drop_proveedor();
                                  for (String i : drop.keySet()) {
                                        out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                    }
                                %>
                                
                            </select>
                                <button class="btn btn-outline-secondary" type="button" onclick="location.href='clientes.jsp';">Agregar Proveedor</button>
                        </div>
                </div>
                
                <label class="form-label">Fecha de ingreso</label>
                <input type="text" class="form-control" id="txt_fecha_ingreso" name="txt_fecha_ingreso" value="" readonly>
                <p></p>
                </div>
        </div>
        
        <!-- empieza la tabla dinamica -->
        <div class="container">
            
            <table class="table table-sm">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Cantidad</th>
                        <th>Descripcion</th>
                        <th>Precio compra</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody id="tbl_compra">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
                
            </table>
        </div>
        <div class="d-grid gap-3 col-3 mx-auto">
            <button type="button" class="btn btn-primary" id="btn_producto" name="btn_producto" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalCompras_det" name="btn_compra" id="btn_compra" value="agregar" onclick="displayDate();limpiar()">Agregar producto</button>
        </div>
        </form>
            
        <div class="d-grid gap2 col-2 mx-auto">
            <button type="button" id="btn_producto" name="btn_producto" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalCompras_det" value="agregar_">Agregar</button>
                <p></p>
            <button class="btn btn-primary" onClick="window.location.reload(true)">Concluir Compra</button>
        </div>

		<!-- Modal -->
                <div class="modal fade" id="ModalCompras_det" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" style="max-width: fit-content;overflow-x: auto">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">SELECCIONA UN ARTICULO PARA ACTUALIZAR SU CANTIDAD Y PRECIO COMPRA</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
                          <form class="container" action="#" method="post">
                            <%
                                Compra compraDetalle = new Compra();
                                out.println("<input class='form-control' id='txt_id_venta_' name='txt_id_venta_' value='" +compraDetalle.id_compra_detalle()+ "' readonly>"); 
                            %>
                            <label class="form-label">Id Producto</label>
                            <input type="text" class="form-control" id="txt_idproducto" name="txt_idproducto" readonly>
                            <label class="form-label">Cantidad</label>
                                
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" id="txt_cantidad" name="txt_cantidad" onchange="venta();">
                                        <span class="input-group-text">Existencia</span>
                                        <input type="text" class="form-control" id="txt_existencia" name="txt_existencia" readonly>
                                </div>
                            
                            <label class="form-label">Descripcion</label>
                            <input type="text" class="form-control" id="txt_descripcion_producto" name="txt_descripcion_producto" readonly>
                            <label class="form-label">Costo Unitario</label>
                            <input type="text" class="form-control" id="txt_costo_unitario" name="txt_costo_unitario" onchange="total();">
                            <label class="form-label">Total</label>
                            <input type="text" class="form-control" id="txt_total" name="txt_total" readonly>
                            
                            <!-- nuevo input -->
                            <label class="form-label">Venta</label>
                            <input type="text" class="form-control" id="txt_venta" name="txt_venta">
                            <!-- comment -->
                            
                            <label></label>  
                              <table class="table table-striped">
                                    <thead>
                                        <tr>
                                        <th  scope="col">Id</th>
                                        <th  scope="col">Descripcion</th>
                                        <th  scope="col">precio compra</th>
                                        <th  scope="col">existencia</th>
                                        <th  scope="col">Precio unitario para la venta</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbl_pr">
                                    <% 
                                    Producto producto = new Producto();
                                    DefaultTableModel tabla = new DefaultTableModel();
                                    tabla = producto.leer_tabla_compras();
                                    for (int t=0;t<tabla.getRowCount();t++){
                                        out.println("<tr>");
                                        out.println("<td>" + tabla.getValueAt(t,0) + "</td>");
                                        out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                                        out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                                        out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
                                        out.println("<td>"+tabla.getValueAt(t, 4)+"</td>");
                                        out.println("</tr>");
                                    }
                                    %>

                                    </tbody>
                                <button id="btn_agregar_compra" name="btn_agregar_compra" value="agregar" data-bs-dismiss="modal" onclick="celda()">Agregar</button>   
                            </table>
                        </form>
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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <script type="text/javascript">
        var table = document.getElementById('tbl_pr');
                        for (var i = 0; i < table.rows.length; i++)
                                    {
                                        table.rows[i].onclick = function ()
                                        {
                                            rIndex = this.rowIndex;
                                            document.getElementById("txt_idproducto").value = this.cells[0].innerHTML;
                                            document.getElementById("txt_descripcion_producto").value = this.cells[1].innerHTML;
                                            document.getElementById("txt_costo_unitario").value = this.cells[2].innerHTML;
                                            document.getElementById("txt_existencia").value = this.cells[3].innerHTML;
                                            document.getElementById("txt_venta").value = this.cells[4].innerHTML;
                                        };
                                    }
                                    function limpiar() {
                                        $("#txt_idproducto").val(0);
                                        $("#txt_descripcion_producto").val('');
                                        $("#txt_costo_unitario").val('');
                                        $("#txt_cantidad").val('');
                                        $("#txt_total").val('');
                                        $("#txt_existencia").val('');
                                        $("#txt_venta").val('');
                                    }

                                    function total() {
                                        var costo_u = document.getElementById("txt_costo_unitario");
                                        var cant = document.getElementById("txt_cantidad");
                                        var exist = document.getElementById("txt_existencia");
                                        var total = costo_u.value * cant.value;
                                        var exist_total = parseInt(cant.value) + parseInt(exist.value);
                                        document.getElementById("txt_total").value = total;
                                        document.getElementById("txt_existencia").value = exist_total;
                                        venta();
                                    }
                                    
                                        function venta(){
                                        var costo_u = document.getElementById("txt_costo_unitario");
                                        var nuevo_precio = parseFloat((costo_u.value)*0.25)+parseFloat(costo_u.value);
                                        document.getElementById("txt_venta").value = nuevo_precio;
                                        
                                    }
                                    
                                    function celda() {
                                        tbl = document.getElementById("tbl_compra");
                                        row = tbl.insertRow(0);
                                        var newCell = row.insertCell(0);
                                        newCell.innerHTML = document.getElementById("txt_idproducto").value;
                                        var newCell = row.insertCell(1);
                                        newCell.innerHTML = document.getElementById("txt_cantidad").value;
                                        var newCell = row.insertCell(2);
                                        newCell.innerHTML = document.getElementById("txt_descripcion_producto").value;
                                        var newCell = row.insertCell(3);
                                        newCell.innerHTML = document.getElementById("txt_costo_unitario").value;
                                        var newCell = row.insertCell(4);
                                        newCell.innerHTML = document.getElementById("txt_total").value;
                                    }
                                    const btn = document.getElementById("btn_compra");
                                    const btn_2 = document.getElementById("btn_producto");
                                    btn.addEventListener('click', () => {
                                        btn.style.display = 'none';
                                        btn_2.style.display = "block";
                                    });
        
        
                                               
                        function displayDate() {
                        let date = new Date();
                        var dateString=(date.toISOString().split('T')[0]);
                        var dateString1 = date.toLocaleTimeString();

                        document.getElementById("txt_fecha_ingreso").value = [dateString + " " + dateString1];
                        };
                    
                    </script>
    </body>
</html>
