<%-- 
    Document   : NotaEsp
    Created on : 30-sep-2021, 15:26:10
    Author     : karen
--%>

<%@page import="com.mycompany.flowernotes.Model.Etiquetas"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.flowernotes.Model.Nota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Nota note = (Nota) request.getAttribute("Nota");
    List<Etiquetas> hashtag = (List<Etiquetas>) request.getAttribute("EtiquetaNota");
    List<Etiquetas> etiquetas = (List<Etiquetas>) request.getAttribute("hashtags");
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
        <title>Página Nota</title>


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
        <nav class="navbar-fluid sticky-top navbar-expand-md  bgT" style="height: 200px;" >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-auto mt-2 ">

                        <img src="<%= session.getAttribute("Foto")%>" alt="" width="90" class="img-thumbnail  ">


                    </div>

                    <div class="col-auto  ms-auto mt-2 ">
                        <h2 class="fw-bold  text-white mt-2"><%= session.getAttribute("username")%></h2>

                    </div>


                    <div class="col-auto ms-auto mt-2 ">

                        <img src="img/LOGO.png" alt="" width="90">

                    </div>
                </div>



                </a>
                <div class="row">
                    <div class="col-auto ms-auto mt-2 ">

                            <form action ="CerrarSesion" method ="POST">
                                 <button class="btn btn-danger" type="submit">Cerrar Sesion</button> 
                            </form>
                    </div>
                    <div class="col-auto ms-auto mt-2 ">

                        <button class="btn btn-danger"  onclick="location.href = 'Principal'" type="submit">Pagina Principal</button>
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



                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toogle navigation">


                    <span class="navbar-toggler-icon"></span>

                </button>

      <div class="collapse  navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ">
                            <% for (Etiquetas etiqueta : etiquetas) {%>
                            <li class="nav-item"><a class="nav-link" href="BuscarNotaHashtag?id=<%= etiqueta.getID()%>">#<%= etiqueta.getNombre()%></a></li>
                                <% }%>

                        </ul>



                    </div>


            </div>

        </div>
    </nav>



    <div class="container-fluid bg2 ">
        <div class="row align-items-stretch"> 
            <form action ="EditarNota" class="form-inline" method="POST">
                <div class="col p-3 text-white text-center w-75 bg m-3 rounded shadow">
                    <h1>Nota</h1>
                    <h2><%= note.getNota()%></h2>


                    <%

                        if (hashtag != null) {%>
                    <label for="exampleFormControlTextarea1 m-"><b>Etiquetas:</b> 
                        <% for (Etiquetas hash : hashtag) {%> 
                        #<%= hash.getNombre()%>
                        <%}
                            }%>
                    </label>
                    <br>
                    <label for="exampleFormControlTextarea1 m-"><b>Fecha de Creación:</b> <%= note.getFecha()%>
                    </label>
                    <input type="hidden" name="ID" id="ID" value="<%= note.getId()%>" >   
                    <br>
                    <div class="form-group">
                        <div class="content-foo">
                            <h4> </h4>

                        </div>

                        <h1>Editar Nota</h1>
                        <input class="form-control rounded-0" name="inputNota"id="exampleFormControlTextarea1" rows="20" style="height: 200px;" value="<%= note.getNota()%>"></input>
                    </div>

                    <div class="multiselect custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                        <div class="selectBox" onclick="showCheckboxes()">

                            <select >
                                <option>Etiquetas</option>
                            </select>
                            <div class="overSelect"></div>
                        </div>
                        <div id="checkboxes" >
                            <% for (Etiquetas etiqueta : etiquetas) {%>
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
                    <button class="btn btn-success m-3 p-5" type="submit">Editar Nota </button> <br>

                </div>


            </form>
            <form action="BorrarNota" method="POST" " >
                <input type="hidden" name="ID" id="ID" value="<%= note.getId()%>" >   
                <input type="hidden" name="bool" id="bool" value="false" >   
                <script>

                    function alerta2() { //Alerta para el botón de borrar

                        var opcion = confirm("¿Está seguro de que quiere eliminar esta nota?");
                        if (opcion === true) {

                            document.getElementById("bool").value = "true";

                        } else {
                            document.getElementById("bool").value = "false";
                        }
                    }
                    ;
                </script>
                <button class="btn btn-danger m-3 p-5" onclick="alerta2()" type="submit">Borrar Nota</button>
            </form> 
        </div> 

    </div>


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
