package user
import login.*

class UserSuggestionService {

    static transactional = true

    def getBestOfferers() {
		
		def offerers = User.findAll().sort {a,b -> b.getOffererReputation() <=> a.getOffererReputation() }
		def bestOfferers = new ArrayList<User>()
		
		(0..9).each{
			bestOfferers.add(offerers.get(it))
		}
		return bestOfferers
    }
	
	def getBestClients() {
		def clients = User.findAll().sort {a,b -> b.getClientReputation() <=> a.getClientReputation() }
		def bestClients = new ArrayList<User>()
		
		(0..9).each{
			bestClients.add(clients.get(it))
		}
		return bestClients
		
	}
}
