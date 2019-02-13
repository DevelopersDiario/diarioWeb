<%--
  Created by IntelliJ IDEA.
  User: dinf_imac_programador05
  Date: 03/05/18
  Time: 10:17
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Supervisor de Sedes</title>
    <meta name="layout" content="main"/>

</head>
<body>


<div  id="supSede" data-url="${createLink(controller: 'estado', action: 'listaEstados')}"  >
    <g:hiddenField name="urlGetSedes" value="${createLink(controller: 'supervisarFormato', action: 'getSedes')}"/>
    <div class="container col-md-12 responsive">
        <div class="row col-md-12 responsive">




            <div   class="container-fluid col-sm-2 col-md-2 col-lg-2 responsive" align="center">
                <h4 align="center" class="text-default"></h4>
                <div class="row">

                </div>
                <div class="row col-md-12" >
                    <div class="md-form col-md" >
                        <b align="center"> Consultar Centro de Trabajo </b>
                    </div>
                </div>
                %{--Termina fila de boton para consultar CCT--}%


                <div class="row" >
                    <div class="col-md-12" >
                        <fieldset class="form-group"
                                  onload="buscarCentroTrabajo()"
                                  id="fdsSearchCentro"
                                  url="${createLink(controller: 'beneficiarioFormato', action: 'list')}">

                            <div class="row" >

                                <div class="col-md-10" >


                                    <input type="text"
                                           align="center"
                                           name="centrotrabajo"
                                           id="centrotrabajo"
                                           placeholder="Clave Centro de Trabajo "
                                           onblur="if ($(this).val() == '') {$('#centroeducativoId').val('')}"
                                           @click="limpiarDatosCentro()"
                                           url="${createLink(controller: 'centroTrabajo', action: 'loadCentroTrabajo')}"
                                           class="typeahead form-control" v-on:keyup.enter="buscarCct()">
                                    <input type="hidden"
                                           name="centroeducativoId"
                                           id="centroeducativoId"
                                           url="${createLink(controller: 'centroTrabajo', action: 'listaGrados')}">
                                </div>
                                <div class="col-md-1">
                                    <button id="urlbuscarct" class="btn-floating btn-unique waves-effect waves-light btn-sm" style="padding: 0;" type="button" url="${createLink(controller: 'centroTrabajo', action: 'findAllByClaveNombreSql')}" @click="buscarCct()"><i class="fa fa-search" title="B&uacute;scar CT" ></i></button>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                </div>

                <div class="row responsive" >
                    %{--Termina imput de busqueda--}%
                    <div class="col-md-12 responsive" align="center">
                        <div class="table-responsive">


                            <table class="table table-striped responsive" >

                                <div v-show="centroTrabajo.claveCentro">

                                    <h5> <b class="mdb-color-ic">{{centroTrabajo.nivelEducativo}}</b> <p>{{centroTrabajo.nombre}} </p> </h5>
                                    <b> Total de Beneficiarios Registrados:<h5 class="text-info"> {{listBeneficiarios.length}} </h5> </b>
                                </div>

                                <tbody v-if="centroTrabajo.claveCentro">
                                %{--<tr v-for="(benef, index) in listBeneficiarios">--}%
                                %{--</tr>--}%
                                <tr>
                                    <td>
                                        <p class="text-black-50"><p class="mdb-color-ic"> C.C.T:</p> {{centroTrabajo.claveCentro}} </p>
                                        <b>Nombre Director:</b>  <p>{{centroTrabajo.datosDirector.fullname}} </p>
                                        <b>Tel. Director: </b> <p>{{centroTrabajo.datosDirector.directorTel}} </p>
                                        <b>Tel. Presidente de comite de padres de Familia: </b> <p> {{centroTrabajo.datosPresidente.telPresidenteApf}}</p>
                                        <div class="row container flex-lg-column-reverse " v-if="centroTrabajo.permiso" align="center">

                                            <button class="mdb-color-ic btn-floating btn-outline-unique waves-effect waves-light btn-sm" style="padding: 0;"  @click="InfoDirectorPpf(centroTrabajo)" v-if="centroTrabajo.claveCentro"  data-toggle="modal"  data-target="#InfDirector">
                                                <i class="fa fa-edit"></i></button>

                                        </div>

                                    </td>
                                    %{--<td> </td>--}%
                                </tr>



                                </tbody>
                            </table>
                        </div>
                    </div>
                    %{--Termina tabla de informacion de CCT--}%
                </div>

            </div>

            <div class="container-fluid col-sm-8 col-md-8 col-lg-8" >

                <div class="row" align="center" v-if="centroTrabajo.vigente">
                    <span align="center" style="color:green"><b><h3>{{ centroTrabajo.mensajevigente }}
                    </h3>
                    </b>
                    </span>
                </div>

                <br>
                <div class="container text-center">
                    <div class="card-title responsive">Indicaciones</div>
                    <h6 v-show="centroTrabajo.mensajevigente" class="text-danger"> {{centroTrabajo.mensajevigente}} </h6>
                    <div class="card-body col-md-12">
                        <div class="row responsive form-control">
                            <div class="row col-md-12" >
                                <div class="col-md-4">
                                    <p align="left" style="color: #2e2e2e"><button type="button" class="btn-circle"
                                                                                   style="background: #f5c6cb" disabled="true">
                                        <i class="glyphicon glyphicon-heart"></i>
                                    </button> </i> Beneficiarios duplicados (Está registrado en más de un formato &uacute;nico)</p>
                                </div>
                                <div class="col-md-4">
                                    <p> <button type="button" class="btn_info btn-circle"  disabled="true"><i class="fas fa-check text-white" ></i> </button>Validar y Completar informaci&oacute;n del beneficiario.</p>

                                </div>
                                <div class="col-md-4">
                                    <p align="left" style="color: #2e2e2e"> <button type="button" class="btn-unique btn-circle" style="background: #f5c6cb" disabled="true">
                                        <i class="fas fa-check" ></i></button>  Actualizar informaci&oacute;n del beneficiario.</p>
                                </div>

                            </div>
                            <div class="row col-md-12" >
                                <div class="col-md-6">
                                    <p> <button type="button" class="btn-warning btn-circle" style="background: #f5c6cb" disabled="true"><i class="fa fa-exclamation-triangle btn-warning " ></i>
                                    </button>La Medida en centimetros de la cintura del beneficiario se encuentra fuera del rango de tallas</p>
                                </div>
                                <div class="col-md-6">
                                    <p><button type="button" class="btn-default btn-circle" style="background: #f5c6cb" disabled="true"><i class="fa fa-thumbs-up " ></i>
                                    </button> La Medida en centimetros de la cintura del beneficiario es adecauada para la talla</p>

                                </div>

                            </div>
                            <div class="row col-md-12"  v-show="centroTrabajo.nombre!='STOCK'" >
                                <div class="row float-right col-md-4 responsive float-left container-fluid" >
                                    <div class="container-fluid col-xl-12 col-sm-12 col-md-12">
                                        <div class="row-fluid">
                                            <h5 align="left" class="responsive container">Formato: <b
                                                    class="text-info">{{ centroTrabajo.validado == true ? 'VALIDADO' : '' }}</b>
                                                <br class="responsive"> Folio de Validaci&oacute;n: <b
                                                    class="text-success responsive"><input disabled="true"
                                                                                           v-model="centroTrabajo.datosFormato.folio_validacion"
                                                                                           class="text-info form-control responsive"> </input>
                                            </b></h5>
                                            <h5>Estatus de la Escuela: <b class=" " :class="centroTrabajo.cerrado ?'text-info' : 'text-info' ">{{centroTrabajo.cerrado ? 'Cerrada ' : 'Abierta '}}</b><i class="mdb-color-ic" :class="centroTrabajo.cerrado ? 'fa fa-lock text-success' : 'fa fa-lock-open'"></i></h5>
                                            <h5 class="responsive container" style="text-align: left">Bienes Entregados:  <b class=" " :class="beneficiosEntregados ?'text-success' : 'mdb-color-ic' ">{{beneficiosEntregados  ? 'Si ' : 'No '}}</b></h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="container-fluid float-right col-md-8 responsive float-left" style="display: none" id="rowDownload">
                                    <div class=" row container-fluid" v-show="!centroTrabajo.mensajevigente" >
                                        <button v-if="centroTrabajo.permiso" class="btn btn_purple btn-180 btn-md waves-effect waves-light" data-toggle="modal" data-target="#exampleModal" @click="cleanDatosBeneficiario()">Agregar Beneficiario <i class="fa fa-user-plus" aria-hidden="true"></i></button>
                                        <button  v-if="centroTrabajo.permiso" class="btn btn_purple btn-md waves-effect waves-light" @click="cerrarEscuela()">{{centroTrabajo.cerrado ? 'Escuela Cerrada' : 'Cerrar Escuela '}}  <i class="" :class="centroTrabajo.cerrado ? 'fa fa-lock' : 'fa fa-lock-open'"> </i> </button>
                                        <button  v-if="centroTrabajo.permiso" class="btn btn_purple btn-180 btn-md waves-effect waves-light" @click="validarFormato()"><i class="fa fa-th-list" aria-hidden="true"></i> Validar Formato <i class="fas fa-check-circle"> </i> </button>
                                    </div>
                                    <div class="row container-fluid">
                                        <button class="btn btn-unique btn-md waves-effect waves-light" @click="downloadFormato()" url="${createLink(controller: 'beneficiarioFormato', action: 'donwloadFormatoBeneficiario')}" id="btnDownloadFormato"> Formato &Uacute;nico<i class="fa fa-file-download mr-1"></i>
                                        </button>
                                        <button class="btn btn-unique btn-md  waves-effect waves-light" @click="downloadccedula()" url="${createLink(controller: 'beneficiarioFormato', action: 'downloadCedula')}" id="btnDownloadCedula"> Cedulas <i class="fa fa-file-download mr-1"></i>
                                        </button>
                                        <g:hiddenField name="urldescarga" value="${createLink(controller: 'dashboard', action: 'descarga')}"/>
                                        <button class="btn btn-unique btn-md waves-effect waves-light" @click="downloadEncuesta()" url="${createLink(controller: 'beneficiarioFormato', action: 'downloadEncuesta')}" id="btnDownloadEncuesta"> Encuestas <i class="fa fa-file-download mr-1"></i></button>
                                    </div>
                                    <div class="row container-fluid">
                                        <button  v-if="centroTrabajo.permiso" class="btn btn_info btn-180 btn-md waves-effect waves-light" @click="entregar()"> {{!beneficiosEntregados ? 'Entregar Bienes' : 'Bienes Entregados'}} </button>
                                        <button v-if="centroTrabajo.permiso"  class="btn btn_info btn-md waves-effect waves-light" @click="salidaAlmacen()"><i class="fa fa-truck-circle"> </i>Modificar Salida </button>
                                        <g:hiddenField name="urlSalida" value="${createLink(controller: 'salidas', action: 'download')}"/>
                                    </div>

                                </div>
                                <br>

                            </div>
                        </div>



                    </div>
                    <div class="row col-md-6" v-show="centroTrabajo.nombre=='STOCK'" align="center" style="text-align: center">
                        <h5 class="text-default" align="center"> La Clave de Centro de trabajo est&aacute; considerada como Stock </h5>
                    </div>

                </div>
                <!-- Datos del centro de trabajo -->


            </div>
            <!--Termina 2da secion-->
            <div class="container-fluid col-sm-2 col-md-2 col-lg-2" align="center">
                <div class="col-sm col-md col-lg">
                    <h6 align="center" class="text-dark">Sedes a cargo</h6>
                </div>

                <div class="row col-md-12">
                    <div class="col-sm col-md col-lg" align="center">

                        <table align="center"class="table-responsive-sm">
                            <thead>
                            <tr class="text-uppercase text-center">

                            </tr>
                            </thead>
                            <tbody>

                            <tr v-for="(sedes,index) in listSedes" align="left">
                                <td align="center" class="responsive " >
                                    %{--<button class="btn btn-sm btn-primary responsive " data-toggle="modal" data-target="#ModalUpdateSede"--}%
                                    %{--@click="showDataSede(sedes, index)" > </button>--}%
                                    <b data-toggle="modal" data-target="#ModalUpdateSede"  @click="showDataSede(sedes, index)" class="text-black-50">{{indice+index}}: {{sedes.sede }}

                                        <button type="button" disabled="disabled" class=" mdb-color-ic btn-outline-unique btn-circle"><i class="fas fa-edit"></i></button>  </b>
                                </td>


                            </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row col-md-12">
                    <div class="table-responsive" v-if="centroTrabajo.claveCentro">


                        <table class="table table-striped responsive" >

                            <tbody >
                            <BR>
                            <h5> <b class="mdb-color-ic">REMISI&Oacute;N DE DOCUMENTACI&Oacute;N</b> </p> </h5>
                            <tr>
                                <td>
                                    <h5>Total de Encuestas: <b class="text-info"> {{datosExpedientes.total_encuestas== 0 || datosExpedientes.total_encuestas== null ? '0' : datosExpedientes.total_encuestas }} </b></h5>
                                    <h5>Total de Cedulas:  <b class="text-info">{{datosExpedientes.total_cedulas== 0 || datosExpedientes.total_cedulas== null ? '0' : datosExpedientes.total_cedulas }} </b></h5>
                                    <h5>Formato &Uacute;nico:  <b>  <i  :class="datosExpedientes.entrego_fu ? 'text-info fa fa-check' :  'fa fa-times ' "> </i>  </b></h5>
                                    <h5> Observaci&oacute;nes:</h5>  <b class="text-info justifyText"> {{ datosExpedientes.observaciones == '' || datosExpedientes.observaciones== null ? 'Sin observaciones' : datosExpedientes.observaciones}}</b>
                                </td>

                            </tr>



                            </tbody>
                        </table>
                    </div>

                </div>

            </div>
        </div>
        <div class="row form-control col-md-12 responsive">
            <div class="card-body" v-show="centroTrabajo.nombre!='STOCK'">
                <section>
                    <div class="table-wrapper-2 ">


                        <!--Table-->
                        <table class="table table-sm responsive">
                            <!--Table head-->
                            <thead class="mdb-color lighten-5">
                            <tr class="text-uppercase text-center">
                                <th>C.I</th>
                                <th><i class="fa fa-plus-circle fa-lg pr-2" aria-hidden="true"></i>Grado</th>
                                <th><i class="fa fa-barcode fa-lg pr-2" aria-hidden="true"></i>Folio</th>
                                <th><i class="fa fa-venus-mars fa-lg pr-2" aria-hidden="true"></i>Género</th>
                                <th><i class="fa fa-id-card fa-lg pr-2" aria-hidden="true"></i>CURP</th>
                                <th><i class="fa fa-child fa-lg pr-2" aria-hidden="true"></i>Nombre</th>
                                <th v-if="centroTrabajo.beneficio == 'ESPECIE'"><i class="fa fa-arrows-alt fa-lg pr-2" aria-hidden="true"></i>Medida de <br> la Cintuta <br> en(CM)</th>
                                <th v-if="centroTrabajo.beneficio == 'ESPECIE'"><i class="fa fa-compress fa-lg pr-2" aria-hidden="true"></i>Talla</th>
                                %{--<th><i  aria-hidden="true"></i>Duplicado</th>--}%
                                <th><i  aria-hidden="true"></i>Talla Fuera <br> de Rango</th>
                                <th><i  aria-hidden="true"></i> Opciones</th>
                                %{--<th>Duplicado</th>--}%
                                %{--<th>FR</th>--}%
                            </tr>
                            </thead>
                            <!--Table head-->

                            <!--Table body-->
                            <tbody>


                            <tr v-for="(benef, index) in listBeneficiarios" class="text-center"
                                :class="benef.disabled ? 'grey-text' : benef.duplicado && !benef.inconsistencia ? 'table-danger' : (!benef.duplicado && benef.inconsistencia ? 'table-warning' : (benef.duplicado && benef.inconsistencia ? 'table-warning' : ''))"

                            ><span
                                    class="modal-title"></span>
                                <td>{{benef.consecutivo}}</td>
                                <td>
                                    <select

                                            class="form-control"
                                            :name="'grado'+index" v-model="benef.grado" id="grado" required
                                            :class="benef.disabled ? 'disabled' : errors.has('grado'+index) ? 'inputInvalid' : 'Inputvalid'">
                                        <option  v-for="grado in listGrados" :value="grado.grado">{{grado.descripcion}}</option>
                                    </select>
                                </td>
                                <td>{{benef.folio}}</td>
                                <td>{{benef.genero}}</td>
                                <td>{{benef.curp}}</td>
                                <td>{{benef.nombre}} {{benef.apPaterno}} {{benef.apMaterno}}</td>

                                <td v-if="centroTrabajo.beneficio == 'ESPECIE'" >
                                    <input

                                            type="text"
                                            class="form-control"
                                            onkeypress="return filtrardecimal(event,this);"
                                            id="medida"
                                            :name="'medida'+index"
                                            v-model="benef.medida"
                                            v-validate="'required|numeric'"


                                            :class=" benef.disabled ? 'disabled' : errors.has('medida'+index) ? 'inputInvalid' : 'Inputvalid'"></td>

                                <td v-if="centroTrabajo.beneficio == 'ESPECIE'"><label type="text" class="form-control-text-plain text-center" id="talla">{{benef.talla}}</label></td>
                                %{--<td disabled="true">{{benef.duplicado ? 'Si' : 'No'}}</td>--}%
                                <td disabled="true" v-if="benef.fueraRango"><i disabled="true"
                                                                               class="fa fa-exclamation-triangle btn-warning btn-circle"
                                                                               aria-hidden="true"
                                                                               title="La Medida se encuentra fuera del rango de tallas"></i>
                                </td>
                                <td disabled="true" v-else="!benef.fueraRango"><i disabled="true"
                                                                                  class="fa fa-thumbs-up btn-default btn-circle"
                                                                                  aria-hidden="true"
                                                                                  title="La medida es adecauada para la Talla"></i></td>
                                <td role="group" aria-label="Basic example">
                                    <div v-show="!centroTrabajo.mensajevigente" class="btn-group btn-group-sm float-right">

                                        <div v-if="centroTrabajo.permiso">
                                            <button v-show="!benef.disabled" class="btn-sm btn-unique " name="" @click="updateMedidas(benef, index)" id="btnupdatebeneficiario" url="${createLink(controller: 'beneficiarioFormato', action: 'update')}"><span
                                                    :class="benef.beneficiarioFormato ? 'fa fa-edit': 'fa fa-edit'"></span></button>

                                            <button v-show="!benef.disabled"  class="btn-sm btn-unique" name="" @click="saveMedidas(benef, index)"
                                                    v-if="benef.centroBeneficiario"><span class="fa fa-edit"></span></button>

                                            <button v-show="!benef.disabled"  class="btn-sm btn-red" @click="removeBenef(benef,index)"
                                                    v-if="benef.permisoEliminar" id="btnremoveBenef" url="${createLink(controller: 'beneficiarioFormato', action: 'delete')}"><span
                                                    class="fa fa-trash-alt"></span></button>

                                            <button v-show="!benef.disabled"  class="btn-sm btn_info" name="" @click="getDatosCedula(benef, index)" data-toggle="modal"  data-target="#ModalValidarBenf"
                                                    v-if="!benef.validado" id="showDataCedula" url="${createLink(controller: 'cedula', action: 'getDatosCedula')}"><i class="fas fa-check text-white" ></i></button>

                                            <button v-show="!benef.disabled"  class="btn-sm btn-unique" name="" @click="getDatosCedula(benef, index)" data-toggle="modal"  data-target="#ModalValidarBenf"
                                                    v-if="benef.validado"  id="showDataCedula"  url="${createLink(controller: 'cedula', action: 'getDatosCedula')}"><i class="fas fa-check"></i></button>
                                        </div>
                                    </div>
                                    <!--boton para visualizar información de beneficiarios duplicados-->
                                    <button v-show="!benef.disabled"  class="btn-sm btn-pink" name="" @click="getDataDuplicado(benef, index)" data-toggle="modal"  data-target="#ModalInfoBenef"
                                            v-if="benef.duplicado" url="${createLink(controller: 'beneficiarioFormato', action: 'getDataDuplicado')}" id="btnShowDuplicado"><i class="fas fa-eye"></i></button>




                                </td>
                            </tr>
                            </tbody>
                            <!--Table body-->
                        </table>
                        <!--Table-->
                    </div> </section>
            </div>
        </div>

        %{--Comienza 3ra seccion--}%
        <!--MODAL PARA REGISTRAR NUEVOS BENEFICIARIOS-->
        <!-- Modal -->
        <div class="modal modal fade right show modal-notify modal-info" id="exampleModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 align="center" class="modal-title" id="exampleModalLabel">Agregar Beneficiario: <b>     </b>  <button disabled="true" type="button" class="btn-circle btn_purple">  <i class="fa fa-user-plus text-white" title="Capturar Informaci&oacute; de Nuevo Beneficiario"></i> </button>Registrar Beneficiario(a)</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" @click="reset()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">

                        <div class="container" v-show="!controlVars.formActive">
                            <!-- Formulario para iniciar la búsqueda -->
                            <fieldset class="form-group" onload="buscarBeneficiario()">
                                <div class="row">
                                    <div class="col-md-4">
                                        <select v-model="parambusqueda" class="custom-select" @click="limpiarLabel()">
                                            <option class="custom-file-input" v-for="option in options" :value="option.value"  >
                                                <h5>{{option.text}}</h5>
                                            </option>
                                        </select>
                                    </div>

                                    <div class="col-md-6 datos" v-if="parambusqueda=='Folio'">
                                        <input class="form-control datos" type="text" name="beneficiario" placeholder="Folio del Beneficiario" id="beneficiario" v-on:keyup.enter="buscarBenefFolio()"
                                               onkeypress="return aceptnumbers(event)"
                                        >
                                        <input type="hidden" name="personaId" id="personaId">
                                    </div>
                                    <div class="col-md-6 datos" v-if="parambusqueda=='CURP'">
                                        <input type="text" name="beneficiario" placeholder="Busqueda por CURP " id="beneficiario" v-on:keyup.enter="buscarBenefFolio()"
                                               class="typeahead form-control" >
                                        <input type="hidden" name="personaId" id="personaId">
                                    </div>
                                    <div class="col-md-1">
                                        <button id="urlfolio" class="btn-floating btn-unique waves-effect waves-light btn-sm" style="padding: 0;" type="button" url="${createLink(controller: 'beneficiario', action: 'findBeneficiarioByFolioOrCurp')}" @click="buscarBenefFolio()"  ><i class="fa fa-search" title="Buscar beneficiario"></i></button>
                                    </div>
                                    <div class="col-md-1">
                                        <button class="btn-floating btn_purple waves-effect waves-light btn-sm"
                                                style="padding: 0;" type="button" @click="showForm" ><i
                                                class="fa fa-user-plus"></i></button>
                                    </div>
                                </div>
                            </fieldset>

                            <!-- Tabla con resultados -->
                            <div class="col-md-12" id="tblCoincidencias" style="display: none;">
                                <!--Table-->
                                <table class="table table-striped table-responsive-md btn-table">
                                    <!--Table head-->
                                    <thead>
                                    <tr class="text-uppercase text-center">
                                        <th><i class="fa fa-barcode fa-lg pr-2" aria-hidden="true"></i>Folio</th>
                                        <th><i class="fa fa-id-card fa-lg pr-2" aria-hidden="true"></i>CURP</th>
                                        <th><i class="fa fa-child" aria-hidden="true"></i> Nombre</th>
                                        <th><i class="fa fa-th-list" aria-hidden="true"></i> Duplicado (F.&uacute;nico)</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <!--Table head-->
                                    <!--Table body-->
                                    <tbody>
                                    <tr v-for="(item, index) in listCoincidencias" class="text-center"><span class="modal-title"></span>
                                        <td>{{item.folio}}</td>
                                        <td>{{item.curp}}</td>
                                        <td>{{item.nombre}} {{item.apPaterno}} {{item.apMaterno}}</td>
                                        <td disabled="true" class="tex-warning" v-if="item.duplicado"><i disabled="true"
                                                                                                         class="fa fa-check-triangle btn-warning btn-circle"
                                                                                                         aria-hidden="true"
                                                                                                         title="La Medida se encuentra fuera del rango de tallas"><b> S&iacute;</b>  </i>
                                        </td>
                                        <td disabled="true" class="text-success" v-else="!item.duplicado"><i disabled="true"
                                                                                                             class="fa fa btn-success btn-circle"
                                                                                                             aria-hidden="true"
                                                                                                             title="La medida es adecauada para la Talla"><b> No</b></i></td>
                                        <td>
                                            <button class="btn-sm btn-unique" name="" @click="selectBenefTable(item, index)">Seleccionar</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <!--Table body-->
                                </table>
                            </div>

                            <!-- Datos a mostrar y pedir cuando el usuario elija al beneficiario -->
                            <div class="card" id="mostrarForm" style="display: none">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <i class="fa fa-id-card prefix grey-text"></i>
                                            <label>CURP:</label>
                                            <input class="form-control datos" :value="beneficiarioInstance.curp" readonly>
                                        </div>

                                        <div class="col-md-3">
                                            <i class="fa fa-id-card prefix grey-text"></i>
                                            <label>Folio:</label>
                                            <input class="form-control datos" :value="beneficiarioInstance.folio" readonly>
                                        </div>

                                        <div class="col-md-3">
                                            <div>
                                                <span class="fa fa-graduation-cap prefix grey-text"><label
                                                        for="genero">Género:</label></span>
                                                <input class="form-control datos" readonly
                                                       :value="beneficiarioInstance.genero">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <i class="fa fa-id-card prefix grey-text"></i>
                                            <label>Nombre:</label>
                                            <input readonly class="form-control datos"
                                                   :value="beneficiarioInstance.nombre + ' ' + beneficiarioInstance.apPaterno +  ' ' + beneficiarioInstance.apMaterno">
                                        </div>

                                        <div class="col-md-3">
                                            <div>
                                                <span class="fa fa-graduation-cap prefix grey-text"><label
                                                        for="grado">Grado:</label></span>
                                                <select class="form-control datos" name="grado" id="gradoB"
                                                        v-model="beneficiarioInstance.grado">
                                                    <option value="0" disabled>Seleccione</option>
                                                    <option v-for="grado in listGrados"
                                                            :value="grado.grado">{{grado.descripcion}}</option>
                                                </select>

                                            </div>
                                        </div>

                                        <div class="col-md-3" v-if="centroTrabajo.beneficio == 'ESPECIE'">
                                            <div class="md-form">
                                                <i class="fa fa-arrows-alt prefix grey-text"></i>
                                                <input type="text" id="medida" class="form-control" onkeypress="return filtrardecimal(event,this);"
                                                       v-model="beneficiarioInstance.medida">
                                                <label for="materialFormLoginEmailEx">Medida (cm.):</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-mdb-color" data-dismiss="modal">Cerrar</button>
                                        <button type="button" class="btn btn-unique"
                                                @click="saveMedidas(beneficiarioInstance)">Guardar</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- FORMULARIO PARA AGREGAR UN NUEVO BENEFICIARIO -->

                        <div id="modalFormNewBen" v-show="controlVars.formActive" v-show="controlVars.formActive" class="animated fadeInRightQuick">
                            <div class="row">
                                <div class="col-md-10"></div>

                                <div class="col-md-2 text-right"><button
                                        class="btn-floating btn_purple waves-effect waves-light btn-sm" type="button"
                                        @click="showForm()" style="padding: 0;"><i class="fa fa-undo text-white"></i></button>
                                    <label for="materialFormLoginEmailEx">Regresar</label>

                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-child prefix grey-text"><label for="materialFormLoginEmailEx">Nombre:</label></i>
                                        <input type="text"
                                               class="form-control"
                                               id="name"
                                               onkeypress="return soloLetras(event)"
                                               style="text-transform: uppercase"
                                               v-model="newBen.nombre">

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-id-card  grey-text"> <label for="materialFormLoginEmailEx">Apellido Paterno:</label></i>
                                        <input type="text"
                                               id="Paterno"
                                               class="form-control"
                                               onkeypress="return soloLetras(event)"
                                               style="text-transform: uppercase"
                                               v-model="newBen.apPaterno">

                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-id-card prefix grey-text"> <label for="materialFormLoginEmailEx">Apellido Materno:</label></i>
                                        <input type="text"
                                               id="apMaterno"
                                               class="form-control"
                                               onkeypress="return soloLetras(event)"
                                               style="text-transform: uppercase"
                                               v-model="newBen.apMaterno">

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa-graduation-cap prefix grey-text"><label for="grado">Grado:</label></span>
                                        <select  class="form-control" name="grado" id="" v-model="newBen.grado">
                                            <option v-for="grado in listGrados" :value="grado.grado">{{grado.descripcion}}</option>
                                        </select>
                                    </div>
                                </div>


                            </div>

                            <div class="row">
                                <div class="col-md-6" v-if="centroTrabajo.beneficio == 'ESPECIE'">
                                    <div class="">
                                        <i class="fa fa-arrows-alt prefix grey-text"> <label for="materialFormLoginEmailEx">Medida (cm.):</label></i>
                                        <input type="text" id="medidanewben" class="form-control"  v-model="newBen.medida" class="form-control" onkeypress="return filtrardecimal(event,this);"  >

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa- grey-text"><label
                                                for="genero">Género:</label></span>
                                        <select class="form-control" name="genero" id="genero" v-model="newBen.genero">
                                            <option value="0" disabled>Seleccione</option>
                                            <option value="H">Hombre</option>
                                            <option value="M">Mujer</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <br>

                            <div class="row " id="dataFecha">

                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-birthday-cake  grey-text"><label for="fechaNac">Fecha de Nacimiento:</label></i>
                                        <input type="date" id="datetimepicker_mask1" name="fecNac" class="form-control"
                                               v-model="newBen.fechaNac">
                                    </div>
                                </div>



                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa-graduation-cap  grey-text"><label
                                        >Estado de Nacimiento:</label></span>
                                        <select class="form-control chosen" name="estado" id="estado" v-model="newBen.estado">
                                            <option value="0" disabled>Seleccione un Estado</option>
                                            <option v-for="estado in listEstados"
                                                    :value="estado.id">{{estado.nombre}}</option>
                                        </select>


                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row" >
                                <div class="col-md-6" id="rowcurp">
                                    <div class="">
                                        <i class="fa fa-address-card grey-text"><label id='curpLabel' for="materialFormLoginEmailEx">CURP:</label></i>
                                        <input class="form-control"
                                               type="text"
                                               maxlength="18"
                                               id="curp"
                                               name="curp"
                                               style="text-transform: uppercase"
                                               v-model="newBen.curp"
                                               oninput="validarInput(this)" >

                                        <pre class="resultado" id="resultado"></pre>
                                    </div>
                                </div>
                                <div class="col-md-6" id="rowcheckcurp" >
                                    <div class="row">
                                        <div class="col-md-6 " align="center" >
                                            <div class="md-form " >
                                                %{--style="background-color:lightblue" align="center"--}%
                                                <p class="text-info">No cuento con CURP <b class="text-dark">, Tengo una constancia de Origen y Vecindad</b> Generar Segmento Ra&iacute;z.</p>
                                                %{--<input type="checkbox" align="center" name="checkConstancia" id="checkConstancia" @click="helpCurp()"  @click="validChkConstancia() " v-model="newBen.hasConstancia"/>--}%

                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="">
                                                <br>
                                                <i class="fa fa-repeat" aria-hidden="true"></i>
                                                <button  type="button" class="btn-unique btn-circle" align="center" name="checkConstancia" id="checkConstancia" @click="helpCurp()"
                                                         @click="validChkConstancia() "  :value="newBen.hasconstancia"><i class="fa fa-cogs" aria-hidden="true"></i> </button>

                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-6" id="rowcheckcurpok" style="display: none" >
                                    <div class="row">
                                        <div class="col-md-6 " align="center" >
                                            <div class="" >
                                                <p class="green-text">Si Cuento con una CURP</p>
                                            </div>

                                        </div>
                                        <div >
                                            <br>
                                            <i class="fa fa-repeat" aria-hidden="true"></i>
                                            <button  type="button" class="btn-success btn-circle" align="center"  id="sinConstancia"
                                                     @click="enableConstancia()"   :value="newBen.hasconstancia"><i class="fa fa-check" aria-hidden="true"></i> </button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!--Datos del domicilio-->
                            <br>
                            <h5 align="center" class="mdb-color-ic"><b>Datos de Domicilio</b></h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fas fa-street-view  grey-text"> <label for="materialFormLoginEmailEx">Vialidad</label></i>
                                        <select  class="form-control chosen"  name="vialidad" id="vialidad" v-model="newBen.vialidadId">
                                            <option value="0" disabled>Tipo de Vialidad</option>
                                            <option v-for="vialidad in listVialidades"
                                                    :value="vialidad.id">{{vialidad.vialidad}}</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div >
                                        <i class="fa fa-id-card  grey-text"><label for="materialFormLoginEmailEx">Nombre de Vialidad:</label></i>
                                        <input type="text"
                                               id="calleD"
                                               class="form-control"
                                               style="text-transform: uppercase"
                                               v-model="newBen.valorvialidad">
                                    </div>
                                </div>
                            </div>
                            <div class="row ">
                                <div class="col-md-6">
                                    <div >
                                        <i class="fa fa-sort-numeric-up  grey-text"><label for="materialFormLoginEmailEx">N&uacute;mero Exterior:</label></i>
                                        <input type="text" id="numeroD" class="form-control"  style="text-transform: uppercase" onkeypress="return aceptnumbers(event)"  v-model="newBen.numero">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div >
                                        <i class="fa fa-sort-numeric-down  grey-text"> <label for="materialFormLoginEmailEx">N&uacute;mero Interior:</label></i>
                                        <input type="text" id="numeroInteriorD" class="form-control"  style="text-transform: uppercase" onkeypress="return aceptnumbers(event)"  v-model="newBen.numeroInterior">
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fas fa-street-view  grey-text"> <label for="materialFormLoginEmailEx">Asentamiento</label></i>
                                        <select  class="form-control chosen"  name="asentamiento" id="asentamiento" v-model="newBen.asentamientoId">
                                            <option value="0" disabled>Tipo de Asentamiento</option>
                                            <option v-for="asentamiento in listAsentamientos"
                                                    :value="asentamiento.id">{{asentamiento.asentamiento}}</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div >
                                        <i class="fa fa-map-marker  grey-text">  <span for="materialFormLoginEmailEx">Nombre del Asentamiento </span></i>
                                        <input type="text" id="colonia" class="form-control"  style="text-transform: uppercase" v-model="newBen.valorasentamiento">

                                    </div>

                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-id-card prefix grey-text"> <label for="materialFormLoginEmailEx">Codigo postal:</label></i>
                                        <input type="text" id="codigoPostal" class="form-control" maxlength="5" style="text-transform: uppercase" onkeypress="return aceptnumbers(event)" v-model="newBen.codigoPostal">

                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa-graduation-cap prefix grey-text"><label
                                                for="municipio">Municipio:</label></span>
                                        <select class="form-control" name="municipio" id="municipio" v-model="newBen.municipioId"
                                        %{--@change="loadLocBenef()"--}%
                                        >
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="municipio in listMunicipios"
                                                    :value="municipio.id">{{municipio.municipio}}</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa-graduation-cap grey-text"><label
                                                for="localidad">Localidad:</label></span>
                                        <select class="form-control chosen" name="localidad" id="localidad" v-model="newBen.localidadId" url="${createLink(controller: 'localidad', action: 'getLocalidadByMunicipio')}">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="localidad in listLocalidades"
                                                    :value="localidad.id">{{localidad.label}}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!--Termina Datos del domicilio-->
                            <br>
                            <h5 align="center" class="mdb-color-ic"> <b>Informaci&oacute;n  del Responsable o Tutor </b> </h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-child grey-text"><label for="materialFormLoginEmailEx">Nombre:</label></i>
                                        <input type="text" id="nombreT" class="form-control" onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="newBen.nombreTutor">

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-id-card prefix grey-text"><label for="materialFormLoginEmailEx">Apellido Paterno:</label></i>
                                        <input type="text" id="apPaternoT" class="form-control" onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="newBen.apPaternoTutor">

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-id-card  grey-text"><label for="materialFormLoginEmailEx">Apellido Materno:</label></i>
                                        <input type="text" id="apMaternoT" class="form-control" onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="newBen.apMaternoTutor">

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-address-card grey-text"><label for="materialFormLoginEmailEx">CURP:</label></i>
                                        <input class="form-control" type="text" id="curpT" name="curpT" style="text-transform: uppercase"  v-model="newBen.curpTutor"  maxlength="18">


                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa-users prefix grey-text"><label for="grado">Parentesco:</label></span>
                                        <select  class="form-control" name="grado" id="parentescoT" v-model="newBen.parentescoTutor" >
                                            <option value="" disabled>Seleccione Parentesco</option>
                                            <option value="PADRE">PADRE</option>
                                            <option value="MADRE">MADRE</option>
                                            <option value="TIA">TIA</option>
                                            <option value="TIO">TIO</option>
                                            <option value="ABUELA">ABUELA</option>
                                            <option value="ABUELO">ABUELO</option>
                                            <option value="HERMANA">HERMANA</option>
                                            <option value="HERMANO">HERMANO</option>
                                            <option value="OTRO">OTRO</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-briefcase prefix grey-text"><label for="materialFormLoginEmailEx">Ocupaci&oacute;n:</label></i>
                                        <input type="text" id="ocupacionT" class="form-control" onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="newBen.ocupacionTutor">

                                    </div>
                                </div>

                            </div>
                            <div class="row ">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-phone prefix grey-text"><label for="materialFormLoginEmailEx">Telefono:</label></i>
                                        <input type="text" id="tel"  class="form-control" maxlength="10"  onkeypress="return aceptnumbers(event)"  v-model="newBen.telefonoTutor" >

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-envelope prefix grey-text"><label for="materialFormLoginEmailEx">Correo Electrónico:<span class="text-danger" id="result"></span> </label></i>
                                        <input  type="email" id="email"  class="form-control"   v-model="newBen.correoElectronicoTutor" onKeyUp="validateMail('email')" >

                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class=" btn mdb-color-ic" data-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-unique" @click="saveBeneficiario()" >Guardar</button>
                            </div>
                        </div>
                        %{--TERMINA FORMULARIO PARA AGREGAR UN NUEVO BENEFICIARIO--}%


                        <!--TERMINA MODAL PARA REGISTRAR NUEVOS BENEFICIARIOS-->
                    </div>
                </div>
            </div>
        </div>


        <!-- FORMULARIO PARA ACTUALIZAR INFORMACION DEL CENTRO EDUCATIVO -->
        <div class="modal modal fade right show modal-notify modal-info" id="InfDirector" tabindex="-1" role="dialog"
             aria-labelledby="InfDirectorLabel" aria-hidden="true" >
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="InfDirectorLabel" align="center"><b > Actualizaci&oacute;n de informaci&oacute;n del Centro Educativo:</b></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div >
                            <h5 class="mdb-color-ic" align="center">Informaci&oacute;n del centro Educativo</h5>
                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="clavecentro" class="form-control" style="text-transform: uppercase" disabled v-model="datosInfoCentro.claveCentro">
                                    <label for="materialFormLoginEmailEx">Clave: </label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-child prefix grey-text"></i>
                                    <input type="text" id="nombreCentro" class="form-control" onkeypress="return soloLetras(event)" disabled style="text-transform: uppercase" v-model="datosInfoCentro.nombreCentro">
                                    <label for="materialFormLoginEmailEx">Nombre:</label>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div>
                                    <span class="fa fa-graduation-cap prefix grey-text"><label
                                            for="genero">Nivel Educativo:</label></span>
                                    <select class="form-control" name="genero" id="genero" disabled v-model="datosInfoCentro.nivelEducativo">
                                        <option value="0" disabled>Seleccione</option>
                                        <option value="PREESCOLAR">PREESCOLAR</option>
                                        <option value="PRIMARIA">PRIMARIA</option>
                                        <option value="SECUNDARIA">SECUNDARIA</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <span class="fa fa-graduation-cap prefix grey-text"><label
                                        for="turno">Turno:</label></span>
                                <select class="form-control" name="turno" id="turno" v-model="datosInfoCentro.turno" value="MATUTINO ==1 : 2">
                                    <option  value="MATUTINO">MATUTINO</option>
                                    <option value="VESPERTINO">VESPERTINO</option>
                                </select>
                            </div>


                        </div>
                        <br>
                        <div >
                            <h5 class="mdb-color-ic" align="center">Informaci&oacute;n del Director</h5>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-child prefix grey-text"></i>
                                    <input type="text" id="nombre" class="form-control" onkeypress="return soloLetras(event)"  style="text-transform: uppercase" v-model="datosInfoCentro.nombre">
                                    <label for="materialFormLoginEmailEx">Nombre Director:</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="apPaterno" name="apPaterno"
                                           onkeypress="return soloLetras(event)" v-model="datosInfoCentro.apPaterno" style="text-transform: uppercase" >
                                    <label for="materialFormLoginEmailEx">Apellido Paterno:</label>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="apMaterno" name="apMaterno"
                                           onkeypress="return soloLetras(event)" v-model="datosInfoCentro.apMaterno" style="text-transform: uppercase" >
                                    <label for="materialFormLoginEmailEx">Apellido Materno:</label>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="E-mail" name="e-mail" onKeyUp="validateMail('E-mail')"
                                           v-model="datosInfoCentro.correoElectronico" ><span class="text-danger" id="result"></span>
                                    <label for="materialFormLoginEmailEx">Correo Electronico:</label>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="telDir" name="telDir"
                                           onkeypress="return aceptnumbers(event)" v-model="datosInfoCentro.telefonoContacto" >
                                    <label for="materialFormLoginEmailEx">Telefono de Director:</label>

                                </div>
                            </div>
                        </div>
                        %{--termina datos del director--}%
                        <br>

                        <div>
                            <h5 class="mdb-color-ic" align="center">Informaci&oacute;n del presidente de comite de padres de Familia</h5>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-child prefix grey-text"></i>
                                    <input type="text" id="nombreP" class="form-control" onkeypress="return soloLetras(event)"  style="text-transform: uppercase" v-model="datosInfoCentro.nombreP">
                                    <label for="materialFormLoginEmailEx">Nombre:</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="apPaternoP" name="apPaternoP"
                                           onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="datosInfoCentro.apPaternoP" >
                                    <label for="materialFormLoginEmailEx">Apellido Paterno:</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="apMaternoP" name="apMaternoP"
                                           onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="datosInfoCentro.apMaternoP" >
                                    <label for="materialFormLoginEmailEx">Apellido Materno:</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="id_email" name="email" onKeyUp="validateMail('id_email')"
                                           v-model="datosInfoCentro.correoElectronicoP" >
                                    <label for="materialFormLoginEmailEx">Correo Electronico:<span class="text-danger" id="result"></span></label>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="telefonoP" name="telefonoP"
                                           onkeypress="return aceptnumbers(event)" maxlength="10" v-model="datosInfoCentro.telefonoP" >
                                    <label for="materialFormLoginEmailEx">Telefono:</label>
                                </div>
                            </div>
                        </div>
                        %{--termina datos del presidente de padres de familia--}%

                        <div class="modal-footer">
                            <button type="button" class="mdb-color-ic btn btn-outline-default" data-dismiss="modal">Cerrar</button>
                            <g:hiddenField name="urlUpdateDataCenter" value="${createLink(controller: 'centroTrabajo', action: 'updateDatosCentro')}"/>
                            <button type="button" class="btn btn-default" @click="updateInfoCentro(centroTrabajo.idCct)">Guardar</button>
                        </div>

                    </div>
                </div>  <!--fin modal-body-->
            </div>
        </div>
        <!--FIN  FORMULARIO PARA ACTUALIZAR INFORMACION DEL CENTRO EDUCATIVO -->



        <!--MODAL PARA ACTUALIZAR INFORMACION DE SEDE-->
        <div class="modal modal fade right show modal-notify modal-info" id="ModalUpdateSede" tabindex="-1" role="dialog"
             aria-labelledby="ModalUpdateSedeLabel" aria-hidden="true" >
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalUpdateSedeLabel"><b>  Actualizar Informaci&oacute;n de SEDE:</b></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body" >

                        <div class="row">

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-child prefix grey-text"></i>
                                    <input type="text" id="sede" class="form-control" onkeypress="return soloLetras(event)"
                                           style="text-transform: uppercase"
                                           disabled="true"
                                           v-model="datosSede.sede" >
                                    <label for="materialFormLoginEmailEx">Sede:</label>
                                    <input type="hidden" name="id" id="id" v-model="datosSede.id" >

                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="clavesede" class="form-control"
                                           onkeypress="return soloLetras(event)"
                                           style="text-transform: uppercase"
                                           disabled="true"
                                           v-model="datosSede.clavesede">
                                    <label for="materialFormLoginEmailEx">Clave:</label>
                                </div>
                            </div>

                        </div>
                        <div  align="center">
                            <h5 align="center" class="mdb-color-ic"> Datos de Ubicaci&oacute;n
                            </h5>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="calle" class="form-control" style="text-transform: uppercase" v-model="datosSede.calle">
                                    <label for="materialFormLoginEmailEx">Calle:</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="numero" class="form-control"
                                           onkeypress="return aceptnumbers(event)"
                                           style="text-transform: uppercase"
                                           v-model="datosSede.numero">
                                    <label for="materialFormLoginEmailEx">N&uacute;mero Exterior:</label>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="numerointerior" class="form-control"
                                           onkeypress="return aceptnumbers(event)"
                                           style="text-transform: uppercase"
                                           v-model="datosSede.numerointerior">
                                    <label for="materialFormLoginEmailEx">N&uacute;mero Interior:</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" maxlength="5" id="codigopostal" class="form-control"
                                           onkeypress="return aceptnumbers(event)"
                                           style="text-transform: uppercase"
                                           v-model="datosSede.codigopostal">
                                    <label for="materialFormLoginEmailEx">Codigo Postal:</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div>
                                    <span class="fa fa-graduation-cap prefix grey-text"><label
                                            for="mpio">Municipio:</label></span>
                                    <select class="form-control chosen"  id="mpio" v-model="datosSede.municipioId"  @change="loadLocSede()">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="municipio in listMunicipios"
                                                :value="municipio.id">{{municipio.municipio}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div>
                                    <span class="fa fa-graduation-cap prefix grey-text"><label
                                            for="localid">Localidad:</label></span>
                                    <select class="form-control"  id="localid"  url="${createLink(controller: 'localidad', action: 'getLocalidadByMunicipio')}" v-model="datosSede.localidadId">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="localidad in listLocalidades"
                                                :value="localidad.id">{{localidad.label}}</option>
                                    </select>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="colonia" class="form-control"
                                           onkeypress="return soloLetras(event)"
                                           style="text-transform: uppercase"
                                           v-model="datosSede.colonia">
                                    <label for="materialFormLoginEmailEx">Colonia:</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="email" id="email" class="form-control"
                                           onkeypress="return soloLetras(event)"
                                           style="text-transform: uppercase"
                                           v-model="datosSede.correo">
                                    <label for="materialFormLoginEmailEx">@ Correo Electronico de contacto:</label>
                                </div>
                            </div>





                        </div>


                        <div class="row">




                        </div>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="mdb-color-ic btn btn-outline-default" data-dismiss="modal">Cerrar</button>
                        <input type="hidden" name="urlsaveDataSede" id="urlsaveDataSede" url="${createLink(controller: 'sede', action: 'updateDataSede')}">
                        <button type="button" class="btn btn-default" @click="updateDataSede()">Guardar</button>
                    </div>


                </div>  <!--fin modal-body-->
            </div>
        </div>
        <!--TERMINA MODAL PARA ACTUALIZAR INFORMACION DE SEDE-->
        <g:include view="supervisarFormato/formulario_cedula.gsp"></g:include>
        <g:include view="supervisarFormato/tabla_duplicados.gsp"></g:include>
        <g:include view="supervisarFormato/tabla_coincidencias_centros.gsp"></g:include>
        <g:include view="supervisarFormato/formato_salida.gsp"></g:include>
        <g:include view="supervisarFormato/incidencia.gsp"></g:include>

    </div>
    <div class=" row col-md-12">

    </div>
</div>





<asset:javascript src="plugins/bootstrap3-typeahead.js"/>
<asset:javascript src="supervisor/supervisor.js"/>
</body>





</html><%--
  Created by IntelliJ IDEA.
  User: dinf_imac_programador05
  Date: 03/05/18
  Time: 10:17
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Supervisor de Sedes</title>
    <meta name="layout" content="main"/>

</head>
<body>


<div  id="supSede" data-url="${createLink(controller: 'estado', action: 'listaEstados')}"  >
    <g:hiddenField name="urlGetSedes" value="${createLink(controller: 'supervisarFormato', action: 'getSedes')}"/>
    <div class="container col-md-12 responsive">
        <div class="row col-md-12 responsive">




            <div   class="container-fluid col-sm-2 col-md-2 col-lg-2 responsive" align="center">
                <h4 align="center" class="text-default"></h4>
                <div class="row">

                </div>
                <div class="row col-md-12" >
                    <div class="md-form col-md" >
                        <b align="center"> Consultar Centro de Trabajo </b>
                    </div>
                </div>
                %{--Termina fila de boton para consultar CCT--}%


                <div class="row" >
                    <div class="col-md-12" >
                        <fieldset class="form-group"
                                  onload="buscarCentroTrabajo()"
                                  id="fdsSearchCentro"
                                  url="${createLink(controller: 'beneficiarioFormato', action: 'list')}">

                            <div class="row" >

                                <div class="col-md-10" >


                                    <input type="text"
                                           align="center"
                                           name="centrotrabajo"
                                           id="centrotrabajo"
                                           placeholder="Clave Centro de Trabajo "
                                           onblur="if ($(this).val() == '') {$('#centroeducativoId').val('')}"
                                           @click="limpiarDatosCentro()"
                                           url="${createLink(controller: 'centroTrabajo', action: 'loadCentroTrabajo')}"
                                           class="typeahead form-control" v-on:keyup.enter="buscarCct()">
                                    <input type="hidden"
                                           name="centroeducativoId"
                                           id="centroeducativoId"
                                           url="${createLink(controller: 'centroTrabajo', action: 'listaGrados')}">
                                </div>
                                <div class="col-md-1">
                                    <button id="urlbuscarct" class="btn-floating btn-unique waves-effect waves-light btn-sm" style="padding: 0;" type="button" url="${createLink(controller: 'centroTrabajo', action: 'findAllByClaveNombreSql')}" @click="buscarCct()"><i class="fa fa-search" title="B&uacute;scar CT" ></i></button>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                </div>

                <div class="row responsive" >
                    %{--Termina imput de busqueda--}%
                    <div class="col-md-12 responsive" align="center">
                        <div class="table-responsive">


                            <table class="table table-striped responsive" >

                                <div v-show="centroTrabajo.claveCentro">

                                    <h5> <b class="mdb-color-ic">{{centroTrabajo.nivelEducativo}}</b> <p>{{centroTrabajo.nombre}} </p> </h5>
                                    <b> Total de Beneficiarios Registrados:<h5 class="text-info"> {{listBeneficiarios.length}} </h5> </b>
                                </div>

                                <tbody v-if="centroTrabajo.claveCentro">
                                %{--<tr v-for="(benef, index) in listBeneficiarios">--}%
                                %{--</tr>--}%
                                <tr>
                                    <td>
                                        <p class="text-black-50"><p class="mdb-color-ic"> C.C.T:</p> {{centroTrabajo.claveCentro}} </p>
                                        <b>Nombre Director:</b>  <p>{{centroTrabajo.datosDirector.fullname}} </p>
                                        <b>Tel. Director: </b> <p>{{centroTrabajo.datosDirector.directorTel}} </p>
                                        <b>Tel. Presidente de comite de padres de Familia: </b> <p> {{centroTrabajo.datosPresidente.telPresidenteApf}}</p>
                                        <div class="row container flex-lg-column-reverse " v-if="centroTrabajo.permiso" align="center">

                                            <button class="mdb-color-ic btn-floating btn-outline-unique waves-effect waves-light btn-sm" style="padding: 0;"  @click="InfoDirectorPpf(centroTrabajo)" v-if="centroTrabajo.claveCentro"  data-toggle="modal"  data-target="#InfDirector">
                                                <i class="fa fa-edit"></i></button>

                                        </div>

                                    </td>
                                    %{--<td> </td>--}%
                                </tr>



                                </tbody>
                            </table>
                        </div>
                    </div>
                    %{--Termina tabla de informacion de CCT--}%
                </div>

            </div>

            <div class="container-fluid col-sm-8 col-md-8 col-lg-8" >

                <div class="row" align="center" v-if="centroTrabajo.vigente">
                    <span align="center" style="color:green"><b><h3>{{ centroTrabajo.mensajevigente }}
                    </h3>
                    </b>
                    </span>
                </div>

                <br>
                <div class="container text-center">
                    <div class="card-title responsive">Indicaciones</div>
                    <h6 v-show="centroTrabajo.mensajevigente" class="text-danger"> {{centroTrabajo.mensajevigente}} </h6>
                    <div class="card-body col-md-12">
                        <div class="row responsive form-control">
                            <div class="row col-md-12" >
                                <div class="col-md-4">
                                    <p align="left" style="color: #2e2e2e"><button type="button" class="btn-circle"
                                                                                   style="background: #f5c6cb" disabled="true">
                                        <i class="glyphicon glyphicon-heart"></i>
                                    </button> </i> Beneficiarios duplicados (Está registrado en más de un formato &uacute;nico)</p>
                                </div>
                                <div class="col-md-4">
                                    <p> <button type="button" class="btn_info btn-circle"  disabled="true"><i class="fas fa-check text-white" ></i> </button>Validar y Completar informaci&oacute;n del beneficiario.</p>

                                </div>
                                <div class="col-md-4">
                                    <p align="left" style="color: #2e2e2e"> <button type="button" class="btn-unique btn-circle" style="background: #f5c6cb" disabled="true">
                                        <i class="fas fa-check" ></i></button>  Actualizar informaci&oacute;n del beneficiario.</p>
                                </div>

                            </div>
                            <div class="row col-md-12" >
                                <div class="col-md-6">
                                    <p> <button type="button" class="btn-warning btn-circle" style="background: #f5c6cb" disabled="true"><i class="fa fa-exclamation-triangle btn-warning " ></i>
                                    </button>La Medida en centimetros de la cintura del beneficiario se encuentra fuera del rango de tallas</p>
                                </div>
                                <div class="col-md-6">
                                    <p><button type="button" class="btn-default btn-circle" style="background: #f5c6cb" disabled="true"><i class="fa fa-thumbs-up " ></i>
                                    </button> La Medida en centimetros de la cintura del beneficiario es adecauada para la talla</p>

                                </div>

                            </div>
                            <div class="row col-md-12"  v-show="centroTrabajo.nombre!='STOCK'" >
                                <div class="row float-right col-md-4 responsive float-left container-fluid" >
                                    <div class="container-fluid col-xl-12 col-sm-12 col-md-12">
                                        <div class="row-fluid">
                                            <h5 align="left" class="responsive container">Formato: <b
                                                    class="text-info">{{ centroTrabajo.validado == true ? 'VALIDADO' : '' }}</b>
                                                <br class="responsive"> Folio de Validaci&oacute;n: <b
                                                    class="text-success responsive"><input disabled="true"
                                                                                           v-model="centroTrabajo.datosFormato.folio_validacion"
                                                                                           class="text-info form-control responsive"> </input>
                                            </b></h5>
                                            <h5>Estatus de la Escuela: <b class=" " :class="centroTrabajo.cerrado ?'text-info' : 'text-info' ">{{centroTrabajo.cerrado ? 'Cerrada ' : 'Abierta '}}</b><i class="mdb-color-ic" :class="centroTrabajo.cerrado ? 'fa fa-lock text-success' : 'fa fa-lock-open'"></i></h5>
                                            <h5 class="responsive container" style="text-align: left">Bienes Entregados:  <b class=" " :class="beneficiosEntregados ?'text-success' : 'mdb-color-ic' ">{{beneficiosEntregados  ? 'Si ' : 'No '}}</b></h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="container-fluid float-right col-md-8 responsive float-left" style="display: none" id="rowDownload">
                                    <div class=" row container-fluid" v-show="!centroTrabajo.mensajevigente" >
                                        <button v-if="centroTrabajo.permiso" class="btn btn_purple btn-180 btn-md waves-effect waves-light" data-toggle="modal" data-target="#exampleModal" @click="cleanDatosBeneficiario()">Agregar Beneficiario <i class="fa fa-user-plus" aria-hidden="true"></i></button>
                                        <button  v-if="centroTrabajo.permiso" class="btn btn_purple btn-md waves-effect waves-light" @click="cerrarEscuela()">{{centroTrabajo.cerrado ? 'Escuela Cerrada' : 'Cerrar Escuela '}}  <i class="" :class="centroTrabajo.cerrado ? 'fa fa-lock' : 'fa fa-lock-open'"> </i> </button>
                                        <button  v-if="centroTrabajo.permiso" class="btn btn_purple btn-180 btn-md waves-effect waves-light" @click="validarFormato()"><i class="fa fa-th-list" aria-hidden="true"></i> Validar Formato <i class="fas fa-check-circle"> </i> </button>
                                    </div>
                                    <div class="row container-fluid">
                                        <button class="btn btn-unique btn-md waves-effect waves-light" @click="downloadFormato()" url="${createLink(controller: 'beneficiarioFormato', action: 'donwloadFormatoBeneficiario')}" id="btnDownloadFormato"> Formato &Uacute;nico<i class="fa fa-file-download mr-1"></i>
                                        </button>
                                        <button class="btn btn-unique btn-md  waves-effect waves-light" @click="downloadccedula()" url="${createLink(controller: 'beneficiarioFormato', action: 'downloadCedula')}" id="btnDownloadCedula"> Cedulas <i class="fa fa-file-download mr-1"></i>
                                        </button>
                                        <g:hiddenField name="urldescarga" value="${createLink(controller: 'dashboard', action: 'descarga')}"/>
                                        <button class="btn btn-unique btn-md waves-effect waves-light" @click="downloadEncuesta()" url="${createLink(controller: 'beneficiarioFormato', action: 'downloadEncuesta')}" id="btnDownloadEncuesta"> Encuestas <i class="fa fa-file-download mr-1"></i></button>
                                    </div>
                                    <div class="row container-fluid">
                                        <button  v-if="centroTrabajo.permiso" class="btn btn_info btn-180 btn-md waves-effect waves-light" @click="entregar()"> {{!beneficiosEntregados ? 'Entregar Bienes' : 'Bienes Entregados'}} </button>
                                        <button v-if="centroTrabajo.permiso"  class="btn btn_info btn-md waves-effect waves-light" @click="salidaAlmacen()"><i class="fa fa-truck-circle"> </i>Modificar Salida </button>
                                        <g:hiddenField name="urlSalida" value="${createLink(controller: 'salidas', action: 'download')}"/>
                                    </div>

                                </div>
                                <br>

                            </div>
                        </div>



                    </div>
                    <div class="row col-md-6" v-show="centroTrabajo.nombre=='STOCK'" align="center" style="text-align: center">
                        <h5 class="text-default" align="center"> La Clave de Centro de trabajo est&aacute; considerada como Stock </h5>
                    </div>

                </div>
                <!-- Datos del centro de trabajo -->


            </div>
            <!--Termina 2da secion-->
            <div class="container-fluid col-sm-2 col-md-2 col-lg-2" align="center">
                <div class="col-sm col-md col-lg">
                    <h6 align="center" class="text-dark">Sedes a cargo</h6>
                </div>

                <div class="row col-md-12">
                    <div class="col-sm col-md col-lg" align="center">

                        <table align="center"class="table-responsive-sm">
                            <thead>
                            <tr class="text-uppercase text-center">

                            </tr>
                            </thead>
                            <tbody>

                            <tr v-for="(sedes,index) in listSedes" align="left">
                                <td align="center" class="responsive " >
                                    %{--<button class="btn btn-sm btn-primary responsive " data-toggle="modal" data-target="#ModalUpdateSede"--}%
                                    %{--@click="showDataSede(sedes, index)" > </button>--}%
                                    <b data-toggle="modal" data-target="#ModalUpdateSede"  @click="showDataSede(sedes, index)" class="text-black-50">{{indice+index}}: {{sedes.sede }}

                                        <button type="button" disabled="disabled" class=" mdb-color-ic btn-outline-unique btn-circle"><i class="fas fa-edit"></i></button>  </b>
                                </td>


                            </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row col-md-12">
                    <div class="table-responsive" v-if="centroTrabajo.claveCentro">


                        <table class="table table-striped responsive" >

                            <tbody >
                            <BR>
                            <h5> <b class="mdb-color-ic">REMISI&Oacute;N DE DOCUMENTACI&Oacute;N</b> </p> </h5>
                            <tr>
                                <td>
                                    <h5>Total de Encuestas: <b class="text-info"> {{datosExpedientes.total_encuestas== 0 || datosExpedientes.total_encuestas== null ? '0' : datosExpedientes.total_encuestas }} </b></h5>
                                    <h5>Total de Cedulas:  <b class="text-info">{{datosExpedientes.total_cedulas== 0 || datosExpedientes.total_cedulas== null ? '0' : datosExpedientes.total_cedulas }} </b></h5>
                                    <h5>Formato &Uacute;nico:  <b>  <i  :class="datosExpedientes.entrego_fu ? 'text-info fa fa-check' :  'fa fa-times ' "> </i>  </b></h5>
                                    <h5> Observaci&oacute;nes:</h5>  <b class="text-info justifyText"> {{ datosExpedientes.observaciones == '' || datosExpedientes.observaciones== null ? 'Sin observaciones' : datosExpedientes.observaciones}}</b>
                                </td>

                            </tr>



                            </tbody>
                        </table>
                    </div>

                </div>

            </div>
        </div>
        <div class="row form-control col-md-12 responsive">
            <div class="card-body" v-show="centroTrabajo.nombre!='STOCK'">
                <section>
                    <div class="table-wrapper-2 ">


                        <!--Table-->
                        <table class="table table-sm responsive">
                            <!--Table head-->
                            <thead class="mdb-color lighten-5">
                            <tr class="text-uppercase text-center">
                                <th>C.I</th>
                                <th><i class="fa fa-plus-circle fa-lg pr-2" aria-hidden="true"></i>Grado</th>
                                <th><i class="fa fa-barcode fa-lg pr-2" aria-hidden="true"></i>Folio</th>
                                <th><i class="fa fa-venus-mars fa-lg pr-2" aria-hidden="true"></i>Género</th>
                                <th><i class="fa fa-id-card fa-lg pr-2" aria-hidden="true"></i>CURP</th>
                                <th><i class="fa fa-child fa-lg pr-2" aria-hidden="true"></i>Nombre</th>
                                <th v-if="centroTrabajo.beneficio == 'ESPECIE'"><i class="fa fa-arrows-alt fa-lg pr-2" aria-hidden="true"></i>Medida de <br> la Cintuta <br> en(CM)</th>
                                <th v-if="centroTrabajo.beneficio == 'ESPECIE'"><i class="fa fa-compress fa-lg pr-2" aria-hidden="true"></i>Talla</th>
                                %{--<th><i  aria-hidden="true"></i>Duplicado</th>--}%
                                <th><i  aria-hidden="true"></i>Talla Fuera <br> de Rango</th>
                                <th><i  aria-hidden="true"></i> Opciones</th>
                                %{--<th>Duplicado</th>--}%
                                %{--<th>FR</th>--}%
                            </tr>
                            </thead>
                            <!--Table head-->

                            <!--Table body-->
                            <tbody>


                            <tr v-for="(benef, index) in listBeneficiarios" class="text-center"
                                :class="benef.disabled ? 'grey-text' : benef.duplicado && !benef.inconsistencia ? 'table-danger' : (!benef.duplicado && benef.inconsistencia ? 'table-warning' : (benef.duplicado && benef.inconsistencia ? 'table-warning' : ''))"

                            ><span
                                    class="modal-title"></span>
                                <td>{{benef.consecutivo}}</td>
                                <td>
                                    <select

                                            class="form-control"
                                            :name="'grado'+index" v-model="benef.grado" id="grado" required
                                            :class="benef.disabled ? 'disabled' : errors.has('grado'+index) ? 'inputInvalid' : 'Inputvalid'">
                                        <option  v-for="grado in listGrados" :value="grado.grado">{{grado.descripcion}}</option>
                                    </select>
                                </td>
                                <td>{{benef.folio}}</td>
                                <td>{{benef.genero}}</td>
                                <td>{{benef.curp}}</td>
                                <td>{{benef.nombre}} {{benef.apPaterno}} {{benef.apMaterno}}</td>

                                <td v-if="centroTrabajo.beneficio == 'ESPECIE'" >
                                    <input

                                            type="text"
                                            class="form-control"
                                            onkeypress="return filtrardecimal(event,this);"
                                            id="medida"
                                            :name="'medida'+index"
                                            v-model="benef.medida"
                                            v-validate="'required|numeric'"


                                            :class=" benef.disabled ? 'disabled' : errors.has('medida'+index) ? 'inputInvalid' : 'Inputvalid'"></td>

                                <td v-if="centroTrabajo.beneficio == 'ESPECIE'"><label type="text" class="form-control-text-plain text-center" id="talla">{{benef.talla}}</label></td>
                                %{--<td disabled="true">{{benef.duplicado ? 'Si' : 'No'}}</td>--}%
                                <td disabled="true" v-if="benef.fueraRango"><i disabled="true"
                                                                               class="fa fa-exclamation-triangle btn-warning btn-circle"
                                                                               aria-hidden="true"
                                                                               title="La Medida se encuentra fuera del rango de tallas"></i>
                                </td>
                                <td disabled="true" v-else="!benef.fueraRango"><i disabled="true"
                                                                                  class="fa fa-thumbs-up btn-default btn-circle"
                                                                                  aria-hidden="true"
                                                                                  title="La medida es adecauada para la Talla"></i></td>
                                <td role="group" aria-label="Basic example">
                                    <div v-show="!centroTrabajo.mensajevigente" class="btn-group btn-group-sm float-right">

                                        <div v-if="centroTrabajo.permiso">
                                            <button v-show="!benef.disabled" class="btn-sm btn-unique " name="" @click="updateMedidas(benef, index)" id="btnupdatebeneficiario" url="${createLink(controller: 'beneficiarioFormato', action: 'update')}"><span
                                                    :class="benef.beneficiarioFormato ? 'fa fa-edit': 'fa fa-edit'"></span></button>

                                            <button v-show="!benef.disabled"  class="btn-sm btn-unique" name="" @click="saveMedidas(benef, index)"
                                                    v-if="benef.centroBeneficiario"><span class="fa fa-edit"></span></button>

                                            <button v-show="!benef.disabled"  class="btn-sm btn-red" @click="removeBenef(benef,index)"
                                                    v-if="benef.permisoEliminar" id="btnremoveBenef" url="${createLink(controller: 'beneficiarioFormato', action: 'delete')}"><span
                                                    class="fa fa-trash-alt"></span></button>

                                            <button v-show="!benef.disabled"  class="btn-sm btn_info" name="" @click="getDatosCedula(benef, index)" data-toggle="modal"  data-target="#ModalValidarBenf"
                                                    v-if="!benef.validado" id="showDataCedula" url="${createLink(controller: 'cedula', action: 'getDatosCedula')}"><i class="fas fa-check text-white" ></i></button>

                                            <button v-show="!benef.disabled"  class="btn-sm btn-unique" name="" @click="getDatosCedula(benef, index)" data-toggle="modal"  data-target="#ModalValidarBenf"
                                                    v-if="benef.validado"  id="showDataCedula"  url="${createLink(controller: 'cedula', action: 'getDatosCedula')}"><i class="fas fa-check"></i></button>
                                        </div>
                                    </div>
                                    <!--boton para visualizar información de beneficiarios duplicados-->
                                    <button v-show="!benef.disabled"  class="btn-sm btn-pink" name="" @click="getDataDuplicado(benef, index)" data-toggle="modal"  data-target="#ModalInfoBenef"
                                            v-if="benef.duplicado" url="${createLink(controller: 'beneficiarioFormato', action: 'getDataDuplicado')}" id="btnShowDuplicado"><i class="fas fa-eye"></i></button>




                                </td>
                            </tr>
                            </tbody>
                            <!--Table body-->
                        </table>
                        <!--Table-->
                    </div> </section>
            </div>
        </div>

        %{--Comienza 3ra seccion--}%
        <!--MODAL PARA REGISTRAR NUEVOS BENEFICIARIOS-->
        <!-- Modal -->
        <div class="modal modal fade right show modal-notify modal-info" id="exampleModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 align="center" class="modal-title" id="exampleModalLabel">Agregar Beneficiario: <b>     </b>  <button disabled="true" type="button" class="btn-circle btn_purple">  <i class="fa fa-user-plus text-white" title="Capturar Informaci&oacute; de Nuevo Beneficiario"></i> </button>Registrar Beneficiario(a)</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" @click="reset()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">

                        <div class="container" v-show="!controlVars.formActive">
                            <!-- Formulario para iniciar la búsqueda -->
                            <fieldset class="form-group" onload="buscarBeneficiario()">
                                <div class="row">
                                    <div class="col-md-4">
                                        <select v-model="parambusqueda" class="custom-select" @click="limpiarLabel()">
                                            <option class="custom-file-input" v-for="option in options" :value="option.value"  >
                                                <h5>{{option.text}}</h5>
                                            </option>
                                        </select>
                                    </div>

                                    <div class="col-md-6 datos" v-if="parambusqueda=='Folio'">
                                        <input class="form-control datos" type="text" name="beneficiario" placeholder="Folio del Beneficiario" id="beneficiario" v-on:keyup.enter="buscarBenefFolio()"
                                               onkeypress="return aceptnumbers(event)"
                                        >
                                        <input type="hidden" name="personaId" id="personaId">
                                    </div>
                                    <div class="col-md-6 datos" v-if="parambusqueda=='CURP'">
                                        <input type="text" name="beneficiario" placeholder="Busqueda por CURP " id="beneficiario" v-on:keyup.enter="buscarBenefFolio()"
                                               class="typeahead form-control" >
                                        <input type="hidden" name="personaId" id="personaId">
                                    </div>
                                    <div class="col-md-1">
                                        <button id="urlfolio" class="btn-floating btn-unique waves-effect waves-light btn-sm" style="padding: 0;" type="button" url="${createLink(controller: 'beneficiario', action: 'findBeneficiarioByFolioOrCurp')}" @click="buscarBenefFolio()"  ><i class="fa fa-search" title="Buscar beneficiario"></i></button>
                                    </div>
                                    <div class="col-md-1">
                                        <button class="btn-floating btn_purple waves-effect waves-light btn-sm"
                                                style="padding: 0;" type="button" @click="showForm" ><i
                                                class="fa fa-user-plus"></i></button>
                                    </div>
                                </div>
                            </fieldset>

                            <!-- Tabla con resultados -->
                            <div class="col-md-12" id="tblCoincidencias" style="display: none;">
                                <!--Table-->
                                <table class="table table-striped table-responsive-md btn-table">
                                    <!--Table head-->
                                    <thead>
                                    <tr class="text-uppercase text-center">
                                        <th><i class="fa fa-barcode fa-lg pr-2" aria-hidden="true"></i>Folio</th>
                                        <th><i class="fa fa-id-card fa-lg pr-2" aria-hidden="true"></i>CURP</th>
                                        <th><i class="fa fa-child" aria-hidden="true"></i> Nombre</th>
                                        <th><i class="fa fa-th-list" aria-hidden="true"></i> Duplicado (F.&uacute;nico)</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <!--Table head-->
                                    <!--Table body-->
                                    <tbody>
                                    <tr v-for="(item, index) in listCoincidencias" class="text-center"><span class="modal-title"></span>
                                        <td>{{item.folio}}</td>
                                        <td>{{item.curp}}</td>
                                        <td>{{item.nombre}} {{item.apPaterno}} {{item.apMaterno}}</td>
                                        <td disabled="true" class="tex-warning" v-if="item.duplicado"><i disabled="true"
                                                                                                         class="fa fa-check-triangle btn-warning btn-circle"
                                                                                                         aria-hidden="true"
                                                                                                         title="La Medida se encuentra fuera del rango de tallas"><b> S&iacute;</b>  </i>
                                        </td>
                                        <td disabled="true" class="text-success" v-else="!item.duplicado"><i disabled="true"
                                                                                                             class="fa fa btn-success btn-circle"
                                                                                                             aria-hidden="true"
                                                                                                             title="La medida es adecauada para la Talla"><b> No</b></i></td>
                                        <td>
                                            <button class="btn-sm btn-unique" name="" @click="selectBenefTable(item, index)">Seleccionar</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <!--Table body-->
                                </table>
                            </div>

                            <!-- Datos a mostrar y pedir cuando el usuario elija al beneficiario -->
                            <div class="card" id="mostrarForm" style="display: none">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <i class="fa fa-id-card prefix grey-text"></i>
                                            <label>CURP:</label>
                                            <input class="form-control datos" :value="beneficiarioInstance.curp" readonly>
                                        </div>

                                        <div class="col-md-3">
                                            <i class="fa fa-id-card prefix grey-text"></i>
                                            <label>Folio:</label>
                                            <input class="form-control datos" :value="beneficiarioInstance.folio" readonly>
                                        </div>

                                        <div class="col-md-3">
                                            <div>
                                                <span class="fa fa-graduation-cap prefix grey-text"><label
                                                        for="genero">Género:</label></span>
                                                <input class="form-control datos" readonly
                                                       :value="beneficiarioInstance.genero">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <i class="fa fa-id-card prefix grey-text"></i>
                                            <label>Nombre:</label>
                                            <input readonly class="form-control datos"
                                                   :value="beneficiarioInstance.nombre + ' ' + beneficiarioInstance.apPaterno +  ' ' + beneficiarioInstance.apMaterno">
                                        </div>

                                        <div class="col-md-3">
                                            <div>
                                                <span class="fa fa-graduation-cap prefix grey-text"><label
                                                        for="grado">Grado:</label></span>
                                                <select class="form-control datos" name="grado" id="gradoB"
                                                        v-model="beneficiarioInstance.grado">
                                                    <option value="0" disabled>Seleccione</option>
                                                    <option v-for="grado in listGrados"
                                                            :value="grado.grado">{{grado.descripcion}}</option>
                                                </select>

                                            </div>
                                        </div>

                                        <div class="col-md-3" v-if="centroTrabajo.beneficio == 'ESPECIE'">
                                            <div class="md-form">
                                                <i class="fa fa-arrows-alt prefix grey-text"></i>
                                                <input type="text" id="medida" class="form-control" onkeypress="return filtrardecimal(event,this);"
                                                       v-model="beneficiarioInstance.medida">
                                                <label for="materialFormLoginEmailEx">Medida (cm.):</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-mdb-color" data-dismiss="modal">Cerrar</button>
                                        <button type="button" class="btn btn-unique"
                                                @click="saveMedidas(beneficiarioInstance)">Guardar</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- FORMULARIO PARA AGREGAR UN NUEVO BENEFICIARIO -->

                        <div id="modalFormNewBen" v-show="controlVars.formActive" v-show="controlVars.formActive" class="animated fadeInRightQuick">
                            <div class="row">
                                <div class="col-md-10"></div>

                                <div class="col-md-2 text-right"><button
                                        class="btn-floating btn_purple waves-effect waves-light btn-sm" type="button"
                                        @click="showForm()" style="padding: 0;"><i class="fa fa-undo text-white"></i></button>
                                    <label for="materialFormLoginEmailEx">Regresar</label>

                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-child prefix grey-text"><label for="materialFormLoginEmailEx">Nombre:</label></i>
                                        <input type="text"
                                               class="form-control"
                                               id="name"
                                               onkeypress="return soloLetras(event)"
                                               style="text-transform: uppercase"
                                               v-model="newBen.nombre">

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-id-card  grey-text"> <label for="materialFormLoginEmailEx">Apellido Paterno:</label></i>
                                        <input type="text"
                                               id="Paterno"
                                               class="form-control"
                                               onkeypress="return soloLetras(event)"
                                               style="text-transform: uppercase"
                                               v-model="newBen.apPaterno">

                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-id-card prefix grey-text"> <label for="materialFormLoginEmailEx">Apellido Materno:</label></i>
                                        <input type="text"
                                               id="apMaterno"
                                               class="form-control"
                                               onkeypress="return soloLetras(event)"
                                               style="text-transform: uppercase"
                                               v-model="newBen.apMaterno">

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa-graduation-cap prefix grey-text"><label for="grado">Grado:</label></span>
                                        <select  class="form-control" name="grado" id="" v-model="newBen.grado">
                                            <option v-for="grado in listGrados" :value="grado.grado">{{grado.descripcion}}</option>
                                        </select>
                                    </div>
                                </div>


                            </div>

                            <div class="row">
                                <div class="col-md-6" v-if="centroTrabajo.beneficio == 'ESPECIE'">
                                    <div class="">
                                        <i class="fa fa-arrows-alt prefix grey-text"> <label for="materialFormLoginEmailEx">Medida (cm.):</label></i>
                                        <input type="text" id="medidanewben" class="form-control"  v-model="newBen.medida" class="form-control" onkeypress="return filtrardecimal(event,this);"  >

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa- grey-text"><label
                                                for="genero">Género:</label></span>
                                        <select class="form-control" name="genero" id="genero" v-model="newBen.genero">
                                            <option value="0" disabled>Seleccione</option>
                                            <option value="H">Hombre</option>
                                            <option value="M">Mujer</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <br>

                            <div class="row " id="dataFecha">

                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-birthday-cake  grey-text"><label for="fechaNac">Fecha de Nacimiento:</label></i>
                                        <input type="date" id="datetimepicker_mask1" name="fecNac" class="form-control"
                                               v-model="newBen.fechaNac">
                                    </div>
                                </div>



                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa-graduation-cap  grey-text"><label
                                        >Estado de Nacimiento:</label></span>
                                        <select class="form-control chosen" name="estado" id="estado" v-model="newBen.estado">
                                            <option value="0" disabled>Seleccione un Estado</option>
                                            <option v-for="estado in listEstados"
                                                    :value="estado.id">{{estado.nombre}}</option>
                                        </select>


                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row" >
                                <div class="col-md-6" id="rowcurp">
                                    <div class="">
                                        <i class="fa fa-address-card grey-text"><label id='curpLabel' for="materialFormLoginEmailEx">CURP:</label></i>
                                        <input class="form-control"
                                               type="text"
                                               maxlength="18"
                                               id="curp"
                                               name="curp"
                                               style="text-transform: uppercase"
                                               v-model="newBen.curp"
                                               oninput="validarInput(this)" >

                                        <pre class="resultado" id="resultado"></pre>
                                    </div>
                                </div>
                                <div class="col-md-6" id="rowcheckcurp" >
                                    <div class="row">
                                        <div class="col-md-6 " align="center" >
                                            <div class="md-form " >
                                                %{--style="background-color:lightblue" align="center"--}%
                                                <p class="text-info">No cuento con CURP <b class="text-dark">, Tengo una constancia de Origen y Vecindad</b> Generar Segmento Ra&iacute;z.</p>
                                                %{--<input type="checkbox" align="center" name="checkConstancia" id="checkConstancia" @click="helpCurp()"  @click="validChkConstancia() " v-model="newBen.hasConstancia"/>--}%

                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="">
                                                <br>
                                                <i class="fa fa-repeat" aria-hidden="true"></i>
                                                <button  type="button" class="btn-unique btn-circle" align="center" name="checkConstancia" id="checkConstancia" @click="helpCurp()"
                                                         @click="validChkConstancia() "  :value="newBen.hasconstancia"><i class="fa fa-cogs" aria-hidden="true"></i> </button>

                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-6" id="rowcheckcurpok" style="display: none" >
                                    <div class="row">
                                        <div class="col-md-6 " align="center" >
                                            <div class="" >
                                                <p class="green-text">Si Cuento con una CURP</p>
                                            </div>

                                        </div>
                                        <div >
                                            <br>
                                            <i class="fa fa-repeat" aria-hidden="true"></i>
                                            <button  type="button" class="btn-success btn-circle" align="center"  id="sinConstancia"
                                                     @click="enableConstancia()"   :value="newBen.hasconstancia"><i class="fa fa-check" aria-hidden="true"></i> </button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!--Datos del domicilio-->
                            <br>
                            <h5 align="center" class="mdb-color-ic"><b>Datos de Domicilio</b></h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fas fa-street-view  grey-text"> <label for="materialFormLoginEmailEx">Vialidad</label></i>
                                        <select  class="form-control chosen"  name="vialidad" id="vialidad" v-model="newBen.vialidadId">
                                            <option value="0" disabled>Tipo de Vialidad</option>
                                            <option v-for="vialidad in listVialidades"
                                                    :value="vialidad.id">{{vialidad.vialidad}}</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div >
                                        <i class="fa fa-id-card  grey-text"><label for="materialFormLoginEmailEx">Nombre de Vialidad:</label></i>
                                        <input type="text"
                                               id="calleD"
                                               class="form-control"
                                               style="text-transform: uppercase"
                                               v-model="newBen.valorvialidad">
                                    </div>
                                </div>
                            </div>
                            <div class="row ">
                                <div class="col-md-6">
                                    <div >
                                        <i class="fa fa-sort-numeric-up  grey-text"><label for="materialFormLoginEmailEx">N&uacute;mero Exterior:</label></i>
                                        <input type="text" id="numeroD" class="form-control"  style="text-transform: uppercase" onkeypress="return aceptnumbers(event)"  v-model="newBen.numero">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div >
                                        <i class="fa fa-sort-numeric-down  grey-text"> <label for="materialFormLoginEmailEx">N&uacute;mero Interior:</label></i>
                                        <input type="text" id="numeroInteriorD" class="form-control"  style="text-transform: uppercase" onkeypress="return aceptnumbers(event)"  v-model="newBen.numeroInterior">
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fas fa-street-view  grey-text"> <label for="materialFormLoginEmailEx">Asentamiento</label></i>
                                        <select  class="form-control chosen"  name="asentamiento" id="asentamiento" v-model="newBen.asentamientoId">
                                            <option value="0" disabled>Tipo de Asentamiento</option>
                                            <option v-for="asentamiento in listAsentamientos"
                                                    :value="asentamiento.id">{{asentamiento.asentamiento}}</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div >
                                        <i class="fa fa-map-marker  grey-text">  <span for="materialFormLoginEmailEx">Nombre del Asentamiento </span></i>
                                        <input type="text" id="colonia" class="form-control"  style="text-transform: uppercase" v-model="newBen.valorasentamiento">

                                    </div>

                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-id-card prefix grey-text"> <label for="materialFormLoginEmailEx">Codigo postal:</label></i>
                                        <input type="text" id="codigoPostal" class="form-control" maxlength="5" style="text-transform: uppercase" onkeypress="return aceptnumbers(event)" v-model="newBen.codigoPostal">

                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa-graduation-cap prefix grey-text"><label
                                                for="municipio">Municipio:</label></span>
                                        <select class="form-control" name="municipio" id="municipio" v-model="newBen.municipioId"
                                        %{--@change="loadLocBenef()"--}%
                                        >
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="municipio in listMunicipios"
                                                    :value="municipio.id">{{municipio.municipio}}</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa-graduation-cap grey-text"><label
                                                for="localidad">Localidad:</label></span>
                                        <select class="form-control chosen" name="localidad" id="localidad" v-model="newBen.localidadId" url="${createLink(controller: 'localidad', action: 'getLocalidadByMunicipio')}">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="localidad in listLocalidades"
                                                    :value="localidad.id">{{localidad.label}}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!--Termina Datos del domicilio-->
                            <br>
                            <h5 align="center" class="mdb-color-ic"> <b>Informaci&oacute;n  del Responsable o Tutor </b> </h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-child grey-text"><label for="materialFormLoginEmailEx">Nombre:</label></i>
                                        <input type="text" id="nombreT" class="form-control" onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="newBen.nombreTutor">

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-id-card prefix grey-text"><label for="materialFormLoginEmailEx">Apellido Paterno:</label></i>
                                        <input type="text" id="apPaternoT" class="form-control" onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="newBen.apPaternoTutor">

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-id-card  grey-text"><label for="materialFormLoginEmailEx">Apellido Materno:</label></i>
                                        <input type="text" id="apMaternoT" class="form-control" onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="newBen.apMaternoTutor">

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-address-card grey-text"><label for="materialFormLoginEmailEx">CURP:</label></i>
                                        <input class="form-control" type="text" id="curpT" name="curpT" style="text-transform: uppercase"  v-model="newBen.curpTutor"  maxlength="18">


                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div>
                                        <span class="fa fa-users prefix grey-text"><label for="grado">Parentesco:</label></span>
                                        <select  class="form-control" name="grado" id="parentescoT" v-model="newBen.parentescoTutor" >
                                            <option value="" disabled>Seleccione Parentesco</option>
                                            <option value="PADRE">PADRE</option>
                                            <option value="MADRE">MADRE</option>
                                            <option value="TIA">TIA</option>
                                            <option value="TIO">TIO</option>
                                            <option value="ABUELA">ABUELA</option>
                                            <option value="ABUELO">ABUELO</option>
                                            <option value="HERMANA">HERMANA</option>
                                            <option value="HERMANO">HERMANO</option>
                                            <option value="OTRO">OTRO</option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-briefcase prefix grey-text"><label for="materialFormLoginEmailEx">Ocupaci&oacute;n:</label></i>
                                        <input type="text" id="ocupacionT" class="form-control" onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="newBen.ocupacionTutor">

                                    </div>
                                </div>

                            </div>
                            <div class="row ">
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-phone prefix grey-text"><label for="materialFormLoginEmailEx">Telefono:</label></i>
                                        <input type="text" id="tel"  class="form-control" maxlength="10"  onkeypress="return aceptnumbers(event)"  v-model="newBen.telefonoTutor" >

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="">
                                        <i class="fa fa-envelope prefix grey-text"><label for="materialFormLoginEmailEx">Correo Electrónico:<span class="text-danger" id="result"></span> </label></i>
                                        <input  type="email" id="email"  class="form-control"   v-model="newBen.correoElectronicoTutor" onKeyUp="validateMail('email')" >

                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class=" btn mdb-color-ic" data-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-unique" @click="saveBeneficiario()" >Guardar</button>
                            </div>
                        </div>
                        %{--TERMINA FORMULARIO PARA AGREGAR UN NUEVO BENEFICIARIO--}%


                        <!--TERMINA MODAL PARA REGISTRAR NUEVOS BENEFICIARIOS-->
                    </div>
                </div>
            </div>
        </div>


        <!-- FORMULARIO PARA ACTUALIZAR INFORMACION DEL CENTRO EDUCATIVO -->
        <div class="modal modal fade right show modal-notify modal-info" id="InfDirector" tabindex="-1" role="dialog"
             aria-labelledby="InfDirectorLabel" aria-hidden="true" >
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="InfDirectorLabel" align="center"><b > Actualizaci&oacute;n de informaci&oacute;n del Centro Educativo:</b></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div >
                            <h5 class="mdb-color-ic" align="center">Informaci&oacute;n del centro Educativo</h5>
                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="clavecentro" class="form-control" style="text-transform: uppercase" disabled v-model="datosInfoCentro.claveCentro">
                                    <label for="materialFormLoginEmailEx">Clave: </label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-child prefix grey-text"></i>
                                    <input type="text" id="nombreCentro" class="form-control" onkeypress="return soloLetras(event)" disabled style="text-transform: uppercase" v-model="datosInfoCentro.nombreCentro">
                                    <label for="materialFormLoginEmailEx">Nombre:</label>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div>
                                    <span class="fa fa-graduation-cap prefix grey-text"><label
                                            for="genero">Nivel Educativo:</label></span>
                                    <select class="form-control" name="genero" id="genero" disabled v-model="datosInfoCentro.nivelEducativo">
                                        <option value="0" disabled>Seleccione</option>
                                        <option value="PREESCOLAR">PREESCOLAR</option>
                                        <option value="PRIMARIA">PRIMARIA</option>
                                        <option value="SECUNDARIA">SECUNDARIA</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <span class="fa fa-graduation-cap prefix grey-text"><label
                                        for="turno">Turno:</label></span>
                                <select class="form-control" name="turno" id="turno" v-model="datosInfoCentro.turno" value="MATUTINO ==1 : 2">
                                    <option  value="MATUTINO">MATUTINO</option>
                                    <option value="VESPERTINO">VESPERTINO</option>
                                </select>
                            </div>


                        </div>
                        <br>
                        <div >
                            <h5 class="mdb-color-ic" align="center">Informaci&oacute;n del Director</h5>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-child prefix grey-text"></i>
                                    <input type="text" id="nombre" class="form-control" onkeypress="return soloLetras(event)"  style="text-transform: uppercase" v-model="datosInfoCentro.nombre">
                                    <label for="materialFormLoginEmailEx">Nombre Director:</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="apPaterno" name="apPaterno"
                                           onkeypress="return soloLetras(event)" v-model="datosInfoCentro.apPaterno" style="text-transform: uppercase" >
                                    <label for="materialFormLoginEmailEx">Apellido Paterno:</label>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="apMaterno" name="apMaterno"
                                           onkeypress="return soloLetras(event)" v-model="datosInfoCentro.apMaterno" style="text-transform: uppercase" >
                                    <label for="materialFormLoginEmailEx">Apellido Materno:</label>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="E-mail" name="e-mail" onKeyUp="validateMail('E-mail')"
                                           v-model="datosInfoCentro.correoElectronico" ><span class="text-danger" id="result"></span>
                                    <label for="materialFormLoginEmailEx">Correo Electronico:</label>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="telDir" name="telDir"
                                           onkeypress="return aceptnumbers(event)" v-model="datosInfoCentro.telefonoContacto" >
                                    <label for="materialFormLoginEmailEx">Telefono de Director:</label>

                                </div>
                            </div>
                        </div>
                        %{--termina datos del director--}%
                        <br>

                        <div>
                            <h5 class="mdb-color-ic" align="center">Informaci&oacute;n del presidente de comite de padres de Familia</h5>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-child prefix grey-text"></i>
                                    <input type="text" id="nombreP" class="form-control" onkeypress="return soloLetras(event)"  style="text-transform: uppercase" v-model="datosInfoCentro.nombreP">
                                    <label for="materialFormLoginEmailEx">Nombre:</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="apPaternoP" name="apPaternoP"
                                           onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="datosInfoCentro.apPaternoP" >
                                    <label for="materialFormLoginEmailEx">Apellido Paterno:</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="apMaternoP" name="apMaternoP"
                                           onkeypress="return soloLetras(event)" style="text-transform: uppercase" v-model="datosInfoCentro.apMaternoP" >
                                    <label for="materialFormLoginEmailEx">Apellido Materno:</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="id_email" name="email" onKeyUp="validateMail('id_email')"
                                           v-model="datosInfoCentro.correoElectronicoP" >
                                    <label for="materialFormLoginEmailEx">Correo Electronico:<span class="text-danger" id="result"></span></label>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <i class="fa fa-address-card prefix grey-text"></i>
                                    <input type="text" id="telefonoP" name="telefonoP"
                                           onkeypress="return aceptnumbers(event)" maxlength="10" v-model="datosInfoCentro.telefonoP" >
                                    <label for="materialFormLoginEmailEx">Telefono:</label>
                                </div>
                            </div>
                        </div>
                        %{--termina datos del presidente de padres de familia--}%

                        <div class="modal-footer">
                            <button type="button" class="mdb-color-ic btn btn-outline-default" data-dismiss="modal">Cerrar</button>
                            <g:hiddenField name="urlUpdateDataCenter" value="${createLink(controller: 'centroTrabajo', action: 'updateDatosCentro')}"/>
                            <button type="button" class="btn btn-default" @click="updateInfoCentro(centroTrabajo.idCct)">Guardar</button>
                        </div>

                    </div>
                </div>  <!--fin modal-body-->
            </div>
        </div>
        <!--FIN  FORMULARIO PARA ACTUALIZAR INFORMACION DEL CENTRO EDUCATIVO -->



        <!--MODAL PARA ACTUALIZAR INFORMACION DE SEDE-->
        <div class="modal modal fade right show modal-notify modal-info" id="ModalUpdateSede" tabindex="-1" role="dialog"
             aria-labelledby="ModalUpdateSedeLabel" aria-hidden="true" >
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalUpdateSedeLabel"><b>  Actualizar Informaci&oacute;n de SEDE:</b></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body" >

                        <div class="row">

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-child prefix grey-text"></i>
                                    <input type="text" id="sede" class="form-control" onkeypress="return soloLetras(event)"
                                           style="text-transform: uppercase"
                                           disabled="true"
                                           v-model="datosSede.sede" >
                                    <label for="materialFormLoginEmailEx">Sede:</label>
                                    <input type="hidden" name="id" id="id" v-model="datosSede.id" >

                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="clavesede" class="form-control"
                                           onkeypress="return soloLetras(event)"
                                           style="text-transform: uppercase"
                                           disabled="true"
                                           v-model="datosSede.clavesede">
                                    <label for="materialFormLoginEmailEx">Clave:</label>
                                </div>
                            </div>

                        </div>
                        <div  align="center">
                            <h5 align="center" class="mdb-color-ic"> Datos de Ubicaci&oacute;n
                            </h5>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="calle" class="form-control" style="text-transform: uppercase" v-model="datosSede.calle">
                                    <label for="materialFormLoginEmailEx">Calle:</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="numero" class="form-control"
                                           onkeypress="return aceptnumbers(event)"
                                           style="text-transform: uppercase"
                                           v-model="datosSede.numero">
                                    <label for="materialFormLoginEmailEx">N&uacute;mero Exterior:</label>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="numerointerior" class="form-control"
                                           onkeypress="return aceptnumbers(event)"
                                           style="text-transform: uppercase"
                                           v-model="datosSede.numerointerior">
                                    <label for="materialFormLoginEmailEx">N&uacute;mero Interior:</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" maxlength="5" id="codigopostal" class="form-control"
                                           onkeypress="return aceptnumbers(event)"
                                           style="text-transform: uppercase"
                                           v-model="datosSede.codigopostal">
                                    <label for="materialFormLoginEmailEx">Codigo Postal:</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div>
                                    <span class="fa fa-graduation-cap prefix grey-text"><label
                                            for="mpio">Municipio:</label></span>
                                    <select class="form-control chosen"  id="mpio" v-model="datosSede.municipioId"  @change="loadLocSede()">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="municipio in listMunicipios"
                                                :value="municipio.id">{{municipio.municipio}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div>
                                    <span class="fa fa-graduation-cap prefix grey-text"><label
                                            for="localid">Localidad:</label></span>
                                    <select class="form-control"  id="localid"  url="${createLink(controller: 'localidad', action: 'getLocalidadByMunicipio')}" v-model="datosSede.localidadId">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="localidad in listLocalidades"
                                                :value="localidad.id">{{localidad.label}}</option>
                                    </select>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="text" id="colonia" class="form-control"
                                           onkeypress="return soloLetras(event)"
                                           style="text-transform: uppercase"
                                           v-model="datosSede.colonia">
                                    <label for="materialFormLoginEmailEx">Colonia:</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input type="email" id="email" class="form-control"
                                           onkeypress="return soloLetras(event)"
                                           style="text-transform: uppercase"
                                           v-model="datosSede.correo">
                                    <label for="materialFormLoginEmailEx">@ Correo Electronico de contacto:</label>
                                </div>
                            </div>





                        </div>


                        <div class="row">




                        </div>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="mdb-color-ic btn btn-outline-default" data-dismiss="modal">Cerrar</button>
                        <input type="hidden" name="urlsaveDataSede" id="urlsaveDataSede" url="${createLink(controller: 'sede', action: 'updateDataSede')}">
                        <button type="button" class="btn btn-default" @click="updateDataSede()">Guardar</button>
                    </div>


                </div>  <!--fin modal-body-->
            </div>
        </div>
        <!--TERMINA MODAL PARA ACTUALIZAR INFORMACION DE SEDE-->
        <g:include view="supervisarFormato/formulario_cedula.gsp"></g:include>
        <g:include view="supervisarFormato/tabla_duplicados.gsp"></g:include>
        <g:include view="supervisarFormato/tabla_coincidencias_centros.gsp"></g:include>
        <g:include view="supervisarFormato/formato_salida.gsp"></g:include>
        <g:include view="supervisarFormato/incidencia.gsp"></g:include>

    </div>
    <div class=" row col-md-12">

    </div>
</div>





<asset:javascript src="plugins/bootstrap3-typeahead.js"/>
<asset:javascript src="supervisor/supervisor.js"/>
</body>





</html>