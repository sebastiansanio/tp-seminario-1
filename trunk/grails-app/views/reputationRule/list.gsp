
<%@ page import="modal.ReputationRule" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'reputationRule.label', default: 'ReputationRule')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-reputationRule" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="baseReputation" title="${message(code: 'reputationRule.baseReputation.label', default: 'Base Reputation')}" />
			
				<g:sortableColumn property="maxActiveAds" title="${message(code: 'reputationRule.maxActiveAds.label', default: 'Max Active Ads')}" />
			
				<g:sortableColumn property="maxAdsPerDay" title="${message(code: 'reputationRule.maxAdsPerDay.label', default: 'Max Ads Per Day')}" />
			
				<g:sortableColumn property="maxPrice" title="${message(code: 'reputationRule.maxPrice.label', default: 'Max Price')}" />
			
				<g:sortableColumn property="topReputation" title="${message(code: 'reputationRule.topReputation.label', default: 'Top Reputation')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${reputationRuleInstanceList}" status="i" var="reputationRuleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${reputationRuleInstance.id}">${fieldValue(bean: reputationRuleInstance, field: "baseReputation")}</g:link></td>
			
				<td>${fieldValue(bean: reputationRuleInstance, field: "maxActiveAds")}</td>
			
				<td>${fieldValue(bean: reputationRuleInstance, field: "maxAdsPerDay")}</td>
			
				<td>${fieldValue(bean: reputationRuleInstance, field: "maxPrice")}</td>
			
				<td>${fieldValue(bean: reputationRuleInstance, field: "topReputation")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${reputationRuleInstanceTotal}" />
	</div>
</section>

</body>

</html>
