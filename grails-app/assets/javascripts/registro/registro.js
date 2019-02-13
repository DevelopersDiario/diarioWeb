/**
 * Created by Benya on 1/02/19.
 */

Vue.use(VeeValidate);
var datos = new Vue({
    el: "#registro",
    data: {
        persona: {
            username: '',
            nombre: '',
            apPaterno: '',
            apMaterno: '',
            telefono: '',
            correo: '',

        }
    },
    methods: {
        savePersona: function () {

        },
    }
});

$(document).ready(function () {

});