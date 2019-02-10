package amdi

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class PublicacionController {

    def index() {}
}
