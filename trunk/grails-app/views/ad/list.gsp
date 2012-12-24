
<%@ page import="ad.Ad" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ad.label', default: 'Ad')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-ad" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:if test="${ params.action == "listOthersWishes" || params.action == "listOthersOffers"}">
					<g:sortableColumn property="user" title="${message(code: 'ad.user.label', default: 'User')}" />	
				</g:if>	
				<g:sortableColumn property="family" title="${message(code: 'ad.family.label', default: 'Family')}" />
				<g:sortableColumn property="title" title="${message(code: 'ad.title.label', default: 'Title')}" />
				<g:sortableColumn property="dateCreated" title="${message(code: 'ad.dateCreated.label', default: 'Date Created')}" />
				<g:sortableColumn property="adStatus" title="${message(code: 'ad.adStatus.label', default: 'Ad Status')}" />
				<g:sortableColumn property="applicationsLimit" title="${message(code: 'ad.applicationsLimit.label', default: 'Applications limit')}" />
				<g:sortableColumn property="budget" title="${message(code: 'ad.budget.label', default: 'Budget')}" />

			
			</tr>
		</thead>
		<tbody>
		<g:each in="${adInstanceList}" status="i" var="adInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<g:if test="${ params.action == "listOthersWishes" || params.action == "listOthersOffers"}">
					<td><g:link controller="user" action="show" id="${adInstance.user.id}">${fieldValue(bean: adInstance, field: "user")}</g:link></td>
				</g:if>
				<td>${fieldValue(bean: adInstance, field: "family")}</td>
				<td><g:link action="show" id="${adInstance.id}">${fieldValue(bean: adInstance, field: "title")}</g:link></td>
				<td>${fieldValue(bean: adInstance, field: "dateCreated")}</td>		
				<td>${fieldValue(bean: adInstance, field: "adStatus")}</td>
				<td>${fieldValue(bean: adInstance, field: "applicationsLimit")}</td>
				<td>${fieldValue(bean: adInstance, field: "budget")}</td>

			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${adInstanceTotal}" />
	</div>
</section>

</body>

</html>
