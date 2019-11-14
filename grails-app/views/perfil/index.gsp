<%--
  Created by IntelliJ IDEA.
  User: benyamin
  Date: 09/02/2019
  Time: 01:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:set var="change" value="${change}" scope="request"/>
    <meta name="layout" content="main"/>
    <title>Dashboard</title>
</head>

<body>
<section id="perfil">
    <div class="container col-md-12 col-sm-12 col-xl-12 responsive">
        <div class="row align-items-center">

            <div class="row justify-content-center col-lg-12 order-lg-1" style="padding-top: 50px">
                <div class="row col-md-12 justify-content-center">
                    <div class="col-md-4">
                        <div class="md-form">
                            <i class="fa fa-child prefix grey-text"><label
                                    for="materialFormLoginEmailEx">Nombre:</label></i>
                            <input type="text" id="name" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row col-md-12 justify-content-center">
                    <div class="col-md-4">
                        <div class="md-form">
                            <i class="fa fa-child prefix grey-text"><label
                                    for="materialFormLoginEmailEx">Apellidos:</label></i>
                            <input type="text" id="name" class="form-control">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</section>

</body>
</html>