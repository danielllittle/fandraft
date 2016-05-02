package cscie56.fandraft.stats



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PitchingStatsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PitchingStats.list(params), model:[pitchingStatsInstanceCount: PitchingStats.count()]
    }

    def show(PitchingStats pitchingStatsInstance) {
        respond pitchingStatsInstance
    }

    def create() {
        respond new PitchingStats(params)
    }

    @Transactional
    def save(PitchingStats pitchingStatsInstance) {
        if (pitchingStatsInstance == null) {
            notFound()
            return
        }

        if (pitchingStatsInstance.hasErrors()) {
            respond pitchingStatsInstance.errors, view:'create'
            return
        }

        pitchingStatsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pitchingStats.label', default: 'PitchingStats'), pitchingStatsInstance.id])
                redirect pitchingStatsInstance
            }
            '*' { respond pitchingStatsInstance, [status: CREATED] }
        }
    }

    def edit(PitchingStats pitchingStatsInstance) {
        respond pitchingStatsInstance
    }

    @Transactional
    def update(PitchingStats pitchingStatsInstance) {
        if (pitchingStatsInstance == null) {
            notFound()
            return
        }

        if (pitchingStatsInstance.hasErrors()) {
            respond pitchingStatsInstance.errors, view:'edit'
            return
        }

        pitchingStatsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PitchingStats.label', default: 'PitchingStats'), pitchingStatsInstance.id])
                redirect pitchingStatsInstance
            }
            '*'{ respond pitchingStatsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PitchingStats pitchingStatsInstance) {

        if (pitchingStatsInstance == null) {
            notFound()
            return
        }

        pitchingStatsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PitchingStats.label', default: 'PitchingStats'), pitchingStatsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pitchingStats.label', default: 'PitchingStats'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
