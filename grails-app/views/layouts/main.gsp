<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" >

	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'didactic.ico')}" type="image/x-icon">
	<title>AMDI</title>
	<meta name="title" content="AMDI" />
	<!-- <meta name="description" content="" />-->
	<!--<meta name="keywords" content="" />-->
	<meta http-equiv="content-language" content="es_MX" />
	<meta name="robots" content="index, follow" />
	<!--  <link rel="canonical" href="http://" />-->
	<meta name="author" content="AMDI" />
	<meta property="og:title" content="AMDI" />
	<meta property="og:site_name" content="AMDI" />
	<!-- <meta name="url" content="http://" />-->


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
	%{--<asset:javascript src="plugins/vuetify.js"/>--}%


	<script type="text/javascript">
        var CONTEXT_ROOT = '${request.getContextPath()}';
	</script>
</head>

<body>
<header class="masthead text-center text-white">
    <div class="masthead-content">
        <div class="container">
            <h1 class="masthead-heading mb-0">Didactics</h1>

            <h2 class="masthead-subheading mb-0">AMDI</h2>
            <a href="#" class="btn btn-primary btn-xl rounded-pill mt-5"><i class="fab fa-twitter-square"></i></a>
            <a href="#" class="btn btn-primary btn-xl rounded-pill mt-5"><i class="fab fa-facebook"></i></a>
        </div>
    </div>
    <div class="bg-circle-5 bg-circle"></div>
</header>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">AMDI</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Sign Up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="loguin">Log In</a>
                </li>
            </ul>
        </div>
    </div>

</nav>

<div id="main">

    %{--Contenedor donde se incluiran las vistas posteriores--}%
    <div id="main-container">
        <span v-html="mainContainer"></span>
        <g:include view="login/form.gsp"></g:include>
    </div>
    <footer>
        %{--Aqui agregaremos el pie de pagina --}%
    </footer>

</div>
<asset:javascript src="plugins/bootstrapmdb/mdb.js"/>
</body>
</html>