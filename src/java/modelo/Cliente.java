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
public class Cliente extends Persona{

    private String nit; 
    private String email;     
    private String fecha_ingreso;
    Conexion cn;
    
    public Cliente(){}
    public Cliente(String nit, String email, String fecha_ingreso, int id, String tel, int gen, String nombres, String apellidos, String dpi, String fecha_nacimiento, String dir) {
        super(id, tel, gen, nombres, apellidos, dpi, fecha_nacimiento, dir);
        this.nit = nit;
        this.email = email;
        this.fecha_ingreso = fecha_ingreso;
    }
    
    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
    

    
    
    public DefaultTableModel leer() throws SQLException{
    DefaultTableModel tabla = new DefaultTableModel();
    try{
    cn = new Conexion();
    cn.abrir_conexion();
    String query = "select idclientes,nombres,apellidos,nit,case when genero = 0 then 'FEMENINO' when genero = 1 then 'MASCULINO' else 'Unknown'end as sexo,telefono,correo_electronico,fechaingreso from clientes;";
    ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
    String encabezado[] = {"id","nombres","apellidos","nit","sexo","telefono","Correo","Fecha de Ingreso"};
    tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[9];
      while (consulta.next()){
          datos[0] = consulta.getString("idclientes");
          datos[1] = consulta.getString("nombres");
          datos[2] = consulta.getString("apellidos");
          datos[3] = consulta.getString("nit");
          datos[4] = consulta.getString("sexo");
          datos[5] = consulta.getString("telefono");
          datos[6] = consulta.getString("correo_electronico");
          datos[7] = consulta.getString("fechaingreso");
          tabla.addRow(datos);
      }
        cn.cerrar_conexion();
    }catch(SQLException ex){
    System.out.println(ex.getMessage());
    }
    return tabla;
    }
    
    @Override
    public int agregar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO clientes(nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) VALUES (?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,getNombres());
            parametro.setString(2,getApellidos());
            parametro.setString(3,getNit());
            parametro.setInt(4,getGen());
            parametro.setString(5,getTel());
            parametro.setString(6,getEmail());
            parametro.setString(7,getFecha_ingreso());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    @Override
    public int modificar (){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE clientes SET nombres= ?,apellidos= ?,nit= ?,genero= ?,telefono=?,correo_electronico=?,fechaingreso=? where idclientes=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,getNombres());
            parametro.setString(2,getApellidos());
            parametro.setString(3,getNit());
            parametro.setInt(4,getGen());
            parametro.setString(5,getTel());
            parametro.setString(6,getEmail());
            parametro.setString(7, getFecha_ingreso());
            parametro.setInt(8, getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    @Override
    public int eliminar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "DELETE FROM clientes WHERE idclientes=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }

    public HashMap drop_cliente(){
        HashMap <String, String> drop = new HashMap();
        try {
            cn = new Conexion();
            String query = "SELECT idclientes as idclientes, concat_ws(' ', nombres, apellidos, nit) as nombre FROM clientes;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
                drop.put(consulta.getString("idclientes"), consulta.getString("nombre"));
            }
            cn.cerrar_conexion();
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return drop;
    }
    
}
