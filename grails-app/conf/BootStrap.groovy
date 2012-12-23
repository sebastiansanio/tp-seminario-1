import org.apache.shiro.crypto.hash.Sha256Hash
import login.User
import ad.*
import user.*

class BootStrap {

    def init = { servletContext ->
		def user = new User(username:"seminario", passwordHash: new Sha256Hash("seminario").toHex())
		user.addToPermissions("*:*")
		user.save()
		
		user = new User(username:"santiago", passwordHash: new Sha256Hash("santiago").toHex())
		user.addToPermissions("main:*")
		user.save()
		
		user = new User(username:"gaston", passwordHash: new Sha256Hash("gaston").toHex())
		user.addToPermissions("main:*")
		user.addToPermissions("ad:*")
		user.save()
		
		user = new User(username:"sebastian", passwordHash: new Sha256Hash("sebastian").toHex())
		user.addToPermissions("main:*")
		user.addToPermissions("ad:*")
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
		
    }
    def destroy = {
    }
}
