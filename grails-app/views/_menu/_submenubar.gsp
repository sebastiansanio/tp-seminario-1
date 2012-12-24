<%@ page import="org.apache.shiro.SecurityUtils" %>


<g:if test="${	params.controller == 'ad'}">
	<ul id="Menu" class="nav nav-pills">

		<g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		

		
		<li class="${ params.action == "listMyOffers" ? 'active' : '' }">
			<g:link action="listMyOffers"><i class="icon-th-list"></i> <g:message code="default.listMyOffers.label" args="[entityName]"/></g:link>
		</li>
		
		<li class="${ params.action == "listMyWishes" ? 'active' : '' }">
			<g:link action="listMyWishes"><i class="icon-th-list"></i> <g:message code="default.listMyWishes.label" args="[entityName]"/></g:link>
		</li>
		
		<li class="${ params.action == "createOffer" ? 'active' : '' }">
			<g:link action="createOffer"><i class="icon-plus"></i> <g:message code="default.createOffer.label"  args="[entityName]"/></g:link>
		</li>
		
		<li class="${ params.action == "createWish" ? 'active' : '' }">
			<g:link action="createWish"><i class="icon-plus"></i> <g:message code="default.createWish.label"  args="[entityName]"/></g:link>
		</li>
		
		
		
		<g:if test="${( params.action == 'show' || params.action == 'edit') && adInstance.user.username==SecurityUtils.subject.getPrincipal() }">
		
			<li class="${ params.action == "edit" ? 'active' : '' }">
				<g:link action="edit" id="${params.id}"><i class="icon-pencil"></i> <g:message code="default.edit.ad.label"  args="${[adInstance.adType] }"/></g:link>
			</li>
			<li class="">
				<g:render template="/_common/modals/deleteTextLink"/>
			</li>
		</g:if>
		
		
		<li class="${ params.action == "listOthersOffers" ? 'active' : '' }">
			<g:link action="listOthersOffers"><i class="icon-th-list"></i> <g:message code="default.listOthersOffers.label" args="[entityName]"/></g:link>
		</li>
		
		<li class="${ params.action == "listOthersWishes" ? 'active' : '' }">
			<g:link action="listOthersWishes"><i class="icon-th-list"></i> <g:message code="default.listOthersWishes.label" args="[entityName]"/></g:link>
		</li>
		
		
	</ul>


</g:if>

<g:if test="${	params.controller == 'application'}">
	<ul id="Menu" class="nav nav-pills">

		<g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		

		
		<li class="${ params.action == "listMyApplications" ? 'active' : '' }">
			<g:link action="listMyApplications"><i class="icon-th-list"></i> <g:message code="default.listMyApplications.label" args="[entityName]"/></g:link>
		</li>
		
		<li class="${ params.action == "listReceivedApplications" ? 'active' : '' }">
			<g:link action="listReceivedApplications"><i class="icon-th-list"></i> <g:message code="default.listReceivedApplications.label" args="[entityName]"/></g:link>
		</li>	
		
		
		
		
		<g:if test="${ params.action == 'show' || params.action == 'edit' }">
			<!-- the item is an object (not a list) -->
			<li class="${ params.action == "edit" ? 'active' : '' }">
				<g:link action="edit" id="${params.id}"><i class="icon-pencil"></i> <g:message code="default.edit.label"  args="[entityName]"/></g:link>
			</li>
			<li class="">
				<g:render template="/_common/modals/deleteTextLink"/>
			</li>
		</g:if>
		
	</ul>


</g:if>

