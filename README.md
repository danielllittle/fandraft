# fandraft 
 
## [draft version - please refrain from complete review until May 3]

A fantasy baseball draft simulator written in Grails.   Users must be registered to utilize the site.   General users are free to sign-up, create a new team within an existing league.   League manager users are additonally allowed to create new leagues with various custom options.   League managers are also allowed to pick the date and time of the draft, the # of teams that participate within the league and whether the league consists of National League only, American League or a combination league of both american and national league players.

Leagues are initially created by a league manager.  Each league is assigned a scheduled draft date and time.   Up and until that draft time, any user is invited to join the league and create a member team until the league is full of teams.   Should the league not fill up entirely at the point of the draft, a computer team will fill in to complete the league.  Each time is allowed to customize their draft player board according to their own preferences.   Each league member has their own assigned draft priority.   The draft is executed as a 'snake-draft' for the first round and every odd subsequent round the draft priority of each team is followed in ascending order.   For every even round of the draft, the priority is reversed and the draft is executed in descending order.

Dependencies:

1. Quartz plugin for Grails - [Job execution] - compile "org.grails.plugins:quartz:1.0.2"
2. Spring Security Core Plugin - [User Role Mgmt] - compile "org.grails.plugins:spring-security-core:2.0.0"
