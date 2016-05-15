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

<!--script language="javascript">
	$(document).ready(function(){
		$('#sortable').sortable({
			update: function(event, ui) {
				var draftOrder = $(this).sortable('toArray').toString();
				$.post('/fandraft/team/ajaxedit/${teamInstance?.id}', {draftOrder:draftOrder});
			}
		});
	});
</script-->
<script >
$(document).ready(function() {
    $('#draftboard').DataTable( {
		rowReorder: true,
        scrollY: 300,
        paging: false
    } );
} );
</script>
<!--,
		"ajax": {
			url: '/fandraft/team/ajaxshow/${teamInstance?.id}',
			dataSrc: '',
			columns: [
				{ data: 0 },
				{ data: 1 },
				{ data: 2 },
				{ data: 3 }
			]
		}-->
<!--<h3>Draft Board</h3>
<ul id="sortable" class="ui-sortable">
	<g:each in="${teamInstance.draftBoard}" var="player">
		<li id="${player.playerID?.encodeAsHTML()}" class=" ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>${player.getFullName()}, ${player?.position?.value}, ${player?.team}</li>
	</g:each>
</ul-->
<table id="draftboard" class="display" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th>Draft Rank</th>
			<th>Name</th>
			<th>Position</th>
			<th>Team</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th>Draft Rank</th>
			<th>Name</th>
			<th>Position</th>
			<th>Team</th>
		</tr>
	</tfoot>
	<tbody>
		<g:each status="i" in="${teamInstance.draftBoard}" var="player">
			<tr><td>${i+1}</td><td>${player.getFullName()}</td><td>${player?.position?.value}</td><td>${player?.team}</td></tr>
		</g:each>
	</tbody>
</table>

<!--div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'players', 'error')} ">
	<label for="players">
		<g:message code="team.players.label" default="Players" />
		
	</label>
	<!--g:select name="players" from="${cscie56.fandraft.Player.list()}" multiple="multiple" optionKey="id" size="5" value="${teamInstance?.players*.id}" class="many-to-many"/>

</div-->

