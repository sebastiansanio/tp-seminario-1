<%@ page import="ad.Feedback" %>

			<div class="control-group fieldcontain ${hasErrors(bean: feedbackInstance, field: 'application', 'error')}">
				<label for="application" class="control-label"><g:message code="feedback.application.label" default="Application" /></label>
				<div class="controls">
				
			     	<g:textArea disabled="disabled" style="width: 50%;" rows="7" name="note" value="${feedbackInstance.application}"/>

					<input type="hidden" id="application" name="application.id" value=" ${feedbackInstance.application.id}"/>
				
					<span class="help-inline">${hasErrors(bean: feedbackInstance, field: 'application', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: feedbackInstance, field: 'note', 'error')} ">
				<label for="note" class="control-label"><g:message code="feedback.note.label" default="Note" /></label>
				<div class="controls">
					<g:textArea style="width: 50%;" rows="7" name="note" value="${feedbackInstance?.note}"/>
					<span class="help-inline">${hasErrors(bean: feedbackInstance, field: 'note', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: feedbackInstance, field: 'score', 'error')} required">
				<label for="score" class="control-label"><g:message code="feedback.score.label" default="Score" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select name="score" from="${0..10}" class="range" required="" value="${fieldValue(bean: feedbackInstance, field: 'score')}"/>
					<span class="help-inline">${hasErrors(bean: feedbackInstance, field: 'score', 'error')}</span>
				</div>
			</div>

