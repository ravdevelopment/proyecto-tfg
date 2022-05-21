<%-- 
    Document   : menu
    Created on : 12-abr-2022, 8:49:49
    Author     : Ravpracticas.vsti
--%>

<%@page import="model.Usuario_Rol"%>
<%@page import="DAO.UsuariosDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="DAO.AnunciosDAO"%>
<%@page import="model.Anuncio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/719719aba5.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="css/menu2.css">

        <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

        <title>Proyectos</title>
    </head>
    <%
        Connection bd = (Connection) session.getAttribute("database");
        Usuario usuario_conectado = (Usuario) session.getAttribute("usuarioConectado");
        UsuariosDAO usuariosDAO = new UsuariosDAO();
        ArrayList<Usuario> listausuarios = usuariosDAO.cargarUsuarios(bd);
        Usuario_Rol rolesusuario = new Usuario_Rol();
        rolesusuario = usuariosDAO.obtenerRolesUsuario(bd, usuario_conectado.getDni());
        ArrayList<Usuario> lista_alumnos = usuariosDAO.obtenerDatosUsuarios(bd);
    %>
    <body>

        <div class="d-flex" id="content-wrapper">
            <div id="sidebar-container" class="bg-primary">
                <div class="logo">
                    <h4 class="text-light font-weight-bold mb-0">RAV Development</h4>
                </div>
                <div class="menu">
                    <a href="controller?estado=inicio" class="d-block text-light p-3 border-0"><i class="icon ion-md-apps lead mr-2"></i>
                        Inicio</a>

                    <a href="controller?estado=alumnos" class="d-block text-light p-3 border-0"><i class="icon ion-md-people lead mr-2"></i>
                        Alumnos</a>

                    <a href="controller?estado=proyectos" class="d-block text-light p-3 border-0"><i class="icon ion-md-stats lead mr-2"></i>
                        Proyectos</a>
                    <a href="controller?estado=anuncios" class="d-block text-light p-3 border-0"><i class="icon ion-md-person lead mr-2"></i>
                        Anuncios</a>
                        <%
                            for (int i = 0; i < rolesusuario.getRoles().size(); i++) {
                                if (rolesusuario.getRoles().get(i).getNombre_rol().equals("administrador")) {
                        %>
                    <a href="#" class="d-block text-light p-3 border-0"> <i class="icon ion-md-settings lead mr-2"></i>
                        Configuración</a>
                        <%
                                }
                            }
                        %>

                </div>
            </div>
            <div class="w-100">
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container">

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                                <li class="nav-item dropdown">
                                    <a class="nav-link text-dark dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <% if (usuario_conectado.getImagen().equals("no imagen")) {

                                        %>
                                        <img src="" class="rounded-circle ion-md-person mr-2" alt="" />
                                        <%                                             } else {
                                        %>
                                        <img src="<%= usuario_conectado.getImagen()%>" class="rounded-circle ion-md-person mr-2 avatar" alt=""/>

                                        <%

                                            }
                                        %>
                                        <%= usuario_conectado.getNombre()%>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="controller?estado=miperfil">Mi perfil</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="controller?estado=logout">Cerrar sesión</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>




                <div id="content" class="bg-grey w-100">
                    <div class="container">
                        <%
                            for (int x = 0; x < lista_alumnos.size(); x++) {

                        %>
                        <div class="card rounded-0 mb-3">
                            <div class="card-body">
                                <div class="card-header">
                                    <h6 class="text-muted"><%=lista_alumnos.get(x).getNombre()%> <%=lista_alumnos.get(x).getApellidos()%></h6>
                                </div>
                                <div class="row">
                                    <div class="col-lg d-flex stat my-3">
                                        <div class="mx-auto">
                                            <% if (lista_alumnos.get(x).getImagen().equals("no imagen")) {

                                            %>
                                            <img src="" class="rounded-circle ion-md-person mr-2" alt="" />
                                            <%                                             } else {
                                            %>
                                            <img src="<%= lista_alumnos.get(x).getImagen()%>" class="rounded-circle ion-md-person mr-2" alt="" width="170px" />

                                            <%

                                                }
                                            %>


                                        </div>
                                    </div>
                                    <div class="col-lg d-flex stat my-3">
                                        <div class="mx-auto">
                                            <h6 class="font-weight-bold">Correo electrónico</h6>
                                            <h6 class="text-muted"><%=lista_alumnos.get(x).getEmail()%></h6>
                                        </div>
                                    </div>
                                    <div class="col-lg d-flex stat my-3">
                                        <div class="mx-auto">
                                            <h6 class="font-weight-bold">Teléfono</h6>
                                            <h6 class="text-muted"><%=lista_alumnos.get(x).getTelefonoContacto()%></h6>

                                        </div>
                                    </div>
                                    <div class="col-lg d-flex my-3">
                                        <div class="mx-auto">
                                            <h6 class="font-weight-bold">Municipio</h6>
                                            <h6 class="text-muted"><%=lista_alumnos.get(x).getMunicipio()%></h6>

                                        </div>
                                    </div>
                                    <%
                                        for (int i = 0; i < rolesusuario.getRoles().size(); i++) {
                                            if (rolesusuario.getRoles().get(i).getNombre_rol().equals("profesor")) {
                                    %>

                                    <div class="col-lg-6 d-flex stat my-3">
                                        <div class="mx-auto">
                                            <h6 class="dropdown-toggle font-weight-bold">Enlace a git</h6>
                                            <%
                                                if (lista_alumnos.get(x).getEnlace_proyecto().equals("0")) {
                                            %>
                                            <h6 class="font-weight-bold">Sin entregar</h6>      
                                            <%
                                            } else {
                                            %>
                                            <h6 class="font-weight-bold"><%= lista_alumnos.get(x).getEnlace_proyecto()%></h6>  
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 d-flex my-3 row">
                                        <div class="mx-auto d-flex row">
                                            <div class="mx-auto">
                                                <%
                                                    if (lista_alumnos.get(x).getNota() == 0 && !lista_alumnos.get(x).getEnlace_proyecto().equals("0")) {
                                                %>
                                                <h6 class="font-weight-bold">Nota</h6>

                                                <select id="nota_alumno" name="nota_alumno">
                                                    <%
                                                        for (int j = 0; j <= 10; j++) {
                                                    %>
                                                    <option><%=j%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                                <input type="submit" id="enviar_datos" class="text-light btn-primary mt-2" name="enviar" value="Asignar nota">
                                                <input type="hidden" name="dnialumno" value="<%=lista_alumnos.get(x).getDni()%>"/>
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </div>

                                    </div>





                                    <%
                                            }
                                        }
                                    %>

                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>

            </div>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"
            integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
            <script>
                /* window.onload = ocultarbtn();
                 function ocultarbtn() {
                 for(let i = 0; )
                 document.getElementById("nota_alumno").style.display = "none";
                 document.getElementById("enviar_datos").style.display = "none";
                 
                 }
                 document.getElementById("btn_evaluar").addEventListener("click", (ev) => {
                 document.getElementById("nota_alumno").style.display = "flex";
                 document.getElementById("btn_evaluar").style.display = "none";
                 });
                 document.getElementById("nota_alumno").addEventListener("change", (ev) => {
                 document.getElementById("enviar_datos").style.display = "flex";
                 });
                 */
            </script>
    </body>

</html>