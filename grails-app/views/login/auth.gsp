<!--
    you can substitue the span of reauth email for a input with the email and
    include the remember me checkbox
    -->
<head>
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
    <asset:javascript src="plugins/wow.js"/>
    <asset:javascript src="plugins/owl.carousel.js"/>
    <asset:stylesheet type="text/css" src="css/loguin/slider.css"/>

    <%-- <asset:javascript src="plugins/waypoints.min.js"/>  --%>
    <asset:javascript src="plugins/jquery.counterup.min.js"/>
    <asset:javascript src="plugins/jquery.slicknav.js"/>
    <asset:javascript src="plugins/jquery.appear.js"/>
    <asset:javascript src="plugins/jquery.vide.js"/>
    <asset:javascript src="plugins/main.js"/>
    <asset:javascript src="plugins/toastr.min.js"/>
    <asset:javascript src="plugins/chosen.jquery.js"/>
    <asset:javascript src="plugins/chosen.jquery.min.js"/>
    <asset:javascript src="plugins/bootstrap-multiselect.js"/>
    <asset:javascript src="plugins/jquery.dataTables.min.js"/>
    <asset:javascript src="plugins/vue.js"/>
    <asset:javascript src="plugins/vee-validate.js"/>
    <asset:javascript src="plugins/mobile-multinivel/jquery.dlmenu.js"/>
    <asset:javascript src="plugins/mobile-multinivel/modernizr.custom.js"/>
    <asset:javascript src="principal.js"/>
    <asset:javascript src="plugins/moment.js"/>
    <asset:javascript src="plugins/jquery.twbsPagination.js"/>
    <asset:javascript src="plugins/sweet-alert/assets/sweetalert/sweetalert.min.js"/>
    <asset:javascript src="plugins/slider.js"/>

    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'didactics.png')}" type="image/x-icon">
    <title>Didactic</title>
    <meta name="title" content="Didactic"/>
    <!--<meta name="description" content="" />-->
    <meta name="keywords" content=""/>
    <meta http-equiv="content-language" content="es_MX"/>
    <meta name="robots" content="index, follow"/>
    <!-- <link rel="canonical" href="http://" />-->
    <meta name="author" content="Didactic"/>
    <meta property="og:title" content="Didactic"/>
    <meta property="og:site_name" content="Didactic"/>
    <!-- <meta name="url" content="http://" />-->
</head>
<header class="masthead text-center text-white">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
        <div class="container">
            <img src="${resource(dir: 'images', file: 'didactico.png')}">
            <a class="navbar-brand text-info">Didactic</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" href="loginRegister"
                           data-target="#loginRegister">Sign Up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" href="loginForm" data-target="#loginForm">Log In</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="row-fluid">
    <div class="slider-container">
        <div class="slider-control left inactive"></div>

        <div class="slider-control right"></div>
        <ul class="slider-pagi"></ul>

        <div class="slider">
            <div class="slide slide-0 active">
                <div class="slide__bg"></div>

                <div class="slide__content">
                    <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
                        <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405"/>
                    </svg>

                    <div class="slide__text">
                        <h2 class="slide__text-heading">Project name 1</h2>

                        <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque voluptate tempore quia.</p>
                        <a href="http://hkmbhutto.wix.com/abdulrasheed"
                           class="slide__text-link">Project link</a>
                    </div>
                </div>
            </div>

            <div class="slide slide-1 ">
                <div class="slide__bg"></div>

                <div class="slide__content">
                    <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
                        <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405"/>
                    </svg>

                    <div class="slide__text">
                        <h2 class="slide__text-heading">Project name 2</h2>

                        <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque voluptate tempore quia.</p>
                        <a href="http://hkmbhutto.wix.com/abdulrasheed"
                           class="slide__text-link">Project link</a>
                    </div>
                </div>
            </div>

            <div class="slide slide-2">
                <div class="slide__bg"></div>

                <div class="slide__content">
                    <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
                        <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405"/>
                    </svg>

                    <div class="slide__text">
                        <h2 class="slide__text-heading">Project name 3</h2>

                        <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque voluptate tempore quia.</p>
                        <a href="http://hkmbhutto.wix.com/abdulrasheed"
                           class="slide__text-link">Project link</a>
                    </div>
                </div>
            </div>

            <div class="slide slide-3">
                <div class="slide__bg"></div>

                <div class="slide__content">
                    <svg class="slide__overlay" viewBox="0 0 720 405" preserveAspectRatio="xMaxYMax slice">
                        <path class="slide__overlay-path" d="M0,0 150,0 500,405 0,405"/>
                    </svg>

                    <div class="slide__text">
                        <h2 class="slide__text-heading">Project name 4</h2>

                        <p class="slide__text-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque voluptate tempore quia. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio veniam minus illo debitis nihil animi facere, doloremque voluptate tempore quia.</p>
                        <a href="http://hkmbhutto.wix.com/abdulrasheed"
                           class="slide__text-link">Project link</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>


    <!-- Loguin Modal -->
    <div class="modal fade" id="loginForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <form action='${postUrl}' method='POST' id="loguin">

                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control" name='j_username' id='username'
                                   placeholder="Usuario">

                        </div>

                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" name='j_password' id='password'
                                   placeholder="Contraseña">
                        </div>

                        <div class="row align-items-center remember">
                            <div>
                                <!-- Remember me -->
                                <div class="custom-control custom-checkbox justify-content-cente">
                                    <input type='radio' class='chk' name='${rememberMeParameter}' id='remember_me'
                                           <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                                    <label for='remember_me' class="text-info">Recordarme</label>
                                </div>

                                <div class="d-flex justify-content-center">
                                    <g:if test='${flash.message}'> 
                                        <div align="center " class='login_message text-danger'>${flash.message}</div>  
                                    </g:if>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>


    <div class="bg-circle-5 bg-circle"></div>

</header>


<script type='text/javascript'>
    (function () {
        document.forms['loguin'].elements['j_username'].focus();
    })();
</script>