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
                    <!--  <input type="text">-->
                    </b>


                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                    Realizar publicación
                </button>

                </div>

                <div class="row-fluid">
                    <!--Table-->
                    <table class="table  table-responsive-md btn-table">
                        <!--Table head-->
                        <thead>
                        <tr class="text-uppercase text-center">
                            <th>id</th>
                            <th>Titulo</th>
                            <th>Sentimiento</th>
                        </tr>
                        </thead>
                        <!--Table head-->
                        <!--Table body-->
                        <tbody>
                        <tr v-for="(benef, index) in listPublicaciones" class="text-center "><span
                                class="modal-title"></span>
                            <td>{{benef.id}}</td>
                            <td>{{benef.titulo}}</td>
                            <td>
                                <button class="btn-sm btn-unique" name="" @click="updatePublic(benef, index)">
                                    <span class="fa fa-edit"></span></button>

                                <button class="btn-sm btn-red" @click="removePublic(benef,index)">
                                    <span class="fa fa-trash-alt"></span></button>

                            </td>
                        </tr>
                        </tbody>
                        <!--Table body-->
                    </table>
                    <!--Table-->

                </div>
            </div>
        </div>
    </div>
    <g:include view="publicacion/modalPublicacion.gsp"></g:include>
</section>

<asset:javascript src="publicacion/publicaciones.js"/>
</body>
</html>