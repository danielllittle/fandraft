<%@ page import="cscie56.fandraft.stats.PitchingStats" %>



<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'balks', 'error')} required">
	<label for="balks">
		<g:message code="pitchingStats.balks.label" default="Balks" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="balks" type="number" value="${pitchingStatsInstance.balks}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'completeGames', 'error')} required">
	<label for="completeGames">
		<g:message code="pitchingStats.completeGames.label" default="Complete Games" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="completeGames" type="number" value="${pitchingStatsInstance.completeGames}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'earnedRuns', 'error')} required">
	<label for="earnedRuns">
		<g:message code="pitchingStats.earnedRuns.label" default="Earned Runs" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="earnedRuns" type="number" value="${pitchingStatsInstance.earnedRuns}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'games', 'error')} required">
	<label for="games">
		<g:message code="pitchingStats.games.label" default="Games" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="games" type="number" value="${pitchingStatsInstance.games}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'gamesStarted', 'error')} required">
	<label for="gamesStarted">
		<g:message code="pitchingStats.gamesStarted.label" default="Games Started" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="gamesStarted" type="number" value="${pitchingStatsInstance.gamesStarted}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'hits', 'error')} required">
	<label for="hits">
		<g:message code="pitchingStats.hits.label" default="Hits" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hits" type="number" value="${pitchingStatsInstance.hits}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'homeRuns', 'error')} required">
	<label for="homeRuns">
		<g:message code="pitchingStats.homeRuns.label" default="Home Runs" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="homeRuns" type="number" value="${pitchingStatsInstance.homeRuns}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'intentionalWalks', 'error')} required">
	<label for="intentionalWalks">
		<g:message code="pitchingStats.intentionalWalks.label" default="Intentional Walks" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="intentionalWalks" type="number" value="${pitchingStatsInstance.intentionalWalks}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'losses', 'error')} required">
	<label for="losses">
		<g:message code="pitchingStats.losses.label" default="Losses" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="losses" type="number" value="${pitchingStatsInstance.losses}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'saves', 'error')} required">
	<label for="saves">
		<g:message code="pitchingStats.saves.label" default="Saves" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="saves" type="number" value="${pitchingStatsInstance.saves}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'shutouts', 'error')} required">
	<label for="shutouts">
		<g:message code="pitchingStats.shutouts.label" default="Shutouts" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="shutouts" type="number" value="${pitchingStatsInstance.shutouts}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'strikeouts', 'error')} required">
	<label for="strikeouts">
		<g:message code="pitchingStats.strikeouts.label" default="Strikeouts" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="strikeouts" type="number" value="${pitchingStatsInstance.strikeouts}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'team', 'error')} required">
	<label for="team">
		<g:message code="pitchingStats.team.label" default="Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="team" required="" value="${pitchingStatsInstance?.team}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'walks', 'error')} required">
	<label for="walks">
		<g:message code="pitchingStats.walks.label" default="Walks" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="walks" type="number" value="${pitchingStatsInstance.walks}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'wildPitches', 'error')} required">
	<label for="wildPitches">
		<g:message code="pitchingStats.wildPitches.label" default="Wild Pitches" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="wildPitches" type="number" value="${pitchingStatsInstance.wildPitches}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'wins', 'error')} required">
	<label for="wins">
		<g:message code="pitchingStats.wins.label" default="Wins" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="wins" type="number" value="${pitchingStatsInstance.wins}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pitchingStatsInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="pitchingStats.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${pitchingStatsInstance.year}" required=""/>

</div>

