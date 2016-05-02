<%@ page import="cscie56.fandraft.stats.BattingStats" %>



<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'atBats', 'error')} required">
	<label for="atBats">
		<g:message code="battingStats.atBats.label" default="At Bats" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="atBats" type="number" value="${battingStatsInstance.atBats}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'caughtStealing', 'error')} required">
	<label for="caughtStealing">
		<g:message code="battingStats.caughtStealing.label" default="Caught Stealing" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="caughtStealing" type="number" value="${battingStatsInstance.caughtStealing}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'doubles', 'error')} required">
	<label for="doubles">
		<g:message code="battingStats.doubles.label" default="Doubles" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="doubles" type="number" value="${battingStatsInstance.doubles}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'games', 'error')} required">
	<label for="games">
		<g:message code="battingStats.games.label" default="Games" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="games" type="number" value="${battingStatsInstance.games}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'groundedIntoDblPlay', 'error')} required">
	<label for="groundedIntoDblPlay">
		<g:message code="battingStats.groundedIntoDblPlay.label" default="Grounded Into Dbl Play" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="groundedIntoDblPlay" type="number" value="${battingStatsInstance.groundedIntoDblPlay}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'hitByPitch', 'error')} required">
	<label for="hitByPitch">
		<g:message code="battingStats.hitByPitch.label" default="Hit By Pitch" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hitByPitch" type="number" value="${battingStatsInstance.hitByPitch}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'hits', 'error')} required">
	<label for="hits">
		<g:message code="battingStats.hits.label" default="Hits" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hits" type="number" value="${battingStatsInstance.hits}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'homeRuns', 'error')} required">
	<label for="homeRuns">
		<g:message code="battingStats.homeRuns.label" default="Home Runs" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="homeRuns" type="number" value="${battingStatsInstance.homeRuns}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'intentionalWalks', 'error')} required">
	<label for="intentionalWalks">
		<g:message code="battingStats.intentionalWalks.label" default="Intentional Walks" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="intentionalWalks" type="number" value="${battingStatsInstance.intentionalWalks}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'rbis', 'error')} required">
	<label for="rbis">
		<g:message code="battingStats.rbis.label" default="Rbis" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rbis" type="number" value="${battingStatsInstance.rbis}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'runs', 'error')} required">
	<label for="runs">
		<g:message code="battingStats.runs.label" default="Runs" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="runs" type="number" value="${battingStatsInstance.runs}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'sacrificeFlys', 'error')} required">
	<label for="sacrificeFlys">
		<g:message code="battingStats.sacrificeFlys.label" default="Sacrifice Flys" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sacrificeFlys" type="number" value="${battingStatsInstance.sacrificeFlys}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'sacrificeHits', 'error')} required">
	<label for="sacrificeHits">
		<g:message code="battingStats.sacrificeHits.label" default="Sacrifice Hits" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sacrificeHits" type="number" value="${battingStatsInstance.sacrificeHits}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'stolenBases', 'error')} required">
	<label for="stolenBases">
		<g:message code="battingStats.stolenBases.label" default="Stolen Bases" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stolenBases" type="number" value="${battingStatsInstance.stolenBases}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'strikeouts', 'error')} required">
	<label for="strikeouts">
		<g:message code="battingStats.strikeouts.label" default="Strikeouts" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="strikeouts" type="number" value="${battingStatsInstance.strikeouts}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'team', 'error')} required">
	<label for="team">
		<g:message code="battingStats.team.label" default="Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="team" required="" value="${battingStatsInstance?.team}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'triples', 'error')} required">
	<label for="triples">
		<g:message code="battingStats.triples.label" default="Triples" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="triples" type="number" value="${battingStatsInstance.triples}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'walks', 'error')} required">
	<label for="walks">
		<g:message code="battingStats.walks.label" default="Walks" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="walks" type="number" value="${battingStatsInstance.walks}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battingStatsInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="battingStats.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${battingStatsInstance.year}" required=""/>

</div>

