
<%@ page import="ad.Application" %>


<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-application" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:if test="${ params.action == "listReceivedApplications"}">
					<g:sortableColumn property="user" title="${message(code: 'application.user.label', default: 'User')}" />	
				</g:if>	
			
				<th><g:message code="application.label" default="Application" /></th>
				<th><g:message code="application.applicationStatus.label" default="Application Status" /></th>
			
			
				<th><g:message code="application.ad.label" default="Ad" /></th>
				<th><g:message code="ad.adType.label" default="Ad type" /></th>
			
			
			
				<g:sortableColumn property="budget" title="${message(code: 'application.budget.label', default: 'Budget')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'application.dateCreated.label', default: 'Date Created')}" />
			
			
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${applicationInstanceList}" status="i" var="applicationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
			
				<g:if test="${ params.action == "listReceivedApplications"}">
			
					<td><g:link controller="user" action="show" id="${applicationInstance.user.id}">${applicationInstance.user }</g:link></td>
			
				</g:if>	
			
			
				<td><g:link action="show" id="${applicationInstance.id}">${message(code: 'showapplication.label')}</g:link></td>
			
				<td>${fieldValue(bean: applicationInstance, field: "applicationStatus")}</td>
			
			
				<td><g:link controller="ad" action="show" id="${applicationInstance.ad.id}">${fieldValue(bean: applicationInstance, field: "ad")}</g:link></td>
				<td>${fieldValue(bean: applicationInstance, field: "ad.adType")}</td>
			
			
				<td>${fieldValue(bean: applicationInstance, field: "budget")}</td>
			
				<td><g:formatDate date="${applicationInstance.dateCreated}" /></td>
				
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${applicationInstanceTotal}" />
	</div>
</section>

</body>

</html>
