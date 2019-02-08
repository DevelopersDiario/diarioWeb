package diario

import seguridad.Usuario

class Publicacion {
    Usuario usuario
    String sentimiento
    String evaluacion
    String analisis
    String conclusion
    String planAccion
    String titulo
    String observaciones
    Publicacion publicacion
    Date dateCreated
    Date lastUpdated


    static constraints = {
        usuario nullable: false
        sentimiento nullable: true
        evaluacion nullable: true
        analisis nullable: true
        conclusion nullable: true
        planAccion nullable: true
        titulo nullable: true
        observaciones nullable: true
        publicacion nullable: false
    }
    static mapping = {
        id generator: 'increment'
    }
}
