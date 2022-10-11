/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author Sapón Pérez
 */
abstract class Persona {
    private int id,gen;
    private String nombres, apellidos, dpi, fecha_nacimiento, dir,tel;
    public Persona(){};

    public Persona(int id, String tel, int gen, String nombres, String apellidos, String dpi, String fecha_nacimiento, String dir) {
        this.id = id;
        this.tel = tel;
        this.gen = gen;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.dpi = dpi;
        this.fecha_nacimiento = fecha_nacimiento;
        this.dir = dir;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getGen() {
        return gen;
    }

    public void setGen(int gen) {
    this.gen = gen;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }
    
    //metodos CRUD
    
    
    public int agregar(){
        return 0;
    }
    
    public int modificar(){
        return 0;
    }
    
    public int eliminar(){
        return 0;
    }

  
    
    
}
