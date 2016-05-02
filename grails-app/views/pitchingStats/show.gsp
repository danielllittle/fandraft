
<%@ page import="cscie56.fandraft.stats.PitchingStats" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pitchingStats.label', default: 'PitchingStats')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pitchingStats" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pitchingStats" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pitchingStats">
			
				<g:if test="${pitchingStatsInstance?.balks}">
				<li class="fieldcontain">
					<span id="balks-label" class="property-label"><g:message code="pitchingStats.balks.label" default="Balks" /></span>
					
						<span class="property-value" aria-labelledby="balks-label"><g:fieldValue bean="${pitchingStatsInstance}" field="balks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.completeGames}">
				<li class="fieldcontain">
					<span id="completeGames-label" class="property-label"><g:message code="pitchingStats.completeGames.label" default="Complete Games" /></span>
					
						<span class="property-value" aria-labelledby="completeGames-label"><g:fieldValue bean="${pitchingStatsInstance}" field="completeGames"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.earnedRuns}">
				<li class="fieldcontain">
					<span id="earnedRuns-label" class="property-label"><g:message code="pitchingStats.earnedRuns.label" default="Earned Runs" /></span>
					
						<span class="property-value" aria-labelledby="earnedRuns-label"><g:fieldValue bean="${pitchingStatsInstance}" field="earnedRuns"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.games}">
				<li class="fieldcontain">
					<span id="games-label" class="property-label"><g:message code="pitchingStats.games.label" default="Games" /></span>
					
						<span class="property-value" aria-labelledby="games-label"><g:fieldValue bean="${pitchingStatsInstance}" field="games"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.gamesStarted}">
				<li class="fieldcontain">
					<span id="gamesStarted-label" class="property-label"><g:message code="pitchingStats.gamesStarted.label" default="Games Started" /></span>
					
						<span class="property-value" aria-labelledby="gamesStarted-label"><g:fieldValue bean="${pitchingStatsInstance}" field="gamesStarted"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.hits}">
				<li class="fieldcontain">
					<span id="hits-label" class="property-label"><g:message code="pitchingStats.hits.label" default="Hits" /></span>
					
						<span class="property-value" aria-labelledby="hits-label"><g:fieldValue bean="${pitchingStatsInstance}" field="hits"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.homeRuns}">
				<li class="fieldcontain">
					<span id="homeRuns-label" class="property-label"><g:message code="pitchingStats.homeRuns.label" default="Home Runs" /></span>
					
						<span class="property-value" aria-labelledby="homeRuns-label"><g:fieldValue bean="${pitchingStatsInstance}" field="homeRuns"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.intentionalWalks}">
				<li class="fieldcontain">
					<span id="intentionalWalks-label" class="property-label"><g:message code="pitchingStats.intentionalWalks.label" default="Intentional Walks" /></span>
					
						<span class="property-value" aria-labelledby="intentionalWalks-label"><g:fieldValue bean="${pitchingStatsInstance}" field="intentionalWalks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.losses}">
				<li class="fieldcontain">
					<span id="losses-label" class="property-label"><g:message code="pitchingStats.losses.label" default="Losses" /></span>
					
						<span class="property-value" aria-labelledby="losses-label"><g:fieldValue bean="${pitchingStatsInstance}" field="losses"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.saves}">
				<li class="fieldcontain">
					<span id="saves-label" class="property-label"><g:message code="pitchingStats.saves.label" default="Saves" /></span>
					
						<span class="property-value" aria-labelledby="saves-label"><g:fieldValue bean="${pitchingStatsInstance}" field="saves"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.shutouts}">
				<li class="fieldcontain">
					<span id="shutouts-label" class="property-label"><g:message code="pitchingStats.shutouts.label" default="Shutouts" /></span>
					
						<span class="property-value" aria-labelledby="shutouts-label"><g:fieldValue bean="${pitchingStatsInstance}" field="shutouts"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.strikeouts}">
				<li class="fieldcontain">
					<span id="strikeouts-label" class="property-label"><g:message code="pitchingStats.strikeouts.label" default="Strikeouts" /></span>
					
						<span class="property-value" aria-labelledby="strikeouts-label"><g:fieldValue bean="${pitchingStatsInstance}" field="strikeouts"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.team}">
				<li class="fieldcontain">
					<span id="team-label" class="property-label"><g:message code="pitchingStats.team.label" default="Team" /></span>
					
						<span class="property-value" aria-labelledby="team-label"><g:fieldValue bean="${pitchingStatsInstance}" field="team"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.walks}">
				<li class="fieldcontain">
					<span id="walks-label" class="property-label"><g:message code="pitchingStats.walks.label" default="Walks" /></span>
					
						<span class="property-value" aria-labelledby="walks-label"><g:fieldValue bean="${pitchingStatsInstance}" field="walks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.wildPitches}">
				<li class="fieldcontain">
					<span id="wildPitches-label" class="property-label"><g:message code="pitchingStats.wildPitches.label" default="Wild Pitches" /></span>
					
						<span class="property-value" aria-labelledby="wildPitches-label"><g:fieldValue bean="${pitchingStatsInstance}" field="wildPitches"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.wins}">
				<li class="fieldcontain">
					<span id="wins-label" class="property-label"><g:message code="pitchingStats.wins.label" default="Wins" /></span>
					
						<span class="property-value" aria-labelledby="wins-label"><g:fieldValue bean="${pitchingStatsInstance}" field="wins"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pitchingStatsInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="pitchingStats.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${pitchingStatsInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pitchingStatsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pitchingStatsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
