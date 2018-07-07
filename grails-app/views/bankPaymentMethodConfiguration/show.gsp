
<%@ page import="pos.BankPaymentMethodConfiguration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankPaymentMethodConfiguration.label', default: 'BankPaymentMethodConfiguration')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bankPaymentMethodConfiguration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bankPaymentMethodConfiguration" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bankPaymentMethodConfiguration">
			
				<g:if test="${bankPaymentMethodConfigurationInstance?.account}">
				<li class="fieldcontain">
					<span id="account-label" class="property-label"><g:message code="bankPaymentMethodConfiguration.account.label" default="Account" /></span>
					
						<span class="property-value" aria-labelledby="account-label"><g:link controller="account" action="show" id="${bankPaymentMethodConfigurationInstance?.account?.id}">${bankPaymentMethodConfigurationInstance?.account?.name}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankPaymentMethodConfigurationInstance?.bank}">
				<li class="fieldcontain">
					<span id="bank-label" class="property-label"><g:message code="bankPaymentMethodConfiguration.bank.label" default="Bank" /></span>
					
						<span class="property-value" aria-labelledby="bank-label"><g:link controller="bank" action="show" id="${bankPaymentMethodConfigurationInstance?.bank?.id}">${bankPaymentMethodConfigurationInstance?.bank?.name}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankPaymentMethodConfigurationInstance?.creationDate}">
				<li class="fieldcontain">
					<span id="creationDate-label" class="property-label"><g:message code="bankPaymentMethodConfiguration.creationDate.label" default="Creation Date" /></span>
					
						<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate date="${bankPaymentMethodConfigurationInstance?.creationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankPaymentMethodConfigurationInstance?.methodString}">
				<li class="fieldcontain">
					<span id="methodString-label" class="property-label"><g:message code="bankPaymentMethodConfiguration.methodString.label" default="Method String" /></span>
					
						<span class="property-value" aria-labelledby="methodString-label"><g:fieldValue bean="${bankPaymentMethodConfigurationInstance}" field="methodString"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankPaymentMethodConfigurationInstance?.paymentMethod}">
				<li class="fieldcontain">
					<span id="paymentMethod-label" class="property-label"><g:message code="bankPaymentMethodConfiguration.paymentMethod.label" default="Payment Method" /></span>
					
						<span class="property-value" aria-labelledby="paymentMethod-label"><g:link controller="paymentMethod" action="show" id="${bankPaymentMethodConfigurationInstance?.paymentMethod?.id}">${bankPaymentMethodConfigurationInstance?.paymentMethod?.name}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bankPaymentMethodConfigurationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bankPaymentMethodConfigurationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
