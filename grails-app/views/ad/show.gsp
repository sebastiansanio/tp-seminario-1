
<%@ page import="ad.Ad" %>
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
				<td valign="top" class="name"><g:message code="ad.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${adInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${adInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.adType.label" default="Ad Type" /></td>
				
				<td valign="top" class="value"><g:link controller="adType" action="show" id="${adInstance?.adType?.id}">${adInstance?.adType?.encodeAsHTML()}</g:link></td>
				
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
				<td valign="top" class="name"><g:message code="ad.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: adInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ad.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${adInstance?.user?.id}">${adInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
