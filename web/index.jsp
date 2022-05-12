<%-- 
    Document   : index
    Created on : 11-abr-2022, 11:03:47
    Author     : Ravpracticas.vsti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- <link rel="stylesheet" href="css/style.css"> -->
        <link rel="stylesheet" href="css/style_light_mode.css">

        <style>
            .orden2 {
                order: 2;
            }
            .orden1 {
                order: 1;
            }
        </style>
    </head>
    <body>
        <% String falloindex = (String) session.getAttribute("falloindex");
        %>
        <div>
            <input type="button" class="btnSwitchMode" id="cambiar_color" value="¡Cambiar a la versión Dark Mode!">
            
        </div>

        <section class="formularios">   
            <div class="transparent1">
                <form class="form1" id="formulario1" name='registro' action="controller" method="post">
                    <p id="create"> Crear una cuenta </p>
                    <input type="text" id="dni" name="dniRegistro" placeholder="DNI"/>
                    <input type="text" id="nombre" name="nombreRegistro" placeholder="Nombre"/>
                    <input type="text" id="apellidos" name="apellidosRegistro" placeholder="Apellidos"/>
                    <input type="password" id="password" name="passwordRegistro" placeholder="Contraseña"/>
                    <input type="text" id="email" name="emailRegistro" placeholder="email@gmail"/>
                    <input type="text" id="municipio" name="municipioRegistro" placeholder="Municipio"/>
                    <input type="text" id="telefono" name="telefonoRegistro" placeholder="Nº teléfono"/>
                    <% if (falloindex != null) {%>
                    <input type="text" id="fallo" style="color: red; font-size: 1em" value="<%=falloindex%>" readonly/>
                    <% }%>
                    <input id='btn1' type="submit" name="acceder" value="Registrarse"/>
                    <input type="hidden" id="estado_form1" name="estado" value="registro"/>
                </form>
            </div>
            <div class="transparent2">
                <form class="form2" id="formulario2" name='inicio' method="post">
                    <p id="acceder"> ¡Si ya estás registrado, inicia sesión aquí! </p>
                    <input id='btn2' type="button" name="registro" value="Acceder"/>
                    <input type="hidden" name="estado" value="menu"/>
                </form>
            </div>

        </section>

        <script>

            var transparent1 = document.getElementsByClassName("transparent1");
            var transparent2 = document.getElementsByClassName("transparent2");
            var acceder = document.getElementById("btn2");
            var contador = 0;

            acceder.addEventListener("click", (ev) => {
                transparent1[0].classList.add("orden2");
                transparent2[0].classList.add("orden1");
                document.getElementById("acceder").innerText = "¡Para registrarte haz click aquí!";
                document.getElementById("btn2").value = "Registrarse";
                document.getElementById("create").innerText = "Iniciar sesión";
                document.getElementById("nombre").hidden = "true";
                document.getElementById("apellidos").hidden = "true";
                document.getElementById("email").hidden = "true";
                document.getElementById("municipio").hidden = "true";
                document.getElementById("telefono").hidden = "true";
                if (document.getElementById("fallo")) {
                    document.getElementById("fallo").hidden = "true";
                }
                document.getElementById("dni").name = "dni";
                document.getElementById("password").name = "password";
                document.getElementById("btn1").value = "Acceder";
                document.getElementsByClassName("form2").action = "controller";
                document.getElementsByClassName("form1").action = "index.jsp";
                document.getElementById("estado_form1").value = "menu";
                if (contador > 0) {
                    document.getElementById("btn2").type = "submit";
                }
                contador++;

            });
            var cambiar_color = document.getElementById("cambiar_color");
            cambiar_color.addEventListener("click", (ev) => {

                if (cambiar_color.value == "¡Cambiar a la versión Light Mode!") {
                    changeCSS('css/style_light_mode.css', 0);
                    cambiar_color.value = "¡Cambiar a la versión Dark Mode!";
                } else {
                    changeCSS('css/style.css', 0);
                    cambiar_color.value = "¡Cambiar a la versión Light Mode!";
                }

            });

            function changeCSS(cssFile, cssLinkIndex) {

                var oldlink = document.getElementsByTagName("link").item(cssLinkIndex);

                var newlink = document.createElement("link");
                newlink.setAttribute("rel", "stylesheet");
                newlink.setAttribute("type", "text/css");
                newlink.setAttribute("href", cssFile);

                document.getElementsByTagName("head").item(cssLinkIndex).replaceChild(newlink, oldlink);
            }
        </script>
        <script src="js/swap_color.js"></script>
    </body>
</html>
