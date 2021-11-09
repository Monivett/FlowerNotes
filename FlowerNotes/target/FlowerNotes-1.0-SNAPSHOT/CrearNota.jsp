<%-- 
    Document   : CrearNota
    Created on : 29-sep-2021, 19:43:23
    Author     : karen
--%>

<%@page import="com.mycompany.flowernotes.Model.Etiquetas"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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
        <title>Crear Notas</title>
        <link rel="stylesheet" href="CSS/Style.css">
    </head>

    <body>

        <style>
            .multiselect {
                width: 200px;
                margin-left: 300px;
            }

            .selectBox {
                position: relative;
            }

            .selectBox select {
                width: 100%;
                font-weight: bold;
            }

            .overSelect {
                position: absolute;
                left: 0;
                right: 0;
                top: 0;
                bottom: 0;
            }

            #checkboxes {
                display: none;
                border: 1px #911f87 solid;
            }

            #checkboxes label {
                display: block;
            }

            #checkboxes label:hover {
                background-color: #c578d8;
            }



        </style>

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



                </a>
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
                            <input type="text" class="form-control" id="Buscador" placeholder="Buscar">
                        </div>
                        <div class="col-auto mt-2">
                            <button class="btn btn-success " type="submit">Buscar</button>

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




        <div class="container-fluid bg2 ">
            <div class="row align-items-stretch"> 
                <form action ="CrearNota" class="form-inline" method="POST">
                    <div class="col p-3 text-white text-center w-75 bg m-3 rounded shadow">

                        <h2>Creacion de Nota </h2>
                        <label for="exampleFormControlTextarea1 m-">Contenido de Nota</label>




                        <div class="multiselect custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                            <div class="selectBox" onclick="showCheckboxes()">

                                <select >
                                    <option>Etiquetas</option>
                                </select>
                                <div class="overSelect"></div>
                            </div>
                            <div id="checkboxes" >
                                <% for (Etiquetas etiqueta : hashtags) {%>
                                <label for="<%= etiqueta.getID()%>"  style="text-align: left;">
                                    <input type="checkbox" name="hashtags<%= etiqueta.getID()%>" value="<%= etiqueta.getID()%>" id="<%= etiqueta.getID()%>" /><%= etiqueta.getNombre()%></label>
                                    <%}%>

                            </div>
                        </div>
                        <script>
                            var expanded = false;

                            function showCheckboxes() {
                                var checkboxes = document.getElementById("checkboxes");
                                if (!expanded) {
                                    checkboxes.style.display = "block";
                                    expanded = true;
                                } else {
                                    checkboxes.style.display = "none";
                                    expanded = false;
                                }
                            }
                        </script>



                        <div class="form-group">

                            <input class="form-control rounded-0" name="inputNota"id="exampleFormControlTextarea1" rows="20" style="height: 200px;"></input>
                        </div>


                        <button class="btn btn-success m-3 p-5" type="submit">Guardar Nota </button> <br>

                    </div>


                </form>
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