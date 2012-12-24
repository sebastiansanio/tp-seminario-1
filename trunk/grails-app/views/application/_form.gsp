<%@ page import="ad.Application" %>



			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'ad', 'error')} required">
				<label for="ad" class="control-label"><g:message code="application.ad.label" default="Ad" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="ad" name="ad.id" from="${ad.Ad.list()}" optionKey="id" required="" value="${applicationInstance?.ad?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: applicationInstance, field: 'ad', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'applicationStatus', 'error')} required">
				<label for="applicationStatus" class="control-label"><g:message code="application.applicationStatus.label" default="Application Status" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="applicationStatus" name="applicationStatus.id" from="${ad.ApplicationStatus.list()}" optionKey="id" required="" value="${applicationInstance?.applicationStatus?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: applicationInstance, field: 'applicationStatus', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'budget', 'error')} required">
				<label for="budget" class="control-label"><g:message code="application.budget.label" default="Budget" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="text" name="budget" step="any" required="" value="${applicationInstance.budget}"/>
					<span class="help-inline">${hasErrors(bean: applicationInstance, field: 'budget', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="application.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${applicationInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: applicationInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'feedback', 'error')}">
				<label for="feedback" class="control-label"><g:message code="application.feedback.label" default="Feedback" /></label>
				<div class="controls">
					<g:select id="feedback" name="feedback.id" from="${ad.Feedback.list()}" optionKey="id" value="${applicationInstance?.feedback?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: applicationInstance, field: 'feedback', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="application.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="user" name="user.id" from="${login.User.list()}" optionKey="id" required="" value="${applicationInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: applicationInstance, field: 'user', 'error')}</span>
				</div>
			</div>

