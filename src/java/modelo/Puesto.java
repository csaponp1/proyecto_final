/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;



/**
 *
 * @author Sapón Pérez
 */
public class Puesto {
    
    private String puesto, id_puesto;
    private Conexion cn;

    public Puesto(){};
    public Puesto(String id_puesto, String puesto) {
        this.id_puesto = id_puesto;
        this.puesto = puesto;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
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
    
}
