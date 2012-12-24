<%@ page import="ad.Application" %>





			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'ad.user', 'error')}">
				<label for="ad.user" class="control-label"><g:message code="ad.user.label" default="User" /></label>
				<div class="controls">
				
					<select disabled="disabled">
					<option>  ${applicationInstance.ad.user} </option>
					</select>
				
				</div>
			</div>


			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'ad', 'error')}">
				<label for="ad" class="control-label"><g:message code="application.ad.label" default="Ad" /></label>
				<div class="controls">
				
					<select disabled="disabled">
					<option>  ${applicationInstance.ad} </option>
					</select>
					<input type="hidden" id="ad" name="ad.id" value=" ${applicationInstance.ad.id}"/>
				
				</div>
			</div>


			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="application.description.label" default="Description" /></label>
				<div class="controls">
					<g:textArea style="width: 50%;" rows="7" name="description" value="${applicationInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: applicationInstance, field: 'description', 'error')}</span>
				</div>
			</div>


			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'budget', 'error')} ">
				<label for="budget" class="control-label"><g:message code="application.budget.label" default="Budget" /></label>
				<div class="controls">
					<g:field type="text" name="budget" step="any" value="${applicationInstance.budget}"/>
					<span class="help-inline">${hasErrors(bean: applicationInstance, field: 'budget', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: applicationInstance, field: 'ad.description', 'error')}">
				<label for="ad.user" class="control-label"><g:message code="applicacion.ad.description.label" default="Ad description" /></label>
				<div class="controls">				
				<g:textArea disabled="disabled" style="width: 50%;" rows="7" name="description" value="${applicationInstance?.ad?.description}"/>
				</div>
			</div>

