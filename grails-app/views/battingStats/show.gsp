
<%@ page import="cscie56.fandraft.stats.BattingStats" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'battingStats.label', default: 'BattingStats')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-battingStats" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-battingStats" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list battingStats">
			
				<g:if test="${battingStatsInstance?.atBats}">
				<li class="fieldcontain">
					<span id="atBats-label" class="property-label"><g:message code="battingStats.atBats.label" default="At Bats" /></span>
					
						<span class="property-value" aria-labelledby="atBats-label"><g:fieldValue bean="${battingStatsInstance}" field="atBats"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.caughtStealing}">
				<li class="fieldcontain">
					<span id="caughtStealing-label" class="property-label"><g:message code="battingStats.caughtStealing.label" default="Caught Stealing" /></span>
					
						<span class="property-value" aria-labelledby="caughtStealing-label"><g:fieldValue bean="${battingStatsInstance}" field="caughtStealing"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.doubles}">
				<li class="fieldcontain">
					<span id="doubles-label" class="property-label"><g:message code="battingStats.doubles.label" default="Doubles" /></span>
					
						<span class="property-value" aria-labelledby="doubles-label"><g:fieldValue bean="${battingStatsInstance}" field="doubles"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.games}">
				<li class="fieldcontain">
					<span id="games-label" class="property-label"><g:message code="battingStats.games.label" default="Games" /></span>
					
						<span class="property-value" aria-labelledby="games-label"><g:fieldValue bean="${battingStatsInstance}" field="games"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.groundedIntoDblPlay}">
				<li class="fieldcontain">
					<span id="groundedIntoDblPlay-label" class="property-label"><g:message code="battingStats.groundedIntoDblPlay.label" default="Grounded Into Dbl Play" /></span>
					
						<span class="property-value" aria-labelledby="groundedIntoDblPlay-label"><g:fieldValue bean="${battingStatsInstance}" field="groundedIntoDblPlay"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.hitByPitch}">
				<li class="fieldcontain">
					<span id="hitByPitch-label" class="property-label"><g:message code="battingStats.hitByPitch.label" default="Hit By Pitch" /></span>
					
						<span class="property-value" aria-labelledby="hitByPitch-label"><g:fieldValue bean="${battingStatsInstance}" field="hitByPitch"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.hits}">
				<li class="fieldcontain">
					<span id="hits-label" class="property-label"><g:message code="battingStats.hits.label" default="Hits" /></span>
					
						<span class="property-value" aria-labelledby="hits-label"><g:fieldValue bean="${battingStatsInstance}" field="hits"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.homeRuns}">
				<li class="fieldcontain">
					<span id="homeRuns-label" class="property-label"><g:message code="battingStats.homeRuns.label" default="Home Runs" /></span>
					
						<span class="property-value" aria-labelledby="homeRuns-label"><g:fieldValue bean="${battingStatsInstance}" field="homeRuns"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.intentionalWalks}">
				<li class="fieldcontain">
					<span id="intentionalWalks-label" class="property-label"><g:message code="battingStats.intentionalWalks.label" default="Intentional Walks" /></span>
					
						<span class="property-value" aria-labelledby="intentionalWalks-label"><g:fieldValue bean="${battingStatsInstance}" field="intentionalWalks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.rbis}">
				<li class="fieldcontain">
					<span id="rbis-label" class="property-label"><g:message code="battingStats.rbis.label" default="Rbis" /></span>
					
						<span class="property-value" aria-labelledby="rbis-label"><g:fieldValue bean="${battingStatsInstance}" field="rbis"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.runs}">
				<li class="fieldcontain">
					<span id="runs-label" class="property-label"><g:message code="battingStats.runs.label" default="Runs" /></span>
					
						<span class="property-value" aria-labelledby="runs-label"><g:fieldValue bean="${battingStatsInstance}" field="runs"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.sacrificeFlys}">
				<li class="fieldcontain">
					<span id="sacrificeFlys-label" class="property-label"><g:message code="battingStats.sacrificeFlys.label" default="Sacrifice Flys" /></span>
					
						<span class="property-value" aria-labelledby="sacrificeFlys-label"><g:fieldValue bean="${battingStatsInstance}" field="sacrificeFlys"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.sacrificeHits}">
				<li class="fieldcontain">
					<span id="sacrificeHits-label" class="property-label"><g:message code="battingStats.sacrificeHits.label" default="Sacrifice Hits" /></span>
					
						<span class="property-value" aria-labelledby="sacrificeHits-label"><g:fieldValue bean="${battingStatsInstance}" field="sacrificeHits"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.stolenBases}">
				<li class="fieldcontain">
					<span id="stolenBases-label" class="property-label"><g:message code="battingStats.stolenBases.label" default="Stolen Bases" /></span>
					
						<span class="property-value" aria-labelledby="stolenBases-label"><g:fieldValue bean="${battingStatsInstance}" field="stolenBases"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.strikeouts}">
				<li class="fieldcontain">
					<span id="strikeouts-label" class="property-label"><g:message code="battingStats.strikeouts.label" default="Strikeouts" /></span>
					
						<span class="property-value" aria-labelledby="strikeouts-label"><g:fieldValue bean="${battingStatsInstance}" field="strikeouts"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.team}">
				<li class="fieldcontain">
					<span id="team-label" class="property-label"><g:message code="battingStats.team.label" default="Team" /></span>
					
						<span class="property-value" aria-labelledby="team-label"><g:fieldValue bean="${battingStatsInstance}" field="team"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.triples}">
				<li class="fieldcontain">
					<span id="triples-label" class="property-label"><g:message code="battingStats.triples.label" default="Triples" /></span>
					
						<span class="property-value" aria-labelledby="triples-label"><g:fieldValue bean="${battingStatsInstance}" field="triples"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.walks}">
				<li class="fieldcontain">
					<span id="walks-label" class="property-label"><g:message code="battingStats.walks.label" default="Walks" /></span>
					
						<span class="property-value" aria-labelledby="walks-label"><g:fieldValue bean="${battingStatsInstance}" field="walks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battingStatsInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="battingStats.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${battingStatsInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:battingStatsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${battingStatsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
