package user

import org.apache.shiro.crypto.hash.Sha256Hash
import login.User
import modal.*

class UserCreateService {

    static transactional = true

    def createUser(String username,String password,Place place) {
		def user = new User(username:username, passwordHash: new Sha256Hash(password).toHex())
		user.place = place
		
		user.addToReputations(new Reputation(userRole:UserRole.findByDescription(UserRole.offererLabel),value:0))
		user.addToReputations(new Reputation(userRole:UserRole.findByDescription(UserRole.clientLabel),value:0))
		
		user.addToPermissions("main:*")
		user.addToPermissions("ad:index,listMyOffers,listMyWishes,listOthersWishes,listOthersWishes,listOthersOffers,createWish,createOffer,save,show")
		user.addToPermissions("application:*")
		user.addToPermissions("user:show")
		user.save()
    }
}
