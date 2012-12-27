package ad
import login.*

class Feedback {

	Date	dateCreated
	String note
	long score
		
	static belongsTo	= [application: Application]	
	
     
	static constraints = {
		note blank: true
		score nullable: false
    }
	
	public String toString() {
		return user+": "+note
	}
}
