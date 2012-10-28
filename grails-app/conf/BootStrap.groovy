import org.apache.shiro.crypto.hash.Sha256Hash
import login.*
class BootStrap {

    def init = { servletContext ->
		def user = new User(username:"seminario", passwordHash: new Sha256Hash("seminario").toHex())
		user.addToPermissions("*:*")
		user.save()
    }
    def destroy = {
    }
}
