/**
 * Created by Benya on 09/02/19.
 */

Vue.use(VeeValidate);
var datos = new Vue({
    el: "#dashboard",
    data: {
        usuario: {
            nombre: '',
            apPaterno: '',
            apMaterno: ''
        }
    },
    methods: {

        getDatos: function () {
            $.post("dashboard/getDatos", {}, function (response) {
                datos.usuario = response
            });
        },
        download: function (formato) {
            var data = new FormData();
            data.append('formato', formato);
            var descarga_url = $("input[name='urldescarga']").val();
            var xhr = new XMLHttpRequest();
            xhr.open('POST', descarga_url, true);
            xhr.responseType = 'blob';
            xhr.onload = function (e) {
                if (this.status == 200) {
                    var blob = this.response;
                    var file_name = xhr.getResponseHeader('X-File-Name');
                    var link = document.createElement('a');
                    link.href = window.URL.createObjectURL(blob);
                    link.download = file_name;
                    document.body.appendChild(link);
                    link.click();
                }
            };
            xhr.send(data);
        }
    }
});

$(document).ready(function () {
    datos.getDatos();
});