
<%@ page import="login.User" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-user" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.username.label" default="Username" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.ads.label" default="Ads" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${userInstance.ads}" var="a">
						<li><g:link controller="ad" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userInstance?.dateCreated}" /></td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.place.label" default="Place" /></td>
				
				<td valign="top" class="value">${userInstance?.place?.encodeAsHTML()}</td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.reputation.offerer.label" default="Reputations" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					
					${userInstance.getOffererReputation()}

					</ul>
				</td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.reputation.client.label" default="Reputations" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>

					${userInstance.getClientReputation()}

					</ul>
				</td>
				
			</tr>
		
		
		</tbody>
	</table>
</section>

</body>

</html>
