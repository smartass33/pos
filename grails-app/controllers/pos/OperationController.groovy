package pos



import static org.springframework.http.HttpStatus.*

import java.util.Date;

import grails.converters.JSON
import grails.transaction.Transactional

import javax.servlet.http.HttpServletRequest

import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import uk.co.desirableobjects.ajaxuploader.exception.FileUploadException

@Transactional(readOnly = true)
class OperationController {

	def ajaxUploaderService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Operation.list(params), model:[operationInstanceCount: Operation.count()]
    }

    def show(Operation operationInstance) {
        respond operationInstance
    }

    def create() {
        respond new Operation(params)
    }

    @Transactional
    def save(Operation operationInstance) {
		params.each{i->log.error('parameter of list: '+i)}

        if (operationInstance == null) {
            notFound()
            return
        }

		// the thirdparty is unknown: need to create it.
		if (params['thirdPartyNew'] !=null && params['thirdPartyNew'].size() > 0){
			ThirdParty newThirdParty = new ThirdParty(params['thirdPartyNew'])
			newThirdParty.save flush:true
			operationInstance.thirdParty = newThirdParty
		}
		
        if (operationInstance.hasErrors()) {
            respond operationInstance.errors, view:'create'
            return
        }


		
		
        operationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'operationInstance.label', default: 'Operation'), operationInstance.id])
                redirect operationInstance
            }
            '*' { respond operationInstance, [status: CREATED] }
        }
    }

    def edit(Operation operationInstance) {
        respond operationInstance
    }

    @Transactional
    def update(Operation operationInstance) {
        if (operationInstance == null) {
            notFound()
            return
        }

        if (operationInstance.hasErrors()) {
            respond operationInstance.errors, view:'edit'
            return
        }

        operationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Operation.label', default: 'Operation'), operationInstance.id])
                redirect operationInstance
            }
            '*'{ respond operationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Operation operationInstance) {

        if (operationInstance == null) {
            notFound()
            return
        }

        operationInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Operation.label', default: 'Operation'), operationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'operationInstance.label', default: 'Operation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	private InputStream selectInputStream(HttpServletRequest request) {
		if (request instanceof MultipartHttpServletRequest) {
			MultipartFile uploadedFile = ((MultipartHttpServletRequest) request).getFile('importfile')
			return uploadedFile.inputStream
		}
		return request.inputStream
	}
	def importOperation = {
		log.error('importOperation called')
		// to be done by site --> each site has its own bank!!!!
		def site
		def settings = [separatorChar:';','charset':'windows-1252']
		def criteria
		def accountNumber
		def operationEffectiveValueDate
		def operationDate
		def operationLabel
		def reference
		def valueDate
		def amount
		def operation
		def nature
		
		//def bankName = params['bankName']
		def bankName = 'BPACA'
		
		def bank = Bank.findByName(bankName)
		def bankPaymentMethodConfigList = BankPaymentMethodConfiguration.findAllByBank(bank)
		def bankMethodConfiguration = BankConfiguration.findByBank(bank)
		log.error('done')
		// need to save order of the fields

		//Operation(def paymentMethod, def nature, def operationDate, def account, def amount, def justification, def status){
			

		
		
	
		
		
		try {
			File uploaded = File.createTempFile('grails', 'ajaxupload')
			InputStream inputStream = selectInputStream(request)

			ajaxUploaderService.upload(inputStream, uploaded)
			uploaded.toCsvReader(settings).eachLine { tokens ->
				log.error("tokens: "+tokens)
				accountNumber = tokens[0]
				operationEffectiveValueDate = tokens[1]
				operationDate = tokens[2]
				operationLabel = tokens[3]
				reference = tokens[4]
				valueDate = tokens[5]
				
				if ((tokens[6]).contains(',')){
					amount = (tokens[6]).replace(',','.')
				}
				
				
				operation = new Operation()
				
				ThirdParty thirdParty 
				
				if (amount.contains('-')){
					operation.nature = Nature.DEBIT
					operation.amount = amount.drop(1) as double
				}else{
					operation.nature = Nature.CREDIT
					operation.amount = amount as double
				}
				//paymentMethod = 
				
				for (BankPaymentMethodConfiguration paymentConf in bankPaymentMethodConfigList){
					if (operationLabel.startsWith(paymentConf.methodString)){
						operation.paymentMethod = paymentConf.paymentMethod
						operation.description = (operationLabel.split(paymentConf.methodString))[1] //operationLabel.trim(paymentConf.methodString as String)   
						operation.account = paymentConf.account
						thirdParty = ThirdParty.findByName(operation.description)
						if (thirdParty == null){
							thirdParty = new ThirdParty(operation.description)
							thirdParty.save flush:true
						}
						operation.thirdParty = thirdParty
						
						break;
					}
				}
				operation.operationDate = new Date().parse("dd/MM/yyyy", operationDate)
				operation.entryDate = new Date()
				
				operation.save flush:true
			}
			return render(text: [success:true] as JSON, contentType:'text/json')
		} catch (FileUploadException e) {
			log.error("Failed to upload file.", e)
			return render(text: [success:false] as JSON, contentType:'text/json')
		}
	}
	
	

}
