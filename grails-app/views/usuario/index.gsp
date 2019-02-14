<%--
  Created by IntelliJ IDEA.
  User: benyamin
  Date: 13/02/2019
  Time: 10:27 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<asset:stylesheet type="text/css" src="css/bootstrap.css"/>

<asset:stylesheet type="text/css"
                  src="css/wonder/one-page-wonder.min.css"/> <!--Wonder es el template principal del main-->
%{--<asset:stylesheet type="text/css" src="css/bootstrapmdb/mdb.min.css"/>--}%
<asset:stylesheet type="text/css" src="css/colors/gradient.css"/>
%{--<asset:stylesheet type="text/css" src="css/main.css"/>--}%
<asset:stylesheet type="text/css" src="css/chossen/component-chosen.css"/>
<asset:stylesheet type="text/css" src="css/chossen/component-chosen.min.css"/>
<asset:stylesheet type="text/css" src="css/bootstrap.min.css"/>
<asset:stylesheet type="text/css" src="css/dataTables.min.css"/>
<asset:stylesheet type="text/css" src="css/slicknav.css"/>
<asset:stylesheet type="text/css" src="css/color-switcher.css"/>
<asset:stylesheet type="text/css" src="css/responsive.css"/>
<asset:stylesheet type="text/css" src="fonts/font-awesome/css/fontawesome-all.min.css"/>
<asset:stylesheet type="text/css" src="fonts/simple-line-icons.css"/>
<asset:stylesheet type="text/css" src="extras/owl/owl.carousel.css"/>
<asset:stylesheet type="text/css" src="extras/owl/owl.theme.css"/>
<asset:stylesheet type="text/css" src="extras/animate.css"/>
<asset:stylesheet type="text/css" src="extras/normalize.css"/>
<asset:stylesheet type="text/css" src="extras/settings.css"/>
<asset:stylesheet type="text/css" src="css/colors/green.css"/>
<asset:stylesheet type="text/css" src="css/toastr.min.css"/>
<asset:stylesheet type="text/css" src="css/icons/fas-fa.css"/>
%{--<asset:stylesheet type="text/css" src="css/menumobile-multinivel/component.css"/>--}%
<asset:stylesheet type="text/css" src="css/app.css"/>
%{--<asset:stylesheet type="text/css" src="css/vuetify/vuetify.min.css"/>--}%
<asset:javascript src="plugins/jquery-min.js"/>
%{--<asset:javascript src="plugins/jquery3.2.1.min.js"/>--}%
<asset:javascript src="plugins/bootstrapmdb/popper.min.js"/>
<asset:javascript src="plugins/bootstrapmdb/bootstrap.js"/>
<asset:javascript src="plugins/color-switcher.js"/>
<asset:javascript src="plugins/jquery.mixitup.js"/>

<%-- <asset:javascript src="plugins/waypoints.min.js"/>  --%>
<asset:javascript src="plugins/jquery.counterup.min.js"/>
<asset:javascript src="plugins/jquery.slicknav.js"/>
<asset:javascript src="plugins/jquery.appear.js"/>
<asset:javascript src="plugins/jquery.vide.js"/>
<asset:javascript src="plugins/main.js"/>
<asset:javascript src="plugins/toastr.min.js"/>
<asset:javascript src="plugins/vue.js"/>
<asset:javascript src="plugins/vee-validate.js"/>
<asset:javascript src="plugins/mobile-multinivel/jquery.dlmenu.js"/>
<asset:javascript src="plugins/mobile-multinivel/modernizr.custom.js"/>
<asset:javascript src="plugins/moment.js"/>
<asset:javascript src="plugins/jquery.twbsPagination.js"/>
<asset:javascript src="plugins/sweet-alert/assets/sweetalert/sweetalert.min.js"/>


<header class="masthead text-center text-white">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
        <div class="container">
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="login">Cancelar Registro</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    </nav>

    <div id="register" class="container col-md-3 align-content-center" style="margin-top: 80px">
        <form>
            <div class="input-group form-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control" v-model="user.username"
                       placeholder="Correo">
            </div>

            <div class="input-group form-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" class="form-control" id="password2" v-model="user.password"
                       placeholder="Contraseña">
            </div>

            <div class="input-group form-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" class="form-control" v-model="user.confirm"
                       placeholder="Confirme Contraseña">
            </div>

            <div class="form-group">
                <button class="btn btn-lg btn-primary btn-block btn-signin" @click="saveUsuario()">Sign in</button>
            </div>
        </form>
    </div>
    <asset:javascript src="registro/registro.js"/>
    <div class="bg-circle-5 bg-circle"></div>

</header>
