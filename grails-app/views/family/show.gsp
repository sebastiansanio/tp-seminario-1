
<%@ page import="ad.Family" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'family.label', default: 'Family')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-family" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="family.ads.label" default="Ads" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${familyInstance.ads}" var="a">
						<li><g:link controller="ad" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="family.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: familyInstance, field: "description")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
