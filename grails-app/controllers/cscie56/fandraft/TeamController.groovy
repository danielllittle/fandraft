package cscie56.fandraft

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class TeamController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Team.list(params), model:[teamInstanceCount: Team.count()]
    }

    def myindex(User userInstance) {
        def max = 10
        params.max = Math.min(max ?: 10, 100)
        respond Team.findAllByOwner(userInstance), model:[teamInstanceCount: Team.findAllByOwner(userInstance)]

    }

    def show(Team teamInstance) {
        respond teamInstance
    }

    def create() {
        respond new Team(params)
    }

    @Transactional
    def save(Team teamInstance) {
        if (teamInstance == null) {
            notFound()
            return
        }

        if (teamInstance.hasErrors()) {
            respond teamInstance.errors, view:'create'
            return
        }

        teamInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.id])
                redirect teamInstance
            }
            '*' { respond teamInstance, [status: CREATED] }
        }
    }

    def edit(Team teamInstance) {
        respond teamInstance
    }

    @Transactional
    def ajaxedit(Team teamInstance) {
        if (teamInstance == null) {
            notFound()
            return
        }
        List<Player> newOrderDraft = new LinkedList<Player>()
        def ids = params.draftOrder.split(',')
        ids?.each { playerid ->
            Player player = teamInstance.draftBoard.find{it.playerID == playerid}
            newOrderDraft.add(player)
        }
        /*newOrderDraft.each { indPlayer ->
            println 'adding ' + indPlayer
            teamInstance.draftBoardaddToDraftBoard(indPlayer)
        }*/
        teamInstance.draftBoard = newOrderDraft
        render status: NO_CONTENT 
    }

    @Transactional
    def update(Team teamInstance) {
        if (teamInstance == null) {
            notFound()
            return
        }

        if (teamInstance.hasErrors()) {
            respond teamInstance.errors, view:'edit'
            return
        }

        teamInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Team.label', default: 'Team'), teamInstance.id])
                redirect teamInstance
            }
            '*'{ respond teamInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Team teamInstance) {

        if (teamInstance == null) {
            notFound()
            return
        }

        teamInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Team.label', default: 'Team'), teamInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
