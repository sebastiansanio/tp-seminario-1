package user
import login.User

class Reputation {

	
	UserRole userRole
	static belongsTo	= [user: User]
	double value
	
	
    static mapping = {
    }
    
	static constraints = {
    	
	}
	
	public String toString() {
		return user+" - "+userRole+": "+value;
	}
}
