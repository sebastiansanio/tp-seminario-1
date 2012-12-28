package ad
import org.apache.shiro.SecurityUtils
import login.*
import org.springframework.dao.DataIntegrityViolationException
import rule.*
import modal.*


class AdController {

	def statusChangeService
	def limitCheckerService
	def adCreateService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
		redirect(action: "listMyOffers", params: params)
    }
	
	def listMyOffers(){		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def adInstances = user.getOffers()
		def model = [adInstanceList: adInstances, adInstanceTotal: adInstances.size()]
		render(view: "list",model:model)
	}
	
	def listMyWishes(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def adInstances = user.getWishes()
		def model = [adInstanceList: adInstances, adInstanceTotal: adInstances.size()]
		render(view: "list",model:model)
	}

	def listOthersWishes(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def currentUser = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def adInstances = AdType.findByDescription(AdType.wishLabel).ads.findAll{
			it.isActive() && it.user!=currentUser
		}
		def model = [adInstanceList: adInstances, adInstanceTotal: adInstances.size()]
		render(view: "list",model:model)
	}

	def listOthersOffers(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def currentUser = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def adInstances = AdType.findByDescription(AdType.offerLabel).ads.findAll{
			it.isActive() && it.user!=currentUser
		}	
		def model = [adInstanceList: adInstances, adInstanceTotal: adInstances.size()]
		render(view: "list",model:model)
	}


    def createWish() {
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		if(limitCheckerService.checkWishesLimit(user,flash)){
			def adInstance = adCreateService.createWish(params)
			render(view: "create",model:[adInstance:adInstance])
		}else{
			redirect(action: "listMyWishes")
		}
    }

	def createOffer() {
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		if(limitCheckerService.checkOffersLimit(user,flash)){
			def adInstance = adCreateService.createOffer(params)
			render(view: "create",model:[adInstance:adInstance])
		}else{
			redirect(action: "listMyOffers")
		}		
	
	}
	
    def save() {
		
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())	
		def adInstance = adCreateService.prepareAdToSave(params,user)
		
		boolean canContinue	
		if(adInstance.isOffer())
			canContinue=limitCheckerService.checkOffersLimit(user,flash)
		else
			canContinue=limitCheckerService.checkWishesLimit(user,flash)

		if(!canContinue){
            render(view: "create", model: [adInstance: adInstance])
            return
        }

        if (!adInstance.save(flush: true)) {
            render(view: "create", model: [adInstance: adInstance])
            return
        }

		user.addToPermissions("ad:delete:"+adInstance.id)
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])
        redirect(action: "show", id: adInstance.id)
    }

    def show() {
        def adInstance = Ad.get(params.id)
        if (!adInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "list")
            return
        }

        [adInstance: adInstance]
    }

    def delete() {
        def adInstance = Ad.get(params.id)
        if (!adInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "index")
            return
        }
		statusChangeService.suspendAd(adInstance)
		redirect(action: "index")

    }
}
