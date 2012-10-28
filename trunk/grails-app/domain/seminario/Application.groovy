package seminario

/**
 * Application
 * A domain class describes the data object and it's mapping to the database
 */
class Application {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	
	static belongsTo	= [ad: Ad, rol: Rol]	
	static hasMany		= [feedbacks: Feedback]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
