
<%@ page import="pos.Site" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'site.label', default: 'Site')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-site" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-site" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list site">
			
				<g:if test="${siteInstance?.bank}">
				<li class="fieldcontain">
					<span id="bank-label" class="property-label"><g:message code="site.bank.label" default="Bank" /></span>
					
						<span class="property-value" aria-labelledby="bank-label"><g:link controller="bank" action="show" id="${siteInstance?.bank?.id}">${siteInstance?.bank?.name}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteInstance?.balance}">
				<li class="fieldcontain">
					<span id="balance-label" class="property-label"><g:message code="site.balance.label" default="Balance" /></span>
					
						<span class="property-value" aria-labelledby="balance-label"><g:fieldValue bean="${siteInstance}" field="balance"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteInstance?.balanceDate}">
				<li class="fieldcontain">
					<span id="balanceDate-label" class="property-label"><g:message code="site.balanceDate.label" default="Balance Date" /></span>
					
						<span class="property-value" aria-labelledby="balanceDate-label"><g:formatDate date="${siteInstance?.balanceDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="site.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${siteInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:siteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${siteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
