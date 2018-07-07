
<%@ page import="pos.BankConfiguration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankConfiguration.label', default: 'BankConfiguration')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bankConfiguration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bankConfiguration" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="bankConfiguration.bank.label" default="Bank" /></th>
					
						<g:sortableColumn property="creationDate" title="${message(code: 'bankConfiguration.creationDate.label', default: 'Creation Date')}" />
					
						<g:sortableColumn property="fileExtension" title="${message(code: 'bankConfiguration.fileExtension.label', default: 'File Extension')}" />
					
						<g:sortableColumn property="separator" title="${message(code: 'bankConfiguration.separator.label', default: 'Separator')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bankConfigurationInstanceList}" status="i" var="bankConfigurationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bankConfigurationInstance.id}">${fieldValue(bean: bankConfigurationInstance, field: "bank")}</g:link></td>
					
						<td><g:formatDate date="${bankConfigurationInstance.creationDate}" /></td>
					
						<td>${fieldValue(bean: bankConfigurationInstance, field: "fileExtension")}</td>
					
						<td>${fieldValue(bean: bankConfigurationInstance, field: "separator")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bankConfigurationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
