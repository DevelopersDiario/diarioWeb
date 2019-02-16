package amdi

import diario.Persona
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.core.io.ResourceLoader
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_ALUMNO'])


class DashboardController {
    ResourceLoader resourceLoader

    def springSecurityService
    def personaService
    def usuarioRolService

    def index() {}

    def getDatos() {
        def datos
        def currentUser = springSecurityService.currentUser

        def usuarioRol = usuarioRolService.findByUsuario(currentUser)
        if (usuarioRol?.rol?.authority.equals("ROLE_ADMIN")) {
            def persona = Persona.executeQuery("SELECT id, nombre, apPaterno, apMaterno FROM Persona WHERE usuario.id = ? AND enabled = ?", [currentUser.id as long, true]).first()
            datos = [id: persona[0], nombre: persona[1], apPaterno: persona[2], apMaterno: persona[3]]
        }
        render datos as JSON
    }

}












