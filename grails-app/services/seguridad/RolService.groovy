package seguridad

import grails.transaction.Transactional

@Transactional
class RolService { /**
 * Crea un objeto Rol.
 *
 * @param Rol : rolInstance     Datos de Rol.
 *
 * @return Rol: rolInstance     Objeto Rol creada.
 * @return null       En caso de no poder crear el objeto Rol.
 */
    def create(Rol rolInstance) throws Exception {
        log.info 'Componente: Rol, Service: Rol, Metodo: create, ingresando.'
        if (rolInstance.validate() && rolInstance.save(flush: true)) {
            log.info 'Componente: Rol, Service: Rol, Metodo: create, completado.'
            return rolInstance
        }
        log.error 'Componente: Rol, Service: Rol, Metodo: create, error.'
        throw new Exception()
        return null
    }

    /**
     * Elimina un objeto de Rol.
     *
     * @param Rol : rolInstance     Objeto de Rol a eliminar.
     *
     * @return true                             En caso de eliminado exitoso.
     *
     * @throws null                             En caso de error.
     */
    def delete(Rol rolInstance) throws Exception {
        log.info 'Componente: Rol, Service: Rol, Metodo: delete, ingresando.'
        if (!rolInstance.delete(flush: true)) {
            log.info 'Componente: Rol, Service: Rol, Metodo: delete, completado.'
            return true
        }
        log.error 'Componente: Rol, Service: Rol, Metodo: delete, error.'
        throw new Exception()
        return null
    }

    /**
     * Obtiene el objeto Rol.
     *
     * @param long : RolId       Id de Rol a buscar.
     *
     * @return Rol               Objeto Rol encontrado, null en caso de error.
     *
     */
    Rol get(long rolId) {
        log.info 'Componente: Rol, Service: Rol, Metodo: get, completado.'
        return Rol.get(rolId)
    }
    /**
     * Actualiza un objeto de Rol.
     *
     * @param Rol : rolInstance     Datos de Rol a actualizar.
     *
     * @return Rol: rolInstance     Objeto Rol actualizado.
     * @return null                             En caso de no poder actualizar objeto de Rol.
     */
    def update(Rol rolInstance) throws Exception {
        log.info 'Componente: Rol, Service: Rol, Metodo: update, ingresando.'
        if (!rolInstance.hasErrors() && rolInstance.save(flush: true)) {
            log.info 'Componente: Rol, Service: Rol, Metodo: update, completado.'
            return rolInstance
        }
        log.error 'Componente: Rol, Service: Rol, Metodo: update, error.'
        throw new Exception()
        return null
    }

}//fin de clase RolService
