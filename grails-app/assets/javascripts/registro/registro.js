/**
 * Created by Benya on 1/02/19.
 */

Vue.use(VeeValidate);
var registro = new Vue({
    el: "#register",
    data: {
        user: {
            username: '',
            password: '',
            confirm: ''
        }
    },
    methods: {
        saveUsuario: function () {

            if (registro.user.password != registro.user.confirm) {
                swal("Las contraseñas no coinciden")
            }
            else {
                $.post("../usuario/save", registro.user, function (data) {
                    response = data
                    alert(data)
                }).done(function () {
                    toastr("Registro Exitoso", "Success")

                }).error(function () {
                    toastr("Ha ocurrido un error", "Lo sentimos")

                })
            }
        },
    }
});
