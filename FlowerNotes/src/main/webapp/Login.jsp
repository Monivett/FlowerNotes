<%-- 
    Document   : Login
    Created on : 25-sep-2021, 12:50:56
    Author     : monic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <link rel="shortcut icon" href="img/LOGO.png" type="image/x-icon">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="CSS/InicioSesion_1.css">
  <title>Iniciar Sesión</title>
  <script type="text/javascript" src="JS/jquery-3.6.0.min.js"></script>


<body>
  <nav style="height:  60px;"  class="navbar-fluid sticky-top navbar-expand-md  bgT" >
    <div class="container-fluid">
      <div class="row">
        <div class="col-auto mt-2 ">

         <h1>Flower Notes</h1>


        </div>

      </div>

 
  



      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toogle navigation">


        <span class="navbar-toggler-icon"></span>

      </button>



    </div>

 
  </nav>
  <div class="container">
    <div class="row align-items-stretch">
      <div class="col d-none d-md-block col-xl-4 col-md-2 col-sm-1"></div>
      <div class="col m-2 text-white w-75 bg mt-5 rounded shadow">

        <h1 class="fw-bold text-center mt-5"> LOGIN </h1>
        <img src="img/LOGO.png" class=" mx-auto d-block" alt="" width="90">



        <!-- #login-->


        <form action="Login" method="POST" id="Form_Login">
          <div class="fw-bold mb-5 text-center">
            <h2>__________________</h2>
          </div>
          <div class="mb-4">
            <label for="username" class="form-label">Nombre de usuario</label>
            <input type="text" class="form-control" name="username">
          </div>

          <div class="mb-4">
            <label for="password" class="form-label"> Contraseña</label>
            <input type="password" class="form-control" name="password">
          </div>

          <p id="LoginError" style="display: none;">Favor de introducir datos correctos</p>


          <div class="d-grid p-5">
            <button class="btn-success"type="submit">Iniciar Sesión</button>
            <br>
            <br>
            <a class="a" onclick="location.href='Registro.jsp'">¿No tienes cuenta? Registrate</a>
          </div>

         
        </form>



      </div>
      <div class="col d-none d-md-block col-xl-4 col-md-2 col-sm-1"></div>
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

<script src="JS/InicioSesion_1.js"></script>
</body>


</html>