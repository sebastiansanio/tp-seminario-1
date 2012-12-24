package ad

import org.springframework.dao.DataIntegrityViolationException
import login.User
import org.apache.shiro.SecurityUtils


class ApplicationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	def listMyApplications(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def adApplications = user.applications
		def model = [applicationInstanceList: adApplications, applicationInstanceTotal: adApplications.size()]
		render(view: "list",model:model)
	}
	
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [applicationInstanceList: Application.list(params), applicationInstanceTotal: Application.count()]
    }

    def create() {
        [applicationInstance: new Application(params)]
    }

    def save() {
        def applicationInstance = new Application(params)
        if (!applicationInstance.save(flush: true)) {
            render(view: "create", model: [applicationInstance: applicationInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'application.label', default: 'Application'), applicationInstance.id])
        redirect(action: "show", id: applicationInstance.id)
    }

    def show() {
        def applicationInstance = Application.get(params.id)
        if (!applicationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'application.label', default: 'Application'), params.id])
            redirect(action: "list")
            return
        }

        [applicationInstance: applicationInstance]
    }

    def edit() {
        def applicationInstance = Application.get(params.id)
        if (!applicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'application.label', default: 'Application'), params.id])
            redirect(action: "list")
            return
        }

        [applicationInstance: applicationInstance]
    }

    def update() {
        def applicationInstance = Application.get(params.id)
        if (!applicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'application.label', default: 'Application'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (applicationInstance.version > version) {
                applicationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'application.label', default: 'Application')] as Object[],
                          "Another user has updated this Application while you were editing")
                render(view: "edit", model: [applicationInstance: applicationInstance])
                return
            }
        }

        applicationInstance.properties = params

        if (!applicationInstance.save(flush: true)) {
            render(view: "edit", model: [applicationInstance: applicationInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'application.label', default: 'Application'), applicationInstance.id])
        redirect(action: "show", id: applicationInstance.id)
    }

    def delete() {
        def applicationInstance = Application.get(params.id)
        if (!applicationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'application.label', default: 'Application'), params.id])
            redirect(action: "list")
            return
        }

        try {
            applicationInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'application.label', default: 'Application'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'application.label', default: 'Application'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
