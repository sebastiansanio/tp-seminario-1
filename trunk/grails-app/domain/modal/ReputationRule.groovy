package modal

class ReputationRule {

	long baseReputation
	long topReputation
	int maxActiveAds
	int maxAdsPerDay
	int maxActiveApplications
	int maxApplicationsPerDay
	BigDecimal maxPrice
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return baseReputation+" - "+topReputation
	}
}
