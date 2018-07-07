<%@ page import="pos.Site" %>



<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'bank', 'error')} ">
	<label for="bank">
		<g:message code="site.bank.label" default="Bank" />
		
	</label>
	<g:select id="bank" name="bank.id" from="${pos.Bank.list()}" optionKey="id" optionValue="name" value="${siteInstance?.bank?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'balance', 'error')} required">
	<label for="balance">
		<g:message code="site.balance.label" default="Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="balance" value="${fieldValue(bean: siteInstance, field: 'balance')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'balanceDate', 'error')} required">
	<label for="balanceDate">
		<g:message code="site.balanceDate.label" default="Balance Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="balanceDate" precision="day"  value="${siteInstance?.balanceDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="site.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${siteInstance?.name}"/>
</div>

