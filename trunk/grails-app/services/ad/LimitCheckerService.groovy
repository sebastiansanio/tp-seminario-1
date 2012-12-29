package ad
import login.User
import user.*
import modal.*

class LimitCheckerService {

    static transactional = true

	private ReputationRule getReputationRule(long reputation){
		ReputationRule.find("from ReputationRule as rr where rr.baseReputation<=:reputation and rr.topReputation>=:reputation", [reputation: reputation])
	}
	
    def checkOffersLimit(User user,flash) {
		long reputation = user.getOffererReputation()
		def reputationRule = getReputationRule(reputation)
		
		if(user.getActiveOffersQuantity()>=reputationRule.maxActiveAds){
			flash.message = "No puede tener más avisos activos de este tipo. "
			return false
		}
		if(user.getTodayOffersQuantity()>=reputationRule.maxAdsPerDay){
			flash.message = "No puede crear más avisos de este tipo en el día de hoy. "
			return false
		}
		return true
		
    }
	
	def checkWishesLimit(User user,flash) {
		long reputation = user.getClientReputation()
		def reputationRule = getReputationRule(reputation)
		
		if(user.getActiveWishesQuantity()>=reputationRule.maxActiveAds){
			flash.message = "No puede tener más avisos activos de este tipo. "
			return false
		}
		if(user.getTodayWishesQuantity()>=reputationRule.maxAdsPerDay){
			flash.message = "No puede crear más avisos de este tipo en el día de hoy. "
			return false
		}
		return true
		
	}
	
	def checkApplicationLimit(User user,Ad ad,flash) {
		
		if(!ad.isActive()){
			flash.message = "El aviso no se encuentra activo"
			return false	
		}
		if(ad.id in user.applications.ad.id){
			flash.message = "Ya posee una aplicación para este aviso.  "
			return false
		}
		
		if(!(user.place.id in ad.desiredPlaces.id)){
			flash.message = "No puede aplicar debido a que no cumple con las restricciones de localización. "
			return false
		}
		if(ad.getPossibleApplicationsQuantity()==0){
			flash.message = "El aviso no puede recibir más aplicaciones en este momento. "
			return false
		}
		
		long reputation = 0
		if(ad.isOffer()){		
			reputation = user.getClientReputation()
		}else{
			reputation = user.getOffererReputation()
		}
		def reputationRule = getReputationRule(reputation)
		if(user.getActiveApplicationsQuantity()>=reputationRule.maxActiveApplications){
			flash.message = "No puede tener más aplicaciones activas de este tipo. "
			return false
		}
		if(user.getTodayApplicationsQuantity()>=reputationRule.maxApplicationsPerDay){
			flash.message = "No puede crear más aplicaciones de este tipo en el día de hoy. "
			return false
		}
		if(ad.budget>reputationRule.maxPrice){
			flash.message = "Debe poseer una reputación mayor para aplicar a este aviso.  "
			return false
		}

		return true
		
	}
}
