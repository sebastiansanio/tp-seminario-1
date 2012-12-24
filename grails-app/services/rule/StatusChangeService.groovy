package rule
import ad.*


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
	
}
