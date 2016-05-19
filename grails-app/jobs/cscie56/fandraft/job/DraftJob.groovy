package cscie56.fandraft.job

import grails.plugin.springsecurity.annotation.Secured
import cscie56.fandraft.League
import cscie56.fandraft.DraftService


class DraftJob {

    def draftService

    static triggers = {
        simple name: 'draftTrigger', startDelay: 600000, repeatInterval: 60000  // execute job once in 1 minute
    }

    def group = "FanDraft"
    def description = "Draft job - FanDraft"


    def execute() {
        log.debug('league job fired')
        def leagues = League.findNotDraftedByDraftDateIsNotNullAndDraftDateLessThanEquals(new Date())
        log.debug('leagues found: ' + leagues)
        leagues?.each { league ->
            log.debug('locking league: ' + league)
            draftService.lockLeague(league)
            log.debug('assigning draft order to league: ' + league)
            draftService.assignDraftOrder(league)
            log.debug('drafting league: ' + league)
            draftService.draftPlayers(league)
            log.debug('finished drafting league: ' + league)
            draftService.unlockLeague(league)
        }
    }
}
