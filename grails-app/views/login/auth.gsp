<!--
    you can substitue the span of reauth email for a input with the email and
    include the remember me checkbox
    -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <asset:stylesheet type="text/css" src="css/wonder/one-page-wonder.css"/>
    <asset:stylesheet type="text/css" src="css/wonder/one-page-wonder.min.css"/>
    <asset:stylesheet type="text/css" src="css/loguin/auth.css"/>
    <asset:stylesheet type="text/css" src="css/bootstrap.css"/>
    <asset:stylesheet type="text/css" src="fonts/font-awesome/css/fontawesome-all.min.css"/>
    <asset:javascript src="loguin/auth.js"/>

    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'didactics.png')}" type="image/x-icon">
    <title>AMDI</title>
    <meta name="title" content="AMDI"/>
    <!--<meta name="description" content="" />-->
    <meta name="keywords" content=""/>
    <meta http-equiv="content-language" content="es_MX"/>
    <meta name="robots" content="index, follow"/>
    <!-- <link rel="canonical" href="http://" />-->
    <meta name="author" content="AMDI"/>
    <meta property="og:title" content="AMDI"/>
    <meta property="og:site_name" content="AMDI"/>
    <!-- <meta name="url" content="http://" />-->
</head>

<div class="container">
    <div class="card card-container">
        <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
        <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png"/>

        <p id="profile-name" class="profile-name-card"></p>

        <form action='${postUrl}' method='POST' id="loguin">

            <div class="input-group form-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control" name='j_username' id='username' placeholder="Usuario">

            </div>

            <div class="input-group form-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" class="form-control" name='j_password' id='password' placeholder="Contraseña">
            </div>

            <div class="row align-items-center remember">
                <div>
                    <!-- Remember me -->
                    <div class="custom-control custom-checkbox">
                        <input type='radio' class='chk' name='${rememberMeParameter}' id='remember_me'
                               <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                        <label for='remember_me'>Recordarme</label>
                    </div>

                    <div class="d-flex justify-content-around">
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
        %{--<a href="#" class="forgot-password">--}%
        %{--Forgot the password?--}%
        %{--</a>--}%
    </div><!-- /card-container -->
</div><!-- /containerbody-->
<script type='text/javascript'>
    (function () {
        document.forms['loguin'].elements['j_username'].focus();
    })();
</script>