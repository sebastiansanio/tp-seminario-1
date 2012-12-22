package ad

import org.springframework.dao.DataIntegrityViolationException

/**
 * AdController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AdController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [adInstanceList: Ad.list(params), adInstanceTotal: Ad.count()]
    }

    def create() {
        [adInstance: new Ad(params)]
    }

    def save() {
        def adInstance = new Ad(params)
        if (!adInstance.save(flush: true)) {
            render(view: "create", model: [adInstance: adInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])
        redirect(action: "show", id: adInstance.id)
    }

    def show() {
        def adInstance = Ad.get(params.id)
        if (!adInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "list")
            return
        }

        [adInstance: adInstance]
    }

    def edit() {
        def adInstance = Ad.get(params.id)
        if (!adInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "list")
            return
        }

        [adInstance: adInstance]
    }

    def update() {
        def adInstance = Ad.get(params.id)
        if (!adInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (adInstance.version > version) {
                adInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ad.label', default: 'Ad')] as Object[],
                          "Another user has updated this Ad while you were editing")
                render(view: "edit", model: [adInstance: adInstance])
                return
            }
        }

        adInstance.properties = params

        if (!adInstance.save(flush: true)) {
            render(view: "edit", model: [adInstance: adInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])
        redirect(action: "show", id: adInstance.id)
    }

    def delete() {
        def adInstance = Ad.get(params.id)
        if (!adInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "list")
            return
        }

        try {
            adInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
