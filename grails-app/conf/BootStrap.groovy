import org.apache.shiro.crypto.hash.Sha256Hash
import login.User
import ad.*
import user.*
import modal.*

class BootStrap {

	def userCreateService
	
    def init = { servletContext ->
		def user = new User(username:"seminario", passwordHash: new Sha256Hash("seminario").toHex())
		user.addToPermissions("*:*")
		user.save()
						
		def adType = new AdType(description: AdType.offerLabel)
		adType.save()
		adType = new AdType(description: AdType.wishLabel)
		adType.save()
		
		def adStatus = new AdStatus(description: AdStatus.activeLabel)
		adStatus.save()
		adStatus = new AdStatus(description: AdStatus.finalizedLabel)
		adStatus.save()
		adStatus = new AdStatus(description: AdStatus.suspendedLabel)
		adStatus.save()
		
		def userRole = new UserRole(description: UserRole.offererLabel)
		userRole.save()
		userRole = new UserRole(description: UserRole.clientLabel)
		userRole.save()
		
		
		def family = new Family(description: 'Contable')
		family.save()
		family = new Family(description: 'Agrimensura')
		family.save()
		
		
		def reputationRule = new ReputationRule(baseReputation: 0, topReputation: 100,maxActiveAds:2,maxAdsPerDay:1,maxPrice:200)
		reputationRule.save()
		
		userCreateService.createUser("santiago","santiago")
		userCreateService.createUser("sebastian","sebastian")
		userCreateService.createUser("gaston","gaston")
		
		
		
    }
    def destroy = {
    }
}
