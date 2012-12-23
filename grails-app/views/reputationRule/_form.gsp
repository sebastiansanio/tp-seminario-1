<%@ page import="modal.ReputationRule" %>



			<div class="control-group fieldcontain ${hasErrors(bean: reputationRuleInstance, field: 'baseReputation', 'error')} required">
				<label for="baseReputation" class="control-label"><g:message code="reputationRule.baseReputation.label" default="Base Reputation" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="baseReputation" required="" value="${reputationRuleInstance.baseReputation}"/>
					<span class="help-inline">${hasErrors(bean: reputationRuleInstance, field: 'baseReputation', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reputationRuleInstance, field: 'maxActiveAds', 'error')} required">
				<label for="maxActiveAds" class="control-label"><g:message code="reputationRule.maxActiveAds.label" default="Max Active Ads" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="maxActiveAds" required="" value="${reputationRuleInstance.maxActiveAds}"/>
					<span class="help-inline">${hasErrors(bean: reputationRuleInstance, field: 'maxActiveAds', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reputationRuleInstance, field: 'maxAdsPerDay', 'error')} required">
				<label for="maxAdsPerDay" class="control-label"><g:message code="reputationRule.maxAdsPerDay.label" default="Max Ads Per Day" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="maxAdsPerDay" required="" value="${reputationRuleInstance.maxAdsPerDay}"/>
					<span class="help-inline">${hasErrors(bean: reputationRuleInstance, field: 'maxAdsPerDay', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reputationRuleInstance, field: 'maxPrice', 'error')} required">
				<label for="maxPrice" class="control-label"><g:message code="reputationRule.maxPrice.label" default="Max Price" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="maxPrice" step="any" required="" value="${reputationRuleInstance.maxPrice}"/>
					<span class="help-inline">${hasErrors(bean: reputationRuleInstance, field: 'maxPrice', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reputationRuleInstance, field: 'topReputation', 'error')} required">
				<label for="topReputation" class="control-label"><g:message code="reputationRule.topReputation.label" default="Top Reputation" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="topReputation" required="" value="${reputationRuleInstance.topReputation}"/>
					<span class="help-inline">${hasErrors(bean: reputationRuleInstance, field: 'topReputation', 'error')}</span>
				</div>
			</div>

