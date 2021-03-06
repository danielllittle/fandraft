
<%@ page import="cscie56.fandraft.League" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'league.label', default: 'League')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-league" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-league" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'league.name.label', default: 'Name')}" />
					
						<th><g:message code="league.manager.label" default="Manager" /></th>
					
						<g:sortableColumn property="draftDate" title="${message(code: 'league.draftDate.label', default: 'Draft Date')}" />
					
						<th><g:message code="league.draftPool.label" default="Draft Pool" /></th>
					
						<g:sortableColumn property="drafted" title="${message(code: 'league.drafted.label', default: 'Drafted')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${leagueInstanceList}" status="i" var="leagueInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${leagueInstance.id}">${fieldValue(bean: leagueInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: leagueInstance, field: "manager")}</td>
					
						<td><g:formatDate date="${leagueInstance.draftDate}" /></td>
					
						<td>${fieldValue(bean: leagueInstance, field: "draftPool")}</td>
					
						<td><g:formatBoolean boolean="${leagueInstance.drafted}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${leagueInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
