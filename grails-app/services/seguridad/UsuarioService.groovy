package seguridad

import grails.converters.JSON
import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional
class UsuarioService {
    def dataSource
    /**
     * Crea un objeto Usuario.
     *
     * @param Usuario : usuarioInstance     Datos de Usuario.
     *
     * @return Usuario: usuarioInstance     Objeto Usuario creada.
     * @return null                             En caso de no poder crear el objeto Usuario.
     */
    def create(Usuario usuarioInstance) throws Exception {
        log.info 'Componente: Usuario, Service: Usuario, Metodo: create, ingresando.'
        if (usuarioInstance.validate() && usuarioInstance.save(flush: true)) {
            log.info 'Componente: Usuario, Service: Usuario, Metodo: create, completado.'
            return usuarioInstance
        }
        log.error 'Componente: Usuario, Service: Usuario, Metodo: create, error.'
        throw new Exception()
        return null
    }
    /**
     * Elimina un objeto de Usuario.
     *
     * @param Usuario : usuarioInstance     Objeto de Usuario a eliminar.
     *
     * @return true                             En caso de eliminado exitoso.
     *
     * @throws null                             En caso de error.
     */
    def delete(Usuario usuarioInstance) throws Exception {
        log.info 'Componente: Usuario, Service: Usuario, Metodo: delete, ingresando.'
        if (!usuarioInstance.delete(flush: true)) {
            log.info 'Componente: Usuario, Service: Usuario, Metodo: delete, completado.'
            return true
        }
        log.error 'Componente: Usuario, Service: Usuario, Metodo: delete, error.'
        throw new Exception()
        return null
    }

    /**
     * Obtiene el objeto Usuario.
     *
     * @param long : UsuarioId       Id de Usuario a buscar.
     *
     * @return Usuario               Objeto Usuario encontrado, null en caso de error.
     *
     */
    Usuario get(long usuarioId) {

        log.info 'Componente: Usuario, Service: Usuario, Metodo: get, completado.'
        return Usuario.get(usuarioId)
    }

    /**
     * Actualiza un objeto de Usuario.
     *
     * @param Usuario : usuarioInstance     Datos de Usuario a actualizar.
     *
     * @return Usuario: usuarioInstance     Objeto Usuario actualizado.
     * @return null                             En caso de no poder actualizar objeto de Usuario.
     */
    def update(Usuario usuarioInstance) throws Exception {
        log.info 'Componente: Usuario, Service: Usuario, Metodo: update, ingresando.'
        if (!usuarioInstance.hasErrors() && usuarioInstance.save(flush: true)) {
            log.info 'Componente: Usuario, Service: Usuario, Metodo: update, completado.'
            return usuarioInstance
        }
        log.error 'Componente: Usuario, Service: Usuario, Metodo: update, error.'
        throw new Exception()
        return null
    }

    def executeQuery(String query) {
        def sql = new Sql(dataSource)
        def rows = sql.rows(query)
        sql.close()
        return rows
    }


}
