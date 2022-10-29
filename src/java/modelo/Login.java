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
public class Login {
    
    String usr,pass;
    Conexion cn;
    
    public Login(){}
    public Login(String usr, String pass) {
        this.usr = usr;
        this.pass = pass;
    }

    public String getUsr() {
        return usr;
    }

    public void setUsr(String usr) {
        this.usr = usr;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    public boolean login(){
        boolean login = false;
        String usuario,contrasena;
        usuario = this.getUsr();
        contrasena = this.getPass();
        try{
            ResultSet resultado;
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT usuario,pass FROM usuarios WHERE usuario=? AND pass=?";
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getUsr());
            parametro.setString(2, this.getPass());
            resultado = parametro.executeQuery();
            if(resultado.next()){
                login = true;
            }else{
                login = false;
            }
            cn.cerrar_conexion();
            
        }catch(SQLException ex){
            System.out.println("xxxXXXerrorXXXxxx"+ex.getMessage());
        }
        return login;
    }
    
    
    
}
