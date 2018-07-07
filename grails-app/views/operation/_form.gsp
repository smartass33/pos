<%@ page import="pos.Operation" %>



<div class="fieldcontain ${hasErrors(bean: operationInstance, field: 'account', 'error')} required">
	<label for="account">
		<g:message code="operation.account.label" default="Account" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="account" name="account.id" from="${pos.Account.list()}" optionKey="id" optionValue="name" required="" value="${operationInstance?.account?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: operationInstance, field: 'entryDate', 'error')} required">
	<label for="entryDate">
		<g:message code="operation.entryDate.label" default="Entry Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="entryDate" precision="day"  value="${operationInstance?.entryDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: operationInstance, field: 'nature', 'error')} required">
	<label for="nature">
		<g:message code="operation.nature.label" default="Nature" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nature" from="${pos.Nature?.values()}" keys="${pos.Nature.values()*.name()}" required="" value="${operationInstance?.nature?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: operationInstance, field: 'operationDate', 'error')} required">
	<label for="operationDate">
		<g:message code="operation.operationDate.label" default="Operation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="operationDate" precision="day"  value="${operationInstance?.operationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: operationInstance, field: 'paymentMethod', 'error')} required">
	<label for="paymentMethod">
		<g:message code="operation.paymentMethod.label" default="Payment Method" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="paymentMethod" name="paymentMethod.id" from="${pos.PaymentMethod.list()}" optionKey="id" optionValue="name" required="" value="${operationInstance?.paymentMethod?.id}" class="many-to-one"/>
</div>

<div >
	<label for="thirdParty">
		<g:message code="operation.thirdParty.label" default="Third Party" />
		<g:select id="thirdParty" name="thirdParty.id" from="${pos.ThirdParty.list()}" optionKey="id" optionValue="name" value="${operationInstance?.thirdParty?.id}" class="many-to-one"/>
</label>
</div>
<div>
	<label for="thirdPartyNew">
		<g:message code="operation.thirdParty.label" default="Third Party" /> N'existe pas
		<g:field name="thirdPartyNew" type="string" value="${operationInstance.thirdParty}" />	
</label>
</div>

<div class="fieldcontain ${hasErrors(bean: operationInstance, field: 'amount', 'error')} required">
	<label for="value">
		<g:message code="operation.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${operationInstance.amount}" required=""/>
</div>

