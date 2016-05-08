<%@ page import="cscie56.fandraft.Team" %>



<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'owner', 'error')} required">
	<!--label for="owner">
		<g:message code="team.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label-->
	<g:hiddenField name="owner.id"  value="${sec.loggedInUserInfo(field: 'id')}" />
	<!--g:select id="owner" name="owner.id" from="${cscie56.fandraft.User.list()}" optionKey="id" required="" value="${teamInstance?.owner?.id}" class="many-to-one"/-->

</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'league', 'error')} required">
	<label for="league">
		<g:message code="team.league.label" default="League" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="league" name="league.id" from="${cscie56.fandraft.League.list()}" optionKey="id" required="" value="${teamInstance?.league?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="team.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${teamInstance?.name}"/>

</div>

<g:hiddenField name="draftPosition" value="1" required=""/>
<!--<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'draftPosition', 'error')} required">
	<label for="draftPosition">
		<g:message code="team.draftPosition.label" default="Draft Position" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="draftPosition" type="number" min="1" value="${teamInstance.draftPosition}" required=""/>

</div>-->

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'players', 'error')} ">
	<label for="players">
		<g:message code="team.players.label" default="Players" />
		
	</label>
	<g:select name="players" from="${cscie56.fandraft.Player.list()}" multiple="multiple" optionKey="id" size="5" value="${teamInstance?.players*.id}" class="many-to-many"/>

</div>

