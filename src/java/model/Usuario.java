/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class Usuario {

    String nombre;
    String apellidos;
    String email;
    String dni;
    String password;
    Integer telefonoContacto;
    String municipio;
    String estado;
//    String imagen;
    Float nota;
    String imagen;
    String enlace_proyecto;
    public Usuario() {
    }

    public Usuario(String nombre, String apellidos, String email, String dni, String password, Integer telefonoContacto, String municipio) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
        this.dni = dni;
        this.password = password;
        this.telefonoContacto = telefonoContacto;
        this.municipio = municipio;
    }

    public Usuario(String nombre, String apellidos, String email, String dni, String password, Integer telefonoContacto, String municipio, Float nota) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
        this.dni = dni;
        this.password = password;
        this.telefonoContacto = telefonoContacto;
        this.municipio = municipio;
        this.nota = nota;
    }

    public Usuario(String nombre, String apellidos, String email, String dni, String password, Integer telefonoContacto, String municipio, String estado, Float nota) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
        this.dni = dni;
        this.password = password;
        this.telefonoContacto = telefonoContacto;
        this.municipio = municipio;
        this.estado = estado;
        this.nota = nota;
    }

    public Float getNota() {
        return nota;
    }

    public void setNota(Float nota) {
        this.nota = nota;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getTelefonoContacto() {
        return telefonoContacto;
    }

    public void setTelefonoContacto(Integer telefonoContacto) {
        this.telefonoContacto = telefonoContacto;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEnlace_proyecto() {
        return enlace_proyecto;
    }

    public void setEnlace_proyecto(String enlace_proyecto) {
        this.enlace_proyecto = enlace_proyecto;
    }
    
}
