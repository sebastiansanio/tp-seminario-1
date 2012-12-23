package ad
import login.*

class Application {


	Date	dateCreated
	Date	lastUpdated
	User user
	String description
	ApplicationStatus applicationStatus
	
	static belongsTo	= [ad: Ad]
	static hasOne		= [feedback: Feedback]	

    
	static constraints = {

			
	}
	
	public String toString() {
		return user+": "+description
	}
	
	def isActive(){
		return applicationStatus.isActive()
	}
	def isFinalized(){
		return applicationStatus.isFinalized()
	}
	def isSuspended(){
		return applicationStatus.isSuspended()
	}
	def isRejected(){
		return applicationStatus.isRejected()
	}

}
