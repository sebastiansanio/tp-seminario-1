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
		
		
		def applicationStatus = new ApplicationStatus(description: ApplicationStatus.pendingLabel)
		applicationStatus.save()
		applicationStatus = new ApplicationStatus(description: ApplicationStatus.finalizedLabel)
		applicationStatus.save()
		applicationStatus = new ApplicationStatus(description: ApplicationStatus.suspendedLabel)
		applicationStatus.save()
		applicationStatus = new ApplicationStatus(description: ApplicationStatus.rejectedLabel)
		applicationStatus.save()
		applicationStatus = new ApplicationStatus(description: ApplicationStatus.acceptedLabel)
		applicationStatus.save()
		
		def userRole = new UserRole(description: UserRole.offererLabel)
		userRole.save()
		userRole = new UserRole(description: UserRole.clientLabel)
		userRole.save()
		
		
		def family = new Family(description: 'Contable')
		family.save()
		family = new Family(description: 'Agrimensura')
		family.save()
		
		
		def reputationRule = new ReputationRule(baseReputation: 0, topReputation: 100,maxActiveAds:2,maxAdsPerDay:2,maxPrice:500,maxActiveApplications:10,maxApplicationsPerDay:5)
		reputationRule.save()
		reputationRule = new ReputationRule(baseReputation: 101, topReputation: 200,maxActiveAds:3,maxAdsPerDay:3,maxPrice:1000,maxActiveApplications:20,maxApplicationsPerDay:10)
		reputationRule.save()
		reputationRule = new ReputationRule(baseReputation: 201, topReputation: 300,maxActiveAds:4,maxAdsPerDay:4,maxPrice:2000,maxActiveApplications:30,maxApplicationsPerDay:15)
		reputationRule.save()
		
		
		def place1 = new Place(name:"CABA")
		place1.save()
		def place2 = new Place(name:"Provincia de Buenos Aires")
		place2.save()
		def place3 = new Place(name:"Córdoba")
		place3.save()
	
		userCreateService.createUser("santiago","santiago",place1,"santiago@aaa.com","11111111")
		userCreateService.createUser("sebastian","sebastian",place1,"sebastian@aaa.com","22222222")
		userCreateService.createUser("gaston","gaston",place2,"gaston@aaa.com","33333333")
		
		
	}
    def destroy = {
    }
}
