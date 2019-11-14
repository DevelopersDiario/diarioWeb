package amdi

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_ALUMNO'])

class PerfilController {
    def personaService
    def usuarioService
    def springSecurityService

    def index() {}
    /**
     * Devuelve los datos del perfil
     * @return
     */
    def getPerfil() {
        def currentUser = springSecurityService.currentUser
        def personal = personaService.findByUsuario(currentUser)
        def datosperfil = [id       : personal?.id, username: currentUser?.username, password: '', nombre: personal.nombre, apPaterno: personal.apPaterno,
                           apMaterno: personal.apMaterno, correoElectronico: personal.correoElectronico]
        render datosperfil as JSON
    }
}
