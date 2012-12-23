package ad

class Family {

	String description
	
	static hasMany		= [ads: Ad]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return description
	}
}
