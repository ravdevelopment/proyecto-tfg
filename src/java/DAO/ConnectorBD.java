/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ravpracticas.vsti
 */
public class ConnectorBD {

    private Connection conexion = null;
    private String servidor = "";
    private String database = "";
    private String usuario = "";
    private String password = "";
    private String url = "";

    public ConnectorBD(String servidor, String database, String usuario, String password) {
        try {
            this.servidor = servidor;
            this.database = database;
            this.url = "jdbc:mysql://" + servidor + "/" + database;
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(url, usuario, password);
            System.out.println("Conexión a Base de Datos " + url + " . . . . . Ok");
        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectorBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection getConexion() {
        return conexion;
    }

    public Connection cerrarConexion() {
        try {
            conexion.close();
            System.out.println("Cerrando conexión a " + url + " . . . . . Ok");
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        conexion = null;
        return conexion;

    }
}
