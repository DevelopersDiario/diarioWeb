(function($) {
    $.fn.onlyletters = function() {
        // e.preventDefault();
        // e.stopPropagation();
        var obj = this;
        obj.keypress(function(obj){
            //alert(obj.charCode);
            if(obj.charCode ==241 || obj.charCode ==209){
                return true
            }
            else if((obj.charCode < 97 || obj.charCode > 122) && (obj.charCode < 65 || obj.charCode > 90) && (obj.charCode != 45) && (obj.charCode!=0) && (obj.charCode!=32) ){
                return false;
            }
        })
    }
    $.fn.lettersAndNumb = function() {
        // e.preventDefault();
        // e.stopPropagation();
        var obj = this;
        obj.keypress(function(obj){
            if(obj.charCode ==241 || obj.charCode ==209){
                return true
            }
            else if((obj.charCode < 97 || obj.charCode > 122) && (obj.charCode < 65 || obj.charCode > 90) && (obj.charCode != 45) && (obj.charCode!=0) && (obj.charCode!=32) && (obj.charCode < 48 || obj.charCode > 57) && (obj.charCode!=0) ){
                return false;
            }
        })
    }
    /**
     * funcion para solo numeros
     */
    $.fn.onlynumbers = function(){
        var obj = this
        obj.keypress(function(obj){
            if((obj.charCode < 48 || obj.charCode > 57) && (obj.charCode!=0))
                return false;
        }).on("contextmenu", function(e){e.preventDefault();})
    }
    $.fn.patterEmail = function(){
        var obj = this
        obj.change(function(){
            var email= obj.val()
            if(!email.match(/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/)){
                swal({title:"Correo incorrecto",
                    text:"Vuelve a intentar"
                });
                // obj.val('');
            }
        })
    }



}(jQuery));