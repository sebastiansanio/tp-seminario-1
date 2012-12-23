package modal

class ReputationRule {

	long baseReputation
	long topReputation
	int maxActiveAds
	int maxAdsPerDay
	BigDecimal maxPrice
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return baseReputation+" - "+topReputation
	}
}
