package cscie56.fandraft



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DraftPoolController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DraftPool.list(params), model:[draftPoolInstanceCount: DraftPool.count()]
    }

    def show(DraftPool draftPoolInstance) {
        respond draftPoolInstance
    }

    def create() {
        respond new DraftPool(params)
    }

    @Transactional
    def save(DraftPool draftPoolInstance) {
        if (draftPoolInstance == null) {
            notFound()
            return
        }

        if (draftPoolInstance.hasErrors()) {
            respond draftPoolInstance.errors, view:'create'
            return
        }

        draftPoolInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'draftPool.label', default: 'DraftPool'), draftPoolInstance.id])
                redirect draftPoolInstance
            }
            '*' { respond draftPoolInstance, [status: CREATED] }
        }
    }

    def edit(DraftPool draftPoolInstance) {
        respond draftPoolInstance
    }

    @Transactional
    def update(DraftPool draftPoolInstance) {
        if (draftPoolInstance == null) {
            notFound()
            return
        }

        if (draftPoolInstance.hasErrors()) {
            respond draftPoolInstance.errors, view:'edit'
            return
        }

        draftPoolInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DraftPool.label', default: 'DraftPool'), draftPoolInstance.id])
                redirect draftPoolInstance
            }
            '*'{ respond draftPoolInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DraftPool draftPoolInstance) {

        if (draftPoolInstance == null) {
            notFound()
            return
        }

        draftPoolInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DraftPool.label', default: 'DraftPool'), draftPoolInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'draftPool.label', default: 'DraftPool'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
