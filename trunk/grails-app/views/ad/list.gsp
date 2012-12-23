
<%@ page import="ad.Ad" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ad.label', default: 'Ad')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-ad" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
			
				<g:sortableColumn property="family" title="${message(code: 'ad.family.label', default: 'Family')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'ad.dateCreated.label', default: 'Date Created')}" />
						
			
				<g:sortableColumn property="description" title="${message(code: 'ad.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="adStatus" title="${message(code: 'ad.adStatus.label', default: 'Ad Status')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${adInstanceList}" status="i" var="adInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td>${fieldValue(bean: adInstance, field: "family")}</td>
			
				<td>${fieldValue(bean: adInstance, field: "dateCreated")}</td>
			
			
				<td><g:link action="show" id="${adInstance.id}">${fieldValue(bean: adInstance, field: "description")}</g:link></td>
			
				<td>${fieldValue(bean: adInstance, field: "adStatus")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${adInstanceTotal}" />
	</div>
</section>

</body>

</html>
