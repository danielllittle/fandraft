
<%@ page import="cscie56.fandraft.stats.PitchingStats" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pitchingStats.label', default: 'PitchingStats')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pitchingStats" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pitchingStats" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="balks" title="${message(code: 'pitchingStats.balks.label', default: 'Balks')}" />
					
						<g:sortableColumn property="completeGames" title="${message(code: 'pitchingStats.completeGames.label', default: 'Complete Games')}" />
					
						<g:sortableColumn property="earnedRuns" title="${message(code: 'pitchingStats.earnedRuns.label', default: 'Earned Runs')}" />
					
						<g:sortableColumn property="games" title="${message(code: 'pitchingStats.games.label', default: 'Games')}" />
					
						<g:sortableColumn property="gamesStarted" title="${message(code: 'pitchingStats.gamesStarted.label', default: 'Games Started')}" />
					
						<g:sortableColumn property="hits" title="${message(code: 'pitchingStats.hits.label', default: 'Hits')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pitchingStatsInstanceList}" status="i" var="pitchingStatsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pitchingStatsInstance.id}">${fieldValue(bean: pitchingStatsInstance, field: "balks")}</g:link></td>
					
						<td>${fieldValue(bean: pitchingStatsInstance, field: "completeGames")}</td>
					
						<td>${fieldValue(bean: pitchingStatsInstance, field: "earnedRuns")}</td>
					
						<td>${fieldValue(bean: pitchingStatsInstance, field: "games")}</td>
					
						<td>${fieldValue(bean: pitchingStatsInstance, field: "gamesStarted")}</td>
					
						<td>${fieldValue(bean: pitchingStatsInstance, field: "hits")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pitchingStatsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
