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
public class compras_detalle {
        private int id_compra_det,id_compra,id_producto,cant,exitencias;
        
        private double p_costo_unitario;
        private double p_venta_unitario;
        Conexion cn;
        
    public compras_detalle(){};
    public compras_detalle(int id_compra_det,int id_compra,int id_producto, int cant,int existencias, double p_costo_unitario,double p_venta_unitario) {
        this.id_compra_det =id_compra_det;
        this.id_compra = id_compra;
        this.id_producto = id_producto;
        this.cant = cant;
        this.p_costo_unitario = p_costo_unitario;
        this.p_venta_unitario = p_venta_unitario;
        this.exitencias = existencias;
    }
    
    public int getId_compra_det() {
        return id_compra_det;
    }

    public void setId_compra_det(int id_compra_det) {
        this.id_compra_det = id_compra_det;
    }
    
    public int getId_compra() {
        return id_compra;
    }

    public void setId_compra(int id_compra) {
        this.id_compra = id_compra;
    }
    
    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }
    
    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public void setExistencias(int existencias){
        this.exitencias= existencias;
    }

    public int getExitencias() {
        return exitencias;
    }    
    
    public double getP_costo_unitario() {
        return p_costo_unitario;
    }

    public void setP_costo_unitario(double p_costo_unitario) {
        this.p_costo_unitario = p_costo_unitario;
    }
   
    public double getP_venta_unitario() {
        return p_venta_unitario;
    }

    public void setP_venta_unitario(double p_venta_unitario) {
        this.p_venta_unitario = p_venta_unitario;
    }
    
    
    
    

    public int leer_detalle() {
        int id_compra_ = 0;
        try {
            cn = new Conexion();
            String query = "SELECT (max(idcompra_detalle) + 1) as id_compra_detalle FROM compras_detalle;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            consulta.next();
            id_compra_ = Integer.valueOf(consulta.getString("id_compra_detalle"));
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return id_compra_;
    }
    
    public String id_ordendetalle(){
        String numero=null;
        
        try {   
            cn = new Conexion();
            String query = "SELECT (max(idcompra_detalle) + 1) as id FROM compras_detalle;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            consulta.next();
            numero = consulta.getString("id");
            
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return numero;
    };
        
    public int agregar() {
        
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO compras_detalle (idcompra_detalle,idcompra,idproducto,cantidad,precio_costo_unitario) VALUES (?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1,leer_detalle());
            parametro.setInt(2, getId_compra());
            parametro.setInt(3, this.getId_producto());
            parametro.setInt(4,this.getCant());
            parametro.setDouble(5, this.getP_costo_unitario());
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println("xxxXXXNo se puede agregar la compraXXXxxx"+ex.getMessage());
        }
        return retorno;
    }
    
    public int modificar(){
        int retorno =0;
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            PreparedStatement parametro;
            String query = "UPDATE compras_detalle SET idcompra =?, idproducto =? , cantidad =?, precio_costo_unitario=?  WHERE idcompra_detalle =?;";
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1,getId_compra());
            parametro.setInt(2,this.getId_compra());
            parametro.setInt(3,this.getCant());
            parametro.setDouble(4,this.getP_costo_unitario());
            retorno = parametro.executeUpdate();
        }catch(SQLException ex){
            System.out.println("xxxXXXno se modificoXXXxxx"+ex.getMessage());
        }
        return retorno;
    }
    
    public int eliminar(){
        int retorno;
        try{
            cn = new Conexion();
            PreparedStatement parametro;
            String query="DELETE FROM compras_detalle WHERE idcompra_detalle =? ;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1,this.getId_compra_det());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("xxxXXXno se puede hacer deleteXXXxxx"+ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
    
    public int modificar_producto(){
        int retorno =0;
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            PreparedStatement parametro;
            String query = "UPDATE productos SET precio_costo =?,precio_venta=?,existencia=? where idproductos =?;";
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setDouble(1,getP_costo_unitario());
            parametro.setDouble(2,getP_venta_unitario());
            parametro.setInt(3,this.getExitencias());
            parametro.setInt(4,getId_producto());
            retorno = parametro.executeUpdate();
        }catch(SQLException ex){
            System.out.println("xxxXXXno se modificoXXXxxx"+ex.getMessage());
        }
        return retorno;
    }

    
  
    

   
    
    
    
    

    

    
    
        
        
        
}
