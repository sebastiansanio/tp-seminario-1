
<%@ page import="seminario.Application" %>
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
			
				<th><g:message code="application.ad.label" default="Ad" /></th>
			
				<th><g:message code="application.rol.label" default="Rol" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${applicationInstanceList}" status="i" var="applicationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${applicationInstance.id}">${fieldValue(bean: applicationInstance, field: "ad")}</g:link></td>
			
				<td>${fieldValue(bean: applicationInstance, field: "rol")}</td>
			
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
