<%--
  Created by IntelliJ IDEA.
  User: benyamin
  Date: 09/02/2019
  Time: 08:54 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="container">
    <h5 class="text-info">Didactic</h5>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
            <sec:ifLoggedIn>
                <li class="nav-item dropdown ${controllerName.equals('dashboard') ? 'active' : ''}">
                    <a class=" nav-link " href="${createLink(controller: 'dashboard', action: 'index')}"><i
                            class="fas fa-home" style="font-size:20px;" aria-hidden="true"></i> Inicio</a>
                </li>
                <li class="nav-item dropdown ${controllerName.equals('publicacion') ? 'active' : ''}">
                    <a class=" nav-link " href="${createLink(controller: 'publicacion', action: 'index')}"><i
                            class="fas fa-laptop" style="font-size:20px;" aria-hidden="true"></i> Mis publicaciones</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" href="loginRegister"
                       data-target="#loginRegister">Mi perfil</a>
                </li>
                <li class="nav-item">
                    <a class=" nav-link" href="${createLink(controller: 'logout', action: 'index')}"><i
                            class="fa fa-sign-out-alt" aria-hidden="true"></i> Salir
                    </a>
                </li>
            </sec:ifLoggedIn>
        </ul>

    </div>
</div>