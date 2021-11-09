<%-- 
    Document   : Error
    Created on : 09-nov-2021, 15:02:11
    Author     : monic
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
    <title>Error 404</title>

</head>
<style>
      .error{
    align-items: center;
  
    background-color: #854399;
    padding: 40px 10px;
    box-shadow: linear-gradient(to right, #434343, #854399);
    border-radius: 10px;
  text-align: center;
  }
  
  button{
      
  font-family:Century Gothic;
  font-size: 50px;
  background: #fedcb9;
  border: none;
  height: 80px;
width: 20%;
  }
  img{
      margin-left: 380px;
  }
</style>
<body>
    <div class="error">
         <h1>Página Flower Notes no disponible</h1>
    <h1>La dirección que ingresaste NO existe</h1>
    <button class="btn btn-success"  onclick="location.href = 'Principal'" type="submit">Volver</button>
    </div> 
     <img src = "img/LOGO.png" width="500px" height="500px"></img> 
 
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
     crossorigin="anonymous"></script>
</body>
</html>
