
<%@ page import="seminario.Application" %>
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
				<td valign="top" class="name"><g:message code="application.feedbacks.label" default="Feedbacks" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${applicationInstance.feedbacks}" var="f">
						<li><g:link controller="feedback" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="application.rol.label" default="Rol" /></td>
				
				<td valign="top" class="value"><g:link controller="rol" action="show" id="${applicationInstance?.rol?.id}">${applicationInstance?.rol?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
