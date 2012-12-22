package ad
import login.User

class Ad {

	Date	dateCreated
	Date	lastUpdated
	AdType adType
	String description
	
	
	static belongsTo	= [user: User]	
	static hasMany		= [applications: Application]	
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return description
	}
}
