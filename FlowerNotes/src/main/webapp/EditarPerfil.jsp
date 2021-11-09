<%-- 
    Document   : EditarPerfil
    Created on : 30-sep-2021, 20:53:42
    Author     : monic
--%>

<%@page import="com.mycompany.flowernotes.Model.Etiquetas"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.flowernotes.Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) request.getAttribute("usuario");
//Muestra las etiquetas
    List<Etiquetas> hashtags = (List<Etiquetas>) request.getAttribute("hashtags");%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" href="img/LOGO.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/Registro.css">
        <title>Editar Perfil</title>
        <script type="text/javascript" src="JS/jquery-3.6.0.min.js"></script>  
    </head>

    <body>


        <nav class="navbar-fluid sticky-top navbar-expand-md  bgT">
            <div class="container-fluid">
                <div class="row text-start">
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

                <div class="row" style="height: 90px;">
                    <div class="row">
                        <div class="col-auto ms-auto mt-2 ">

                            <button class="btn btn-danger"  onclick="location.href = 'PerfilUsuario.html'" type="submit">Perfil</button>
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



                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toogle navigation">


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
        <div class="container-fluid body ">
            <div class="row align-items-stretch">
                <div class="col d-none d-md-block col-xl-3 col-md-2 col-sm-1"></div>
                <div class="col m-2 text-white w-75 bg2 mt-3 rounded shadow">

                    <h1 class="fw-bold text-center mt-5"> Editar Perfil </h1>
                    <img src="img/LOGO.png" class="m-3 mx-auto d-block" alt="" width="90">



                    <!-- #login-->

                    <form action="EditarPerfil" method="POST" id="RegistroUsuario" enctype="multipart/form-data">
                        <div class="form-row">
                            <div class="form-group mt-2">
                                <label for="inputAddress">Nombre</label>
                                <input type="text" class="form-control"   name="inputName" value="<%= user.getNombre()%>"onkeypress="return Letra(event);" id="inputAddress" required>
                            </div>
                            <div class="form-group mt-2">
                                <label for="inputAddress">Apellido</label>
                                <input type="text" class="form-control"  name="inputApellido" value="<%= user.getApellidos()%>" onkeypress="return Letra(event);" id="inputAddress" required>
                            </div>
                            <div class="form-group col-md-6 mt-2">
                                <label for="inputEmail">Email</label>
                                <input type="email" class="form-control"   name="inputEmail" value="<%= user.getCorreo()%>"id="inputEmail" placeholder="Email" required>
                            </div>
                            <div class="form-group col-md-6 mt-2">
                                <label for="inputPassword1">Contraseña</label>
                                <input type="password"  minlength="8" class="form-control"  value="<%= user.getContraseña()%>" name="inputPassword1" id="inputPassword1" placeholder="Password" required>
                                <p id="ContraseñaError" style="display: none;">Favor de introducir una contraseña válida</p>
                            </div>
                            <div class="form-group col-md-6 mt-2">
                                <label for="inputPassword2">Confirmar Contraseña</label>
                                <input type="password"  minlength="8" class="form-control"  value="<%= user.getContraseña()%>" name="inputPassword2"id="inputPassword2" placeholder="Password"required>
                                <p id="Contraseña2Error" style="display: none;">Favor de introducir la contraseña igual</p>
                            </div>
                        </div>

                        <div class="form-group mt-2">
                            <label for="inputAddress">Fecha de Nacimiento</label>
                            <input type="date" class="form-control"  value="<%= user.getFechaNac()%>" name="inputDate" id="inputDate"required>
                            <p id="FechaError" style="display: none;">Favor de elegir una fecha antes de la actual</p>
                        </div>

                        <div class="form-group mt-3">
                            <label for="exampleFormControlFile1">Imagen de Perfil</label><br>
                            <input type="file" name="inputFoto"class="form-control-file" id="exampleFormControlFile1" required>
                        </div>




                        <div class="d-grid py-3 m-3">
                            <button class="btn btn-success"  type="submit" id="btn_Registro">Editar</button>
                        </div>
                    </form>
                </div>
                <div class="col d-none d-md-block col-xl-4 col-md-1 col-sm-1"></div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
        crossorigin="anonymous"></script>


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
        <script src="JS/Registro.js"></script>
    </body>

</html>