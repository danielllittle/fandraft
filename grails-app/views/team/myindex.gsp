
<%@ page import="cscie56.fandraft.Team" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-team" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link controller="league" class="create" action="create">New League</g:link></li>
			</ul>
		</div>
		<div id="list-team" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="team.owner.label" default="Owner" /></th>
					
						<th><g:message code="team.league.label" default="League" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'team.name.label', default: 'Name')}" />

						<g:sortableColumn property="draftPosition" title="${message(code: 'team.draftPosition.label', default: 'Draft Position')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${teamInstanceList}" status="i" var="teamInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${teamInstance.id}">${teamInstance?.owner?.username?.encodeAsHTML()}</g:link></td>
					
						<td>${teamInstance?.league?.name?.encodeAsHTML()}</td>
					
						<td>${teamInstance?.name?.encodeAsHTML()}</td>

						<td>${fieldValue(bean: teamInstance, field: "draftPosition")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${teamInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
