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
import modelo.Puesto;
/**
 *
 * @author Sapón Pérez
 */
public class sr_puesto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Puesto puesto;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_puesto</title>");            
            out.println("</head>");
            out.println("<body>");
            puesto = new Puesto(Integer.valueOf(request.getParameter("txt_id")),request.getParameter("txt_puesto"));
            
            if("agregar".equals(request.getParameter("btn_agregar"))){
                    if(puesto.agregar()>0){
                    response.sendRedirect("puestos.jsp");
                }
                else{
                    out.println("<h1>xxxErrorXXxxx</h1>");
                }
                }
            
            if("modificar".equals(request.getParameter("btn_modificar"))){
                    if(puesto.modificar()>0){
                    response.sendRedirect("puestos.jsp");
                }
                else{
                    out.println("<h1>xxxErrorXXxxx</h1>");
                }
                }
            
            if("eliminar".equals(request.getParameter("btn_eliminar"))){
                    if(puesto.eliminar()>0){
                    response.sendRedirect("puestos.jsp");
                }
                else{
                    out.println("<h1>xxxErrorXXxxx</h1>");
                    out.println("<h2>Revisa</h2>");
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
