package ad
import login.*

class AdSuggestionService {

    static transactional = true

    def suggestOffers(user) {
		def adInstances = AdType.findByDescription(AdType.offerLabel).ads.findAll{
			it.isActive() && it.user!=user
		}
		return adInstances
    }
	
	def suggestWishes(user) {
		def adInstances = AdType.findByDescription(AdType.wishLabel).ads.findAll{
			it.isActive() && it.user!=user
		}
		return adInstances
	}
}
