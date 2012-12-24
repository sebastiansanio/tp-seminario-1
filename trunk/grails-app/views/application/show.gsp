
<%@ page import="ad.Application" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-application" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="application.ad.label" default="Ad" /></td>
				
				<td valign="top" class="value"><g:link controller="ad" action="show" id="${applicationInstance?.ad?.id}">${applicationInstance?.ad?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="application.applicationStatus.label" default="Application Status" /></td>
				
				<td valign="top" class="value"><g:link controller="applicationStatus" action="show" id="${applicationInstance?.applicationStatus?.id}">${applicationInstance?.applicationStatus?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="application.budget.label" default="Budget" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: applicationInstance, field: "budget")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="application.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${applicationInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="application.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: applicationInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="application.feedback.label" default="Feedback" /></td>
				
				<td valign="top" class="value"><g:link controller="feedback" action="show" id="${applicationInstance?.feedback?.id}">${applicationInstance?.feedback?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="application.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${applicationInstance?.lastUpdated}" /></td>
				
			</tr>
	<g:if test="${!SecurityUtils.subject.getPrincipal().equals(applicationInstance.user.username) }">
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="application.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${applicationInstance?.user?.id}">${applicationInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
	</g:if>
		
		</tbody>
	</table>
</section>

</body>

</html>
