package ad


class FeedbackCreateService {

    static transactional = true

    def createFeedback(params,user) {
		def application = Application.get(params.applicationid)
		def feedbackInstance = new Feedback(params)
		feedbackInstance.application = application
		return feedbackInstance
	}
	
	def prepareFeedbackToSave(params,user){
		
		def feedbackInstance = new Feedback(params)
		
		if(user == feedbackInstance.application.user){
			feedbackInstance.application.applicantFeedback=feedbackInstance
			if(feedbackInstance.application.ad.isOffer())
				feedbackInstance.application.ad.user.scoreAsOfferer(feedbackInstance.score)
			else
				feedbackInstance.application.ad.user.scoreAsClient(feedbackInstance.score)
		}else if(user == feedbackInstance.application.ad.user){
			feedbackInstance.application.advertiserFeedback=feedbackInstance
			if(feedbackInstance.application.ad.isOffer())
				feedbackInstance.application.user.scoreAsClient(feedbackInstance.score)
			else
				feedbackInstance.application.user.scoreAsOfferer(feedbackInstance.score)
		}
			
		return feedbackInstance
	}
}
