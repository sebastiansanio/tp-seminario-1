package user

class UserRole {

	int code
	String description	
	
    static mapping = {
    
	}
    
	static constraints = {
			
	}
	
	public String toString() {
		return description
	}
}
