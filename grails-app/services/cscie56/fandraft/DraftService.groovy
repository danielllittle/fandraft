package cscie56.fandraft

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional
class DraftService {

    @Secured(['ROLE_ADMIN'])
    def assignDraftOrder(League league) {
        def order = [1..league.teams.size()]
        Collections.shuffle(order)
        league.teams*.draftPosition = order.pop()
    }
}
