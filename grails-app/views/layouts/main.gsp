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
<header class="container-fluid">
	<div class="row" style="padding-top: 40px; /*25px;*/">
	</div>
</header>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    %{--Barra de navegacion que se mostrara despues del logueo del usuario--}%
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
            </li>
        </ul>
        %{--form search--}%
        <!--<form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>-->
    </div>
</nav>
<body class="responsive">
<div id="main" style=" margin-top:80px;">

%{--Contenedor donde se incluiran las vistas posteriores--}%
	<div id="main-container">
		<span v-html="mainContainer"></span>

	</div>
	<footer>
%{--Aqui agregaremos el pie de pagina --}%
	</footer>

</div>

<asset:javascript src="plugins/bootstrapmdb/mdb.js"/>
</body>
</html>