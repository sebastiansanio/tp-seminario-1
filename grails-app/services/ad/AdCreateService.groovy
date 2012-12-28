package ad
import modal.*

class AdCreateService {

    static transactional = true

    def createOffer(params) {
		def adInstance = new Ad(params)
		adInstance.adType = AdType.findByDescription(AdType.offerLabel)
		return adInstance
    }
	
	def createWish(params){
		def adInstance = new Ad(params)
		adInstance.adType = AdType.findByDescription(AdType.wishLabel)
		return adInstance
	}
	
	def prepareAdToSave(params,user){
		def adInstance = new Ad(params)
		adInstance.adStatus = AdStatus.findByDescription(AdStatus.activeLabel)
		adInstance.user = user
		def desiredPlaces = params.get("desiredPlaces.id")
		desiredPlaces.each {
			adInstance.addToDesiredPlaces(Place.get(it))
		}
		return adInstance
	}
}
