package ad
import org.apache.shiro.SecurityUtils
import login.*
import org.springframework.dao.DataIntegrityViolationException



class AdController {

	def limitCheckerService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "listMyWishes", params: params)
    }

	private void getList(String adType){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		def adInstances = user.ads.findAll{
			it.adType.description==adType
		}
		def model = [adInstanceList: adInstances, adInstanceTotal: adInstances.size()]
		render(view: "list",model:model)
	}
	
	def listMyOffers(){
		getList("Oferta")
	}
	
	def listMyWishes(){
		getList("Deseo")
	}


    def createWish() {
		def adInstance = new Ad(params)
		adInstance.adType = AdType.findByDescription("Deseo")
		
		render(view: "create",model:[adInstance:adInstance])

    }

	def createOffer() {
		def adInstance = new Ad(params)
		adInstance.adType = AdType.findByDescription("Oferta")
		
		render(view: "create",model:[adInstance:adInstance])
		
	}
	
	
    def save() {
		
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		
		params.put('user.id', user.id)
		params.put('adStatus.id', AdStatus.findByDescription("ACTIVO").id)
		System.out.println(params)
		
        def adInstance = new Ad(params)
				
        if (!adInstance.save(flush: true)) {
            render(view: "create", model: [adInstance: adInstance])
            return
        }

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

    def edit() {
        def adInstance = Ad.get(params.id)
        if (!adInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "list")
            return
        }

        [adInstance: adInstance]
    }

    def update() {
        def adInstance = Ad.get(params.id)
        if (!adInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (adInstance.version > version) {
                adInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ad.label', default: 'Ad')] as Object[],
                          "Another user has updated this Ad while you were editing")
                render(view: "edit", model: [adInstance: adInstance])
                return
            }
        }

        adInstance.properties = params

        if (!adInstance.save(flush: true)) {
            render(view: "edit", model: [adInstance: adInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])
        redirect(action: "show", id: adInstance.id)
    }

    def delete() {
        def adInstance = Ad.get(params.id)
        if (!adInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "index")
            return
        }

        try {
            adInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "index")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
