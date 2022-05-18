/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ConnectorBD;
import DAO.UsuariosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;
import model.Usuario_Rol;

public class controller extends HttpServlet {

    private UsuariosDAO usuariosDAO;
    private Connection baseDatos;
    String dniAcceso;
    String passwordAcceso;
    String estado;
    Usuario usuario_conectado = new Usuario();

    /**
     *
     * @param conf
     * @throws ServletException
     */
    @Override
    public void init(ServletConfig conf) throws ServletException {
        super.init(conf);
        String servidor = "localhost";
        String database = "proyecto_final";
        String usuario = "root";
        String password = "";
        ConnectorBD conexion = new ConnectorBD(servidor, database, usuario, password);
        baseDatos = conexion.getConexion();
        usuariosDAO = new UsuariosDAO();
        usuariosDAO.cargarUsuarios(baseDatos);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        //session.setAttribute("usuarios", usuariosDAO.listaUsuarios);
        session.setAttribute("database", baseDatos);
        estado = request.getParameter("estado");
        String accion = request.getParameter("accion");
        String nextPage = "";
        if (estado.equals("menu")) {
            dniAcceso = request.getParameter("dni");
            passwordAcceso = request.getParameter("password");
            if (usuariosDAO.comprobarUsuario(dniAcceso, passwordAcceso, baseDatos) == true) {
                session.setAttribute("dniConectado", dniAcceso);
                usuario_conectado = usuariosDAO.obtenerDatosUsuario(dniAcceso, baseDatos);
                session.setAttribute("usuarioConectado", usuario_conectado);
//                Usuario_Rol usuarioActual;
//                usuarioActual = usuariosDAO.obtenerRolesUsuario(baseDatos, dniAcceso);
//                session.setAttribute("Dniroles", usuarioActual);
                nextPage = "/menu.jsp";
            } else {
                session.setAttribute("falloindex", "El usuario y/o contraseña introducidos son incorrectos.");
                nextPage = "/index.jsp";
            }
        }
        if(estado.equals("inicio")) {
            nextPage = "/menu.jsp";
        }
        if(estado.equals("anuncios")) {
            nextPage = "/anuncios.jsp";
        }
        if(estado.equals("proyectos")) {
            nextPage = "/proyectos.jsp";
        }
        if(estado.equals("calificaciones")) {
            nextPage = "/calificaciones.jsp";
        }
        if(estado.equals("miperfil")) {
            nextPage = "/miperfil.jsp";
        }
        
        if (estado.equals("registro")) {
            String dniRegistro = request.getParameter("dniRegistro");
            String nombreRegistro = request.getParameter("nombreRegistro");
            String apellidosRegistro = request.getParameter("apellidosRegistro");
            String passwordRegistro = request.getParameter("passwordRegistro");
            String emailRegistro = request.getParameter("emailRegistro");
            String municipioRegistro = request.getParameter("municipio");
            Integer telefonoRegistro = Integer.parseInt(request.getParameter("telefonoRegistro"));

            Usuario registroUsuario = new Usuario(nombreRegistro, apellidosRegistro, emailRegistro, dniRegistro, passwordRegistro, telefonoRegistro, municipioRegistro);
            if (usuariosDAO.registroUsuario(registroUsuario, baseDatos)) {
                usuario_conectado = usuariosDAO.obtenerDatosUsuario(dniRegistro, baseDatos);
                session.setAttribute("usuarioConectado", usuario_conectado);
                //usuariosDAO.listaUsuarios.add(registroUsuario);
                nextPage = "/menu.jsp";
            } else {
                session.setAttribute("falloindex", "El dni utilizado está en uso, prueba a iniciar sesión.");
                nextPage = "/index.jsp";
            }

        }

        if (estado.equals("logout")) {
            session.invalidate();
            response.sendRedirect("index.jsp");
            return;
        }
        
        if (estado.equals("modificar_datos_usuario")) {
            String nombre_usuario = request.getParameter("nombre_usuario");
            String apellidos_usuario = request.getParameter("apellidos_usuario");
            String email_usuario = request.getParameter("email_usuario");
            String municipio_usuario = request.getParameter("municipio_usuario");
            String password_usuario = request.getParameter("password_usuario");
            Integer telefono_usuario = Integer.parseInt(request.getParameter("telefono_usuario"));
            String estado_usuario = request.getParameter("status_usuario");
            String dni_usuario = usuario_conectado.getDni();
            usuariosDAO.modificarDatosUsuario(baseDatos, nombre_usuario, apellidos_usuario, municipio_usuario, email_usuario, password_usuario, dni_usuario, estado_usuario);
            nextPage = "/miperfil.jsp";
        }

        ServletContext servletContext = getServletContext();
        RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher(nextPage);
        requestDispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
