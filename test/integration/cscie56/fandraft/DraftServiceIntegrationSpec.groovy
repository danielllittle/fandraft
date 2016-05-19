package cscie56.fandraft

import grails.test.spock.IntegrationSpec

import java.awt.Color

class DraftServiceIntegrationSpec extends IntegrationSpec {

    League league
    Team team

    def draftService

    def setup() {
        league = new League(drafted: false, name: 'DraftServiceIntegrationSpec', color: Color.black);
        def user = User.findByUsername("testUser")
        team = new Team(manager: user, name: 'teamtest-fs', league: league, draftPosition: 1)
    }

    def cleanup() {
    }

    void "test lock league"() {
        league.draftDate = new Date()

        when: 'a league draft is locked'
        draftService.lockLeague(league)

        then:
        league.draftDate == null

    }

    void "test assign draft order"() {
        league.teams*.draftPosition = 0


        when: 'a league draft order is assigned'
        draftService.assignDraftOrder(league)

        then: 'each teams draft position is set'
        league.teams*.draftPosition != 0

    }

    void "test unlock league"() {
        league.drafted = false

        when: 'a league draft is unlocked'
        draftService.unlockLeague(league)

        then:
        league.drafted == true

    }


}
