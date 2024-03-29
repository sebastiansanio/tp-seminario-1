package login
import user.*
import ad.*
import modal.*

class User {
	Date	dateCreated
	Date    lastUpdated
    String username
    String passwordHash
	Place place
	String emailAddress
	String telephone
	
	
    static hasMany = [ roles: Role, permissions: String, reputations: Reputation, ads: Ad,applications:Application]

    static constraints = {
        username blank: false, unique: true
		emailAddress blank:false, email: true
		telephone blank:false
    }
	
	public String toString(){
		return username
	}
	
	def getOffers(){
		ads.findAll{
			it.isOffer()
		}
	}
	
	
	def getWishes(){
		ads.findAll{
			it.isWish()
		}
	}
	
	def getActiveAds(){
		ads.findAll{
			it.isActive()
		}
	}
	
	
	def getOffererReputation(){
		def reputation = reputations.find {
			it.isForOfferer()
		}
		return reputation.value
	}
	
	def getClientReputation(){
		def reputation = reputations.find {
			it.isForClient()
			
		}
		return reputation.value
	}
	
	
	def getActiveApplicationsQuantity(){
		def activeApplications = applications.findAll{
			it.isPending()
		}
		return activeApplications.size()
	}

	def getTodayApplicationsQuantity(){
		def todayApplications = applications.findAll{
			it.createdToday()
		}
		return todayApplications.size()
	}
		
		
	def getActiveOffersQuantity(){
		def activeOffers = ads.findAll{
			it.isOffer() && it.isActive()
		}
		return activeOffers.size()
	}
	
	def getActiveWishesQuantity(){
		def activeWishes = ads.findAll{
			it.isWish() && it.isActive()
		}
		return activeWishes.size()
	}

	def getTodayOffersQuantity(){
		def todayOffers = ads.findAll{
			it.isOffer() && it.createdToday()
		}
		return todayOffers.size()
	}
	
	def getTodayWishesQuantity(){
		def todayWishes = ads.findAll{
			it.isWish() && it.createdToday()
		}
		return todayWishes.size()
	}
	
	def scoreAsOfferer(long score){
		def reputation = reputations.find {
			it.isForOfferer()
		}
		reputation.value += score
	}
	
	def scoreAsClient(long score){
		def reputation = reputations.find {
			it.isForClient()
		}
		reputation.value += score
	}


}
