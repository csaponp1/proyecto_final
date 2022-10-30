/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.awt.HeadlessException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Sapón Pérez
 */
public class Empleado extends Persona{
    private String fecha_inicio,fecha_ingreso;
    private int id_puesto;
    Conexion cn;
    public Empleado(){};

    public Empleado(int id, String tel, int gen, String nombres, String apellidos, String dpi, String fecha_nacimiento,String fecha_inicio, String fecha_ingreso,  String dir, int id_puesto) {
        super(id, tel, gen, nombres, apellidos, dpi, fecha_nacimiento, dir);
        this.fecha_inicio=fecha_inicio;
        this.fecha_ingreso=fecha_ingreso;
        this.id_puesto=id_puesto;
    }
    
    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    
    @Override
    public int agregar(){
        int retorno;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();
            String insert = "INSERT INTO empleados (nombres,apellidos,direccion,telefono,dpi,genero,fecha_nacimiento,idpuesto,fecha_inicio_labores,fechaingreso) VALUES(?,?,?,?,?,?,?,?,?,?);";
            
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(insert);
            parametro.setString(1, this.getNombres());
            parametro.setString(2, this.getApellidos());
            parametro.setString(3, this.getDir());
            parametro.setString(4, this.getTel());
            parametro.setString(5, this.getDpi());
            parametro.setInt(6, this.getGen());
            parametro.setString(7, this.getFecha_nacimiento());
            parametro.setInt(8, this.getId_puesto());
            parametro.setString(9, this.getFecha_inicio());
            parametro.setString(10, this.getFecha_ingreso());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
            
    }catch(SQLException ex){
            System.out.println("XXXErrorXXXX al hacer insert: "+ex.getMessage());
            retorno=0;
    }
    cn.cerrar_conexion();
    return retorno;
    }
    
    
    public DefaultTableModel leer(){
       DefaultTableModel tabla = new DefaultTableModel();
      try{
          cn = new Conexion();
          cn.abrir_conexion();
          String query = "select e.idempleado as id,e.nombres,e.apellidos,e.direccion,e.telefono,e.dpi,case when e.genero = 0 then 'FEMENINO' when e.genero = 1 then 'MASCULINO' else 'Unknown' end as sexo,p.puesto,e.fecha_nacimiento,e.fecha_inicio_labores,e.fechaingreso,e.genero,e.idpuesto from empleados as e inner join puestos as p on e.idpuesto = p.idPuesto order by idempleado;";
          ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
          String encabezado[] = {"id","nombres","apellidos","direccion","telefono","dpi","sexo","puesto","fecha_nacimiento","fecha_iniciolab","fecha_ingreso","genero","idpuesto"};
          tabla.setColumnIdentifiers(encabezado);
          String[] datos = new String[13];
          while(consulta.next()){
              datos[0]=consulta.getString("id");
              datos[1]=consulta.getString("nombres");
              datos[2]=consulta.getString("apellidos");
              datos[3]=consulta.getString("direccion");
              datos[4]=consulta.getString("telefono");
              datos[5]=consulta.getString("dpi");
              datos[6]=consulta.getString("sexo");
              datos[7]=consulta.getString("puesto");
              datos[8]=consulta.getString("fecha_nacimiento");
              datos[9]=consulta.getString("fecha_inicio_labores");
              datos[10]=consulta.getString("fechaingreso");
              datos[11]=consulta.getString("genero");
              datos[12]=consulta.getString("idpuesto");
              tabla.addRow(datos);
          }
          cn.cerrar_conexion();
      }catch(SQLException ex){

           System.out.println("error en la tabla" + ex.getMessage());
      }

      return tabla;
  }
    
   
    @Override
    public int modificar(){
         int retorno;
        try{
            
            PreparedStatement parametro;
            cn = new Conexion();
            String update;
            update = "update empleados set nombres=?, apellidos=?,direccion=?,telefono=?,dpi=?,genero=?,fecha_nacimiento=?,idpuesto=?,fecha_inicio_labores=?,fechaingreso=? where idempleado=?;";   
            cn.abrir_conexion();
            
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(update);
            
            parametro.setString(1, this.getNombres());
            parametro.setString(2, this.getApellidos());
            parametro.setString(3, this.getDir());
            parametro.setString(4, this.getTel());
            parametro.setString(5, this.getDpi());
            parametro.setInt(6, this.getGen());
            parametro.setString(7,this.getFecha_nacimiento());
            parametro.setInt(8,this.getId_puesto());
            parametro.setString(9,this.getFecha_inicio());
            parametro.setString(10,this.getFecha_ingreso());
            parametro.setInt(11,this.getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }
        
        catch(HeadlessException | SQLException ex){
            System.out.println("error"+ex.getMessage());
            retorno = 0;
        }
    return retorno; 
    }
    
    @Override
    public int eliminar(){
        int retorno;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String delete;
            delete = "delete from empleados where idempleado = ?;";   
            cn.abrir_conexion();
            
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(delete);
            parametro.setInt(1,this.getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("xxxXXXErrorXXXxxx"+ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
    
    public HashMap drop_empleado(){
        HashMap <String, String> drop = new HashMap();
        try {
            cn = new Conexion();
            String query = "SELECT idempleado as idempleado, concat_ws(' ', nombres, apellidos) as nombre FROM empleados;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
                drop.put(consulta.getString("idempleado"), consulta.getString("nombre"));
            }
            cn.cerrar_conexion();
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return drop;
    }
    


}
