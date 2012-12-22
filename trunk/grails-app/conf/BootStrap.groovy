import org.apache.shiro.crypto.hash.Sha256Hash
import login.User
import ad.*

class BootStrap {

    def init = { servletContext ->
		def user = new User(username:"seminario", passwordHash: new Sha256Hash("seminario").toHex())
		user.addToPermissions("*:*")
		user.save()
		
		def adType = new AdType(code:1,description: 'Oferta')
		adType.save()
		adType = new AdType(code:2,description: "Deseo")
		adType.save()
		
		
    }
    def destroy = {
    }
}
