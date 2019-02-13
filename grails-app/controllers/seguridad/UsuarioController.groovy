package seguridad

import diario.Persona
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import seguridad.Rol
import seguridad.Usuario
import seguridad.UsuarioRol

class UsuarioController {
    def usuarioService

    def index() {}
    /**
     * Crear el objeto usuario.
     * @param username : Nombre del usuario a crear.
     * @params password: contraseña del usuario a crear
     * @return true caso satisfactorio: false caso contrario.
     */
    def save() {
        try {
            UsuarioRol.withTransaction { status ->
                if (usuarioService.findByUsername(params.username.toUpperCase()))
                    throw new Exception("El nombre del usuario ${params.username.toUpperCase()} ya existe")
                Usuario usuarioInstance = new Usuario()
                usuarioInstance.username = params.username.toUpperCase()
                usuarioInstance.password = params.password
                usuarioInstance.enabled = true
                if (params.password != params.confirm)
                    throw new Exception("La contraseña no coincide con la anterior, vuelva a escribirla!")
                usuarioService.create(usuarioInstance)

                def rolInstance = Rol.get(2 as long)
                UsuarioRol.findByRolAndUsuario(rolInstance, usuarioInstance) ?: new UsuarioRol(usuario: usuarioInstance, rol: rolInstance).save(flush: true)

                if (params.rol == '2') {
                    def user = Usuario.executeQuery("SELECT u FROM Usuario as u WHERE u.username = ?", [usuarioInstance.username]);
                    if (user.size() > 1) {
                        throw new Exception("Favor de verificar, el suasuario ${params.username.toUpperCase()} ya existe")
                    } else {
                        Persona persona = new Persona()
                        persona.nombre = params.nombre ? params.nombre.toUpperCase() : '--'
                        persona.apPaterno = params.appaterno ? params.appaterno.toUpperCase() : '---'
                        persona.apMaterno = params.apmaterno ? params.apmaterno.toUpperCase() : '--'
                        persona.correoElectronico = params.correo ? params.correo : '--'
                        persona.telefono = params.telefono ? params.telefono : '---'
                        persona.telefonoOpcional = params.telopcional ? params.telopcional : '---'
                        persona.enabled = true
                        persona.usuario = usuarioInstance
                        usuarioService.create(persona)
                    }
                }

            }
            def data = [message: "Se creó correctamente el usuario ", type: "Satisfactorio", success: true]
            render data as JSON
        } catch (Exception e) {
            def data = [message: "Ocurrio un error al crear el usuario! " + e.getMessage(), type: "Error", success: false]
            render data as JSON
        }
    }
}
