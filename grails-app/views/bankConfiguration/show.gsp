
<%@ page import="pos.BankConfiguration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankConfiguration.label', default: 'BankConfiguration')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bankConfiguration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bankConfiguration" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bankConfiguration">
			
				<g:if test="${bankConfigurationInstance?.bank}">
				<li class="fieldcontain">
					<span id="bank-label" class="property-label"><g:message code="bankConfiguration.bank.label" default="Bank" /></span>
					
						<span class="property-value" aria-labelledby="bank-label"><g:link controller="bank" action="show" id="${bankConfigurationInstance?.bank?.id}">${bankConfigurationInstance?.bank?.name}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankConfigurationInstance?.creationDate}">
				<li class="fieldcontain">
					<span id="creationDate-label" class="property-label"><g:message code="bankConfiguration.creationDate.label" default="Creation Date" /></span>
					
						<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate date="${bankConfigurationInstance?.creationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankConfigurationInstance?.fileExtension}">
				<li class="fieldcontain">
					<span id="fileExtension-label" class="property-label"><g:message code="bankConfiguration.fileExtension.label" default="File Extension" /></span>
					
						<span class="property-value" aria-labelledby="fileExtension-label"><g:fieldValue bean="${bankConfigurationInstance}" field="fileExtension"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankConfigurationInstance?.lineSeparator}">
				<li class="fieldcontain">
					<span id="separator-label" class="property-label"><g:message code="bankConfiguration.separator.label" default="Separator" /></span>
						<span class="property-value" aria-labelledby="separator-label"><g:fieldValue bean="${bankConfigurationInstance}" field="lineSeparator"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bankConfigurationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bankConfigurationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
