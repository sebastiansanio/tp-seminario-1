package ad
import login.*

class Application {


	Date	dateCreated
	Date	lastUpdated
	User user
	String description
	
	static belongsTo	= [ad: Ad]
	static hasOne		= [feedback: Feedback]	

    
	static constraints = {
    	feedback nullable: true
		dateCreated nullable: true
		lastUpdated nullable: true
			
	}
	
	public String toString() {
		return user+": "+description
	}
}
