import org.apache.shiro.crypto.hash.Sha256Hash
import login.User
import ad.*
import user.*
import modal.*

class BootStrap {

	def userCreateService
	
    def init = { servletContext ->
						
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
		family = new Family(description: 'Derecho')
		family.save()
		family = new Family(description: 'Arquitectura')
		family.save()
		family = new Family(description: 'Electricidad')
		family.save()
		family = new Family(description: 'Informática')
		family.save()
		family = new Family(description: 'Limpieza')
		family.save()
		
		
		def reputationRule = new ReputationRule(baseReputation: 0, topReputation: 100,maxActiveAds:2,maxAdsPerDay:2,maxPrice:500,maxActiveApplications:10,maxApplicationsPerDay:5)
		reputationRule.save()
		reputationRule = new ReputationRule(baseReputation: 101, topReputation: 200,maxActiveAds:3,maxAdsPerDay:3,maxPrice:750,maxActiveApplications:20,maxApplicationsPerDay:10)
		reputationRule.save()
		reputationRule = new ReputationRule(baseReputation: 201, topReputation: 300,maxActiveAds:4,maxAdsPerDay:4,maxPrice:1000,maxActiveApplications:30,maxApplicationsPerDay:20)
		reputationRule.save()
		reputationRule = new ReputationRule(baseReputation: 301, topReputation: 400,maxActiveAds:6,maxAdsPerDay:6,maxPrice:1500,maxActiveApplications:40,maxApplicationsPerDay:40)
		reputationRule.save()
		reputationRule = new ReputationRule(baseReputation: 401, topReputation: 9999,maxActiveAds:10,maxAdsPerDay:10,maxPrice:2000,maxActiveApplications:50,maxApplicationsPerDay:80)
		reputationRule.save()
		
		def place1 = new Place(name:"Ciudad de Buenos Aires")
		place1.save()
		def place2 = new Place(name:"Provincia de Buenos Aires")
		place2.save()
		def place3 = new Place(name:"Córdoba")
		place3.save()
		def place4 = new Place(name:"Santa Fe")
		place4.save()
	
		userCreateService.createUser("santiago","santiago",place1,"santiago@aaa.com","11111111")
		userCreateService.createUser("sebastian","sebastian",place1,"sebastian@aaa.com","22222222")
		userCreateService.createUser("gaston","gaston",place2,"gaston@aaa.com","33333333")
		
		(1..50).each{
			def user = userCreateService.createUser("user"+it,"user"+it,place3,"user"+it+"@aaa.com","NO")
			user.scoreAsClient(it*10)
			user.scoreAsOfferer((50-it)*10)
		}
		
		(51..100).each{
			def user = userCreateService.createUser("user"+it,"user"+it,place1,"user"+it+"@aaa.com","NO")
			user.scoreAsClient(it*10)
			user.scoreAsOfferer((100-it)*10)
		}
		
		
		
	}
    def destroy = {
    }
}
