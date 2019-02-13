import seguridad.Rol
import seguridad.Usuario
import seguridad.UsuarioRol

class BootStrap {

    def init = { servletContext ->
      //def rol = Rol.findByAuthority('ROLE_ADMIN')?: new Rol(authority: 'ROLE_ADMIN').save(flush: true)
//        def adminRole = new Rol(authority: 'ROLE_ADMIN').save(flush: true)
//        def userRole = new Rol(authority: 'ROLE_ALUMNO').save(flush: true)
//        def colaboradorRole = new Rol(authority: 'ROLE_COLABORADOR').save(flush: true)
//
/*        def testUser = new Usuario(username: 'Dereckz', password: 'safa2017')
        testUser.save(flush: true)

        UsuarioRol.create testUser, rol, true

        assert Usuario.count() == 1
        assert Rol.count() == 1
        assert UsuarioRol.count() == 1
   */
    }
    def destroy = {
    }
}
