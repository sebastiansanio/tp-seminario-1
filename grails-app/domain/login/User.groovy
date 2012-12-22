package login
import user.*
import ad.*

class User {
	Date	dateCreated
    String username
    String passwordHash
    
    static hasMany = [ roles: Role, permissions: String, reputations: Reputation, ads: Ad]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
    }
	
	public String toString(){
		return username
	}
}
