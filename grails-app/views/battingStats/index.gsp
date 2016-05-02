
<%@ page import="cscie56.fandraft.stats.BattingStats" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'battingStats.label', default: 'BattingStats')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-battingStats" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-battingStats" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="atBats" title="${message(code: 'battingStats.atBats.label', default: 'At Bats')}" />
					
						<g:sortableColumn property="caughtStealing" title="${message(code: 'battingStats.caughtStealing.label', default: 'Caught Stealing')}" />
					
						<g:sortableColumn property="doubles" title="${message(code: 'battingStats.doubles.label', default: 'Doubles')}" />
					
						<g:sortableColumn property="games" title="${message(code: 'battingStats.games.label', default: 'Games')}" />
					
						<g:sortableColumn property="groundedIntoDblPlay" title="${message(code: 'battingStats.groundedIntoDblPlay.label', default: 'Grounded Into Dbl Play')}" />
					
						<g:sortableColumn property="hitByPitch" title="${message(code: 'battingStats.hitByPitch.label', default: 'Hit By Pitch')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${battingStatsInstanceList}" status="i" var="battingStatsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${battingStatsInstance.id}">${fieldValue(bean: battingStatsInstance, field: "atBats")}</g:link></td>
					
						<td>${fieldValue(bean: battingStatsInstance, field: "caughtStealing")}</td>
					
						<td>${fieldValue(bean: battingStatsInstance, field: "doubles")}</td>
					
						<td>${fieldValue(bean: battingStatsInstance, field: "games")}</td>
					
						<td>${fieldValue(bean: battingStatsInstance, field: "groundedIntoDblPlay")}</td>
					
						<td>${fieldValue(bean: battingStatsInstance, field: "hitByPitch")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${battingStatsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
