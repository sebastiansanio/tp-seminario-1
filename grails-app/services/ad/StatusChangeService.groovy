package ad


class StatusChangeService {

    static transactional = true

	def activateAd(Ad ad) {
		ad.user.addToPermissions("ad:delete:"+ad.id)
	}
	
    def suspendAd(Ad ad) {
		def adStatus = AdStatus.findByDescription(AdStatus.suspendedLabel)
		ad.adStatus = adStatus
    }
	
	def finalizeAd(Ad ad) {
		def adStatus = AdStatus.findByDescription(AdStatus.finalizedLabel)
		ad.adStatus = adStatus
	}
	
	def activateApplication(Application application){

		application.user.addToPermissions("application:delete:"+application.id)
		application.user.addToPermissions("application:show:"+application.id)
		application.ad.user.addToPermissions("application:reject,accept:"+application.id)
		application.ad.user.addToPermissions("application:show:"+application.id)
		
	}
	
	
	def suspendApplication(Application application){
		def applicationStatus = ApplicationStatus.findByDescription(ApplicationStatus.suspendedLabel)
		application.applicationStatus = applicationStatus 
	}
	
	def rejectApplication(Application application){
		def applicationStatus = ApplicationStatus.findByDescription(ApplicationStatus.rejectedLabel)
		application.applicationStatus = applicationStatus
		application.ad.user.removeFromPermissions("application:reject,accept:"+application.id)
		
	}
	
	def acceptApplication(Application application){
		def acceptedStatus = ApplicationStatus.findByDescription(ApplicationStatus.acceptedLabel)
		application.applicationStatus = acceptedStatus
		
		finalizeAd(application.ad)
		def remanentApplications = application.ad.applications.each {
			if(it.isPending())
				rejectApplication(it)
		}	
		
		application.user.addToPermissions("user:showAllInfo:"+application.ad.user.id)
		application.ad.user.addToPermissions("user:showAllInfo:"+application.user.id)
		application.ad.user.removeFromPermissions("application:reject,accept:"+application.id)
	}
	
	def finalizeApplication(Application application){
		
		if(application.applicantFeedback!=null && application.advertiserFeedback!=null){
			def finalizedStatus = ApplicationStatus.findByDescription(ApplicationStatus.finalizedLabel)
			application.applicationStatus = finalizedStatus
		}
		
	}
}
