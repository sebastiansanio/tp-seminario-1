package ad

class ApplicationStatus {

	String description

	static String pendingLabel = "PENDIENTE"
	static String finalizedLabel = "FINALIZADO"
	static String suspendedLabel = "SUSPENDIDO"
	static String rejectedLabel = "RECHAZADO"
	static String acceptedLabel = "ACEPTADO"
	
		
	static hasMany		= [applications: Application]	
	
    static mapping = {
    }
    
	static constraints = {
		description inList:[pendingLabel,finalizedLabel,suspendedLabel,rejectedLabel,acceptedLabel], unique:true
    }
	
	public String toString() {
		return description
	}
	
	
	public boolean isPending(){
		return description.equals(pendingLabel)
	}
	
	public boolean isFinalized(){
		return description.equals(finalizedLabel)
	}
	
	public boolean isSuspended(){
		return description.equals(suspendedLabel)
	}
	
	public boolean isRejected(){
		return description.equals(rejectedLabel)
	}
	public boolean isAccepted(){
		return description.equals(acceptedLabel)
	}
	
}
