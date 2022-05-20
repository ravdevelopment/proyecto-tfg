/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.Anuncio;

/**
 *
 * @author Ravpracticas.vsti
 */
public class AnunciosDAO {

    public ArrayList<Anuncio> cargarAnuncios(Connection bd) {
        ArrayList<Anuncio> anunciosPublicados = new ArrayList<Anuncio>();
        try {

            Statement st = bd.createStatement();
            ResultSet resultadoDAO = st.executeQuery("SELECT * from anuncio");
            int count = 0;
            while (resultadoDAO.next()) {
                Anuncio anuncio = new Anuncio();
                anuncio.setId_anuncio(resultadoDAO.getString("id_anuncio"));
                anuncio.setDni_usuario(resultadoDAO.getString("dni_usuario"));
                anuncio.setMunicipio(resultadoDAO.getString("municipio"));
                anuncio.setFecha_publicacion(resultadoDAO.getDate("fecha_publicacion"));
                anuncio.setNombre_empresa(resultadoDAO.getString("nombre_empresa"));
                anuncio.setTelefono(resultadoDAO.getInt("telefono"));
                anuncio.setMensaje(resultadoDAO.getString("mensaje"));
                anuncio.setLogo(resultadoDAO.getString("logo"));
                anuncio.setEmail(resultadoDAO.getString("email"));
                anunciosPublicados.add(anuncio);
                count++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return anunciosPublicados;
    }

    public ArrayList<String> localidades(Connection bd) {
        ArrayList<String> listalocalidades = new ArrayList<String>();
        try {
            Statement st = bd.createStatement();
            ResultSet resultadoDAO = st.executeQuery("SELECT DISTINCT municipio from anuncio");
            while (resultadoDAO.next()) {
                listalocalidades.add(resultadoDAO.getString("municipio"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return listalocalidades;
    }

    public ArrayList<String> empresas(Connection bd) {
        ArrayList<String> nombreempresas = new ArrayList<String>();
        try {
            Statement st = bd.createStatement();
            ResultSet resultadoDAO = st.executeQuery("SELECT DISTINCT nombre_empresa from anuncio");
            while (resultadoDAO.next()) {
                nombreempresas.add(resultadoDAO.getString("nombre_empresa"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return nombreempresas;
    }

    public ArrayList<Date> fechapublicaciones(Connection bd) {
        ArrayList<Date> fechapublicaciones = new ArrayList<Date>();
        try {
            Statement st = bd.createStatement();
            ResultSet resultadoDAO = st.executeQuery("SELECT DISTINCT fecha_publicacion from anuncio");
            while (resultadoDAO.next()) {
                fechapublicaciones.add(resultadoDAO.getDate("fecha_publicacion"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return fechapublicaciones;
    }

    public boolean insertarAnuncio(String dni, String municipio, String nombre_empresa, int telefono, String mensaje, String email, Connection bd) {
        Boolean evaluacion_registro = true;
        try {
            Statement st = bd.createStatement();
            st.executeUpdate("INSERT INTO anuncio(dni_usuario, municipio, nombre_empresa, telefono, mensaje, email) "
                    + "VALUES ('" + dni + "', '"
                    + municipio + "', "
                    + nombre_empresa + "', '"
                    + telefono + "', '"
                    + mensaje + "', '"
                    + email + "')");
        } catch (Exception ex) {
            evaluacion_registro = false;
        }
        return evaluacion_registro;
    }

    // INSERT INTO anuncio(dni_usuario, municipio, fecha_publicacion, nombre_empresa, telefono, mensaje, email) VALUES ()
}
