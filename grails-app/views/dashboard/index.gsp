<%--
  Created by IntelliJ IDEA.
  User: benyamin
  Date: 08/02/2019
  Time: 08:49 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:set var="change" value="${change}" scope="request"/>
    <meta name="layout" content="main"/>
    <title>Dashboard</title>
</head>

<body>
<section id="dashboard">
    <div class="container col-md-12 col-sm-12 col-xl-12 responsive">
        <div class="row align-items-center">

            <div class="col-lg-12 order-lg-1">
                <div class="p-5">
                    <h2 class="display-4">Bienvenido!!</h2>
                    <h4 class="text-primary">{{ usuario.nombre }} {{ usuario.apPaterno }} {{ usuario.apMaterno }}</h4>
                </div>

            </div>
                </div>
            </div>

</section>

<asset:javascript src="dashboard/dashboard.js"/>
</body>
</html>