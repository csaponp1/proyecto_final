/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Sapón Pérez
 */
public class Compra {
    private int idCompra,idCompraDetalle,idProveedor;
    private String fecha_orden,fecha_ingreso;
    private int cantidad,noOrdenCompra;
    private double precio_costo_unitario;
    Conexion cn;

    public Compra(){};
    public Compra(int idCompra, int idCompraDetalle, int idProveedor, String fecha_orden, String fecha_ingreso, int cantidad, int noOrdenCompra, double precio_costo_unitario /*double total)*/) {
        this.idCompra = idCompra;
        this.idCompraDetalle = idCompraDetalle;
        this.idProveedor = idProveedor;
        this.fecha_orden = fecha_orden;
        this.fecha_ingreso = fecha_ingreso;
        this.cantidad = cantidad;
        this.noOrdenCompra = noOrdenCompra;
        this.precio_costo_unitario = precio_costo_unitario;
        
        //this.total = total;
    }
    
    public void setIdCompra(int idCompra){this.idCompra=idCompra;}
    public void setIdCompraDetalle(int idCompraDetalle){this.idCompraDetalle=idCompraDetalle;}
    public void setIdProveedor(int idProveedor){this.idProveedor=idProveedor;}
    
    public void setFnorden(String Fnorden){this.fecha_orden=Fnorden;}
    public void setFingreso(String Fingreso){this.fecha_ingreso=Fingreso;}
    public void setCantidad(int cantidad){this.cantidad=cantidad;}
    public void setNorden(int Norden){this.noOrdenCompra=Norden;}
    public void setPCostoU(double precio_costo_unitario){this.precio_costo_unitario=precio_costo_unitario;}

    public int getIdCompra() {
        return idCompra;
    }

    public int getIdCompraDetalle() {
        return idCompraDetalle;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public String getFecha_orden() {
        return fecha_orden;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public int getCantidad() {
        return cantidad;
    }

    public int getNoOrdenCompra() {
        return noOrdenCompra;
    }

    public double getPrecio_costo_unitario() {
        return precio_costo_unitario;
    }
    
    public int agregar(){
        int retorno;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "insert into compras (no_orden_compra,idproveedor,fecha_orden,fechaingreso) values(?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1,this.getNoOrdenCompra());
            parametro.setInt(2,this.getIdProveedor());
            parametro.setString(3,this.getFecha_orden());
            parametro.setString(4,this.getFecha_ingreso());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("XXXxxxNo se ingreso la compraXXXxxx"+ex.getMessage());
            retorno = 0;
        }
    return retorno;
    }
    
    
    public String id_compra(){
        
        String idcompra;
        
        String query="SELECT (max(idcompra) + 1) as id FROM compras;";
        
        
        try {   
            cn = new Conexion();
            
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            consulta.next();
            idcompra = consulta.getString("id");
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("XXXxxxno se puedo hacer selectXXXxxx"+ex.getMessage());
            idcompra="";
        }
        return idcompra;
    }
    
    
    
    public String leer_orden(){
        String numero=null;
        
        try {   
            cn = new Conexion();
            String query = "select (max(no_orden_compra)+1) as no_orden_compra from compras;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            consulta.next();
            numero = consulta.getString("no_orden_compra");
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("XXXxxxno se puede hacer selectxxxXXX"+ex.getMessage());
        }
        return numero;
    };
    
    
}
    
    
    



