package seguridad

import grails.transaction.Transactional

@Transactional
class UsuarioRolService {
    def springSecurityService

    /**
     * Crea un objeto UsuarioRol.
     *
     * @param Usuario : objeto UsuarioInstance.
     * @param Rol : objeto Rolinstance.
     *
     * @return UsuarioRol: UsuariorolInstance     Objeto UsuarioRol creado.
     * @return null                             En caso de no poder crear el objeto UsuarioRol.
     */
    def create(def userInstance, def roleInstance) {
        return UsuarioRol.create(userInstance, roleInstance)
    }

    /**
     * Elimina un objeto de UsuarioRol.
     *
     * @param UsuarioRol : UsuariorolInstance     Objeto de Usuario-Rol a eliminar.
     *
     * @return true                             En caso de eliminado exitoso.
     *
     * @throws null                             En caso de error.
     */
    def delete(UsuarioRol UsuariorolInstance) throws Exception {
        log.info 'Componente: UsuarioRol, Service: UsuarioRol, Metodo: delete, ingresando.'
        if (!UsuariorolInstance.delete(flush: true)) {
            log.info 'Componente: UsuarioRol, Service: UsuarioRol, Metodo: delete, completado.'
            return true
        }
        log.error 'Componente: UsuarioRol, Service: UsuarioRol, Metodo: delete, error.'
        throw new Exception()
        return null
    }
    /**
     * Se busca un objeto usuario-rol por el usuario
     * @param usuario : usuario a buscar
     * @return
     */
    def findByUsuario(Usuario usuario) {
        return UsuarioRol.findByUsuario(usuario)
    }

    /**
     * Devuelve el rol del usuario logueado
     * @return
     */
    def getAuthority() {
        log.info 'Componente: UsuarioRol, Service: UsuarioRol, Metodo: getAuthority, completado.'
        def currentUser = springSecurityService.currentUser
        def authority = UsuarioRol.executeQuery("SELECT ur.rol.authority FROM UsuarioRol ur join ur.usuario as u join ur.rol r WHERE u.username = ?", [currentUser.username])
        return authority
    }


}
