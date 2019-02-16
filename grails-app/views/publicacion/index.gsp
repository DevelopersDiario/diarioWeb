<%--
  Created by IntelliJ IDEA.
  User: benyamin
  Date: 09/02/2019
  Time: 01:13 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Publicaciones</title>
</head>

<body>
<section id="publicaciones">
    <div class="container col-md-12 col-sm-12 col-xl-12 responsive">
        <div class="row align-items-center">

            <div class="col-lg-12 order-lg-1 align-content-center" style="margin-top: 30">
                <div class="p-5">
                    <b class="text-info">Cuéntame que ha sucedido el día de hoy:
                        <input type="text">
                    </b>


                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                    Realizar publicación
                </button>

                </div>
            </div>
        </div>
    </div>
    <g:include view="publicacion/modalPublicacion.gsp"></g:include>
</section>

<asset:javascript src="publicacion/publicaciones.js"/>
</body>
</html>