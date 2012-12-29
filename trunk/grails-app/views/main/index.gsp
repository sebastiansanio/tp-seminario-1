<html>

<head>
	<title>${message(code: 'main.label')} </title>
	<meta name="layout" content="kickstart" />
</head>

<body>

<div class="span5">
${message(code:'bestOfferers.label') }

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'user.dateCreated.label', default: 'Date Created')}" />
			
				<th><g:message code="user.place.label" default="Place" /></th>
			
				<th><g:message code="user.reputation.label" default="Reputation" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${bestOfferers}" status="i" var="userInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link controller="user" action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
			
				<td><g:formatDate date="${userInstance.dateCreated}" /></td>
			
				
				<td>${fieldValue(bean: userInstance, field: "place")}</td>
				
				<td>${userInstance.getOffererReputation() }</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
</div>
<div class="span5">
${message(code:'bestClients.label') }


	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'user.dateCreated.label', default: 'Date Created')}" />
			
				<th><g:message code="user.place.label" default="Place" /></th>
			
				<th><g:message code="user.reputation.label" default="Reputation" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${bestClients}" status="i" var="userInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link controller="user" action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
			
				<td><g:formatDate date="${userInstance.dateCreated}" /></td>
			
				
				<td>${fieldValue(bean: userInstance, field: "place")}</td>
				
				<td>${userInstance.getClientReputation() }</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>


</div>


</body>


</html>