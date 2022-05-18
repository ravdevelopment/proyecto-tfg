package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Rol;
import model.Usuario;
import model.Usuario_Rol;

/**
 *
 * @author Ravpracticas.vsti
 */
public class UsuariosDAO {

    public ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();

    public void cargarUsuarios(Connection bd) {
        try {
            Statement st = bd.createStatement();
            ResultSet resultadoDAO = st.executeQuery("SELECT * from usuario");
            int count = 0;
            while (resultadoDAO.next()) {
                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.setDni(resultadoDAO.getString("dni"));
                nuevoUsuario.setNombre(resultadoDAO.getString("nombre"));
                nuevoUsuario.setApellidos(resultadoDAO.getString("apellidos"));
                nuevoUsuario.setMunicipio(resultadoDAO.getString("municipio"));
                nuevoUsuario.setEmail(resultadoDAO.getString("email"));
                nuevoUsuario.setPassword(resultadoDAO.getString("password"));
                nuevoUsuario.setEstado(resultadoDAO.getString("estado"));
                nuevoUsuario.setTelefonoContacto(resultadoDAO.getInt("telefono"));
                nuevoUsuario.setNota(resultadoDAO.getFloat("nota"));
                listaUsuarios.add(nuevoUsuario);
                count++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public boolean comprobarUsuario(String dni, String password, Connection bd) {
        boolean encontrado = false;

        try {
            Statement st = bd.createStatement();
            ResultSet resultadoDAO = st.executeQuery("SELECT * from usuario where dni='" + dni + "' and password='" + password + "'");
            encontrado = true;

        } catch (Exception ex) {
            ex.printStackTrace();
            encontrado = false;
        }
        return encontrado;
    }

    public boolean registroUsuario(Usuario usuarioRegistro, Connection bd) {
        Boolean evaluacion_registro = true;
        try {
            Statement st = bd.createStatement();
            st.executeUpdate("INSERT INTO `usuario`(`dni`, `nombre`, `apellidos`, `municipio`, `email`, `password`, `telefono`) "
                    + "VALUES ('" + usuarioRegistro.getDni() + "', '"
                    + usuarioRegistro.getNombre() + "', '"
                    + usuarioRegistro.getApellidos() + "', '"
                    + usuarioRegistro.getMunicipio() + "', '"
                    + usuarioRegistro.getEmail() + "', '"
                    + usuarioRegistro.getPassword() + "', '"
                    + usuarioRegistro.getTelefonoContacto() + "')");
        } catch (Exception ex) {
            evaluacion_registro = false;
        }
        return evaluacion_registro;
    }

    public Usuario obtenerDatosUsuario(String dni, Connection bd) {
        Usuario usuario_conectado = new Usuario();
        try {
            Statement st = bd.createStatement();
            ResultSet resultadoDAO = st.executeQuery("SELECT * from usuario where dni = '" + dni + "'");
            int count = 0;
            while (resultadoDAO.next()) {
                usuario_conectado.setDni(resultadoDAO.getString("dni"));
                usuario_conectado.setNombre(resultadoDAO.getString("nombre"));
                usuario_conectado.setApellidos(resultadoDAO.getString("apellidos"));
                usuario_conectado.setMunicipio(resultadoDAO.getString("municipio"));
                usuario_conectado.setEmail(resultadoDAO.getString("email"));
                usuario_conectado.setPassword(resultadoDAO.getString("password"));
                usuario_conectado.setEstado(resultadoDAO.getString("estado"));
                usuario_conectado.setTelefonoContacto(resultadoDAO.getInt("telefono"));
                usuario_conectado.setNota(resultadoDAO.getFloat("nota"));
                listaUsuarios.add(usuario_conectado);
                count++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return usuario_conectado;
    }

    public String obtenerImagenUsuario(String dni, Connection bd) {
        String usuarioimg = " ";
        try {
            Statement st = bd.createStatement();
            ResultSet resultadoDAO = st.executeQuery("SELECT imagen from usuario where dni_usuario = '" + dni + "'");
            while (resultadoDAO.next()) {
                usuarioimg = resultadoDAO.getString("imagen");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return usuarioimg;
    }

//    public Usuario_Rol obtenerRolesUsuario(Connection bd, String dni) {
//        Usuario_Rol rolesusuario = new Usuario_Rol();
//        rolesusuario.setDni_usuario(dni);
//        try {
//            Statement st = bd.createStatement();
//            ResultSet valores = st.executeQuery("SELECT rol.nombre_rol,rol.id_rol FROM rol,usuario_rol WHERE (usuario_rol.dni_usuario = " + dni + ") AND (rol.id_rol = usuario_rol.id_rol)");
//            ArrayList<Rol> roles = new ArrayList<Rol>();
//            while (valores.next()) {
//                Rol nuevo = new Rol();
//                nuevo.setNombre_rol(valores.getString("nombre_rol"));
//                nuevo.setId_rol(valores.getInt("id_rol"));
//                roles.add(nuevo);
//            }
//            rolesusuario.setRoles(roles);
//        } catch (SQLException ex) {
//        }
//        return rolesusuario;
//    }
//
    public void modificarDatosUsuario(Connection bd, String nombre, String apellidos, String municipio, String email, String pass, String dni, String estado) {
        try {
            Statement st = bd.createStatement();
            st.executeUpdate("UPDATE usuario set nombre = '" + nombre + "', apellidos = '" + apellidos + "', municipio = '" + municipio + "', email = '" + email + "', password = '" + pass + "', estado = '" + estado + "' where dni = '" + dni + "'");
            listaUsuarios = null;
            UsuariosDAO refresh = new UsuariosDAO();
            refresh.cargarUsuarios(bd);
        } catch (SQLException ex) {
        }
    }
}
