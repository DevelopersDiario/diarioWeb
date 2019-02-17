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
        listPublicaciones: [
            {
                id: 1,
                titulo: 'Prueba de Publicación',
                sentimiento: 'El día de hoy se realizan Las primeras pruebas de publicaciones, ' +
                    'se tiene contemplado mostrar de forma dinamica todas las publicaciones',
                evaluacion: 'Se tiene proyectado alojar imagenes, archivos, y videos',
                analisis: '',
                conclusion: '',
                planaccion: '',
                observaciones: '',
            },
            {
                id: 2,
                titulo: 'Publicación 2',
                sentimiento: 'Se tendra contemplado mejorar todo el diseno, ' +
                    'y estructura de la nueva version del proyecto',
                evaluacion: 'Se tiene proyectado alojar imagenes, archivos, y videos',
                analisis: '',
                conclusion: '',
                planaccion: '',
                observaciones: '',
            },

        ]

        ,
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

        removePublic: function (benef, index) {
            swal({
                title: "¿Esta seguro de eliminar la publicacón?",
                text: "",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            }).then((willDelete) = > {
                if(willDelete) {
                    spinner = true;
                    publicaciones.listPublicaciones.splice(index, 1)

                }
            }
        )
            ;
        },

    },

});
