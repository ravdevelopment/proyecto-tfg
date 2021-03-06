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
                        Configuraci??n</a>
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
                                        <a class="dropdown-item" href="controller?estado=logout">Cerrar sesi??n</a>
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
                                    <h1 id="textofiltanuncios" style="text-align: center" class="font-weight-bold mb-0"> Filtrar anuncios
                                    </h1>
                                </div>

                                <%
                                    for (int i = 0; i < rolesusuario.getRoles().size(); i++) {
                                        if (rolesusuario.getRoles().get(i).getNombre_rol().equals("empresa")) {
                                %>
                                <div class="col-lg-3 col-md-4 d-flex">
                                    <button id="botonPublicarOferta" class="btn-primary w-100 align-self-center"> PUBLICAR OFERTA DE EMPLEO </button>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </section>

                    <section id="seccionFiltroAnuncios2" class="bg-mix py-3">
                        <div class="container">
                            <div class="card rounded-0">
                                <div class="card-body">
                                    <form action="controller" method="get" class="row">
                                        <div class="col-lg-3 col-md-6 d-flex stat my-3">
                                            <div class="mx-auto">
                                                <h6 class="text-muted">Por Localidad</h6>
                                                <select name="localidad">
                                                    <option>Todas las localidades</option>
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
                                                    <option>Todas las empresas</option>
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
                                                    <option>Todas las fechas</option>
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
                    <div id="seccionPublicarOferta" style="display: none" class="col-md-8 mx-auto">
                        <div class="card rounded-0">
                            <div class="card-header bg-light">
                                <h6 style="text-align: center" class="font-weight-bold mb-0">A??adir nueva oferta de empleo</h6>
                            </div>
                            <div class="card-body pt-2">
                                <form action="controller" method="post">
                                    <input type="hidden" name="estado" value="publicaradd">
                                    <input type="hidden" name="dni_usuario" value="<%= usuario_conectado.getDni()%>">
                                    <div style="justify-content: center" class="d-flex border-bottom py-2 mb-3">
                                        <div class="align-self-center">
                                            <h6 class="d-block text-muted">Nombre de la empresa</h6>
                                            <input type="text" class="col-md-12" id="nombre_empresa" name="nombre_empresa" value=""/>
                                        </div>
                                    </div>
                                    <div style="justify-content: center" class="d-flex border-bottom py-2 mb-3">
                                        <div class="align-self-center">
                                            <h6 class="d-block text-muted">Municipio</h6>
                                            <input class="col-md-12" type="text" id="Municipio" name="municipio" value=""/>
                                        </div>
                                    </div>
                                    <div style="justify-content: center" class="d-flex border-bottom py-2 mb-3">
                                        <div class="align-self-center">
                                            <h6 class="d-block text-muted">Email</h6>
                                            <input class="col-md-12" type="text" name="email" value=""/>
                                        </div>
                                    </div>
                                    <div style="justify-content: center" class="d-flex border-bottom py-2 mb-3">
                                        <div class="align-self-center">
                                            <h6 class="d-block text-muted">Tel??fono</h6>
                                            <input class="col-md-12" type="text" name="telefono" value=""/>
                                        </div>
                                    </div>
                                    <div style="justify-content: center" class="d-flex border-bottom py-2 mb-3">
                                        <div class="align-self-center">
                                            <h6 class="d-block text-muted" style="text-align: center">??Que est??s buscando?</h6>
                                            <textarea class="col-md-12" name="mensaje" value="" cols="50" rows="10"></textarea>
                                        </div>
                                    </div>
                                    <div style="justify-content: center" class="d-flex border-bottom py-2 mb-3">
                                        <input type="submit" class="btn btn-primary w-50" value="Publicar oferta">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <section id="seccionFiltroAnuncios">
                        <div class="container">
                            <div style="justify-content: center" class="row">
                                <%                    for (int i = 0; i < listaanuncios.size(); i++) {%>
                                <div class="col-lg-12 row">
                                    <div class="col-lg-8 my-3">
                                        <div class="card rounded-0">

                                            <div class="card-header bg-light">
                                                <h2 class="align-self-center mb-0"><img style="width: 2em" alt="" src="<%= listaanuncios.get(i).getLogo()%>"></h2>
                                                <small>FECHA DE PUBLICACI??N
                                                    <%= listaanuncios.get(i).getFecha_publicacion()%>
                                                </small>

                                            </div>
                                            <div class="card-body pt-2">

                                                <div class="d-flex border-bottom py-2 mb-3">

                                                    <div class="">
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
                                                    M??todo de contacto
                                                </h6>
                                            </div>
                                            <div class="card-body pt-2">
                                                <div class="d-flex border-bottom py-2 mb-3">
                                                    <div class="mx-auto">
                                                        Tel??fono  <%= listaanuncios.get(i).getTelefono()%>
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

                            </div>
                        </div>
                    </section>

                </div>

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
            document.getElementById("botonPublicarOferta").addEventListener("click", (ev) => {
                if (document.getElementById("seccionPublicarOferta").style.display == "none") {
                    document.getElementById("seccionPublicarOferta").style.display = "block";
                    document.getElementById("seccionFiltroAnuncios").style.display = "none";
                    document.getElementById("seccionFiltroAnuncios2").style.display = "none";
                    document.getElementById("textofiltanuncios").textContent = "";
                    document.getElementById("botonPublicarOferta").textContent = "Volver";
                } else {
                    document.getElementById("seccionPublicarOferta").style.display = "none";
                    document.getElementById("seccionFiltroAnuncios").style.display = "block";
                    document.getElementById("seccionFiltroAnuncios2").style.display = "block";
                    document.getElementById("textofiltanuncios").textContent = "Filtrar Anuncios";
                    document.getElementById("botonPublicarOferta").textContent = "PUBLICAR OFERTA DE EMPLEO";
                }
            });
        </script>
    </body>

</html>