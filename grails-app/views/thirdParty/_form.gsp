<%@ page import="pos.ThirdParty" %>



<div class="fieldcontain ${hasErrors(bean: thirdPartyInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="thirdParty.creationDate.label" default="Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day"  value="${thirdPartyInstance?.creationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: thirdPartyInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="thirdParty.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${thirdPartyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: thirdPartyInstance, field: 'operation', 'error')} ">
	<label for="operation">
		<g:message code="thirdParty.operation.label" default="Operation" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${thirdPartyInstance?.operation?}" var="o">
    <li><g:link controller="operation" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="operation" action="create" params="['thirdParty.id': thirdPartyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'operation.label', default: 'Operation')])}</g:link>
</li>
</ul>

</div>

