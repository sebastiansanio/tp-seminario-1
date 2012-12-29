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
		return user.toString()+" - "+userRole.toString()+": "+value;
	}
	
	public boolean isForOfferer(){
		return userRole.isOfferer()
	}
	
	public boolean isForClient(){
		return userRole.isClient()
	}

	
}
