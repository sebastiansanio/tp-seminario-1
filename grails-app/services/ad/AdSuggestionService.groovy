package ad
import login.*
import modal.*

class AdSuggestionService {

    static transactional = true

	private ReputationRule getReputationRule(long reputation){
		ReputationRule.findByBaseReputationLessThanEqualsAndTopReputationGreaterThanEquals(reputation,reputation)
	}
	
    def suggestOffers(user) {
		def offers = AdType.findByDescription(AdType.offerLabel).ads.findAll{
			it.isActive() && it.user!=user
		}
		
		
		def offersFilteredByPlace = offers.findAll{
			user.place.id in it.desiredPlaces.id
		}
		
		def wishesFamilies = user.getWishes().family
		
		def suggestedOffers = offersFilteredByPlace.findAll{
			it.family in  wishesFamilies   && it.budget <= getReputationRule(user.clientReputation).maxPrice
		}
		
		return suggestedOffers
    }
	
	def suggestWishes(user) {
		def wishes = AdType.findByDescription(AdType.wishLabel).ads.findAll{
			it.isActive() && it.user!=user
		}
		
		
		def wishesFilteredByPlace = wishes.findAll{
			user.place.id in it.desiredPlaces.id
		}
		
		def offersFamilies = user.getOffers().family
		
		def suggestedWishes = wishesFilteredByPlace.findAll{
			it.family in  offersFamilies   && it.budget <= getReputationRule(user.offererReputation).maxPrice
		}
		
		return suggestedWishes
	}
}
