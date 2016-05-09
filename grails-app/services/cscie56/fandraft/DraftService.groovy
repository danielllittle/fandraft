package cscie56.fandraft

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional
@Secured(['ROLE_ADMIN'])
class DraftService {


    def assignDraftOrder(League league) {
        List<Integer> order = (1..league.teams?.size())?.flatten()
        if (order) {
            Collections.shuffle(order)
            league.teams.each {it.draftPosition = order.pop()}
        }

    }


    def lockLeague(League league) {
        league.draftDate = null
    }

    def unlockLeague(League league) {
        league.drafted = true
        league.save(flush: true, failOnError: true)
    }

    def draftPlayers(League league) {
        def draftBoards = initDraftBoards(league)
        (league.size * league.roster.size).times { it ->
            def teamIdx = it % league.size
            if (it.intdiv(league.size) % 2 == 1 ) {
                teamIdx = league.size - teamIdx - 1//snake on odd rounds (zero based index)
            }

            print ("drafting round#"+(it.intdiv(league.size)+1 + " pick#"+it + " idx#" + teamIdx ))
            Team team = league.teams.find {tm->tm.draftPosition == teamIdx + 1}
            print (" team picking:" + team + " poolSize:"+team.draftBoard.size())
            assert (team != null)
            def teamDraftPicks = draftBoards[team]
            print (" #posneeded: " + teamDraftPicks.size())
            def player = team.draftBoard.find {teamDraftPicks.contains(it.position)}
            print (" team drafted:" + player)
            teamDraftPicks.remove(player.position)
            league.teams*.removeFromDraftBoard(player)
            team.addToPlayers(player)
        }
        league.teams.each{println it}
    }

    def initDraftBoards(League league) {
        league.teams.collectEntries { [(it) : league.roster.clone()] }
    }

}
