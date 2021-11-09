<%-- 
    Document   : PerfilUsuario
    Created on : 30-sep-2021, 19:35:59
    Author     : karen
--%>

<%@page import="com.mycompany.flowernotes.Model.Etiquetas"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.flowernotes.Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) request.getAttribute("usuario");
//Muestra las etiquetas
    List<Etiquetas> hashtags = (List<Etiquetas>) request.getAttribute("hashtags");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" href="img/LOGO.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/Style.css">
        <title>Perfil de Usuario</title>


    </head>

    <body>
        <style>
            p{

                color: black;
            }

            b{
                color: #af8fc0;
            }
        </style>

        <nav class="navbar-fluid sticky-top navbar-expand-md  bgT" style="background-color: #af8fc0;">
            <div class="row">
                <div class="col-auto mt-2 ">

                    <img src="<%= session.getAttribute("Foto")%>" alt="" width="90" class="img-thumbnail  ">


                </div>

                <div class="col-auto  ms-auto mt-2 ">
                    <h2 class="fw-bold  text-white mt-2"> <%= session.getAttribute("username")%> </h2>

                </div>


                <div class="col-auto ms-auto mt-2 ">

                    <img src="img/LOGO.png" alt="" width="90">

                </div>
            </div>



        </a>
        <div class="row">
            <div class="col-auto ms-auto mt-2 ">

                <button class="btn btn-success"  onclick="location.href = 'Principal'" type="submit">Página Principal</button>
            </div>
            <div class="col-auto ms-auto mt-2 ">

                <form action ="CerrarSesion" method ="POST">
                    <button class="btn btn-danger" type="submit">Cerrar Sesion</button> 
                </form>
            </div>
            <div class="col mt-2">
                <form action = "BuscarNota" method = "POST">
                    <input type="text" class="form-control" name = "navegacion"id="Buscador" placeholder="Buscar">

                </form>
            </div>


            <div class="col-auto ms-auto mt-2 ">

                <button class="btn btn-info" type="submit">Busqueda Avanzada</button>
            </div>
        </div>



        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toogle navigation">


            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse  navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ">
                            <% for (Etiquetas etiqueta : hashtags) {%>
                            <li class="nav-item"><a class="nav-link" href="BuscarNotaHashtag?id=<%= etiqueta.getID()%>">#<%= etiqueta.getNombre()%></a></li>
                                <% }%>

                        </ul>



                    </div>



    </div>

</div>
</nav>



<div class="container-fluid bg2 ">
    <div class="row align-items-stretch">
        <div class="col p-3 text-white w-75 bg m-3 rounded shadow">

            <div class="col text-center  " style="background-color: white;">


                <img src="<%= user.getFoto()%>" alt="" width="300" class="img-thumbnail mx-auto d-block">

                <p class="fw-bold text-center mt-3"><b>Nombre Completo:</b> <%= user.getNombre()%> <%=user.getApellidos()%></p>
                <p class="fw-bold text-center mt-3"><b>Fecha de Nacimiento:</b> <%= user.getFechaNac()%></p>
                <p class="fw-bold text-center mt-3"><b>Correo: </b><%= user.getCorreo()%></p>
                <p class="fw-bold text-center mt-3"><b>Edad: </b> <%= user.getEdad()%></p>
                <p class="fw-bold text-center mt-3"><b>Nombre de usuario:</b> <%= user.getUsername()%></p>


                <button class="btn btn-success m-3"  onclick="location.href = 'EditarPerfil'" type="submit">Editar Perfil</button>


            </div>


        </div>



    </div>
</div>


<!--footer-->
<footer>
    <div class="contenedor-footer">
        <div class="content-foo">
            <h4>Teléfono</h4>
            <p>81167823423</p>
        </div>
        <div class="content-foo">
            <h4>Email</h4>
            <p>FlowerNotes@gmail.com</p>
        </div>
        <div class="content-foo">
            <h4>Locación</h4>
            <p>San Nicolás Ciudad Universitaria</p>
        </div>
        <div class="content-foo">
            <h4>Creado por</h4>
            <p>Karen Denisse Sánchez Santoscoy</p>
        </div>
    </div>
    <h2 class="Titulo-final">&copy; Flower Notes</h2>
</footer>










<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
crossorigin="anonymous"></script>
</body>

</html>
