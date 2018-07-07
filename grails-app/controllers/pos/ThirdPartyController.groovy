package pos



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ThirdPartyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ThirdParty.list(params), model:[thirdPartyInstanceCount: ThirdParty.count()]
    }

    def show(ThirdParty thirdPartyInstance) {
        respond thirdPartyInstance
    }

    def create() {
        respond new ThirdParty(params)
    }

    @Transactional
    def save(ThirdParty thirdPartyInstance) {
        if (thirdPartyInstance == null) {
            notFound()
            return
        }

        if (thirdPartyInstance.hasErrors()) {
            respond thirdPartyInstance.errors, view:'create'
            return
        }

        thirdPartyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'thirdPartyInstance.label', default: 'ThirdParty'), thirdPartyInstance.id])
                redirect thirdPartyInstance
            }
            '*' { respond thirdPartyInstance, [status: CREATED] }
        }
    }

    def edit(ThirdParty thirdPartyInstance) {
        respond thirdPartyInstance
    }

    @Transactional
    def update(ThirdParty thirdPartyInstance) {
        if (thirdPartyInstance == null) {
            notFound()
            return
        }

        if (thirdPartyInstance.hasErrors()) {
            respond thirdPartyInstance.errors, view:'edit'
            return
        }

        thirdPartyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ThirdParty.label', default: 'ThirdParty'), thirdPartyInstance.id])
                redirect thirdPartyInstance
            }
            '*'{ respond thirdPartyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ThirdParty thirdPartyInstance) {

        if (thirdPartyInstance == null) {
            notFound()
            return
        }

        thirdPartyInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ThirdParty.label', default: 'ThirdParty'), thirdPartyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'thirdPartyInstance.label', default: 'ThirdParty'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
