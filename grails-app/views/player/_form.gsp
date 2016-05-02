<%@ page import="cscie56.fandraft.Player" %>



<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="player.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${playerInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'position', 'error')} required">
	<label for="position">
		<g:message code="player.position.label" default="Position" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="position" from="${cscie56.fandraft.Position?.values()}" keys="${cscie56.fandraft.Position.values()*.name()}" required="" value="${playerInstance?.position?.name()}" />

</div>

