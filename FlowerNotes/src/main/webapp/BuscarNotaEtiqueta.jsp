<%-- 
    Document   : PaginaPrincipal
    Created on : 25-sep-2021, 14:18:10
    Author     : karen
--%>

<%@page import="com.mycompany.flowernotes.Model.Etiquetas"%>
<%@page import="com.mycompany.flowernotes.Model.Nota"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//Muestra las etiquetas
    List<Etiquetas> hashtags = (List<Etiquetas>) request.getAttribute("hashtags");
    //Notas paginadas en 10
    List<Nota> notes = (List<Nota>) request.getAttribute("Notas");
    //TODAS LAS NOTAS
    List<Nota> TotalNotes = (List<Nota>) request.getAttribute("TotalNotas");
   Object busqueda = request.getAttribute("navegacion");
    int CantidadNotas = 0;
    int paginacion = 1;
    int notas = 10;
    for (Nota no : TotalNotes) { //Sumara la cantidad de notas que hay
        CantidadNotas++;
        if (CantidadNotas >= notas) { //Si la nota sobre el limite de notas
            paginacion = paginacion + 1;//La paginación aumenta
            notas = notas + 10; //El limite de notas se suma a 10
        }
    }

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
        <title>Flower Notes</title>

    </head>

    <body>


        <nav class="navbar-fluid sticky-top navbar-expand-md  bgT">
            <div class="container-fluid">
                <div class="row text-start">
                    <div class="col-auto mt-2 ">
                        <%  if (session.getAttribute("username") != null) {%>
                        <img src="<%= session.getAttribute("Foto")%>" alt="" width="90" class="img-thumbnail  ">

                        <% } else {%>
                        <img src="img/LOGO.png" alt="" width="90" class="img-thumbnail  ">
                        <%}%>

                    </div>

                    <div class="col-auto  ms-auto mt-2 ">
                        <%  if (session.getAttribute("username") != null) {%>
                        <h2 class="fw-bold  text-white mt-2"><%= session.getAttribute("username")%></h2>

                        <% } else {%>
                        <h2 class="fw-bold  text-white mt-2"> Bienvenido </h2>
                        <%}%>


                    </div>


                    <div class="col-auto ms-auto mt-2 ">

                        <img src="img/LOGO.png" alt="" width="90">

                    </div>
                </div>



                </a>
                <div class="row" style="height: 90px;">
                    <div class="row">
                        <div class="col-auto ms-auto mt-2 ">

                            <button class="btn btn-danger"  onclick="location.href = 'Perfil'" type="submit">Perfil</button>
                        </div>
                        <div class="col-auto ms-auto mt-2 ">
                            <%  if (session.getAttribute("username") != null) {%>
                            <form action ="CerrarSesion" method ="POST">
                                <button class="btn btn-danger" type="submit">Cerrar Sesion</button> 
                            </form>


                            <% } else {%>
                            <button class="btn btn-danger" onclick="location.href = 'Login.jsp'" type="submit">Iniciar Sesion</button>
                            <%}%>

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



        <div class="container-fluid bg2 ">
            <div class="row  ">

                <div class="col  p-3 text-white  w-75 bg5 m-3 rounded-lg shadow ">
                    <%  if (session.getAttribute("username") != null) {%>

                    <div class="tab-content">
                        <div role="tabpanel">  
                            <%

                                if (notes != null) {

                                    for (Nota note : notes) {

                            %> 
                            <div class="card d-inline-flex m-3 " style="width: 15rem;">
                                <div class="card-body ">

                                    <h5 class="card-title text-dark"><%= note.getNota()%></h5>

                                    <a href="NotaEsp?id=<%= note.getId()%>" class="btn btn-primary m-2">Ir a la Nota</a><br>

                                </div>
                            </div>
                            <%}
                                }%>






                            <br>
                            <button  onclick="location.href = 'CrearNota'">
                                Crear Notas
                            </button>
                        </div>
                        <% } else {%>
                        <button>¿Quieres agregar tus propias notas? Registrate</button>
                        <%}%>
                    </div>




                </div>
            </div>
        </div>


       <div class="container-fluid bg p-3 ">
            <div class="row">
                <div class="col">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">  
                            <%  for (int limite = 1; limite <= paginacion; limite++) {%>   
                            <form action = "BuscarNotaHashtag?page=<%= limite%>" method = "POST" >
                                <input type="text" value="<%= busqueda%>" name="buscar" style="display: none">
                                <li >
                                    <button class="page-link" type="submit"> <%= limite%> </button>  

                                </li>
                            </form>
                            <%}%> 
                        </ul>
                    </nav>
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
