<%-- 
    Document   : menu
    Created on : 12-abr-2022, 8:49:49
    Author     : Ravpracticas.vsti
--%>

<%@page import="java.sql.Connection"%>
<%@page import="DAO.AnunciosDAO"%>
<%@page import="model.Anuncio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/menu.css">
        <script src="https://kit.fontawesome.com/719719aba5.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <%
            Usuario usuario_conectado = (Usuario) session.getAttribute("usuarioConectado");
        %>
        <nav>
            <div class="logo_container">
                <img id="logonav" src="image/examples/logo-removebg-preview.png">
            </div>
            <div class="buttons_container_parent">
                <form class="buttons_container" action="controller" method="post">
                    <input class="navBotones" type="submit" name="navegador" value="Inicio">
                    <input type="hidden" name="estado" value="inicio">
                    <i class="fa-light fa-house-user fa-2xl"></i>
                </form>
                <form class="buttons_container" action="controller" method="post">
                    <input class="navBotones" type="submit" name="navegador" value="Anuncios">
                    <input type="hidden" name="estado" value="anuncios">
                </form>
                <form class="buttons_container" action="controller" method="post">
                    <input class="navBotones" type="submit" name="navegador" value="Calificaciones">
                    <input type="hidden" name="estado" value="calificaciones">
                </form>
                <form class="buttons_container" action="controller" method="post">
                    <input class="navBotones" type="submit" name="navegador" value="Proyectos">
                    <input type="hidden" name="estado" value="proyectos">
                </form>
                <form class="buttons_container" class="logout" action="controller" method="post">
                    <i class="fa-light fa-right-from-bracket fa-2xl"></i>
                    <input type="hidden" name="estado" value="logout">
                    <input type="hidden" name="navegador" value="Salir">
                </form>
            </div>
        </nav>
        <section class="contenido">
            <aside class="izquierda">
                <section class="modificar_datos">
                    <form class="form1" name='controlador' action="controlador" method="post">
                        <img id="imagen_usuario"
                             src="https://images.generated.photos/8d0HmvcP1TfCTbRen0Up-XM1DonoD0wAbV0YTjyix7o/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/Nzc0OTg2LmpwZw.jpg">
                        <input type="text" name="email" placeholder="<%= usuario_conectado.getEmail()%>"/>
                        <input type="text" name="telefono" placeholder="<%= usuario_conectado.getTelefonoContacto()%>"/>
                        <input type="text" id="nombre" name="nombre" placeholder="<%= usuario_conectado.getNombre()%>" />
                        <input type="text" id="apellidos" name="apellidos" placeholder="<%= usuario_conectado.getApellidos()%>"/>
                        <input type="text" id="municipio" name="municipio" placeholder="<%= usuario_conectado.getMunicipio()%>"/>

                        <input type="password" name="password" placeholder="*******"/>
                        <input id='btn1' type="submit" name="acceder" value="Modificar Datos"/>
                        <input type="hidden" name="estado" value="registro"/>
                    </form>
                </section>
            </aside>
            <%
                AnunciosDAO controladorAnuncios = new AnunciosDAO();
                controladorAnuncios.cargarAnuncios((Connection) session.getAttribute("database"));

            %>
            <table class="derecha">
                <tr id="titulos">
                    <td>LOGO EMPRESA</td>              
                    <td>FECHA DE PUBLICACIÓN</td>
                    <td> NOMBRE DE EMPRESA</td>
                    <td> MUNICIPIO </td>
                    <td>TELÉFONO DE CONTACTO</td>
                </tr>
                <%                    for (int i = 0; i < controladorAnuncios.anunciosPublicados.size(); i++) {

                %>

                <tr class="anuncios">
                    <td><img class="logo_empresas" src="<%= controladorAnuncios.anunciosPublicados.get(i).getLogo()%>"></td>          
                    <td><%= controladorAnuncios.anunciosPublicados.get(i).getFecha_publicacion()%></td>
                    <td> <%= controladorAnuncios.anunciosPublicados.get(i).getNombre_empresa()%></td>
                    <td> <%= controladorAnuncios.anunciosPublicados.get(i).getMunicipio()%></td>
                    <td><%= controladorAnuncios.anunciosPublicados.get(i).getTelefono()%></td>
                    </aside>
                    <%
                        }
                    %>
            </table>
        </section>
        <div class="footer">
            <h2>Footer</h2>
        </div>
    </body>
</html>
