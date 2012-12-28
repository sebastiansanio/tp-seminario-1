
<%@ page import="ad.Feedback" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'feedback.label', default: 'Feedback')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-feedback" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="note" title="${message(code: 'feedback.note.label', default: 'Note')}" />
			
				<g:sortableColumn property="score" title="${message(code: 'feedback.score.label', default: 'Score')}" />
			
				<th><g:message code="feedback.application.label" default="Application" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'feedback.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${feedbackInstanceList}" status="i" var="feedbackInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${feedbackInstance.id}">${fieldValue(bean: feedbackInstance, field: "note")}</g:link></td>
			
				<td>${fieldValue(bean: feedbackInstance, field: "score")}</td>
			
				<td>${fieldValue(bean: feedbackInstance, field: "application")}</td>
			
				<td><g:formatDate date="${feedbackInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${feedbackInstanceTotal}" />
	</div>
</section>

</body>

</html>
