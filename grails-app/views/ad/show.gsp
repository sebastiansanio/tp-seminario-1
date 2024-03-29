
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
				<td valign="top" class="name"><g:message code="ad.applications.label" default="Applications" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${adInstance.applications}" var="a">
						<li><g:link controller="application" action="show" id="${a.id}">${a?.encodeAsHTML()+" ("+a?.applicationStatus.encodeAsHTML()+")"}</g:link></li>
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
				<td valign="top" class="name"><g:message code="ad.possibleApplicationsQuantity.label" default="Applications limit left" /></td>
				
				<td valign="top" class="value">${adInstance.getPossibleApplicationsQuantity()}</td>
				
			</tr>
		</g:if>
		<g:if test="${!SecurityUtils.subject.getPrincipal().equals(adInstance.user.username) }">
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.admitsApplications.label" default="Admits applications?" /></td>
				
				<td valign="top" class="value">${(adInstance.getPossibleApplicationsQuantity()==0 && adInstance.isActive())?message(code:"no.label"):message(code:"yes.label")}</td>
				
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
		</g:if>			
			
		</tbody>
	</table>
				
		<g:if test="${!SecurityUtils.subject.getPrincipal().equals(adInstance.user.username) }">
			<div class="span12 btn btn-alert">
				<g:link class="span12" controller="application" action="create" params="[adid:adInstance?.id]">
					<g:message code="ad.apply.label" default="Apply" />
				</g:link>
	        </div>
		</g:if>

</section>

</body>

</html>
