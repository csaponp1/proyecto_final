package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.HashMap;
import modelo.Conexion;
import javax.swing.table.DefaultTableModel;
import modelo.Puesto;
import modelo.Empleado;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Empleados</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            \n");
      out.write("            <header style=\"background-color: #ff3333\">\n");
      out.write("                <h1>Formulario Empleados</h1>\n");
      out.write("            </header>\n");
      out.write("            <ul class=\"nav justify-content-center\">\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                  <a class=\"nav-link disabled\" href=\"#\">Inicio</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                  <a class=\"nav-link\" href=\"#\">Puestos</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                  <a class=\"nav-link\" href=\"#\">sobre nosotros</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                  <a class=\"nav-link\" href=\"#\">Nuestras politicas</a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("            \n");
      out.write("            <!-- empieza el body -->            \n");
      out.write("            <button type=\"button\" class=\"btn-light\"><a href=\"puestos.jsp\">Manteminiento Puestos</a> </button>\n");
      out.write("        <br>  \n");
      out.write("        <button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#modalEmpleado\" onclick=\"cls()\">\n");
      out.write("            Agregar\n");
      out.write("        </button>\n");
      out.write("        \n");
      out.write("        <div class=\"modal fade\" id=\"modalEmpleado\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                <div class=\"modal-body\">\n");
      out.write("                    <div>\n");
      out.write("                        <form action=\"sr_empleado\" method=\"post\" class=\"form-group\">\n");
      out.write("                        <label for=\"lbl_id\"><b>ID</b></label>\n");
      out.write("                        <input type=\"text\" name=\"txt_id\" id=\"txt_id\" class=\"form-control\" readonly=\"\" value=\"0\">\n");
      out.write("\n");
      out.write("                        <label for=\"lbl_nom\"><b>Nombres</b></label>\n");
      out.write("                        <input type=\"text\" name=\"txt_nom\" id=\"txt_nom\" class=\"form-control\" placeholder=\"Ejemplo: Byron Allan\" required>\n");
      out.write("\n");
      out.write("                        <label for=\"lbl_ape\"><b>Apellidos</b></label>\n");
      out.write("                        <input type=\"text\" name=\"txt_ape\" id=\"txt_ape\" class=\"form-control\" placeholder=\"Ejemplo: Brito Delgado\" required>\n");
      out.write("\n");
      out.write("                        <label for=\"lbl_dir\"><b>Direccion</b></label>\n");
      out.write("                        <input type=\"text\" name=\"txt_dir\" id=\"txt_dir\" class=\"form-control\" placeholder=\"Ejemplo: Ciudad zona pais\" required>\n");
      out.write("\n");
      out.write("                        <label for=\"lbl_tel\"><b>Telefono</b></label>\n");
      out.write("                        <input type=\"txt\" name=\"txt_tel\" id=\"txt_tel\" placeholder=\"Ejemplo: 33333333\" class=\"form-control\" required>\n");
      out.write("                        \n");
      out.write("                        <label for=\"lbl_dpi\"><b>DPI</b></label>\n");
      out.write("                        <input type=\"txt\" name=\"txt_dpi\" id=\"txt_dpi\" placeholder=\"Ejemplo: xxxxxxxxxxxxx\" class=\"form-control\" required>\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        <lable for=\"lbl_sexo\"><b>Genero</b></lable>\n");
      out.write("                        <select name =\"drop_genero\" id=\"drop_genero\" class=\"form-select\">\n");
      out.write("                            <option value=\"0\">Femenino</option>\n");
      out.write("                            <option value=\"1\">Masculino</option>\n");
      out.write("                        </select>\n");
      out.write("\n");
      out.write("                        <label for=\"lbl_puesto\"><b>Puesto</b></label>\n");
      out.write("                        <select name =\"drop_puesto\" id=\"drop_puesto\" class=\"form-select\">    \n");
      out.write("                            ");

                                Puesto obj = new Puesto();
                                HashMap<String,String> drop = obj.drop_puesto();
                                for(String i: drop.keySet()){
                                    out.println("<option value='"+i+"'>"+drop.get(i)+"</option>");
                                }

                            
      out.write("\n");
      out.write("                            \n");
      out.write("                        </select>\n");
      out.write("                        \n");
      out.write("                        <label for=\"lbl_fn\"><b>Fecha nacimiento</b></label>\n");
      out.write("                        <input type=\"date\" name=\"date_fn\" id=\"date_fn\" class=\"form-control\">\n");
      out.write("                        \n");
      out.write("                        <label for=\"lbl_f-inicio\"><b>Fecha inicio labores</b></label>\n");
      out.write("                        <input type=\"date\" name=\"date_f-inicio\" id=\"date_f-inicio\" class=\"form-control\">\n");
      out.write("                        \n");
      out.write("                        <label for=\"lbl_f-ingreso\"><b>Fecha ingreso</b></label>\n");
      out.write("                        <input type=\"date\" name=\"date_f-ingreso\" id=\"date_f-ingreso\" class=\"form-control\" value=\"\">\n");
      out.write("                       \n");
      out.write("                \n");
      out.write("                        <br><button name=\"btn_agregar\" id=\"btn_agregar\" value=\"agregar\" class=\"btn btn-primary\">Agregar</button>\n");
      out.write("                            <button name=\"btn_modificar\" id=\"btn_modificar\" value=\"modificar\" class=\"btn btn-success\">Modificar</button>\n");
      out.write("                            <button name=\"btn_eliminar\" id=\"btn_eliminar\" value=\"eliminar\" class=\"btn btn-danger\" onclick=\"javascript:if(!confirm('¿Desea Eliminar?'))return false\" >Eliminar</button>\n");
      out.write("                            <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Close</button>\n");
      out.write("                    \n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("       </div>\n");
      out.write("        <!--\n");
      out.write("        <div class=\"contanier mt-3\">\n");
      out.write("            <h3 style=\"text-align:center\">Tabla de Empleados registrados</h3>\n");
      out.write("            <br>\n");
      out.write("            <table class=\"table table-hover\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                      <th>Nombres</th>\n");
      out.write("                      <th>Apellidos</th>\n");
      out.write("                      <th>Direccion</th>\n");
      out.write("                      <th>Telefono</th>\n");
      out.write("                      <th>DPI</th>\n");
      out.write("                      <th>Genero</th>\n");
      out.write("                      <th>Puesto</th>\n");
      out.write("                      <th>Fecha nacimiento</th>\n");
      out.write("                      <th>Fecha inicio labores</th>\n");
      out.write("                      <th>Fecha ingreso</th>\n");
      out.write("                    </tr>\n");
      out.write("                  </thead>\n");
      out.write("                  <tbody id=\"tbl_empleados\">\n");
      out.write("                    \n");
      out.write("                        \n");
      out.write("                    \n");
      out.write("                  </tbody>\n");
      out.write("              </table>\n");
      out.write("          \n");
      out.write("        </div>\n");
      out.write("        -->\n");
      out.write("        <br><!-- tabla -->\n");
      out.write("        <h3 style=\"text-align: center\">Tabla Empleados</h3>\n");
      out.write("        <table class=\"table table-dark table-hover\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                  <th>Nombres</th>\n");
      out.write("                  <th>Apellidos</th>\n");
      out.write("                  <th>Direccion</th>\n");
      out.write("                  <th>Telefono</th>\n");
      out.write("                  <th>DPI</th>\n");
      out.write("                  <th>Genero</th>\n");
      out.write("                  <th>Puesto</th>\n");
      out.write("                  <th>Nacimiento</th>\n");
      out.write("                  <th>Inicio labores</th>\n");
      out.write("                  <th>Ingreso</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody id=\"tbl_empleados\">\n");
      out.write("                ");

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

                        
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("        <footer>\n");
      out.write("            <footer style=\"background-color: #ff3333\">\n");
      out.write("            <div style=\"border-width: 2px; border-style: solid;border-color: #999999\">\n");
      out.write("                \n");
      out.write("                <nav class=\"navbar navbar-expand-sm bg-light justify-content-center\" style=\"padding-top: 15px;padding-bottom: 15px\">\n");
      out.write("                     <ul class=\"nav nav-tabs\">\n");
      out.write("                         <li class=\"nav item\"><a class=\"nav-link\" href=\"#\"> Quienes Somos </a></li>\n");
      out.write("                         <li class=\"nav item\"> <a class=\"nav-link\" href=\"#\"> Siguenos en Twitter</a> </li>\n");
      out.write("                         <li class=\"nav item\"> <a class=\"nav-link\" href=\"#\"> Siguenos en Tiktok </a></li>\n");
      out.write("                     </ul>\n");
      out.write("                 </nav>     \n");
      out.write("            </div>\n");
      out.write("            <p style=\"font-family: times new roman; color: #ffffff\">\n");
      out.write("                Creado por Christian Sapon (c) 2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce venenatis, nisl in viverra semper, nibh quam efficitur augue, et elementum ex dui eu libero. Maecenas pretium massa nibh, a dictum leo commodo tincidunt. Duis aliquet ornare ex ac ultricies. Aliquam ligula nibh, pellentesque a cursus nec, scelerisque ac nunc. Proin laoreet non purus et aliquet. Aenean vel euismod purus. Donec tempor diam a pretium dictum. Ut augue lacus, consectetur sit amet bibendum eget, euismod non nulla. Ut quis justo vel nibh consequat ullamcorper et et sapien. Nullam nec scelerisque nisi. Phasellus venenatis facilisis imperdiet. Vivamus ut felis non dolor pellentesque ornare.\n");
      out.write("            </p>\n");
      out.write("           \n");
      out.write("        </footer>\n");
      out.write("            </footer>\n");
      out.write("               \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("         <script src=\"https://code.jquery.com/jquery-3.6.1.slim.js\" integrity=\"sha256-tXm+sa1uzsbFnbXt8GJqsgi2Tw+m4BLGDof6eUPjbtk=\" crossorigin=\"anonymous\"></script>           \n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js\" integrity=\"sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("                        $('#tbl_empleados').on('click','tr td',function(evt){\n");
      out.write("                            var target,id,id_p,id_g,nom,ape,dir,tel,dpi,fn,fl,fi;\n");
      out.write("                            target = $(event.target);\n");
      out.write("                            id = target.parent().data('id');\n");
      out.write("                            id_g = target.parent().data('id_g');\n");
      out.write("                            id_p = target.parent().data('id_p');\n");
      out.write("                            \n");
      out.write("                            nom = target.parent(\"tr\").find(\"td\").eq(0).html();\n");
      out.write("                            ape = target.parent(\"tr\").find(\"td\").eq(1).html();\n");
      out.write("                            dir = target.parent(\"tr\").find(\"td\").eq(2).html();\n");
      out.write("                            tel = target.parent(\"tr\").find(\"td\").eq(3).html();\n");
      out.write("                            dpi = target.parent(\"tr\").find(\"td\").eq(4).html();\n");
      out.write("                            fn = target.parent(\"tr\").find(\"td\").eq(7).html();\n");
      out.write("                            fl = target.parent(\"tr\").find(\"td\").eq(8).html();\n");
      out.write("                            fi = target.parent(\"tr\").find(\"td\").eq(9).html();\n");
      out.write("                            $(\"#txt_id\").val(id);\n");
      out.write("                            $(\"#txt_nom\").val(nom);\n");
      out.write("                            $(\"#txt_ape\").val(ape);\n");
      out.write("                            $(\"#txt_dir\").val(dir);\n");
      out.write("                            $(\"#txt_tel\").val(tel);\n");
      out.write("                            $(\"#txt_dpi\").val(dpi);\n");
      out.write("                            $(\"#date_fn\").val(fn);\n");
      out.write("                            $(\"#date_f-inicio\").val(fl);\n");
      out.write("                            $(\"#date_f-ingreso\").val(fi);\n");
      out.write("                            $(\"#drop_genero\").val(id_g);\n");
      out.write("                            $(\"#drop_puesto\").val(id_p);\n");
      out.write("                            $(\"#modalEmpleado\").modal('show');\n");
      out.write("                        });\n");
      out.write("                    </script>\n");
      out.write("                    <script type=\"text/javascript\">\n");
      out.write("                        function cls(){\n");
      out.write("                        $(\"#txt_id\").val(0);\n");
      out.write("                            $(\"#txt_nom\").val('');\n");
      out.write("                            $(\"#txt_ape\").val('');\n");
      out.write("                            $(\"#txt_dir\").val('');\n");
      out.write("                            $(\"#txt_tel\").val('');\n");
      out.write("                            $(\"#txt_dpi\").val('');\n");
      out.write("                            $(\"#date_fn\").val('');\n");
      out.write("                            $(\"#date_f-inicio\").val('');\n");
      out.write("                            $(\"#date_f-ingreso\").val('');\n");
      out.write("                            $(\"#drop_genero\").val(1);\n");
      out.write("                            $(\"#drop_puesto\").val(1);\n");
      out.write("                 \n");
      out.write("             }\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                    </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
