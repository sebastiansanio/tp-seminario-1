<!-- 
This menu is used to show function that can be triggered on the content (an object or list of objects).
-->

<%-- Only show the "Pills" navigation menu if a controller exists (but not for home) --%>
<g:if test="${	params.controller != null
			&&	params.controller != ''
			&&	params.controller != 'main'
			&&	params.controller != 'ad'
}">
	<ul id="Menu" class="nav nav-pills">

		<g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		
		<li class="${ params.action == "list" ? 'active' : '' }">
			<g:link action="list"><i class="icon-th-list"></i> <g:message code="default.list.label" args="[entityName]"/></g:link>
		</li>
		<li class="${ params.action == "create" ? 'active' : '' }">
			<g:link action="create"><i class="icon-plus"></i> <g:message code="default.new.label"  args="[entityName]"/></g:link>
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
<g:if test="${	params.controller == 'ad'
}">
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

