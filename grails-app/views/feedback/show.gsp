
<%@ page import="ad.Feedback" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'feedback.label', default: 'Feedback')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-feedback" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feedback.note.label" default="Note" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: feedbackInstance, field: "note")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feedback.score.label" default="Score" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: feedbackInstance, field: "score")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feedback.application.label" default="Application" /></td>
				
				<td valign="top" class="value"><g:link controller="application" action="show" id="${feedbackInstance?.application?.id}">${feedbackInstance?.application?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feedback.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${feedbackInstance?.dateCreated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
