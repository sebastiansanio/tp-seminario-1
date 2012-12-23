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
	
	def isOfferer(){
		return description.equals(offererLabel)
	}
	
	def isClient(){
		return description.equals(clientLabel)
	}
}
