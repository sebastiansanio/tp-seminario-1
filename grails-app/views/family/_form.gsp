<%@ page import="ad.Family" %>



			<div class="control-group fieldcontain ${hasErrors(bean: familyInstance, field: 'ads', 'error')} ">
				<label for="ads" class="control-label"><g:message code="family.ads.label" default="Ads" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${familyInstance?.ads?}" var="a">
    <li><g:link controller="ad" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ad" action="create" params="['family.id': familyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ad.label', default: 'Ad')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: familyInstance, field: 'ads', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: familyInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="family.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${familyInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: familyInstance, field: 'description', 'error')}</span>
				</div>
			</div>

