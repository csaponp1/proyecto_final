/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.awt.HeadlessException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;



/**
 *
 * @author Sapón Pérez
 */
public class Puesto {
    
    private String puesto;
    private int id_puesto;
    private Conexion cn;

    public Puesto(){};
    public Puesto(int id_puesto, String puesto) {
        this.id_puesto = id_puesto;
        this.puesto = puesto;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }
    
    public HashMap drop_puesto(){
        HashMap<String,String> drop= new HashMap();
        try{
            cn = new Conexion();
            String select = "select idPuesto as id, puesto from puestos;";
            cn.abrir_conexion();
            ResultSet consulta= cn.conexionBD.createStatement().executeQuery(select);
            while(consulta.next()){
                drop.put(consulta.getString("id"),consulta.getString("puesto"));                
            }
            cn.cerrar_conexion();

        }catch(SQLException ex){
            System.out.println("Error en la tabla"+ex.getMessage());
        }
        return drop;
    }
    
    /*
    public DefaultTableModel leer(){
        
    }
    */
    
    public int agregar(){
        int retorno;
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            PreparedStatement parametro;
            String query = "insert into puestos (puesto) values (?);";
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getPuesto());
            retorno = parametro.executeUpdate();
            
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("xxxErrorXXXxxxx"+ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
    
    public DefaultTableModel leer(){
       DefaultTableModel tabla = new DefaultTableModel();
      try{
          cn = new Conexion();
          cn.abrir_conexion();
          String query = "select p.idPuesto as id, p.puesto from puestos as p;";
          ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
          String encabezado[] = {"id","puesto"};
          tabla.setColumnIdentifiers(encabezado);
          String[] datos = new String[2];
          while(consulta.next()){
              datos[0]=consulta.getString("id");
              datos[1]=consulta.getString("puesto");
              
              tabla.addRow(datos);
          }
          cn.cerrar_conexion();
      }catch(SQLException ex){

           System.out.println("error en la tabla" + ex.getMessage());
      }

      return tabla;
        }
   
    
     public int modificar(){
         int retorno;
        try{
            
            PreparedStatement parametro;
            cn = new Conexion();
            String update;
            update = "update puestos set puesto = ? where idPuesto = ?;";   
            cn.abrir_conexion();
            
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(update);
            
            parametro.setString(1, this.getPuesto());
            parametro.setInt(2, this.getId_puesto());
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }
        
        catch(HeadlessException | SQLException ex){
            System.out.println("error"+ex.getMessage());
            retorno = 0;
        }
    return retorno; 
    }
    
    
    public int eliminar(){
        int retorno;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String delete;
            delete = "delete from puestos where idPuesto = ?;";   
            cn.abrir_conexion();
            
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(delete);
            parametro.setInt(1,this.getId_puesto());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("xxxXXXErrorXXXxxx"+ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
    
}
