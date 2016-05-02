package cscie56.fandraft



import grails.test.mixin.*
import spock.lang.*

@TestFor(DraftPoolController)
@Mock(DraftPool)
class DraftPoolControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.draftPoolInstanceList
            model.draftPoolInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.draftPoolInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def draftPool = new DraftPool()
            draftPool.validate()
            controller.save(draftPool)

        then:"The create view is rendered again with the correct model"
            model.draftPoolInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            draftPool = new DraftPool(params)

            controller.save(draftPool)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/draftPool/show/1'
            controller.flash.message != null
            DraftPool.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def draftPool = new DraftPool(params)
            controller.show(draftPool)

        then:"A model is populated containing the domain instance"
            model.draftPoolInstance == draftPool
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def draftPool = new DraftPool(params)
            controller.edit(draftPool)

        then:"A model is populated containing the domain instance"
            model.draftPoolInstance == draftPool
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/draftPool/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def draftPool = new DraftPool()
            draftPool.validate()
            controller.update(draftPool)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.draftPoolInstance == draftPool

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            draftPool = new DraftPool(params).save(flush: true)
            controller.update(draftPool)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/draftPool/show/$draftPool.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/draftPool/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def draftPool = new DraftPool(params).save(flush: true)

        then:"It exists"
            DraftPool.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(draftPool)

        then:"The instance is deleted"
            DraftPool.count() == 0
            response.redirectedUrl == '/draftPool/index'
            flash.message != null
    }
}
