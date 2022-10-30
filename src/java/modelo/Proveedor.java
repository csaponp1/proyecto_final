/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Sapón Pérez
 */
public class Proveedor {
    int id_proveedor;
    String n_proveedor,nit,direccion,telefono;
    Conexion cn;
    public Proveedor(){}

    public Proveedor(int id_proveedor, String n_proveedor, String nit, String direccion, String telefono) {
        this.id_proveedor = id_proveedor;
        this.n_proveedor = n_proveedor;
        this.nit = nit;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public String getN_proveedor() {
        return n_proveedor;
    }

    public void setN_proveedor(String n_proveedor) {
        this.n_proveedor = n_proveedor;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    public DefaultTableModel leer() throws SQLException{
    DefaultTableModel tabla = new DefaultTableModel();
    try{
    cn = new Conexion();
    cn.abrir_conexion();
    String query = "SELECT * FROM proveedores;";
    ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
    String encabezado[] = {"id","proveedor","nit","direccion","telefono"};
    tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[5];
      while (consulta.next()){
          datos[0] = consulta.getString("idproveedores");
          datos[1] = consulta.getString("proveedor");
          datos[2] = consulta.getString("nit");
          datos[3] = consulta.getString("direccion");
          datos[4] = consulta.getString("telefono");
          tabla.addRow(datos);
      }
        cn.cerrar_conexion();
    }catch(SQLException ex){
    System.out.println(ex.getMessage());
    }
    return tabla;
    }
    public int agregar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO proveedores(proveedor,nit,direccion,telefono) VALUES (?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getN_proveedor());
            parametro.setString(2,this.getNit());
            parametro.setString(3, this.getDireccion());
            parametro.setString(4, this.getTelefono());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    public int modificar (){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE proveedores SET proveedor= ?,nit= ?,direccion= ?,telefono= ? where idproveedores=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,getN_proveedor());
            parametro.setString(2,getNit());
            parametro.setString(3,getDireccion());
            parametro.setString(4,getTelefono());
            parametro.setInt(5, getId_proveedor());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    public int eliminar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "DELETE FROM proveedores WHERE idproveedores=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_proveedor());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    
    public HashMap drop_proveedor(){
        HashMap<String,String> drop = new HashMap();
        try{
            cn = new Conexion();
            String query = "select idproveedores as id, proveedor from proveedores order by id;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
                drop.put(consulta.getString("id"), consulta.getString("proveedor"));
            }
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("xxxXXXerror al hacer selectXXXxxx"+ex.getMessage());
        }
        return drop;
    }
    
    
    
}
