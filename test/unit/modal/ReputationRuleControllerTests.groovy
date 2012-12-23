package modal



import org.junit.*
import grails.test.mixin.*

/**
 * ReputationRuleControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ReputationRuleController)
@Mock(ReputationRule)
class ReputationRuleControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reputationRule/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reputationRuleInstanceList.size() == 0
        assert model.reputationRuleInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.reputationRuleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reputationRuleInstance != null
        assert view == '/reputationRule/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reputationRule/show/1'
        assert controller.flash.message != null
        assert ReputationRule.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reputationRule/list'


        populateValidParams(params)
        def reputationRule = new ReputationRule(params)

        assert reputationRule.save() != null

        params.id = reputationRule.id

        def model = controller.show()

        assert model.reputationRuleInstance == reputationRule
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reputationRule/list'


        populateValidParams(params)
        def reputationRule = new ReputationRule(params)

        assert reputationRule.save() != null

        params.id = reputationRule.id

        def model = controller.edit()

        assert model.reputationRuleInstance == reputationRule
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reputationRule/list'

        response.reset()


        populateValidParams(params)
        def reputationRule = new ReputationRule(params)

        assert reputationRule.save() != null

        // test invalid parameters in update
        params.id = reputationRule.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reputationRule/edit"
        assert model.reputationRuleInstance != null

        reputationRule.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reputationRule/show/$reputationRule.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reputationRule.clearErrors()

        populateValidParams(params)
        params.id = reputationRule.id
        params.version = -1
        controller.update()

        assert view == "/reputationRule/edit"
        assert model.reputationRuleInstance != null
        assert model.reputationRuleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reputationRule/list'

        response.reset()

        populateValidParams(params)
        def reputationRule = new ReputationRule(params)

        assert reputationRule.save() != null
        assert ReputationRule.count() == 1

        params.id = reputationRule.id

        controller.delete()

        assert ReputationRule.count() == 0
        assert ReputationRule.get(reputationRule.id) == null
        assert response.redirectedUrl == '/reputationRule/list'
    }
}
