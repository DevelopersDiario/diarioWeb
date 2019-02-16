/**
 * Created by Benya on 14/02/19.
 */

Vue.use(VeeValidate);
var publicaciones = new Vue({
    el: "#publicaciones",
    data: {
        publicacion: {
            titulo: '',
            sentimiento: '',
            evaluacion: '',
            analisis: '',
            conclusion: '',
            planaccion: '',
            observaciones: '',
        },
    },
    methods: {
        savePublicacion: function () {

            if (publicaciones.publicacion.titulo == '') {
                swal("Debe escribir almenos el titulo de la publicación")
            }
            else {
                $.post("../publicacion/savePublicacion", publicaciones.publicacion, function (data) {
                    response = data
                    alert(data)
                }).error(function () {
                    toastr.error("Ha ocurrido un error", "Lo sentimos")

                })
            }
        },
    }
});
