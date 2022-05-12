/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

public class Usuario_Rol {
    String dni_usuario;
    ArrayList<Rol> roles;
    
   public Usuario_Rol(){}

    public Usuario_Rol(String dni_usuario, ArrayList<Rol> roles) {
        this.dni_usuario = dni_usuario;
        this.roles = roles;
    }

    public String getDni_usuario() {
        return dni_usuario;
    }

    public void setDni_usuario(String dni_usuario) {
        this.dni_usuario = dni_usuario;
    }

    public ArrayList<Rol> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<Rol> roles) {
        this.roles = roles;
    }

   
}
