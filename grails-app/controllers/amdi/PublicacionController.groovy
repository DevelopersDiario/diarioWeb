package amdi

import diario.Persona
import diario.Publicacion
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import seguridad.Rol
import seguridad.Usuario
import seguridad.UsuarioRol

@Secured(['ROLE_ADMIN', 'ROLE_ALUMNO'])
class PublicacionController {
    def springSecurityService
    def usuarioRolService
    def publicacionService

    def index() {}

    def savePublicacion() {
        try {
            if (!params.titulo)
                throw new Exception("debe Ingresar almenos el titulo de la publicacion")
            def currentUser = springSecurityService.currentUser
            //def usuarioRol = usuarioRolService.findByUsuario(currentUser)
            Publicacion publicacion = new Publicacion()
            publicacion.titulo = params.titulo ? params.titulo : ''
            publicacion.sentimiento = params.sentimiento ? params.sentimiento : ''
            publicacion.evaluacion = params.evaluacion ? params.evaluacion : ''
            publicacion.analisis = params.analisis ? params.analisis : ''
            publicacion.conclusion = params.conclusion ? params.conclusion : ''
            publicacion.planAccion = params.planAccion ? params.planAccion : ''
            publicacion.observaciones = params.observaciones ? params.observaciones : ''
            publicacion.active = true
            publicacion.dateCreated = new Date()
            publicacion.lastUpdated = new Date()
            publicacion.usuario = currentUser
            publicacionService.create(publicacion)
            def data = [message: "Se creó correctamente la publicación ", type: "Satisfactorio", success: true]
            render data as JSON
        } catch (Exception e) {
            def data = [message: "Ocurrio un error al crear el usuario! " + e.getMessage(), type: "Error", success: false]
            render data as JSON
        }
    }


}
