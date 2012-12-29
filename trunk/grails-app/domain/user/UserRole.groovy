package user

class UserRole {

	
	static String offererLabel = "Oferente"
	static String clientLabel = "Cliente"
	
	String description	
	
    static mapping = {
    
	}
    
	static constraints = {
		description inList:[offererLabel,clientLabel]
	}
	
	public String toString() {
		return description
	}
	
	public boolean isOfferer(){
		return description.equals(offererLabel)
	}
	
	public boolean isClient(){
		return description.equals(clientLabel)
	}
}
