package ad

import org.springframework.dao.DataIntegrityViolationException
import org.apache.shiro.SecurityUtils
import login.*

class FeedbackController {

	def feedbackCreateService
	def statusChangeService
		
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def create() {
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def application = Application.get(params.applicationid)
		
		if((user==application.user && application.applicantFeedback==null)|| (user==application.ad.user && application.advertiserFeedback==null) ){
			def feedbackInstance = feedbackCreateService.createFeedback(params,user)
			render(view: "create",model:[feedbackInstance:feedbackInstance])
		}else{
			flash.message = "No puede calificar esta aplicación"
			redirect(controller:"application",action: "show",id:params.applicationid)
		}
		
        [feedbackInstance: new Feedback(params)]
    }

    def save() {
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def feedbackInstance = feedbackCreateService.prepareFeedbackToSave(params,user)
		
        if (!feedbackInstance.save(flush: true)) {
            render(view: "create", model: [feedbackInstance: feedbackInstance])
            return
        }
		statusChangeService.finalizeApplication(feedbackInstance.application)
		flash.message = message(code: 'default.created.message', args: [message(code: 'feedback.label', default: 'Feedback'), feedbackInstance.id])
        redirect(action: "show", id: feedbackInstance.id)
    
	}

    def show() {
        def feedbackInstance = Feedback.get(params.id)
        if (!feedbackInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'feedback.label', default: 'Feedback'), params.id])
            redirect(action: "list")
            return
        }

        [feedbackInstance: feedbackInstance]
    }



}
