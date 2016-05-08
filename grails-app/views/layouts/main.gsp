<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>FanDraft</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<!--g:layoutHead/-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
		<!--script src="//code.jquery.com/jquery-1.10.2.js"></script-->


		<style>
		#sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
		#sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
		#sortable li span { position: absolute; margin-left: -1.3em; }
		li>a{ color: red; }		</style>
		<script>
			$(function() {
				$( "#sortable" ).sortable();
				$( "#sortable" ).disableSelection();
			});
		</script>
	</head>
	<body>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="true" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/fandraft">FanDraft</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="nav navbar-nav">
						<sec:ifLoggedIn><li<g:if test="${tab == 'account'}"> class="active"</g:if>><g:link controller="user" action="edit" id="${sec.loggedInUserInfo(field:"id")}">Account <span class="sr-only">(current)</span></g:link></li></sec:ifLoggedIn>
						<sec:ifLoggedIn><li<g:if test="${tab == "teams"}"> class="active"</g:if>><g:link controller="team" action="myindex" id="${sec.loggedInUserInfo(field:"id")}">My Teams <span class="sr-only">(current)</span></g:link></li></sec:ifLoggedIn>
						<!--li<g:if test="${tab == "players"}"> class="active"</g:if>><a id="draftLink" href="/fandraft/team/create">Players <span class="sr-only">(current)</span></a></li-->

					</ul>
					<ul class="nav navbar-nav navbar-right">

						<sec:ifLoggedIn>
							<li>
								<a id="logoutLink" name="logoutLink" href="/fandraft/logout/index"><span class="glyphicon glyphicon-log-in"></span> Logout<span class=" sr-only">(current)</span></a>
							</li>
						</sec:ifLoggedIn>
						<sec:ifNotLoggedIn>
							<li>
								<a id="loginlink" name="loginLink" href="/fandraft/login/auth"><span class="glyphicon glyphicon-log-in"></span> Login</a> <span class="sr-only">(current)</span>
							</li>
							<li>
								<a id="createuserlink" name="createuserlink" href="/fandraft/user/create"><span class="glyphicon glyphicon-sign-up"></span> Sign-up</a> <span class="sr-only">(current)</span>
							</li>
						</sec:ifNotLoggedIn>
						</li>
					</ul>

				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>
		<!--div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div-->
		<g:layoutBody/>
		<!--div class="footer" role="contentinfo"></div-->
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

	</body>
</html>
