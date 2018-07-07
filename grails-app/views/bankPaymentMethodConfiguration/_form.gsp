<%@ page import="pos.BankPaymentMethodConfiguration" %>



<div class="fieldcontain ${hasErrors(bean: bankPaymentMethodConfigurationInstance, field: 'account', 'error')} required">
	<label for="account">
		<g:message code="bankPaymentMethodConfiguration.account.label" default="Account" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="account" name="account.id" from="${pos.Account.list()}" optionKey="id" optionValue="name" required="" value="${bankPaymentMethodConfigurationInstance?.account?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankPaymentMethodConfigurationInstance, field: 'bank', 'error')} required">
	<label for="bank">
		<g:message code="bankPaymentMethodConfiguration.bank.label" default="Bank" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bank" name="bank.id" from="${pos.Bank.list()}" optionKey="id" optionValue="name" required="" value="${bankPaymentMethodConfigurationInstance?.bank?.id}" class="many-to-one"/>
</div>



<div class="fieldcontain ${hasErrors(bean: bankPaymentMethodConfigurationInstance, field: 'methodString', 'error')} ">
	<label for="methodString">
		<g:message code="bankPaymentMethodConfiguration.methodString.label" default="Method String" />
		
	</label>
	<g:textField name="methodString" value="${bankPaymentMethodConfigurationInstance?.methodString}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankPaymentMethodConfigurationInstance, field: 'paymentMethod', 'error')} required">
	<label for="paymentMethod">
		<g:message code="bankPaymentMethodConfiguration.paymentMethod.label" default="Payment Method" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="paymentMethod" name="paymentMethod.id" from="${pos.PaymentMethod.list()}" optionKey="id" optionValue="name" required="" value="${bankPaymentMethodConfigurationInstance?.paymentMethod?.id}" class="many-to-one"/>
</div>

