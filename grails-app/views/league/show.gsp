
<%@ page import="cscie56.fandraft.League" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'league.label', default: 'League')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-league" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-league" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list league">
			
				<g:if test="${leagueInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="league.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${leagueInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueInstance?.manager}">
				<li class="fieldcontain">
					<span id="manager-label" class="property-label"><g:message code="league.manager.label" default="Manager" /></span>
					
						<span class="property-value" aria-labelledby="manager-label"><g:link controller="user" action="show" id="${leagueInstance?.manager?.id}">${leagueInstance?.manager?.username?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueInstance?.draftDate}">
				<li class="fieldcontain">
					<span id="draftDate-label" class="property-label"><g:message code="league.draftDate.label" default="Draft Date" /></span>
					
						<span class="property-value" aria-labelledby="draftDate-label"><g:formatDate date="${leagueInstance?.draftDate}" /></span>
					
				</li>
				</g:if>
			
				<!--<g:if test="${leagueInstance?.draftPool}">
				<li class="fieldcontain">
					<span id="draftPool-label" class="property-label"><g:message code="league.draftPool.label" default="Draft Pool" /></span>
					
						<span class="property-value" aria-labelledby="draftPool-label"><g:link controller="draftPool" action="show" id="${leagueInstance?.draftPool?.id}">${leagueInstance?.draftPool?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>-->
			
				<g:if test="${leagueInstance?.drafted}">
				<li class="fieldcontain">
					<span id="drafted-label" class="property-label"><g:message code="league.drafted.label" default="Drafted" /></span>
					
						<span class="property-value" aria-labelledby="drafted-label"><g:formatBoolean boolean="${leagueInstance?.drafted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueInstance?.teams}">
				<li class="fieldcontain">
					<span id="teams-label" class="property-label"><g:message code="league.teams.label" default="Teams" /></span>
					
						<g:each in="${leagueInstance.teams}" var="t">
						<span class="property-value" aria-labelledby="teams-label"><g:link controller="team" action="show" id="${t.id}">${t?.name?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>

		</div>
	</body>
</html>
