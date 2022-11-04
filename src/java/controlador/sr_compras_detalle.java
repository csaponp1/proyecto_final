    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.compras_detalle;

/**
 *
 * @author Sapón Pérez
 */
public class sr_compras_detalle extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_compras_detalle</title>");            
            out.println("</head>");
            out.println("<body>");
            compras_detalle Compra_detalle = new compras_detalle(0,Integer.valueOf(request.getParameter("txt_id_compra_")),Integer.valueOf(request.getParameter("txt_idproducto")),Integer.valueOf(request.getParameter("txt_cantidad")),Integer.valueOf(request.getParameter("txt_existencia")),Double.parseDouble(request.getParameter("txt_costo_unitario")),Double.parseDouble(request.getParameter("txt_venta")));
            if ("agregar".equals(request.getParameter("btn_agregar_compra"))) {
                if (Compra_detalle.agregar() > 0) {
                    Compra_detalle.modificar_producto();
                    response.setStatus(HttpServletResponse.SC_NO_CONTENT);
                } else {
                    out.println("<h1> xxxxxxx No se Ingreso compra xxxxxxxxxxxx </h1>");
                    out.println("<a href='maestro_detalle_compras.jsp'>Regresar...</a>");
                }
            }
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
