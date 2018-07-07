<%@ page import="pos.PaymentMethod" %>



<div class="fieldcontain ${hasErrors(bean: paymentMethodInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="paymentMethod.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${paymentMethodInstance?.name}"/>
</div>

