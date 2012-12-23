package rule
import login.User
import user.*
import modal.*

class LimitCheckerService {

    static transactional = true

	private ReputationRule getReputationRule(long reputation){
		
		ReputationRule.find("from ReputationRule as rr where rr.baseReputation<=:reputation and rr.topReputation>=:reputation", [reputation: reputation])
		
	}
	
    def checkOffersLimit(User user,flash) {
		boolean correct = true
		long reputation = user.getOffererReputation()
		
		def reputationRule = getReputationRule(reputation)
		
		if(user.getActiveOffersQuantity()>=reputationRule.maxActiveAds){
			flash.message = "No puede tener más avisos activos de este tipo"
			correct = false
		}
		if(user.getTodayOffersQuantity()>=reputationRule.maxAdsPerDay){
			flash.message = "No puede crear más avisos de este tipo en el día de hoy"
			correct = false
		}
		return correct
		
    }
	
	def checkWishesLimit(User user,flash) {
		boolean correct = true
		long reputation = user.getClientReputation()
				def reputationRule = getReputationRule(reputation)
		
		if(user.getActiveWishesQuantity()>=reputationRule.maxActiveAds){
			flash.message += "No puede tener más avisos activos de este tipo"
			correct = false
		}
		if(user.getTodayWishesQuantity()>=reputationRule.maxAdsPerDay){
			flash.message += "No puede crear más avisos de este tipo en el día de hoy"
			correct = false
		}
		return correct
		
	}
}
