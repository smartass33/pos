<%@ page import="pos.Account" %>



<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="account.creationDate.label" default="Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day"  value="${accountInstance?.creationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="account.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${accountInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="account.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" type="number" value="${accountInstance.number}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'operation', 'error')} ">
	<label for="operation">
		<g:message code="account.operation.label" default="Operation" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${accountInstance?.operation?}" var="o">
    <li><g:link controller="operation" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="operation" action="create" params="['account.id': accountInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'operation.label', default: 'Operation')])}</g:link>
</li>
</ul>

</div>

