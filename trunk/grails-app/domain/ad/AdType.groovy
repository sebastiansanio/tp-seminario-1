package ad

class AdType {

	
	String description
	
	static String wishLabel = "Solicitud"
	static String offerLabel = "Oferta"
	
	static hasMany		= [ads: Ad]	
	
    static mapping = {
    }
    
	static constraints = {
    	description inList:[wishLabel,offerLabel] 
		
	}
	
	public String toString() {
		return description
	}
	
	
	public boolean isWish(){
		return description.equals(wishLabel)
	}
	
	public boolean isOffer(){
		return description.equals(offerLabel)
	}

}
