<%@ page import="seminario.Application" %>



			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'ad', 'error')} required">
				<label for="ad" class="control-label"><g:message code="application.ad.label" default="Ad" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="ad" name="ad.id" from="${seminario.Ad.list()}" optionKey="id" required="" value="${applicationInstance?.ad?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: applicationInstance, field: 'ad', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'feedbacks', 'error')} ">
				<label for="feedbacks" class="control-label"><g:message code="application.feedbacks.label" default="Feedbacks" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${applicationInstance?.feedbacks?}" var="f">
    <li><g:link controller="feedback" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="feedback" action="create" params="['application.id': applicationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'feedback.label', default: 'Feedback')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: applicationInstance, field: 'feedbacks', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'rol', 'error')} required">
				<label for="rol" class="control-label"><g:message code="application.rol.label" default="Rol" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="rol" name="rol.id" from="${seminario.Rol.list()}" optionKey="id" required="" value="${applicationInstance?.rol?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: applicationInstance, field: 'rol', 'error')}</span>
				</div>
			</div>

