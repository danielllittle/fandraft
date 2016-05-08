
<%@ page import="cscie56.fandraft.Team" %>
<%@ page import="cscie56.fandraft.Position" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-team" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-team" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list team">
			
				<g:if test="${teamInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="team.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${teamInstance?.owner?.id}">${teamInstance?.owner?.username?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.league}">
				<li class="fieldcontain">
					<span id="league-label" class="property-label"><g:message code="team.league.label" default="League" /></span>
					
						<span class="property-value" aria-labelledby="league-label"><g:link controller="league" action="show" id="${teamInstance?.league?.id}">${teamInstance?.league?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="team.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${teamInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.draftPosition}">
				<li class="fieldcontain">
					<span id="draftPosition-label" class="property-label"><g:message code="team.draftPosition.label" default="Draft Position" /></span>
					
						<span class="property-value" aria-labelledby="draftPosition-label"><g:fieldValue bean="${teamInstance}" field="draftPosition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.players}">

					<h3>Roster</h3><ul class="list-group">
						<g:each in="${teamInstance.players.sort{it.position}}" var="p">
							<li class="list-group-item"><span class="badge">${p?.position?.value?.encodeAsHTML()}</span>${p?.fullName?.encodeAsHTML()}, ${p?.team}</li>
							<!--span class="property-value" aria-labelledby="players-label"><g:link controller="player" action="show" id="${p.id}">${p?.firstName?.encodeAsHTML()}</g:link></span-->
						</g:each>
					</ul>



					<!--li class="fieldcontain">
					<span id="players-label" class="property-label"><g:message code="team.players.label" default="Players" /></span-->





					
				</li>
				</g:if>
			
			</ol>
			<g:if test="false">
				<g:form url="[resource:teamInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${teamInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</g:if>
		</div>
	</body>
</html>
