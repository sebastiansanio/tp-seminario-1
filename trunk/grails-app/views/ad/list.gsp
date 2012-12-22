
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
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'ad.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'ad.lastUpdated.label', default: 'Last Updated')}" />
			
				<th><g:message code="ad.adType.label" default="Ad Type" /></th>
			
				<g:sortableColumn property="description" title="${message(code: 'ad.description.label', default: 'Description')}" />
			
				<th><g:message code="ad.user.label" default="User" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${adInstanceList}" status="i" var="adInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${adInstance.id}">${fieldValue(bean: adInstance, field: "dateCreated")}</g:link></td>
			
				<td><g:formatDate date="${adInstance.lastUpdated}" /></td>
			
				<td>${fieldValue(bean: adInstance, field: "adType")}</td>
			
				<td>${fieldValue(bean: adInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: adInstance, field: "user")}</td>
			
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
