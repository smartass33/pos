package pos



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BankConfigurationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BankConfiguration.list(params), model:[bankConfigurationInstanceCount: BankConfiguration.count()]
    }

    def show(BankConfiguration bankConfigurationInstance) {
        respond bankConfigurationInstance
    }

    def create() {
        respond new BankConfiguration(params)
    }

    @Transactional
    def save(BankConfiguration bankConfigurationInstance) {
		params.each{i->log.error('parameter of list: '+i)}
        if (bankConfigurationInstance == null) {
            notFound()
            return
        }
		
		bankConfigurationInstance.creationDate = new Date()
		bankConfigurationInstance.validate()

        if (bankConfigurationInstance.hasErrors()) {
            respond bankConfigurationInstance.errors, view:'create'
            return
        }

        bankConfigurationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bankConfigurationInstance.label', default: 'BankConfiguration'), bankConfigurationInstance.id])
                redirect bankConfigurationInstance
            }
            '*' { respond bankConfigurationInstance, [status: CREATED] }
        }
    }

    def edit(BankConfiguration bankConfigurationInstance) {
        respond bankConfigurationInstance
    }

    @Transactional
    def update(BankConfiguration bankConfigurationInstance) {
        if (bankConfigurationInstance == null) {
            notFound()
            return
        }

        if (bankConfigurationInstance.hasErrors()) {
            respond bankConfigurationInstance.errors, view:'edit'
            return
        }

        bankConfigurationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BankConfiguration.label', default: 'BankConfiguration'), bankConfigurationInstance.id])
                redirect bankConfigurationInstance
            }
            '*'{ respond bankConfigurationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BankConfiguration bankConfigurationInstance) {

        if (bankConfigurationInstance == null) {
            notFound()
            return
        }

        bankConfigurationInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BankConfiguration.label', default: 'BankConfiguration'), bankConfigurationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bankConfigurationInstance.label', default: 'BankConfiguration'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
