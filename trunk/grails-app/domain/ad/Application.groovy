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
		budget nullable:true
	}
	
	public String toString() {
		return user.toString()+": "+description
	}
	
	public boolean isPending(){
		return applicationStatus.isPending()
	}
	public boolean isFinalized(){
		return applicationStatus.isFinalized()
	}
	public boolean isSuspended(){
		return applicationStatus.isSuspended()
	}
	public boolean isRejected(){
		return applicationStatus.isRejected()
	}
	public boolean isAccepted(){
		return applicationStatus.isAccepted()
	}
	
	public boolean createdToday(){
		Date date = new Date()
		long daysDifference = date-dateCreated
		return (daysDifference == 0)
	}

}
