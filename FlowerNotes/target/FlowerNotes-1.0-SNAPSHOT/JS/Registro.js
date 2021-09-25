const formularioRegistro = document.getElementById('RegistroUsuario'); //ACCEDEMOS AL FORMULARIO
const BTNSubmit = document.getElementById('btn_Registro'); //ACCEDEMOS AL BOTÓN SUBMIT
const inputs = document.querySelectorAll('#RegistroUsuario input'); //ACCEDEMOS A TODOS LOS INPUTS DEL REGISTRO

//-----------------------------------------
//VARIABLES PARA LOS ERRORES 
var FechaError = new Boolean (true);
var Pass1_Error = new Boolean (true);
 var Pass2_Error = new Boolean (true);

function Letra(e) { //FUNCIÓN PARA VALIDAR SÓLO LETRAS (NOMBRE Y APELLIDO)
    key = e.keyCode || e.which;  //Agarra el evento cuando presiono el teclado
    tecla = String.fromCharCode(key).toString();
    letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnopqrstuvwxyzáéíóúñÑ";

    especiales = [8, 13, 32, 164, 165];
    tecla_especial = false;
    for (var i in especiales) {
        if (key === especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if (letras.indexOf(tecla) === -1 && !tecla_especial) { //SI PONEMOS UN NÚMERO

        alert("Ingresar solo letras");

        return false;
    }
} 
//CONSEGUIMOS LA FECHA DE HOY-----------------------
var hoy = new Date();
var dd = hoy.getDate();
var mm = hoy.getMonth() + 1; //Enero es 0 
var yyyy = hoy.getFullYear();
if (dd < 10) {
    dd = '0' + dd;
}
if (mm < 10) {
    mm = '0' + mm;
}

hoy = yyyy + '-' + mm + '-' + dd;


function Fecha() {
     var FechaForm = document.getElementById("inputDate").value;
 
    if (FechaForm > hoy) {
       document.getElementById('FechaError').style.display = 'block';
       Pass2_Error = false;
    }
    else {
        document.getElementById('FechaError').style.display = 'none';
        Pass2_Error = true;
    }

    
}

function ContraseñaFuerte(password){
   	
    var MAYUS = false;
    var minus = false;
    var numero = false;
    var caracter_especial = false;
    
    for(var i = 0;i<password.length;i++){
        if(password.charCodeAt(i) >= 65 && password.charCodeAt(i) <= 90){
            MAYUS = true;
        }
        else{
            
        }
        if(password.charCodeAt(i) >= 97 && password.charCodeAt(i) <= 122)
        {
            minus = true;
           
        }
        else{
           
        }
        if(password.charCodeAt(i) >= 48 && password.charCodeAt(i) <= 57)
        {
            numero = true;
        }
        else
        {
            caracter_especial = true;
        }
    }
    if(MAYUS === true && minus === true && caracter_especial === true && numero === true){
        document.getElementById('ContraseñaError').style.display = 'none';
        Pass1_Error = true;
        return true;
        
    }
    else{
        document.getElementById('ContraseñaError').style.display = 'block';
        Pass1_Error = false;
    }

return false;
}
const ConfirmarContraseña = () => { //VALIDAR CONTRASEÑAS SI SON IGUALES
    const Pass1 = document.getElementById('inputPassword1');
    const Pass2 = document.getElementById('inputPassword2');
    if (Pass1.value !== Pass2.value) {

        document.getElementById('Contraseña2Error').style.display = 'block';
        ERRORCONTRA2 = true;
        
    }
    else {
        document.getElementById('Contraseña2Error').style.display = 'none';
        ERRORCONTRA2 = false;
       
    }
};

const validarFormulario = (e) => {
    switch (e.target.name) {//Identifica el name del INPUT
        case "inputDate":
            Fecha();
            break;
        case "inputPassword1":
            const password = document.getElementById('inputPassword1').value; //ACCEDEMOS AL INPUT CONTRASEÑA
            ContraseñaFuerte(password);
            ConfirmarContraseña();
            break;
        case "inputPassword2":
            ConfirmarContraseña();
            break;
    }

};
inputs.forEach((input) => { //POR CADA INPUT EJECUTA LA FUNCIÓN
    input.addEventListener('keyup', validarFormulario);//Cuando suelte la tecla se ejecuta
    input.addEventListener('blur', validarFormulario);//Cuando de click en otro lugar se ejecuta

});

formularioRegistro.addEventListener("submit", e=>{
     
  e.preventDefault();

  if (FechaError == true && Pass1_Error == true && Pass2_Error == true) {
    // Agregas la validación del «ReCaptcha».
    formularioRegistro.submit();
    alert("Te has registrado correctamente");
    formularioRegistro.reset();
    
    // Envías el formulario en caso de cumplir el «IF»
  } else {
    alert("Profavor ingrese los datos correctamente");  
  }
});