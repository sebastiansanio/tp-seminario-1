package ad

import org.springframework.dao.DataIntegrityViolationException
import login.User
import org.apache.shiro.SecurityUtils


class ApplicationController {

	def statusChangeService
	def limitCheckerService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "listMyApplications", params: params)
    }

	def listMyApplications(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def currentUser = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def adApplications = currentUser.applications
		def model = [applicationInstanceList: adApplications, applicationInstanceTotal: adApplications.size()]
		render(view: "list",model:model)
	}
	
	def listReceivedApplications(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def currentUser = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def adApplications = ApplicationStatus.findByDescription(ApplicationStatus.pendingLabel).applications.findAll {			
			it.ad.user==currentUser
		}
		def model = [applicationInstanceList: adApplications, applicationInstanceTotal: adApplications.size()]
		render(view: "list",model:model)
	}
	
    def create() {
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def ad = Ad.get(params.adid)
		
		if(limitCheckerService.checkApplicationLimit(user,ad,flash)){
			params.put('ad.id', params.adid)
			def applicationInstance= new Application(params)
			render(view: "create",model:[applicationInstance:applicationInstance])
		}else{
			redirect(controller:"ad",action: "show",id:params.adid)
		}
    }

    def save() {
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		params.put('user.id', user.id)
		params.put('applicationStatus.id', ApplicationStatus.findByDescription(ApplicationStatus.pendingLabel).id)
				
        def applicationInstance = new Application(params)
		
		if(!limitCheckerService.checkApplicationLimit(user,applicationInstance.ad,flash)){
			render(view: "create", model: [applicationInstance: applicationInstance])
			return
		}
		
        if (!applicationInstance.save(flush: true)) {
            render(view: "create", model: [applicationInstance: applicationInstance])
            return
        }

		user.addToPermissions("application:delete,show:"+applicationInstance.id)
		applicationInstance.ad.user.addToPermissions("application:reject,approve,show:"+applicationInstance.id)
		
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



    def delete() {
        def applicationInstance = Application.get(params.id)
		
		
		if (!applicationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'application.label', default: 'Application'), params.id])
            redirect(action: "list")
            return
        }

		statusChangeService.suspendApplication(applicationInstance)
		redirect(action: "index")

    }
}
