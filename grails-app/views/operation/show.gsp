
<%@ page import="pos.Operation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'operation.label', default: 'Operation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-operation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-operation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list operation">
			
				<g:if test="${operationInstance?.account}">
				<li class="fieldcontain">
					<span id="account-label" class="property-label"><g:message code="operation.account.label" default="Account" /></span>
					
						<span class="property-value" aria-labelledby="account-label"><g:link controller="account" action="show" id="${operationInstance?.account?.id}">${operationInstance?.account?.name}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${operationInstance?.entryDate}">
				<li class="fieldcontain">
					<span id="entryDate-label" class="property-label"><g:message code="operation.entryDate.label" default="Entry Date" /></span>
					
						<span class="property-value" aria-labelledby="entryDate-label"><g:formatDate date="${operationInstance?.entryDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${operationInstance?.nature}">
				<li class="fieldcontain">
					<span id="nature-label" class="property-label"><g:message code="operation.nature.label" default="Nature" /></span>
					
						<span class="property-value" aria-labelledby="nature-label"><g:fieldValue bean="${operationInstance}" field="nature"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${operationInstance?.operationDate}">
				<li class="fieldcontain">
					<span id="operationDate-label" class="property-label"><g:message code="operation.operationDate.label" default="Operation Date" /></span>
					
						<span class="property-value" aria-labelledby="operationDate-label"><g:formatDate date="${operationInstance?.operationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${operationInstance?.paymentMethod}">
				<li class="fieldcontain">
					<span id="paymentMethod-label" class="property-label"><g:message code="operation.paymentMethod.label" default="Payment Method" /></span>
					
						<span class="property-value" aria-labelledby="paymentMethod-label"><g:link controller="paymentMethod" action="show" id="${operationInstance?.paymentMethod?.id}">${operationInstance?.paymentMethod?.name}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${operationInstance?.thirdParty}">
				<li class="fieldcontain">
					<span id="thirdParty-label" class="property-label"><g:message code="operation.thirdParty.label" default="Third Party" /></span>
					
						<span class="property-value" aria-labelledby="thirdParty-label"><g:link controller="thirdParty" action="show" id="${operationInstance?.thirdParty?.id}">${operationInstance?.thirdParty?.name}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${operationInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="operation.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${operationInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:operationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${operationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
