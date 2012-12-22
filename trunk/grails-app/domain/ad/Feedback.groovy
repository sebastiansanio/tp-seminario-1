package ad
import login.*

class Feedback {

	Date	dateCreated
	Date	lastUpdated
	String note
	User user
	
	
	static belongsTo	= [application: Application]	
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return user+": "+note
	}
}
