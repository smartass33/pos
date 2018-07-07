package pos



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PaymentMethodController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PaymentMethod.list(params), model:[paymentMethodInstanceCount: PaymentMethod.count()]
    }

    def show(PaymentMethod paymentMethodInstance) {
        respond paymentMethodInstance
    }

    def create() {
        respond new PaymentMethod(params)
    }

    @Transactional
    def save(PaymentMethod paymentMethodInstance) {
        if (paymentMethodInstance == null) {
            notFound()
            return
        }

        if (paymentMethodInstance.hasErrors()) {
            respond paymentMethodInstance.errors, view:'create'
            return
        }

        paymentMethodInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'paymentMethodInstance.label', default: 'PaymentMethod'), paymentMethodInstance.id])
                redirect paymentMethodInstance
            }
            '*' { respond paymentMethodInstance, [status: CREATED] }
        }
    }

    def edit(PaymentMethod paymentMethodInstance) {
        respond paymentMethodInstance
    }

    @Transactional
    def update(PaymentMethod paymentMethodInstance) {
        if (paymentMethodInstance == null) {
            notFound()
            return
        }

        if (paymentMethodInstance.hasErrors()) {
            respond paymentMethodInstance.errors, view:'edit'
            return
        }

        paymentMethodInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PaymentMethod.label', default: 'PaymentMethod'), paymentMethodInstance.id])
                redirect paymentMethodInstance
            }
            '*'{ respond paymentMethodInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PaymentMethod paymentMethodInstance) {

        if (paymentMethodInstance == null) {
            notFound()
            return
        }

        paymentMethodInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PaymentMethod.label', default: 'PaymentMethod'), paymentMethodInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentMethodInstance.label', default: 'PaymentMethod'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
