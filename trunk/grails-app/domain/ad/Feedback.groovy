package ad
import login.*

class Feedback {

	Date	dateCreated
	String note
	long score
		
	static belongsTo	= [application: Application]	
	
     
	static constraints = {
		note blank: true
		score nullable: false, range:0..10
    }
	
	public String toString() {
		return note+" ("+score+")"
	}
}
