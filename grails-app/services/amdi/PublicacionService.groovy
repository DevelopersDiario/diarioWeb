package amdi

import diario.Publicacion
import grails.transaction.Transactional

@Transactional
class PublicacionService {

    /**
     * Crea un objeto de Publicacion.
     *
     * @param Publicacion : PublicacionInstance  Datos de Publicacion a crear.
     *
     * @return Publicacion: PublicacionInstance     Objeto Publicacion creado.
     * @return null                           En caso de no poder crear objeto de Publicacion.
     */
    def create(Publicacion publicacionInstance) throws Exception {
        log.info 'Componente: Publicacion, Service: Publicacion, Metodo: create, ingresando.'
        if (!publicacionInstance.hasErrors() && publicacionInstance.save(flush: true)) {
            log.info 'Componente: Publicacion, Service: Publicacion, Metodo: create, completado.'
            return publicacionInstance
        }
        log.error 'Componente: Publicacion, Service: Publicacion, Metodo: create, error.'
        throw new Exception()
        return null
    }
}
