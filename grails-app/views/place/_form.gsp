<%@ page import="modal.Place" %>



			<div class="control-group fieldcontain ${hasErrors(bean: placeInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="place.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${placeInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: placeInstance, field: 'name', 'error')}</span>
				</div>
			</div>

