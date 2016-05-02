<%@ page import="cscie56.fandraft.DraftPool" %>



<div class="fieldcontain ${hasErrors(bean: draftPoolInstance, field: 'league', 'error')} required">
	<label for="league">
		<g:message code="draftPool.league.label" default="League" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="league" name="league.id" from="${cscie56.fandraft.League.list()}" optionKey="id" required="" value="${draftPoolInstance?.league?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: draftPoolInstance, field: 'players', 'error')} ">
	<label for="players">
		<g:message code="draftPool.players.label" default="Players" />
		
	</label>
	<g:select name="players" from="${cscie56.fandraft.Player.list()}" multiple="multiple" optionKey="id" size="5" value="${draftPoolInstance?.players*.id}" class="many-to-many"/>

</div>

