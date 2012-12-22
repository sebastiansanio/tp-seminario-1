package ad
import login.*

class Application {


	Date	dateCreated
	Date	lastUpdated
	User user
	String description
	
	static belongsTo	= [ad: Ad]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	static hasOne		= [feedback: Feedback]	
	
    static mapping = {
    }
    
	static constraints = {
    	feedback nullable: true
			
	}
	
	public String toString() {
		return user+": "+description
	}
}
