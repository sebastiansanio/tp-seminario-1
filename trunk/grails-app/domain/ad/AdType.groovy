package ad

class AdType {

	
	int code
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
