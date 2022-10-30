/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Sapón Pérez
 */
public class ventas_detalle {
    Conexion cn;
    int id_venta, id_producto, p_unitario,existencia;
    String cantidad;

    public ventas_detalle() {}

    public ventas_detalle(int id_venta, int id_producto, int p_unitario, int existencia, String cantidad) {
        this.id_venta = id_venta;
        this.id_producto = id_producto;
        this.p_unitario = p_unitario;
        this.existencia = existencia;
        this.cantidad = cantidad;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getP_unitario() {
        return p_unitario;
    }

    public void setP_unitario(int p_unitario) {
        this.p_unitario = p_unitario;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public int leer_detalle() {
        int id_venta_ = 0;
        try {
            cn = new Conexion();
            String query = "SELECT (max(idventas_detalle) + 1) as id_venta_detalle FROM ventas_detalle;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            consulta.next();
            id_venta_ = Integer.valueOf(consulta.getString("id_venta_detalle"));
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return id_venta_;
    }

    public int agregar() {
        leer_detalle();
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO ventas_detalle (idventas_detalle, idventa, idproducto, cantidad, precio_unitario) VALUES (?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, leer_detalle());
            parametro.setInt(2, getId_venta());
            parametro.setInt(3, getId_producto());
            parametro.setString(4, getCantidad());
            parametro.setInt(5, getP_unitario());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }
        public int modificar_existencia(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE productos SET existencia = ? WHERE (idproductos = ?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1,getExistencia());
            parametro.setInt(2,getId_producto());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }

}
