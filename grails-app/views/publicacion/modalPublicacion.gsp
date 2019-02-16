<%--
  Created by IntelliJ IDEA.
  User: benyamin
  Date: 09/02/2019
  Time: 01:28 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">¿Qu&eacute; ocurri&oacute; hoy?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="modal-body mx-3">
        <div class="md-form mb-12">
          <i class="fas fa-book-reader prefix grey-text">
          <label data-error="wrong" data-success="right">Titulo &oacute; tema:</label></i>
          <input type="text"  class="form-control validate"  v-model="publicacion.titulo">
        </div>
        <div class="md-form mb-12">
          <label data-error="wrong" data-success="right" class="prefix grey-text" >¿Qu&eacute; est&aacute; pasando? <i class="fas fa-comment"></i></label>
          <input  id="defaultForm-pass" class="form-control validate" v-model="publicacion.sentimiento">
        </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" @click="savePublicacion()">Publicar</button>
            </div>
        </div>
    </div>
</div>