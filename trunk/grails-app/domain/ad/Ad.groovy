package ad
import login.User
import modal.Place

class Ad {

	Date	dateCreated
	Date	lastUpdated
	String title
	String description
	AdType adType
	AdStatus adStatus
	Family family
	long minimumReputation
	int applicationsLimit
	BigDecimal budget
	
	
	static belongsTo	= [user: User]	
	static hasMany		= [applications: Application,desiredPlaces: Place]	
	
   
	static constraints = {
		title blank:false
		description blank:false,size:10..400
		minimumReputation nullable: false
		budget nullable:true,scale:2
	}
	
	public String toString() {
		return title
	}
	
	def isOffer(){
		return adType.isOffer()		
	}
	
	def isWish(){
		return adType.isWish()
	}
	def isActive(){
		return adStatus.isActive()
	}
	def isFinalized(){
		return adStatus.isFinalized()
	}
	def isSuspended(){
		return adStatus.isSuspended()
	}
	
	def createdToday(){
		Date date = new Date()
		long daysDifference = date-dateCreated
		return (daysDifference == 0)
	}
	
}
