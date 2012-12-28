package ad


class StatusChangeService {

    static transactional = true

    def suspendAd(Ad ad) {
		def adStatus = AdStatus.findByDescription(AdStatus.suspendedLabel)
		ad.adStatus = adStatus
    }
	
	def finalizeAd(Ad ad) {
		def adStatus = AdStatus.findByDescription(AdStatus.finalizedLabel)
		ad.adStatus = adStatus
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
}
