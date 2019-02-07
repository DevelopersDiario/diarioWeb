/**
 * Created by Administrador on 22/03/18.
 */
var spinner=true;

if (typeof jQuery !== 'undefined') {

        (function($) {
            $(document).ajaxStart(function() {
                if(spinner)
                $('#spinner').fadeIn();
            }).ajaxStop(function() {
                $('#spinner').fadeOut();

            });
        })(jQuery);

}

function removeActive (id, tipo, clase){
    $("#"+id+" "+tipo+" ").each(function (){
        $(this).removeClass(clase)
    })
}

function addActive (id, tipo, clase){
    $("#"+id+" "+tipo+" ").each(function (){
        $(this).addClass(clase)
    })
}

function soloLetras(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
    especiales = [8, 37, 39, 46];

    tecla_especial = false
    for(var i in especiales) {
        if(key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if(letras.indexOf(tecla) == -1 && !tecla_especial)

        return false;
};


 function aceptnumbers(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
        evt.preventDefault();;
    } else {
        return true;
    }
 };

//Validar el CP.
function validarCP(){
    //var cp=/(^([0-9]{5,5})|^)$/
    //Eliminamos la clase error asignada al elemento CP.
    document.getElementsByName("idcodigo").className="";
    var valor = document.getElementsByName("idcodigo").value;
    var patron = /(^([0-9]{5,5})|^)$/
    if (patron.test(document.getElementsByName("idcodigo").value) && (!isNaN(valor))){
        document.getElementsByName("idcodigo").className="success";
        return true;
    }else{
        //Situamos el foco en el campo idcodigo y le asignamos la clase error.
        alert("El código debe tener al menos 5 digitos.\n");
        document.getElementsByName("idcodigo").focus();
        document.getElementsByName("idcodigo").className="error";
        return false;
    }
}

///Funcion que permite filtrar un decimal despues de cantidades enteras se usa en validacion de medida de beneficiarios
   function filtrardecimal( evt , input ) {
       // Backspace = 8, Enter = 13, ‘0′ = 48, ‘9′ = 57, ‘.’ = 46, ‘-’ = 43
       var key = window.Event ? evt.which : evt.keyCode;
       var chark = String.fromCharCode(key);
       var tempValue = input.value+chark;
       if(key >= 48 && key <= 57){
           if(filter(tempValue)=== false){
               return false;
           }else{
               return true;
           }
       }else{
           if(key == 8 || key == 13 || key == 0) {
               return true;
           }else if(key != 46){
               console.log(key)
               if(filter(tempValue)=== false){
                   return false;
               }else{
                   return true;
               }
           }else{
               return false;
           }
       }
};
//funcion que realiza el filtro de . decimal
 function filter( __val__ ) {
     var preg = /^([0-9]+\.?[0-9]{0,1})$/;
     if(preg.test(__val__) === true){
         return true;
     }else{
         return false;
     }

};

function validateMail(email)
{
    var $result = $("#result");
    //Creamos un objeto
    object=document.getElementById(email);
    valueForm=object.value;

    // Patron para el correo
    var patron=/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(valueForm.search(patron)==0)
    {        //Mail correcto
        object.style.color="green";
        $result.text("");
        return true;
    }
    //Mail incorrecto
    $result.text(" No valido");
    object.style.color="#f00";


}

function shutdown(e){
    var title = "¿Esta seguro de cerrar la sesión actual?";
    $.post($('#urlconfig').data('url'), {}, function(response){
        if(response.expiro == false){
            var texto = "Recuerde que tiene hasta el día " + response.fechatermino + " para terminar su captura";
            cerrarsesion(title, texto);
        }else{
            cerrarsesion(title, "");
        }
    });
}

function cerrarsesion(title, texto){
    swal({
        title: title,
        text: texto,
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
        var url = $('.cerrarsesion').data('url');
        var url_root = $('#urlroot').data('url');
        $.ajax({
            url: url,
            method: "POST",
            success: function(data, textStatus, jqXHR) {
                window.location = url_root;
            },
            error: function(jqXHR, textStatus, errorThrown) {
                window.location = url_root;
                console.log("Logout error, textStatus: " + textStatus +
                    ", errorThrown: " + errorThrown);
            }
        });
    }
});
}

//Función para validar una CURP
function curpValida(curp) {
    var re = /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/,
        validado = curp.match(re);

    if (!validado)  //Coincide con el formato general?
        return false;

    //Validar que coincida el dígito verificador
    function digitoVerificador(curp17) {
        //Fuente https://consultas.curp.gob.mx/CurpSP/
        var diccionario  = "0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZ",
            lngSuma      = 0.0,
            lngDigito    = 0.0;
        for(var i=0; i<17; i++)
            lngSuma = lngSuma + diccionario.indexOf(curp17.charAt(i)) * (18 - i);
        lngDigito = 10 - lngSuma % 10;
        if (lngDigito == 10) return 0;
        return lngDigito;
    }

    if (validado[2] != digitoVerificador(validado[1]))
        return false;

    return true; //Validado
}


//Handler para el evento cuando cambia el input
//Lleva la CURP a mayúsculas para validarlo
function validarInput(input) {
    var curp = input.value.toUpperCase(),
        resultado = document.getElementById("resultado"),
        valido = "No válido";

    if (curpValida(curp)) { // ⬅️ Acá se comprueba
        valido = "Válido";
        resultado.classList.add("ok");
    } else {
        resultado.classList.remove("ok");
    }

    resultado.innerText = "CURP: " + curp + "\nFormato: " + valido;
}