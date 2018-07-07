
<%@ page import="pos.BankPaymentMethodConfiguration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankPaymentMethodConfiguration.label', default: 'BankPaymentMethodConfiguration')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bankPaymentMethodConfiguration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bankPaymentMethodConfiguration" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="bankPaymentMethodConfiguration.account.label" default="Account" /></th>
					
						<th><g:message code="bankPaymentMethodConfiguration.bank.label" default="Bank" /></th>
					
						<g:sortableColumn property="creationDate" title="${message(code: 'bankPaymentMethodConfiguration.creationDate.label', default: 'Creation Date')}" />
					
						<g:sortableColumn property="methodString" title="${message(code: 'bankPaymentMethodConfiguration.methodString.label', default: 'Method String')}" />
					
						<th><g:message code="bankPaymentMethodConfiguration.paymentMethod.label" default="Payment Method" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bankPaymentMethodConfigurationInstanceList}" status="i" var="bankPaymentMethodConfigurationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bankPaymentMethodConfigurationInstance.id}">${fieldValue(bean: bankPaymentMethodConfigurationInstance, field: "account")}</g:link></td>
					
						<td>${fieldValue(bean: bankPaymentMethodConfigurationInstance, field: "bank")}</td>
					
						<td><g:formatDate date="${bankPaymentMethodConfigurationInstance.creationDate}" /></td>
					
						<td>${fieldValue(bean: bankPaymentMethodConfigurationInstance, field: "methodString")}</td>
					
						<td>${fieldValue(bean: bankPaymentMethodConfigurationInstance, field: "paymentMethod")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bankPaymentMethodConfigurationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
