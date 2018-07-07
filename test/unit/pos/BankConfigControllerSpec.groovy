package pos



import grails.test.mixin.*
import spock.lang.*

@TestFor(BankConfigController)
@Mock(BankConfig)
class BankConfigControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.bankConfigInstanceList
            model.bankConfigInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.bankConfigInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def bankConfig = new BankConfig()
            bankConfig.validate()
            controller.save(bankConfig)

        then:"The create view is rendered again with the correct model"
            model.bankConfigInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            bankConfig = new BankConfig(params)

            controller.save(bankConfig)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/bankConfig/show/1'
            controller.flash.message != null
            BankConfig.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def bankConfig = new BankConfig(params)
            controller.show(bankConfig)

        then:"A model is populated containing the domain instance"
            model.bankConfigInstance == bankConfig
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def bankConfig = new BankConfig(params)
            controller.edit(bankConfig)

        then:"A model is populated containing the domain instance"
            model.bankConfigInstance == bankConfig
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/bankConfig/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def bankConfig = new BankConfig()
            bankConfig.validate()
            controller.update(bankConfig)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.bankConfigInstance == bankConfig

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            bankConfig = new BankConfig(params).save(flush: true)
            controller.update(bankConfig)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/bankConfig/show/$bankConfig.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/bankConfig/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def bankConfig = new BankConfig(params).save(flush: true)

        then:"It exists"
            BankConfig.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(bankConfig)

        then:"The instance is deleted"
            BankConfig.count() == 0
            response.redirectedUrl == '/bankConfig/index'
            flash.message != null
    }
}
