<%-- 
    Document   : Registro
    Created on : 25-sep-2021, 12:24:54
    Author     : karen
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
  <link rel="stylesheet" href="CSS/Registro.css">
  <title>Registro</title>
  <script type="text/javascript" src="JS/jquery-3.6.0.min.js"></script>  
</head>

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
  <div class="container-fluid body ">
    <div class="row align-items-stretch">
      <div class="col d-none d-md-block col-xl-3 col-md-2 col-sm-1"></div>
      <div class="col m-2 text-white w-75 bg2 mt-3 rounded shadow">

        <h1 class="fw-bold text-center mt-5"> Registrarse </h1>
        <img src="img/LOGO.png" class="m-3 mx-auto d-block" alt="" width="90">



        <!-- #login-->

        <form action="Registrar" method="POST" id="RegistroUsuario" enctype="multipart/form-data">
          <div class="form-row">
            <div class="form-group mt-2">
              <label for="inputName">Nombre</label>
              <input type="text" class="form-control"  onkeypress="return Letra(event);" name = "inputName" id="inputName" required>
            </div>
            <div class="form-group mt-2">
              <label for="inputApellido">Apellido</label>
              <input type="text" class="form-control" onkeypress="return Letra(event);" name = "inputApellido" id="inputApellido" required>
            </div>
            <div class="form-group col-md-6 mt-2">
              <label for="inputEmail">Email</label>
              <input type="email" class="form-control" name = "inputEmail" id="inputEmail" placeholder="Email" required>
            </div>
            <div class="form-group col-md-6 mt-2">
              <label for="inputPassword1">Contraseña</label>
              <input type="password"  minlength="8" class="form-control" name="inputPassword1" id="inputPassword1" placeholder="Password" required>
              <p id="ContraseñaError" style="display: none;">Favor de introducir una contraseña válida</p>
            </div>
            <div class="form-group col-md-6 mt-2">
              <label for="inputPassword2">Confirmar Contraseña</label>
              <input type="password"  minlength="8" class="form-control" name="inputPassword2"id="inputPassword2" placeholder="Password"required>
              <p id="Contraseña2Error" style="display: none;">Favor de introducir la contraseña igual</p>
            </div>
          </div>
          <div class="form-group mt-2">
            <label for="inputUsername">Nombre de Usuario</label>
            <input type="text" class="form-control" name="inputUsername" id="inputUsername" required>
          </div>

          <div class="form-group mt-2">
            <label for="inputDate">Fecha de Nacimiento</label>
            <input type="date" class="form-control" name="inputDate" id="inputDate"required>
            <p id="FechaError" style="display: none;">Favor de elegir una fecha antes de la actual</p>
          </div>

          <div class="form-group mt-3">
            <label for="exampleFormControlFile1">Imagen de Perfil</label><br>
            <input type="file" class="form-control-file" name= "inputFoto"id="exampleFormControlFile1" required>
          </div>




          <div class="d-grid py-3 m-3">
            <button type="submit" id="btn_Registro"style="background-color: rgb(158, 40, 158);">Registrarse</button>
            
          </div>
        </form>
        <a href = 'Login.jsp'">Iniciar Sesión</a>
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
