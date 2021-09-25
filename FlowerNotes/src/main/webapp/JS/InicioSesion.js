
$(document).ready(function () {
    $("#Form_Login").submit(function (event) {
        event.preventDefault(); //prevenimos  que se ejecute otra accion del form
        $.ajax({
          
            data: $(this).serialize(),
            type: "POST", //METODO DEL FORMULARIO
            dataType: "json",
            url: "Login" 
        }).done(function (data, textEstado, jqXHR) {
            console.log("la solicitud se ha compleado correctamente");
            console.log(data);
            if (data.Respuesta) {
                
               location.href = "PaginaPrincipal.jsp"; //TE MANDA AL CONTROLADOR
            } else {
                 document.getElementById('LoginError').style.display = 'block'; 
            }
        }).fail(function (jqXHR, textEstado) {
            console.log("la solicitud fallos porque: " + textEstado);
        });
    });

});