package main
import login.*

class MainController {
	
	def userSuggestionService
	
	def index() {
		def bestOfferers = userSuggestionService.getBestOfferers()
		def bestClients = userSuggestionService.getBestClients()
		[bestOfferers:bestOfferers,bestClients:bestClients]
		
		
	}
}
