package amdi

import groovy.sql.Sql
import diario.Persona
import grails.transaction.Transactional

@Transactional
class PersonaService {
    def dataSource
    /**
     * Crea un objeto de Persona.
     *
     * @param Persona : PersonaInstance  Datos de Persona a crear.
     *
     * @return Persona: PersonaInstance     Objeto Persona creado.
     * @return null                           En caso de no poder crear objeto de Persona.
     */
    def create(Persona personaInstance) throws Exception {
        log.info 'Componente: Persona, Service: Persona, Metodo: create, ingresando.'
        if (!personaInstance.hasErrors() && personaInstance.save(flush: true)) {
            log.info 'Componente: Persona, Service: Persona, Metodo: create, completado.'
            return personaInstance
        }
        log.error 'Componente: Persona, Service: Persona, Metodo: create, error.'
        throw new Exception()
        return null
    }
}
