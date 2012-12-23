package ad
import login.*

class Feedback {

	Date	dateCreated
	Date	lastUpdated
	String note
		
	static belongsTo	= [application: Application]	
	
     
	static constraints = {

    }
	
	public String toString() {
		return user+": "+note
	}
}
