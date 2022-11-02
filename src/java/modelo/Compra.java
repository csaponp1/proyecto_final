/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Sapón Pérez
 */
public class Compra {
    private String idCompra,idCompraDetalle,idProveedor;
    private String idProducto,fecha_orden,fecha_ingreso;
    private int cantidad,noOrdenCompra;
    private double precio_costo_unitario;
    Conexion cn;

    public Compra(){};
    public Compra(String idCompra, String idCompraDetalle, String idProveedor, String idProducto, String fecha_orden, String fecha_ingreso, int cantidad, int noOrdenCompra, double precio_costo_unitario, double precio_venta_unitario /*double total)*/) {
        this.idCompra = idCompra;
        this.idCompraDetalle = idCompraDetalle;
        this.idProveedor = idProveedor;
        this.idProducto = idProducto;
        this.fecha_orden = fecha_orden;
        this.fecha_ingreso = fecha_ingreso;
        this.cantidad = cantidad;
        this.noOrdenCompra = noOrdenCompra;
        this.precio_costo_unitario = precio_costo_unitario;
        
        //this.total = total;
    }
    
    public void setIdCompra(String idCompra){this.idCompra=idCompra;}
    public void setIdCompraDetalle(String idCompraDetalle){this.idCompraDetalle=idCompraDetalle;}
    public void setIdProveedor(String idProveedor){this.idProveedor=idProveedor;}
    public void setIdProducto(String idProducto){this.idProducto=idProducto;}
    public void setFnorden(String Fnorden){this.fecha_orden=Fnorden;}
    public void setFingreso(String Fingreso){this.fecha_ingreso=Fingreso;}
    public void setCantidad(int cantidad){this.cantidad=cantidad;}
    public void setNorden(int Norden){this.noOrdenCompra=Norden;}
    public void setPCostoU(double precio_costo_unitario){this.precio_costo_unitario=precio_costo_unitario;}

    public String getIdCompra() {
        return idCompra;
    }

    public String getIdCompraDetalle() {
        return idCompraDetalle;
    }

    public String getIdProveedor() {
        return idProveedor;
    }

    public String getIdProducto() {
        return idProducto;
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
    
    public void IngresoCompraDet(){
        
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            String query="select p.idproductos as id,p.producto, m.marca, p.descripcion, p.existencia, p.fecha_ingreso,p.precio_costo from productos as p inner join marcas as m on p.idmarca=m.idmarca;";
            ResultSet consulta=cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id","Producto","marca","descripcion","existencia","Fecha Ingreso","Precio Costo Unitario"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[7];
            while (consulta.next()){
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("producto");
                datos[2] = consulta.getString("marca");
                datos[3] = consulta.getString("descripcion");
                datos[4] = consulta.getString("existencia");
                datos[5] = consulta.getString("fecha_ingreso");
                datos[6] = consulta.getString("precio_costo");

                tabla.addRow(datos);
                
            }
            cn.cerrar_conexion();
            
        }catch(SQLException ex){
            System.out.println("xxxXXXXXerrorXXXXXxxx"+ex.getMessage());
        }
        return tabla;
    }
    
    public String id_compra(){
        
        String idcompra=null;
        
        
        try {   
            cn = new Conexion();
            String query = "SELECT (max(idcompra) + 1) as idCompra FROM compras;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            consulta.next();
            idcompra = consulta.getString("idCompra");
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return idcompra;
    }
    
    public String id_compra_detalle(){
        String idcompradetalle=null;
        
        try {   
            cn = new Conexion();
            String query = "SELECT (max(idcompra_detalle) + 1) as idDetalleCompra FROM compras_detalle;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            consulta.next();
            idcompradetalle = consulta.getString("idDetalleCompra");
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return idcompradetalle;
    }
    
    
    
    
}


