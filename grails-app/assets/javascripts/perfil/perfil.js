/**
 * Created by Administrador on 20/03/18.
 */

Vue.use(VeeValidate);// Se importa el pluggin veeValidate para hacer validaciones al forulario
var totalporpagina = 10;

var usuario = new Vue({
    el: "#Usuario",
    data: {
        superusuario: '',
        list: [],
        roles: [],
        listSedes: [],
        newUser: {
            rol: "",
            nombre: "",
            appaterno: "",
            apmaterno: "",
            correo: "",
            puesto: "",
            telefono: "",
            sede: "",
            sedes: '',
            telefonocontacto: "",
            telefonoopcional: "",
            username: "",
            password: "",
            enabled: "",
            confirm: "",
        },
        editMode: false,
        requiredConfirm: false,
        listaestatus: [
            {label: 'Activo', estatus: true},
            {label: 'Inactivo', estatus: false}
        ],
        filtros: {
            busqueda: '',
            rol: '',
            offset: '',
            active: '',
            nombre: '',
            appaterno: '',
            apmaterno: '',
            sede: '',
        },
        listModalidades: '',
        listOrganizaciones: '',
        padresapf: '',
        directores: '',
        datos: {
            organizacionId: '',
            rolId: '',
            modalidadId: '',
        },

    },
    watch: {
        'newUser.password': function () {
            //valida si està creando o editando el usuario
            if (this.editMode) {
                if (this.newUser.password != '') {
                    this.requiredConfirm = true;
                } else this.requiredConfirm = false;
            }

        }
    },
    methods: {

        // funcion para obtener los datos del usuario
        getUser: function (id, dato, index) {
            this.editMode = true
            var response
            $.post("getUsuario", {id: id}, function (data) {
                response = data.usuarioInstance
            }).complete(function () {
                $("#titulo").empty().append(' Editar ' + dato)
                setTimeout(function () {
                    if (response.rol == 4) {
                        $("#sedes").chosen({allow_single_deselect: true}).change(function () {
                            usuario.newUser.sedes = $(this).val()
                        });
                    }
                }, 200)

                $('#sedes').multiselect();
                usuario.newUser = response


            }).error(function () {
                toastr.warning('Error ', '!Intente de nuevo');
            });
        },
        // funcion para actualizar el usuario
        updateUser: function () {
            var response
            var sedes = usuario.newUser.sedes;
            var lista = []
            $('#paginatiousuario').twbsPagination('destroy')
            //verificacmos que la lista de sedes sea diferente de null, solo entonces se recorre
            if (usuario.newUser.sedes != null) {
                sedes.forEach(function (sede) {
                    lista.push(parseInt(sede))
                });
                this.newUser.sedes = lista;
            }
            if (!this.newUser.username) {
                toastr.error('Nombre de usuario obligatorio', 'Error');
                $("#usuario").focus()
                return
            }
            //con stringify parseamos las sedes a formato JSON
            this.newUser.sedes = JSON.stringify(this.newUser.sedes)
            //se procede a ejecutar la peticion al servidor.
            $.post("update", this.newUser, function (data) {
                response = data
            }).complete(function (inf) {
                console.log(inf)
                if (response.success) {
                    usuario.reset()
                    toastr.success(response.message, response.type);
                    $('#modalUsuario').modal('toggle');
                } else {
                    toastr.error(response.message, response.type);
                }

            }).error(function () {
                toastr.warning('Error al actualizar usuario', '!Intente de nuevo');
            });
        },
        //funcion para activar chosen multiple
        rolselected: function (rol) {
            if (rol == 4) {
                setTimeout(function () {
                    $("#sedes").chosen({allow_single_deselect: true}).change(function () {
                        usuario.newUser.sedes = $(this).val()
                    });
                })

            } else {
                setTimeout(function () {
                    $("#sede").chosen({allow_single_deselect: true}).change(function () {
                        usuario.newUser.sede = $(this).val()
                    });
                })
            }
        },
        //Metodo para evaluar el selector de roles en el modal de restaurar contraseñas de usuarios
        selectRol: function () {
            usuario.datos.modalidadId = '';
            usuario.datos.organizacionId = '';
            usuario.padresapf = '';
            usuario.directores = '';
        },
        restaurar: function () {
            var datos = Object.assign({}, usuario.datos, {
                padresApf: usuario.padresapf == true ? padresApf = true : padresApf = false,
                directores: usuario.directores == true ? directores = true : directores = false
            });
            swal({
                title: "¿Está seguro de restaurar las contraseñas a los usuarios?",
                text: usuario.datos.rolId == 5 ? "Recuerda que en este proceso, el sitema asignará la contraseña (temporal) a todos los directores que complan con los requisitos seleccionados "
                    : "Recuerda que en este proceso, el sitema asignará la contraseña (temporal) a los usuarios con el rol antes seleccionado ",
                icon: "warning", buttons: true, dangerMode: true,
            }).then((willDelete) = > {
                if(willDelete) {
                    $.post("resetPasswordCustom", datos, function (response) {
                        if (response.success) {
                            toastr.success(response.message, response.type);

                        } else {
                            toastr.error(response.message, response.type);
                        }
                    }).complete(function () {
                        $('#resetPassword').modal('toggle');
                    });
                } else{
                    swal.close();
        }
        })
            ;
        },
        // funcion para crear nuevo usuario
        saveUser: function () {
            var sedes = usuario.newUser.sedes;
            var lista = []
            if (usuario.newUser.sedes != null) {
                sedes.forEach(function (sede) {
                    lista.push(parseInt(sede))
                });
                this.newUser.sedes = lista;
            }
            this.newUser.sede = parseInt(usuario.newUser.sede);

            var response
            rol
            if (!this.newUser.rol) {
                toastr.error('Es necesario seleccionar un rol.', 'Error');
                $("#rol").focus()
                return
            }
            if (!this.newUser.nombre) {
                toastr.error('Nombre de usuario obligatorio', 'Error');
                $("#nombre").focus()
                return
            }
            if (!this.newUser.username) {
                toastr.error('Cuenta de usuario obligatorio', 'Error');
                $("#username").focus()
                return
            }
            if (!this.newUser.password) {
                toastr.error('La contraseña es obligatorio', 'Error');
                $("#password").focus()
                return
            }
            this.newUser.sedes = JSON.stringify(this.newUser.sedes)
            $.post("save", this.newUser, function (data) {
                response = data
            }).complete(function () {
                if (response.success) {
                    toastr.success(response.message, response.type);
                    $('#modalUsuario').modal('toggle');
                } else {
                    toastr.error(response.message, response.type);
                }
            }).error(function () {
                toastr.warning('Error al crear usuario', '!Intente de nuevo');
            });
        },
        // funcion para limpiar el formulario
        reset: function () {
            this.newUser = {
                nombre: '',
                password: '',
                enabled: '',
                confirm: '',
            }
            $("#titulo").empty().append(' Nuevo Usuario ')
        },

        search: function () {
            var paginas;
            var params = {
                offset: 0
            }
            $('#paginatiousuario').twbsPagination('destroy');
            $.post("list", usuario.filtros, function (response) {
                if (response.total > 0) {
                    paginas = (response.total % totalporpagina) > 0 ? (response.total / totalporpagina) + 1 : (response.total / totalporpagina)
                    usuario.list = response.list;
                    usuario.listModalidades = response.modalidades;
                    usuario.listOrganizaciones = response.organizaciones;
                    usuario.roles = response.roles;
                    usuario.superusuario = response.superusuario;
                    usuario.listSedes = response.sedes;

                } else {
                    swal("Oops!, Al parecer el usuario que buscas no se encuentra en nuestros registros!", {
                        icon: "success"
                    });
                }
            }).done(function () {
                $('#paginatiousuario').twbsPagination({
                    itemOnPage: totalporpagina,
                    currentPage: 1,
                    first: "Primero",
                    totalPages: paginas,
                    visiblePages: 10,
                    onPageClick: function (event, page) {

                    }
                }).on('page', function (event, page) {
                    var offset = ((page - 1) * totalporpagina)
                    params.offset = offset
                    usuario.filtros.offset = params.offset
                    $.post("list", usuario.filtros, function (data) {
                        usuario.list = data.list;
                        usuario.roles = data.roles;

                    })
                });
            });
        },


    }
});


usuario.search();

$(document).ready(function () {


});
