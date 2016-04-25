package cscie56.fandraft

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(League)
class LeagueSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test blank input"() {
        when: 'an object is valid'
        def mgr = Mock(User)
        def league = new League(name: 'cscieleague', draftDate: new Date(), manager: mgr )

        then: 'validate() returns true and there are no errors'

        if (!league.validate()) league.errors.allErrors.each{println it} else println "validated " + league
        league.validate()
        !league.hasErrors()
        league.errors.errorCount == 0

        when: 'an object is blank'
        league.name = ''
        league.draftDate = null
        league.manager = null

        then: 'validate() returns false and the appropriate error is created'
        !league.validate()
        league.hasErrors()
        league.errors.errorCount == 3
    }
}
