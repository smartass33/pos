package pos



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BankPaymentMethodConfigurationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BankPaymentMethodConfiguration.list(params), model:[bankPaymentMethodConfigurationInstanceCount: BankPaymentMethodConfiguration.count()]
    }

    def show(BankPaymentMethodConfiguration bankPaymentMethodConfigurationInstance) {
        respond bankPaymentMethodConfigurationInstance
    }

    def create() {
        respond new BankPaymentMethodConfiguration(params)
    }

    @Transactional
    def save(BankPaymentMethodConfiguration bankPaymentMethodConfigurationInstance) {
        if (bankPaymentMethodConfigurationInstance == null) {
            notFound()
            return
        }

		bankPaymentMethodConfigurationInstance.creationDate = new Date()
		bankPaymentMethodConfigurationInstance.validate()
		
        if (bankPaymentMethodConfigurationInstance.hasErrors()) {
            respond bankPaymentMethodConfigurationInstance.errors, view:'create'
            return
        }

        bankPaymentMethodConfigurationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bankPaymentMethodConfigurationInstance.label', default: 'BankPaymentMethodConfiguration'), bankPaymentMethodConfigurationInstance.id])
                redirect bankPaymentMethodConfigurationInstance
            }
            '*' { respond bankPaymentMethodConfigurationInstance, [status: CREATED] }
        }
    }

    def edit(BankPaymentMethodConfiguration bankPaymentMethodConfigurationInstance) {
        respond bankPaymentMethodConfigurationInstance
    }

    @Transactional
    def update(BankPaymentMethodConfiguration bankPaymentMethodConfigurationInstance) {
        if (bankPaymentMethodConfigurationInstance == null) {
            notFound()
            return
        }

        if (bankPaymentMethodConfigurationInstance.hasErrors()) {
            respond bankPaymentMethodConfigurationInstance.errors, view:'edit'
            return
        }

        bankPaymentMethodConfigurationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BankPaymentMethodConfiguration.label', default: 'BankPaymentMethodConfiguration'), bankPaymentMethodConfigurationInstance.id])
                redirect bankPaymentMethodConfigurationInstance
            }
            '*'{ respond bankPaymentMethodConfigurationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BankPaymentMethodConfiguration bankPaymentMethodConfigurationInstance) {

        if (bankPaymentMethodConfigurationInstance == null) {
            notFound()
            return
        }

        bankPaymentMethodConfigurationInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BankPaymentMethodConfiguration.label', default: 'BankPaymentMethodConfiguration'), bankPaymentMethodConfigurationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bankPaymentMethodConfigurationInstance.label', default: 'BankPaymentMethodConfiguration'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
