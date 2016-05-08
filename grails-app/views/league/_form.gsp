<%@ page import="cscie56.fandraft.League" %>



<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="league.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${leagueInstance?.name}"/>

</div>

<!--<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'manager', 'error')} required">
	<label for="manager">
		<g:message code="league.manager.label" default="Manager" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="manager" name="manager.id" from="${cscie56.fandraft.User.list()}" optionKey="id" required="" value="${leagueInstance?.manager?.id}" class="many-to-one"/>

</div>-->
<g:hiddenField name="manager.id"  value="${sec.loggedInUserInfo(field:"id")}"/>

<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'draftDate', 'error')} required">
	<label for="draftDate">
		<g:message code="league.draftDate.label" default="Draft Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="draftDate" precision="day"  value="${leagueInstance?.draftDate}"  />

</div>

<!--<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'draftPool', 'error')} required">
	<label for="draftPool">
		<g:message code="league.draftPool.label" default="Draft Pool" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="draftPool" name="draftPool.id" from="${cscie56.fandraft.DraftPool.list()}" optionKey="id" required="" value="${leagueInstance?.draftPool?.id}" class="many-to-one"/>

</div>-->

<!--div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'drafted', 'error')} ">
	<label for="drafted">
		<g:message code="league.drafted.label" default="Drafted" />
		
	</label>

</div-->
<g:hiddenField name="drafted" value="${leagueInstance?.drafted}" />


<div class="fieldcontain ${hasErrors(bean: leagueInstance, field: 'teams', 'error')} ">
	<label for="teams">
		<g:message code="league.teams.label" default="Teams" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${leagueInstance?.teams?}" var="t">
    <li><g:link controller="team" action="show" id="${t.id}">${t?.name?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="team" action="create" params="['league.id': leagueInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'team.label', default: 'Team')])}</g:link>
</li>
</ul>


</div>

