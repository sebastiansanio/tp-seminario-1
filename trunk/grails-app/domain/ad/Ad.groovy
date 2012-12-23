package ad
import login.User

class Ad {

	Date	dateCreated
	Date	lastUpdated
	String description
	AdType adType
	AdStatus adStatus
	Family family
	long minimumReputation
	
	static belongsTo	= [user: User]	
	static hasMany		= [applications: Application]	
	
   
	static constraints = {
		description size:10..400
		minimumReputation nullable: false
		
    }
	
	public String toString() {
		return description
	}
}
