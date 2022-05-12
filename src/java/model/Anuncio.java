/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Ravpracticas.vsti
 */
public class Anuncio {
    String id_anuncio;
    String dni_usuario;
    String municipio;
    Date fecha_publicacion;
    String nombre_empresa;
    Integer telefono;
    String mensaje;
    String logo;
    String email;

    public Anuncio() {
        
    }

    public Anuncio(String id_anuncio, String dni_usuario, String municipio, Date fecha_publicacion, String nombre_empresa, Integer telefono, String mensaje, String logo) {
        this.id_anuncio = id_anuncio;
        this.dni_usuario = dni_usuario;
        this.municipio = municipio;
        this.fecha_publicacion = fecha_publicacion;
        this.nombre_empresa = nombre_empresa;
        this.telefono = telefono;
        this.mensaje = mensaje;
        this.logo = logo;
    }
    
    public String getId_anuncio() {
        return id_anuncio;
    }

    public void setId_anuncio(String id_anuncio) {
        this.id_anuncio = id_anuncio;
    }

    public String getDni_usuario() {
        return dni_usuario;
    }

    public void setDni_usuario(String dni_usuario) {
        this.dni_usuario = dni_usuario;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public Date getFecha_publicacion() {
        return fecha_publicacion;
    }

    public void setFecha_publicacion(Date fecha_publicacion) {
        this.fecha_publicacion = fecha_publicacion;
    }

    public String getNombre_empresa() {
        return nombre_empresa;
    }

    public void setNombre_empresa(String nombre_empresa) {
        this.nombre_empresa = nombre_empresa;
    }

    public Integer getTelefono() {
        return telefono;
    }

    public void setTelefono(Integer telefono) {
        this.telefono = telefono;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
}

