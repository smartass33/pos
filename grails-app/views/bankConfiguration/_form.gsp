<%@ page import="pos.BankConfiguration" %>



<div class="fieldcontain ${hasErrors(bean: bankConfigurationInstance, field: 'bank', 'error')} required">
	<label for="bank">
		<g:message code="bankConfiguration.bank.label" default="Bank" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bank" name="bank.id" from="${pos.Bank.list()}" optionKey="id"  optionValue="name" required="" value="${bankConfigurationInstance?.bank?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankConfigurationInstance, field: 'fileExtension', 'error')} ">
	<label for="fileExtension">
		<g:message code="bankConfiguration.fileExtension.label" default="File Extension" />
		
	</label>
	<g:textField name="fileExtension" value="${bankConfigurationInstance?.fileExtension}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankConfigurationInstance, field: 'lineSeparator', 'error')} ">
	<label for="lineSeparator">
		<g:message code="bankConfiguration.lineSeparator.label" default="Separator" />
		
	</label>
	<g:textField name="lineSeparator" value="${bankConfigurationInstance?.lineSeparator}"/>
</div>

