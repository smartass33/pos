package pos



import grails.test.mixin.*
import spock.lang.*

@TestFor(BankPaymentMethodConfigurationController)
@Mock(BankPaymentMethodConfiguration)
class BankPaymentMethodConfigurationControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.bankPaymentMethodConfigurationInstanceList
            model.bankPaymentMethodConfigurationInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.bankPaymentMethodConfigurationInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def bankPaymentMethodConfiguration = new BankPaymentMethodConfiguration()
            bankPaymentMethodConfiguration.validate()
            controller.save(bankPaymentMethodConfiguration)

        then:"The create view is rendered again with the correct model"
            model.bankPaymentMethodConfigurationInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            bankPaymentMethodConfiguration = new BankPaymentMethodConfiguration(params)

            controller.save(bankPaymentMethodConfiguration)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/bankPaymentMethodConfiguration/show/1'
            controller.flash.message != null
            BankPaymentMethodConfiguration.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def bankPaymentMethodConfiguration = new BankPaymentMethodConfiguration(params)
            controller.show(bankPaymentMethodConfiguration)

        then:"A model is populated containing the domain instance"
            model.bankPaymentMethodConfigurationInstance == bankPaymentMethodConfiguration
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def bankPaymentMethodConfiguration = new BankPaymentMethodConfiguration(params)
            controller.edit(bankPaymentMethodConfiguration)

        then:"A model is populated containing the domain instance"
            model.bankPaymentMethodConfigurationInstance == bankPaymentMethodConfiguration
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/bankPaymentMethodConfiguration/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def bankPaymentMethodConfiguration = new BankPaymentMethodConfiguration()
            bankPaymentMethodConfiguration.validate()
            controller.update(bankPaymentMethodConfiguration)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.bankPaymentMethodConfigurationInstance == bankPaymentMethodConfiguration

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            bankPaymentMethodConfiguration = new BankPaymentMethodConfiguration(params).save(flush: true)
            controller.update(bankPaymentMethodConfiguration)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/bankPaymentMethodConfiguration/show/$bankPaymentMethodConfiguration.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/bankPaymentMethodConfiguration/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def bankPaymentMethodConfiguration = new BankPaymentMethodConfiguration(params).save(flush: true)

        then:"It exists"
            BankPaymentMethodConfiguration.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(bankPaymentMethodConfiguration)

        then:"The instance is deleted"
            BankPaymentMethodConfiguration.count() == 0
            response.redirectedUrl == '/bankPaymentMethodConfiguration/index'
            flash.message != null
    }
}
