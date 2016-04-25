package cscie56.fandraft

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Team)
class TeamSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test blank input"() {


        when: 'a team is valid'

        def team = new Team (name: 'teamname', draftPosition: 1, owner: Mock(User), league: Mock(League))

        then: 'validate() returns true and there are no errors'

        team.validate()
        !team.hasErrors()
        team.errors.errorCount == 0

        when: 'team input is blank'

        team.name = ''
        team.owner = null
        team.league = null

        then: 'validate() returns false and there is an error'

        !team.validate()
        team.hasErrors()
        team.errors.errorCount == 3
    }

    void "test draft order"() {


        when: 'an team is valid'

        def team = new Team (name: 'teamname', draftPosition: 1, owner: Mock(User), league: Mock(League))

        then: 'validate() returns true and there are no errors'

        team.validate()
        !team.hasErrors()
        team.errors.errorCount == 0

        when: 'team draft order is invalid'

        team.draftPosition = 0

        then: 'validate() returns false and there is an error'

        !team.validate()
        team.hasErrors()
        team.errors.errorCount == 1

    }
}
