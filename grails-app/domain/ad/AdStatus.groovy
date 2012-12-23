package ad

class AdStatus {

	
	String description

	static String activeLabel = "ACTIVO"
	static String finalizedLabel = "FINALIZADO"
	static String suspendedLabel = "SUSPENDIDO"
	
		
	static hasMany		= [ads: Ad]	
	
    static mapping = {
    }
    
	static constraints = {
		description inList:[activeLabel,finalizedLabel,suspendedLabel]
    }
	
	public String toString() {
		return description
	}
	
	
	public boolean isActive(){
		return description.equals(activeLabel)
	}
	
	public boolean isFinalized(){
		return description.equals(finalizedLabel)
	}
	
	public boolean isSuspended(){
		return description.equals(suspendedLabel)
	}
	
	
}
