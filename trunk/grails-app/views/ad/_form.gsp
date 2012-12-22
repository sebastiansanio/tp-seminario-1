<%@ page import="ad.Ad" %>



			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'adType', 'error')} required">
				<label for="adType" class="control-label"><g:message code="ad.adType.label" default="Ad Type" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="adType" name="adType.id" from="${ad.AdType.list()}" optionKey="id" required="" value="${adInstance?.adType?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'adType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'applications', 'error')} ">
				<label for="applications" class="control-label"><g:message code="ad.applications.label" default="Applications" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${adInstance?.applications?}" var="a">
    <li><g:link controller="application" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="application" action="create" params="['ad.id': adInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'application.label', default: 'Application')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: adInstance, field: 'applications', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="ad.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${adInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: adInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="ad.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="user" name="user.id" from="${login.User.list()}" optionKey="id" required="" value="${adInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: adInstance, field: 'user', 'error')}</span>
				</div>
			</div>

