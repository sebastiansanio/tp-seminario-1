
<%@ page import="ad.Ad" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ad.label', default: 'Ad')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-ad" class="first">

	<table class="table">
		<tbody>
		

			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.adType.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: adInstance, field: "adType")}</td>
				
			</tr>


			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.family.label" default="Family" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: adInstance, field: "family")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.title.label" default="Title" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: adInstance, field: "title")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.description.label" default="Description" /></td>
				
				<td valign="top" class="value">
				
				
				<g:textArea disabled="true" style="width: 80%;" rows="7" name="description" value="${adInstance?.description}"/>
				
				
				</td>
				
			</tr>
		
		
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${adInstance?.dateCreated}" /></td>
				
			</tr>
		<g:if test="${SecurityUtils.subject.getPrincipal().equals(adInstance.user.username) }">
	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.adStatus.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: adInstance, field: "adStatus")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${adInstance?.lastUpdated}" /></td>
				
		
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.applications.label" default="Applications" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${adInstance.applications}" var="a">
						<li><g:link controller="application" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
			</tr>
	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.desiredPlaces.label" default="Desired places" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${adInstance.desiredPlaces}" var="a">
						<li>${a?.encodeAsHTML()}</li>
					</g:each>
					</ul>
				</td>
				
			</tr>
	
	
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.minimumReputation.label" default="Minimum reputation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: adInstance, field: "minimumReputation")}</td>
				
			</tr>
	
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.applicationsLimit.label" default="Applications Limit" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: adInstance, field: "applicationsLimit")}</td>
				
			</tr>
		</g:if>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.budget.label" default="Budget" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: adInstance, field: "budget")}</td>
				
			</tr>
		
		
		<g:if test="${!SecurityUtils.subject.getPrincipal().equals(adInstance.user.username) }">
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${adInstance?.user?.id}">${adInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
			
			
			<tr class="prop">
			
				<td colspan="2" valign="top" class="name"><g:link controller="application" action="create" params="[adid:adInstance?.id]"><h3>
				<g:message code="ad.apply.label" default="Apply" /></h3></g:link></td>
				
				
			</tr>
		
		</g:if>
		

		
		
		
		</tbody>
	</table>
</section>

</body>

</html>
