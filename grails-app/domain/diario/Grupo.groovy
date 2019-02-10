package diario

class Grupo {
    String nombreGrupo

    static hasMany = [colaboradores: Persona]


    static constraints = {
    }
}
