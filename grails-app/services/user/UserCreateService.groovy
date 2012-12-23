package user

import org.apache.shiro.crypto.hash.Sha256Hash
import login.User

class UserCreateService {

    static transactional = true

    def createUser(String username,String password) {
		def user = new User(username:username, passwordHash: new Sha256Hash(password).toHex())
		
		user.addToReputations(new Reputation(userRole:UserRole.findByDescription(UserRole.offererLabel),value:0))
		user.addToReputations(new Reputation(userRole:UserRole.findByDescription(UserRole.clientLabel),value:0))
		
		user.addToPermissions("main:*")
		user.addToPermissions("ad:*")
		user.save()
    }
}
