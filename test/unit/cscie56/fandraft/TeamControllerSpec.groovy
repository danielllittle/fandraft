package cscie56.fandraft



import grails.test.mixin.*
import spock.lang.*

@TestFor(TeamController)
@Mock(Team)
class TeamControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.teamInstanceList
            model.teamInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.teamInstance!= null
    }


    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def team = new Team(params)
            controller.show(team)

        then:"A model is populated containing the domain instance"
            model.teamInstance == team
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def team = new Team(params)
            controller.edit(team)

        then:"A model is populated containing the domain instance"
            model.teamInstance == team
    }



}
