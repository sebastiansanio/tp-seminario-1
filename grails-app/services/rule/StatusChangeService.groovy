package rule
import ad.*


class StatusChangeService {

    static transactional = true

    def suspendAd(Ad ad) {
		def AdStatus = AdStatus.findByDescription(AdStatus.suspendedLabel)
		ad.setAdStatus(AdStatus)
    }
	
	def finalizeAd(Ad ad) {
		def AdStatus = AdStatus.findByDescription(AdStatus.finalizedLabel)
		ad.setAdStatus(AdStatus)
	}
}
