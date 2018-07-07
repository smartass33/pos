package pos



import grails.test.mixin.*
import spock.lang.*

@TestFor(OperationController)
@Mock(Operation)
class OperationControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.operationInstanceList
            model.operationInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.operationInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def operation = new Operation()
            operation.validate()
            controller.save(operation)

        then:"The create view is rendered again with the correct model"
            model.operationInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            operation = new Operation(params)

            controller.save(operation)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/operation/show/1'
            controller.flash.message != null
            Operation.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def operation = new Operation(params)
            controller.show(operation)

        then:"A model is populated containing the domain instance"
            model.operationInstance == operation
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def operation = new Operation(params)
            controller.edit(operation)

        then:"A model is populated containing the domain instance"
            model.operationInstance == operation
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/operation/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def operation = new Operation()
            operation.validate()
            controller.update(operation)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.operationInstance == operation

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            operation = new Operation(params).save(flush: true)
            controller.update(operation)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/operation/show/$operation.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/operation/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def operation = new Operation(params).save(flush: true)

        then:"It exists"
            Operation.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(operation)

        then:"The instance is deleted"
            Operation.count() == 0
            response.redirectedUrl == '/operation/index'
            flash.message != null
    }
}
