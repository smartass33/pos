
<%@ page import="pos.Operation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'operation.label', default: 'Operation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<r:require module="fileuploader" />		
	</head>
	<body>
		<a href="#list-operation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><uploader:uploader id="bankUploader"  url="${[controller:'operation', action:'importOperation']}" /></li>								
			</ul>
		</div>
		<div id="list-operation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>			
						<th><g:message code="operation.account.label" default="Account" /></th>	
						<g:sortableColumn property="entryDate" title="${message(code: 'operation.entryDate.label', default: 'Entry Date')}" />				
						<g:sortableColumn property="nature" title="${message(code: 'operation.nature.label', default: 'Nature')}" />				
						<g:sortableColumn property="operationDate" title="${message(code: 'operation.operationDate.label', default: 'Operation Date')}" />				
						<th><g:message code="operation.paymentMethod.label" default="Payment Method" /></th>				
						<th><g:message code="operation.thirdParty.label" default="Third Party" /></th>	
						<th><g:message code="operation.amount.label" default="Amount" /></th>				
									
					</tr>
			</thead>
			<tbody>
				<g:each in="${operationInstanceList}" status="i" var="operationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">			
						<td><g:link action="show" id="${operationInstance.id}">${operationInstance.account.name}</g:link></td>				
						<td><g:formatDate format="dd-MM-yyyy" date="${operationInstance.entryDate}" /></td>				
						<td>${fieldValue(bean: operationInstance, field: "nature")}</td>				
						<td><g:formatDate format="dd-MM-yyyy" date="${operationInstance.operationDate}" /></td>					
						<td>${operationInstance.paymentMethod.name}</td>					
						<td>${operationInstance.thirdParty.name}</td>
						<td>${operationInstance.amount}</td>
					</tr>
				</g:each>
			</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${operationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
