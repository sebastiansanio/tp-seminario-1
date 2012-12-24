package ad
import login.*

class Application {


	Date	dateCreated
	Date	lastUpdated
	User user
	String description
	BigDecimal budget
	ApplicationStatus applicationStatus
	Feedback feedback
	
	static belongsTo	= [ad: Ad]
    
	static constraints = {
		description blank:false
		budget scale: 2
		feedback nullable:true
	}
	
	public String toString() {
		return user.toString()+": "+description
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
