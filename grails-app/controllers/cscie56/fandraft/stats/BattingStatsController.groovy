package cscie56.fandraft.stats



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BattingStatsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BattingStats.list(params), model:[battingStatsInstanceCount: BattingStats.count()]
    }

    def show(BattingStats battingStatsInstance) {
        respond battingStatsInstance
    }

    def create() {
        respond new BattingStats(params)
    }

    @Transactional
    def save(BattingStats battingStatsInstance) {
        if (battingStatsInstance == null) {
            notFound()
            return
        }

        if (battingStatsInstance.hasErrors()) {
            respond battingStatsInstance.errors, view:'create'
            return
        }

        battingStatsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'battingStats.label', default: 'BattingStats'), battingStatsInstance.id])
                redirect battingStatsInstance
            }
            '*' { respond battingStatsInstance, [status: CREATED] }
        }
    }

    def edit(BattingStats battingStatsInstance) {
        respond battingStatsInstance
    }

    @Transactional
    def update(BattingStats battingStatsInstance) {
        if (battingStatsInstance == null) {
            notFound()
            return
        }

        if (battingStatsInstance.hasErrors()) {
            respond battingStatsInstance.errors, view:'edit'
            return
        }

        battingStatsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BattingStats.label', default: 'BattingStats'), battingStatsInstance.id])
                redirect battingStatsInstance
            }
            '*'{ respond battingStatsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BattingStats battingStatsInstance) {

        if (battingStatsInstance == null) {
            notFound()
            return
        }

        battingStatsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BattingStats.label', default: 'BattingStats'), battingStatsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'battingStats.label', default: 'BattingStats'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
