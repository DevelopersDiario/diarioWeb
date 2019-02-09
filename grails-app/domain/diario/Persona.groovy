package diario

import seguridad.Usuario

class Persona {
    String nombre
    String apPaterno
    String apMaterno
    String strcuenta
    String foto
    String fotoPortada
    String correoElectronico
    String telefono
    String telefonoOpcional
    Usuario usuario
    Date dateCreated
    Date lastUpdated
    Boolean enabled

    static constraints = {
        nombre nullable: true
        apPaterno nullable: true
        apMaterno nullable: true
        strcuenta nullable: false
        foto nullable: true
        fotoPortada nullable: false
        correoElectronico nullable: true
        usuario nullable: false
        telefono nullable: true
        telefonoOpcional nullable: true
    }
    static mapping = {
        id generator: 'increment'
    }
}