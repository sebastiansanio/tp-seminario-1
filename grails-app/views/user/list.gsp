
<%@ page import="login.User" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-user" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'user.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'user.lastUpdated.label', default: 'Last Updated')}" />
			
				<g:sortableColumn property="passwordHash" title="${message(code: 'user.passwordHash.label', default: 'Password Hash')}" />
			
				<th><g:message code="user.place.label" default="Place" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${userInstanceList}" status="i" var="userInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
			
				<td><g:formatDate date="${userInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${userInstance.lastUpdated}" /></td>
			
				<td>${fieldValue(bean: userInstance, field: "passwordHash")}</td>
			
				<td>${fieldValue(bean: userInstance, field: "place")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${userInstanceTotal}" />
	</div>
</section>

</body>

</html>
