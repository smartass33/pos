<%@ page import="pos.Bank" %>



<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'accountNumber', 'error')} required">
	<label for="accountNumber">
		<g:message code="bank.accountNumber.label" default="Account Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="accountNumber" type="number" value="${bankInstance.accountNumber}" required=""/>
</div>


<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="bank.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${bankInstance?.name}"/>
</div>

