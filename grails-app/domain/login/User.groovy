package login
import user.*
import ad.*

class User {
	Date	dateCreated
	Date    lastUpdated
    String username
    String passwordHash
    
    static hasMany = [ roles: Role, permissions: String, reputations: Reputation, ads: Ad]

    static constraints = {
        username(blank: false, unique: true)

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
		return activeWishges.size()
	}

	def getTodayOffersQuantity(){
		def activeOffers = ads.findAll{
			it.isOffer() && it.createdToday()
		}
		return activeOffers.size()
	}
	
	def getTodayWishesQuantity(){
		def activeWishes = ads.findAll{
			it.isWish() && it.createdToday()
		}
		return activeWishges.size()
	}
}
