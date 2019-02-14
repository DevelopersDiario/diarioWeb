<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-info align-content-center" id="modalTitleRegister">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form id="sign up">

                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" v-model="user.username"
                               placeholder="Correo">
                    </div>

                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" class="form-control" id="password2" v-model="user.password"
                               placeholder="Contraseña">
                    </div>

                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" class="form-control" v-model="user.confirm"
                               placeholder="Confirme Contraseña">
                    </div>

                    <div class="form-group">
                        <button class="btn btn-lg btn-primary btn-block btn-signin" @click="saveUsuario()"
                                type="submit">Sign in</button>
                    </div>
                </form>
            </div>

        </div>
    </div>

</div>
