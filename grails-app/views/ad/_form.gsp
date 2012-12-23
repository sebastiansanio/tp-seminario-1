<%@ page import="ad.Ad" %>



			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'adType', 'error')} required">
				<label for="adType" class="control-label"><g:message code="ad.adType.label" default="Ad Type" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="adType" name="adType.id" from="${ad.AdType.list()}" optionKey="id" required="" value="${adInstance?.adType?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'adType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'family', 'error')} required">
				<label for="adType" class="control-label"><g:message code="ad.family.label" default="Family" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="family" name="family.id" from="${ad.Family.list()}" optionKey="id" required="" value="${adInstance?.family?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'adType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="ad.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${adInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'description', 'error')}</span>
				</div>
			</div>


