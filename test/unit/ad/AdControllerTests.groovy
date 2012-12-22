package ad



import org.junit.*
import grails.test.mixin.*

/**
 * AdControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(AdController)
@Mock(Ad)
class AdControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ad/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.adInstanceList.size() == 0
        assert model.adInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.adInstance != null
    }

    void testSave() {
        controller.save()

        assert model.adInstance != null
        assert view == '/ad/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ad/show/1'
        assert controller.flash.message != null
        assert Ad.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ad/list'


        populateValidParams(params)
        def ad = new Ad(params)

        assert ad.save() != null

        params.id = ad.id

        def model = controller.show()

        assert model.adInstance == ad
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ad/list'


        populateValidParams(params)
        def ad = new Ad(params)

        assert ad.save() != null

        params.id = ad.id

        def model = controller.edit()

        assert model.adInstance == ad
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ad/list'

        response.reset()


        populateValidParams(params)
        def ad = new Ad(params)

        assert ad.save() != null

        // test invalid parameters in update
        params.id = ad.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ad/edit"
        assert model.adInstance != null

        ad.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ad/show/$ad.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ad.clearErrors()

        populateValidParams(params)
        params.id = ad.id
        params.version = -1
        controller.update()

        assert view == "/ad/edit"
        assert model.adInstance != null
        assert model.adInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ad/list'

        response.reset()

        populateValidParams(params)
        def ad = new Ad(params)

        assert ad.save() != null
        assert Ad.count() == 1

        params.id = ad.id

        controller.delete()

        assert Ad.count() == 0
        assert Ad.get(ad.id) == null
        assert response.redirectedUrl == '/ad/list'
    }
}
