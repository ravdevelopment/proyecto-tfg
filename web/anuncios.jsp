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

        <title>Bienvenido</title>
    </head>

    <body>
        <%
            Connection bd = (Connection) session.getAttribute("database");
            Usuario usuario_conectado = (Usuario) session.getAttribute("usuarioConectado");
            AnunciosDAO controladorAnuncios = new AnunciosDAO();
            ArrayList<Anuncio> listaanuncios = controladorAnuncios.cargarAnuncios(bd);
            UsuariosDAO usuariosDAO = new UsuariosDAO();
            ArrayList<Usuario> listausuarios = usuariosDAO.cargarUsuarios(bd);
            Usuario_Rol rolesusuario = new Usuario_Rol();
            rolesusuario = usuariosDAO.obtenerRolesUsuario(bd, usuario_conectado.getDni());
        %>
        <div class="d-flex" id="content-wrapper">
            <div id="sidebar-container" class="bg-primary">
                <div class="logo">
                    <h4 class="text-light font-weight-bold mb-0">RAV Development</h4>
                </div>
                <div class="menu">
                    <a href="controller?estado=inicio" class="d-block text-light p-3 border-0"><i class="icon ion-md-apps lead mr-2"></i>
                        Inicio</a>

                    <a href="#" class="d-block text-light p-3 border-0"><i class="icon ion-md-people lead mr-2"></i>
                        Usuarios</a>

                    <a href="#" class="d-block text-light p-3 border-0"><i class="icon ion-md-stats lead mr-2"></i>
                        Proyectos</a>
                    <a href="controller?estado=anuncios" class="d-block text-light p-3 border-0"><i class="icon ion-md-person lead mr-2"></i>
                        Anuncios</a>
                    <a href="#" class="d-block text-light p-3 border-0"> <i class="icon ion-md-settings lead mr-2"></i>
                        Configuración</a>
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
                                        <img src="https://randomuser.me/api/portraits/thumb/men/75.jpg" class="img-fluid rounded-circle avatar mr-2" alt="" />
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

                    <section class="bg-light py-3">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9 col-md-8">
                                    <h1 style="text-align: center" class="font-weight-bold mb-0"> Filtrar anuncios
                                    </h1>
                                </div>

                                <!-- 
                                COMPROBACION SI TIENE ROL DE EMPRESA 
                                >-->
                                <div class="col-lg-3 col-md-4 d-flex">
                                    <button style="background-color: gray !important" class="btn-primary w-100 align-self-center" disabled=""> PUBLICAR OFERTA DE EMPLEO </button>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="bg-mix py-3">
                        <div class="container">
                            <div class="card rounded-0">
                                <div class="card-body">
                                    <form action="controller" method="get" class="row">
                                        <div class="col-lg-3 col-md-6 d-flex stat my-3">
                                            <div class="mx-auto">
                                                <h6 class="text-muted">Por Localidad</h6>
                                                <select name="localidad">
                                                    <% for (int i = 0; i < controladorAnuncios.localidades(bd).size(); i++) {
                                                    %>
                                                    <option><%=controladorAnuncios.localidades(bd).get(i)%></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 d-flex stat my-3">
                                            <div class="mx-auto">
                                                <h6 class="text-muted">Por Empresa</h6>
                                                <select name="nombre_empresa">
                                                    <% for (int i = 0; i < controladorAnuncios.empresas(bd).size(); i++) {%>
                                                    <option><%=controladorAnuncios.empresas(bd).get(i)%></option>
                                                    <% }%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 d-flex stat my-3">
                                            <div class="mx-auto">
                                                <h6 class="text-muted">Por Fecha</h6>
                                                <select name="fecha_publicacion">
                                                    <% for (int i = 0; i < controladorAnuncios.fechapublicaciones(bd).size(); i++) {%>
                                                    <option><%=controladorAnuncios.fechapublicaciones(bd).get(i)%></option>
                                                    <% }%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 d-flex my-3">
                                            <div class="ml-auto mr-auto">
                                                <button type="submit" name="filtrarAnuncios" class="btn btn-primary">Filtrar</button>
                                                <button class="btn btn-primary">Reset</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="container">
                            <div style="justify-content: center" class="row">
                                <%                    for (int i = 0; i < listaanuncios.size(); i++) {%>
                                <div class="col-lg-12 row">
                                    <div class="col-lg-8 my-3">
                                        <div class="card rounded-0">

                                            <div class="card-header bg-light">
                                                <h2 class="align-self-center mb-0"><img style="width: 2em" alt="" src="<%= listaanuncios.get(i).getLogo()%>"></h2>
                                                <small>FECHA DE PUBLICACIÓN
                                                    <%= listaanuncios.get(i).getFecha_publicacion()%>
                                                </small>

                                            </div>
                                            <div class="card-body pt-2">

                                                <div class="d-flex border-bottom py-2 mb-3">

                                                    <div class="align-self-center">
                                                        <h3 class=""><%= listaanuncios.get(i).getNombre_empresa()%></h3>
                                                        <h5 class=""><%= listaanuncios.get(i).getMunicipio()%></h5>
                                                        <%= listaanuncios.get(i).getMensaje()%>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 my-3">
                                        <div class="card rounded-0" >
                                            <div class="card-header bg-light">
                                                <h6 style="text-align: center" class="font-weight-bold mb-0">
                                                    Método de contacto
                                                </h6>
                                            </div>
                                            <div class="card-body pt-2">
                                                <div class="d-flex border-bottom py-2 mb-3">
                                                    <div class="mx-auto">
                                                        Teléfono  <%= listaanuncios.get(i).getTelefono()%>
                                                    </div>
                                                </div>
                                                <div class="d-flex border-bottom py-2 mb-3">
                                                    <div class="mx-auto">
                                                        <small> <%= listaanuncios.get(i).getEmail()%></small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% }%>
                                <div style="display: none" id="modificarmisdatos" class="col-lg-4 my-3 mx-auto">
                                    <div class="card rounded-0">
                                        <div class="card-header bg-light">
                                            <h6 style="text-align: center" class="font-weight-bold mb-0">Mis datos de usuario</h6>
                                        </div>
                                        <div class="card-body pt-2">
                                            <div style="justify-content: center" class="d-flex border-bottom py-2 mb-3, datosusuario">
                                                <div class="d-flex mr-3">
                                                    <h2 class="align-self-center mb-0"><i class="fa-solid fa-user-pen"></i></h2>
                                                </div>
                                                <div class="align-self-center">
                                                    <h6 class="d-block text-muted">Nombre</h6>
                                                    <input type="text" id="nombre" name="nombre" value="<%= usuario_conectado.getNombre()%>" />
                                                </div>
                                            </div>
                                            <div style="justify-content: center" class="d-flex border-bottom py-2 mb-3, datosusuario">
                                                <div class="d-flex mr-3">
                                                    <h2 class="align-self-center mb-0"><i class="fa-solid fa-user-pen"></i></h2>
                                                </div>

                                                <div class="align-self-center">
                                                    <h6 class="d-block text-muted">Apellidos</h6>
                                                    <input type="text" id="apellidos" name="apellidos" value="<%= usuario_conectado.getApellidos()%>"/>
                                                </div>
                                            </div>
                                            <div style="justify-content: center" class="d-flex border-bottom py-2 mb-3, datosusuario">
                                                <div class="d-flex mr-3">
                                                    <h2 class="align-self-center mb-0"><i class="fa-solid fa-envelope"></i></h2>
                                                </div>
                                                <div class="align-self-center">
                                                    <h6 class="d-block text-muted">Email</h6>
                                                    <input type="text" name="email" value="<%= usuario_conectado.getEmail()%>"/>
                                                </div>
                                            </div>
                                            <div style="justify-content: center" class="d-flex border-bottom py-2 mb-3, datosusuario">
                                                <div class="d-flex mr-3">
                                                    <h2 class="align-self-center mb-0"><i class="fa-solid fa-lock"></i></h2>
                                                </div>
                                                <div class="align-self-center">
                                                    <h6 class="d-block text-muted">Contraseña</h6>
                                                    <input type="password" name="password" value="*********"/>
                                                </div>
                                            </div>
                                            <div style="justify-content: center" class="d-flex border-bottom py-2 mb-3, datosusuario">
                                                <div class="d-flex mr-3">
                                                    <h2 class="align-self-center mb-0"><i class="fa-solid fa-mobile-screen"></i></h2>
                                                </div>
                                                <div class="align-self-center">
                                                    <h6 class="d-block text-muted">Teléfono</h6>
                                                    <input type="text" name="telefono" value="<%= usuario_conectado.getTelefonoContacto()%>"/>
                                                </div>
                                            </div>
                                            <button class="btn btn-primary w-100">Modificar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

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
    </body>

</html>