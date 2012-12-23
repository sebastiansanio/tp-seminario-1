
<%@ page import="modal.ReputationRule" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'reputationRule.label', default: 'ReputationRule')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-reputationRule" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reputationRule.baseReputation.label" default="Base Reputation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reputationRuleInstance, field: "baseReputation")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reputationRule.maxActiveAds.label" default="Max Active Ads" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reputationRuleInstance, field: "maxActiveAds")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reputationRule.maxAdsPerDay.label" default="Max Ads Per Day" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reputationRuleInstance, field: "maxAdsPerDay")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reputationRule.maxPrice.label" default="Max Price" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reputationRuleInstance, field: "maxPrice")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reputationRule.topReputation.label" default="Top Reputation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reputationRuleInstance, field: "topReputation")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
