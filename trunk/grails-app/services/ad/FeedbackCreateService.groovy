package ad


class FeedbackCreateService {

    static transactional = true

    def createFeedback(params,user) {
		def application = Application.get(params.applicationid)
		def feedbackInstance = new Feedback(params)
		feedbackInstance.application = application
		return feedbackInstance
	}
}
