package ad
import login.*

class Feedback {

	Date	dateCreated
	Date	lastUpdated
	String note
		
	static belongsTo	= [application: Application]	
	
     
	static constraints = {
		dateCreated nullable: true
		lastUpdated nullable: true
    }
	
	public String toString() {
		return user+": "+note
	}
}
