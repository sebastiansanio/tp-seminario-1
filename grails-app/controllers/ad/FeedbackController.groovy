package ad

import org.springframework.dao.DataIntegrityViolationException
import org.apache.shiro.SecurityUtils
import login.*

class FeedbackController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def create() {
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def application = Application.get(params.applicationid)
		
//		if(user==application.user || user==application.ad.user){
//			def = .createApplication(params,user)
//			render(view: "create",model:[applicationInstance:applicationInstance])
//		}else{
//			redirect(controller:"application",action: "show",id:params.applicationid)
//		}
		
		
        [feedbackInstance: new Feedback(params)]
    }

    def save() {
        def feedbackInstance = new Feedback(params)
        if (!feedbackInstance.save(flush: true)) {
            render(view: "create", model: [feedbackInstance: feedbackInstance])
            return
        }

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
