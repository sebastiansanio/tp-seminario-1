package main
import login.*

class MainController {

	
	def index() {
		def bestOfferers = User.findAll()
		def bestClients = User.findAll()
		[bestOfferers:bestOfferers,bestClients:bestClients]
		
		
	}
}
