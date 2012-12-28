<%@ page import="ad.Feedback" %>




			<div class="control-group fieldcontain ${hasErrors(bean: feedbackInstance, field: 'application', 'error')} required">
				<label for="application" class="control-label"><g:message code="feedback.application.label" default="Application" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="application" name="application.id" from="${ad.Application.list()}" optionKey="id" required="" value="${feedbackInstance?.application?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: feedbackInstance, field: 'application', 'error')}</span>
				</div>
			</div>

