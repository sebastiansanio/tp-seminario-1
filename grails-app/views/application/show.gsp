
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
				
				<td valign="top" class="value">${applicationInstance?.applicationStatus?.encodeAsHTML()}</td>
				
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
				
				<td valign="top" class="value">
				
					<g:textArea disabled="true" style="width: 80%;" rows="7" name="description" value="${applicationInstance?.description}"/>
				</td>
				
			</tr>
		

	<g:if test="${!SecurityUtils.subject.getPrincipal().equals(applicationInstance.user.username) }">
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="application.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${applicationInstance?.user?.id}">${applicationInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
	</g:if>
		
		
		
		</tbody>
	</table>
	
	<g:if test="${!SecurityUtils.subject.getPrincipal().equals(applicationInstance.user.username) && applicationInstance.isPending() }">
			<div class="span12 btn btn-alert">
				<g:link class="span12" action="accept" id="${ applicationInstance?.id}">
					<g:message code="application.accept.label" default="Accept" />
				</g:link>
	        </div>
	        <div class="span12 btn btn-danger">
				<g:link class="span12" action="reject" id="${ applicationInstance?.id}">
					<g:message code="application.reject.label" default="Reject" />
				</g:link>
	        </div>
	</g:if>
		
</section>

</body>

</html>
