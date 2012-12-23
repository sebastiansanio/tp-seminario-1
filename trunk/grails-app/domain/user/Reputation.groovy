package user
import login.User

class Reputation {

	
	UserRole userRole
	static belongsTo	= [user: User]
	long value
	
	
    static mapping = {
    }
    
	static constraints = {
    	
	}
	
	public String toString() {
		return user+" - "+userRole+": "+value;
	}
}
