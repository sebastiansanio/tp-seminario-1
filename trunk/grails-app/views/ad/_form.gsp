<%@ page import="ad.*" %>




			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'adType', 'error')} required">
				<label for="adType" class="control-label"><g:message code="ad.adType.label" default="Ad Type" /></label>
				<div class="controls">
					<select disabled="disabled">
					<option>  ${adInstance.adType} </option>
					</select>
					<input type="hidden"  id="adType" name="adType.id" value="${adInstance.adType.id }"/>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'title', 'error')} ">
				<label for="title" class="control-label"><g:message code="ad.title.label" default="Title" /></label>
				<div class="controls">
					<g:textField name="title" value="${adInstance?.title}"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'title', 'error')}</span>
				</div>
			</div>



			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="ad.description.label" default="Description" /></label>
				<div class="controls">
					<g:textArea style="width: 50%;" rows="7" name="description" value="${adInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'description', 'error')}</span>
				</div>
			</div>


			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'family', 'error')} required">
				<label for="adType" class="control-label"><g:message code="ad.family.label" default="Family" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="family" name="family.id" from="${ad.Family.list()}" optionKey="id" required="" value="${adInstance?.family?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'family', 'error')}</span>
				</div>
			</div>


			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'desiredPlaces', 'error')} required">
				<label for="desirdPlaces" class="control-label"><g:message code="ad.desiredPlaces.label" default="Places" /></label>
				<div class="controls">
					<g:select multiple="true" id="desiredPlaces" name="desiredPlaces.id" from="${modal.Place.list()}" required="" optionKey="id" value="${adInstance?.desiredPlaces?.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'desiredPlaces', 'error')}</span>
				</div>
			</div>


			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'minimumReputation', 'error')} ">
				<label for="minimumReputation" class="control-label"><g:message code="ad.minimumReputation.label" default="Minimun reputation" /></label>
				<div class="controls">
					<g:field type="number" name="minimumReputation" value="${adInstance?.minimumReputation}"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'minimumReputation', 'error')}</span>
				</div>
			</div>


			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'applicationsLimit', 'error')} ">
				<label for="applicationsLimit" class="control-label"><g:message code="ad.applicationsLimit.label" default="Applications limit" /></label>
				<div class="controls">
					<g:field type="number" name="applicationsLimit" value="${adInstance?.applicationsLimit}"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'applicationsLimit', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'budget', 'error')} ">
				<label for="budget" class="control-label"><g:message code="ad.budget.label" default="Budget" /></label>
				<div class="controls">
					<g:field type="text" name="budget" value="${adInstance?.budget}"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'budget', 'error')}</span>
				</div>
			</div>
		