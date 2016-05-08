package cscie56.fandraft

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(DraftService)
class DraftServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test lock league"() {
        def league = Mock(League)
        league.draftDate = new Date()

        when: 'a league draft is locked'
        service.lockLeague(league)

        then:
        league.draftDate == null

    }

    void "test unlock league"() {
        def league = Mock(League)
        league.drafted = false

        when: 'a league draft is unlocked'
        service.unlockLeague(league)

        then:
        league.drafted == true

    }

    void "test assign draft order"() {
        def league = Mock(League)
        league.teams*.draftPosition = 0


        when: 'a league draft order is assigned'
        service.assignDraftOrder(league)

        then: 'each teams draft position is set'
        league.teams*.draftPosition != 0

    }
}
