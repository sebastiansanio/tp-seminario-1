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

			
	}
	
	public String toString() {
		return user+": "+description
	}
}
