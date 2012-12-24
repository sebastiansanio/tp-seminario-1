<%@ page import="login.User" %>



			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
				<label for="username" class="control-label"><g:message code="user.username.label" default="Username" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="username" required="" value="${userInstance?.username}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'username', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'ads', 'error')} ">
				<label for="ads" class="control-label"><g:message code="user.ads.label" default="Ads" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${userInstance?.ads?}" var="a">
    <li><g:link controller="ad" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ad" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ad.label', default: 'Ad')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'ads', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'applications', 'error')} ">
				<label for="applications" class="control-label"><g:message code="user.applications.label" default="Applications" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${userInstance?.applications?}" var="a">
    <li><g:link controller="application" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="application" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'application.label', default: 'Application')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'applications', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'passwordHash', 'error')} ">
				<label for="passwordHash" class="control-label"><g:message code="user.passwordHash.label" default="Password Hash" /></label>
				<div class="controls">
					<g:textField name="passwordHash" value="${userInstance?.passwordHash}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'passwordHash', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'permissions', 'error')} ">
				<label for="permissions" class="control-label"><g:message code="user.permissions.label" default="Permissions" /></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'permissions', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'place', 'error')} required">
				<label for="place" class="control-label"><g:message code="user.place.label" default="Place" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="place" name="place.id" from="${modal.Place.list()}" optionKey="id" required="" value="${userInstance?.place?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'place', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'reputations', 'error')} ">
				<label for="reputations" class="control-label"><g:message code="user.reputations.label" default="Reputations" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${userInstance?.reputations?}" var="r">
    <li><g:link controller="reputation" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reputation" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reputation.label', default: 'Reputation')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'reputations', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'roles', 'error')} ">
				<label for="roles" class="control-label"><g:message code="user.roles.label" default="Roles" /></label>
				<div class="controls">
					<g:select name="roles" from="${login.Role.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.roles*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'roles', 'error')}</span>
				</div>
			</div>

