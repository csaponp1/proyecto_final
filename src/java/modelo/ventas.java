/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
/**
 *
 * @author Sapón Pérez
 */
public class ventas {
    int no_factura_,id_cliente,id_empleado;
    String serie,fecha_factura,fecha_ingreso;
    Conexion cn;
    
    public ventas(){};
    public ventas(int no_factura_, int id_cliente, int id_empleado, String serie, String fecha_factura, String fecha_ingreso) {
        this.no_factura_ = no_factura_;
        this.id_cliente = id_cliente;
        this.id_empleado = id_empleado;
        this.serie = serie;
        this.fecha_factura = fecha_factura;
        this.fecha_ingreso = fecha_ingreso;
    }

    public int getNo_factura_() {
        return no_factura_;
    }

    public void setNo_factura_(int no_factura_) {
        this.no_factura_ = no_factura_;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(String fecha_factura) {
        this.fecha_factura = fecha_factura;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
    //metodos
    
    public int agregar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO ventas(nofactura,serie,fechafactura,idcliente,idempleado,fechaingreso) VALUES (?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1,getNo_factura_());
            parametro.setString(2,getSerie());
            parametro.setString(3,getFecha_factura());
            parametro.setInt(4,getId_cliente());
            parametro.setInt(5,getId_empleado());
            parametro.setString(6,getFecha_ingreso());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    
    public String leer_id(){
        String n_factura = null;
        try {   
            cn = new Conexion();
            String query = "SELECT (max(nofactura) + 1) as nofactura FROM ventas;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            consulta.next();
            n_factura = consulta.getString("nofactura");
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return n_factura;
    }
    
    public String leer_factura(){
        String id_venta = null;
        try {
            cn = new Conexion();
            String query = "SELECT (max(idventa) + 1) as idventa FROM ventas;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            consulta.next();
            id_venta = consulta.getString("idventa");
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return id_venta;
    }
    
    
}
