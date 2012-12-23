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
		
		def adType = new AdType(code:1,description: 'Oferta')
		adType.save()
		adType = new AdType(code:2,description: "Deseo")
		adType.save()
		
		def adStatus = new AdStatus(code:1,description: 'ACTIVO')
		adStatus.save()
		adStatus = new AdStatus(code:2,description:'FINALIZADO')
		adStatus.save()
		adStatus = new AdStatus(code:3, description:'SUSPENDIDO')
		adStatus.save()
		
		def userRole = new UserRole(code:1,description: 'Oferente')
		userRole.save()
		userRole = new UserRole(code:2,description: 'Cliente')
		userRole.save()
		
		
    }
    def destroy = {
    }
}
