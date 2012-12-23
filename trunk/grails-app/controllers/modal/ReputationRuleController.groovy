package modal

import org.springframework.dao.DataIntegrityViolationException

/**
 * ReputationRuleController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ReputationRuleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reputationRuleInstanceList: ReputationRule.list(params), reputationRuleInstanceTotal: ReputationRule.count()]
    }

    def create() {
        [reputationRuleInstance: new ReputationRule(params)]
    }

    def save() {
        def reputationRuleInstance = new ReputationRule(params)
        if (!reputationRuleInstance.save(flush: true)) {
            render(view: "create", model: [reputationRuleInstance: reputationRuleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'reputationRule.label', default: 'ReputationRule'), reputationRuleInstance.id])
        redirect(action: "show", id: reputationRuleInstance.id)
    }

    def show() {
        def reputationRuleInstance = ReputationRule.get(params.id)
        if (!reputationRuleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reputationRule.label', default: 'ReputationRule'), params.id])
            redirect(action: "list")
            return
        }

        [reputationRuleInstance: reputationRuleInstance]
    }

    def edit() {
        def reputationRuleInstance = ReputationRule.get(params.id)
        if (!reputationRuleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reputationRule.label', default: 'ReputationRule'), params.id])
            redirect(action: "list")
            return
        }

        [reputationRuleInstance: reputationRuleInstance]
    }

    def update() {
        def reputationRuleInstance = ReputationRule.get(params.id)
        if (!reputationRuleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reputationRule.label', default: 'ReputationRule'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (reputationRuleInstance.version > version) {
                reputationRuleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reputationRule.label', default: 'ReputationRule')] as Object[],
                          "Another user has updated this ReputationRule while you were editing")
                render(view: "edit", model: [reputationRuleInstance: reputationRuleInstance])
                return
            }
        }

        reputationRuleInstance.properties = params

        if (!reputationRuleInstance.save(flush: true)) {
            render(view: "edit", model: [reputationRuleInstance: reputationRuleInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'reputationRule.label', default: 'ReputationRule'), reputationRuleInstance.id])
        redirect(action: "show", id: reputationRuleInstance.id)
    }

    def delete() {
        def reputationRuleInstance = ReputationRule.get(params.id)
        if (!reputationRuleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reputationRule.label', default: 'ReputationRule'), params.id])
            redirect(action: "list")
            return
        }

        try {
            reputationRuleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'reputationRule.label', default: 'ReputationRule'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reputationRule.label', default: 'ReputationRule'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
