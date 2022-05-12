<%-- 
    Document   : jobs
    Created on : 13-abr-2022, 8:38:39
    Author     : Ravpracticas.vsti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/jobs.css">

    </head>
    <body>
        <nav class="navegador">
            <div class="logo">
                <img src="image/examples/logo-removebg-preview.png">
            </div>
            <div class="navegador_int">
                <li><a href="menu.jsp" id="li1"> Inicio</a></li>
                <li><a href="jobs.jsp" id="li2">Anuncios</a></li>
                <li><a href="#" id="li3">Calificaciones</a></li>
                <li><a href="#" id="li4">Proyectos</a></li>
            </div>
            <div class="logout"><a href="index.jsp" id="li5"><img class="iconos" src="image/examples/switch.png"></a></div>
        </nav>
        <main class="contenido">
            <form class="filtrar">
                <div class="lista_aside_izq_fecha">
                    <h2>Fecha</h2>
                    <label>  <input type="radio" name="Fecha" class="filtrar_fecha" checked> Cualquier fecha</label>
                    <label>  <input type="radio" name="Fecha" class="filtrar_fecha"> Últimas 24 horas</label>
                    <label>  <input type="radio" name="Fecha" class="filtrar_fecha"> Últimos 7 días</label>
                    <label> <input type="radio" name="Fecha" class="filtrar_fecha"> Últimos 15 días</label>
                </div>
                <div class="lista_aside_izq_fecha">
                    <h2>Provincia</h2>
                    <label>  <input type="radio" name="Provincia" class="filtrar_fecha" checked> Cualquier Provincia </label>
                    <label>  <input type="radio" name="Provincia" class="filtrar_fecha"> Castro Urdiales </label>
                    <label>  <input type="radio" name="Provincia" class="filtrar_fecha"> Laredo </label>
                    <label>  <input type="radio" name="Provincia" class="filtrar_fecha"> Santander </label>
                    <label>  <input type="radio" name="Provincia" class="filtrar_fecha"> San Sebastián </label>
                    <label>  <input type="radio" name="Provincia" class="filtrar_fecha"> Bilbao </label>
                    <label>  <input type="radio" name="Provincia" class="filtrar_fecha"> Madrid </label>
                    <label>  <input type="radio" name="Provincia" class="filtrar_fecha"> Barcelona </label>
                    <input type="submit" id="btn_busqueda" name="Buscar_Anuncio" value="Buscar">
                </div>
            </form>

            <section class="bloq_anuncios">

            </section>

        </main>
        <div class="footer">
            <h2>Footer</h2>
        </div>

    </body>
</html>
