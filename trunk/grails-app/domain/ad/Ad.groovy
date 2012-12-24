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
	int applicationsLimit
	BigDecimal budget
	
	
	static belongsTo	= [user: User]	
	static hasMany		= [applications: Application,desiredPlaces: Place]	
	
   
	static constraints = {
		title blank:false
		description blank:false,size:10..400
		budget nullable:true,scale:2
	}
	
	public String toString() {
		return title
	}
	
	public boolean isOffer(){
		return adType.isOffer()		
	}
	
	public boolean isWish(){
		return adType.isWish()
	}
	public boolean isActive(){
		return adStatus.isActive()
	}
	public boolean isFinalized(){
		return adStatus.isFinalized()
	}
	public boolean isSuspended(){
		return adStatus.isSuspended()
	}
	
	public getPendingApplications(){
		return applications.findAll{
			it.isPending()
		}
	}
	
	public boolean createdToday(){
		Date date = new Date()
		long daysDifference = date-dateCreated
		return (daysDifference == 0)
	}
	
}
