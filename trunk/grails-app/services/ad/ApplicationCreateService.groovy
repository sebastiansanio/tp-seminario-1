package ad

/**
 * ApplicationCreateService
 * A service class encapsulates the core business logic of a Grails application
 */
class ApplicationCreateService {

    static transactional = true

    def createApplication(params) {
		def ad = Ad.get(params.adid)
		def applicationInstance = new Application(params)
		applicationInstance.ad = ad
		return applicationInstance
    }
	
	def prepareApplicationToSave(params,user){
		def applicationInstance = new Application(params)
		applicationInstance.user = user
		applicationInstance.applicationStatus = ApplicationStatus.findByDescription(ApplicationStatus.pendingLabel)
		return applicationInstance
	}
}
