package ad
import login.User

class Ad {

	Date	dateCreated
	Date	lastUpdated
	String description
	
	
	static belongsTo	= [user: User,adType: AdType]	
	static hasMany		= [applications: Application]	
	
   
	static constraints = {
		dateCreated nullable: true
		lastUpdated nullable: true
    }
	
	public String toString() {
		return description
	}
}
