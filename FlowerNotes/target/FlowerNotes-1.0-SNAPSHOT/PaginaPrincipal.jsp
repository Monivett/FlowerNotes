<%-- 
    Document   : PaginaPrincipal
    Created on : 25-sep-2021, 14:18:10
    Author     : karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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

                            <button class="btn btn-danger"  onclick="location.href = 'PerfilUsuario.html'" type="submit">Perfil</button>
                        </div>
                        <div class="col-auto ms-auto mt-2 ">
                            <%  if (session.getAttribute("username") != null) {%>
                            <button class="btn btn-danger" type="submit">Cerrar Sesion</button>

                            <% } else {%>
                            <button class="btn btn-danger" onclick="location.href = 'Login.jsp'" type="submit">Iniciar Sesion</button>
                            <%}%>

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




                </div>

            </div>
        </nav>



        <div class="container-fluid bg2 ">
            <div class="row  ">

                <div class="col  p-3 text-white  w-75 bg5 m-3 rounded-lg shadow ">
                    <%  if (session.getAttribute("username") != null) {%>

                    <div class="tab-content">
                        <div role="tabpanel">
                            <div class="card d-inline-flex m-3 " style="width: 15rem;">
                                <div class="card-body ">

                                    <h5 class="card-title text-dark"> Titulo Nota </h5>
                                    <p class="card-text text-dark"> Hashtag </p>
                                    <a href="#" class="btn btn-primary m-2">Ir a la Nota</a><br>

                                </div>
                            </div>
                            <div class="card d-inline-flex m-3 " style="width: 15rem;">
                                <div class="card-body ">

                                    <h5 class="card-title text-dark"> Titulo Nota </h5>
                                    <p class="card-text text-dark"> Hashtag </p>
                                    <a href="#" class="btn btn-primary m-2">Ir a la Nota</a><br>

                                </div>
                            </div>

                            <div class="card d-inline-flex m-3 " style="width: 15rem;">
                                <div class="card-body ">

                                    <h5 class="card-title text-dark"> Titulo Nota </h5>
                                    <p class="card-text text-dark"> Hashtag </p>
                                    <a href="#" class="btn btn-primary m-2">Ir a la Nota</a><br>

                                </div>
                            </div>

                            <div class="card d-inline-flex m-3 " style="width: 15rem;">
                                <div class="card-body ">

                                    <h5 class="card-title text-dark"> Titulo Nota </h5>
                                    <p class="card-text text-dark"> Hashtag </p>
                                    <a href="#" class="btn btn-primary m-2">Ir a la Nota</a><br>

                                </div>
                            </div>

                            <div class="card d-inline-flex m-3 " style="width: 15rem;">
                                <div class="card-body ">

                                    <h5 class="card-title text-dark"> Titulo Nota </h5>
                                    <p class="card-text text-dark"> Hashtag </p>
                                    <a href="#" class="btn btn-primary m-2">Ir a la Nota</a><br>

                                </div>
                            </div>

                            <div class="card d-inline-flex m-3 " style="width: 15rem;">
                                <div class="card-body ">

                                    <h5 class="card-title text-dark"> Titulo Nota </h5>
                                    <p class="card-text text-dark"> Hashtag </p>
                                    <a href="#" class="btn btn-primary m-2">Ir a la Nota</a><br>

                                </div>
                            </div>
                            <div class="card d-inline-flex m-3 " style="width: 15rem;">
                                <div class="card-body ">

                                    <h5 class="card-title text-dark"> Titulo Nota </h5>
                                    <p class="card-text text-dark"> Hashtag </p>
                                    <a href="#" class="btn btn-primary m-2">Ir a la Nota</a><br>

                                </div>
                            </div>

                            <br>
                            <button>
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


        <div class="container-fluid bg p-3 mb-2">
            <div class="row">
                <div class="col">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ">
                                <a class="page-link" href="#" tabindex="-1">&laquo;</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">&raquo;</a>
                            </li>
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
