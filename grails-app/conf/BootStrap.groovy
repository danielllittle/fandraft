import cscie56.fandraft.League
import cscie56.fandraft.Player
import cscie56.fandraft.Position
import cscie56.fandraft.UserRole
import cscie56.fandraft.Role
import cscie56.fandraft.User
import cscie56.fandraft.Team
import cscie56.fandraft.job.DraftJob
import cscie56.fandraft.stats.BattingStats
import cscie56.fandraft.stats.PitchingStats

import java.awt.Color

class BootStrap {

    def init = { servletContext ->

        def keys = ['playerID','birthYear','firstName','lastName','weight','height','bats','throows']

        def battingkeys = ['year','team','league','games','atBats','runs','hits','doubles','triples','homeRuns',
                           'rbis','stolenBases','caughtStealing','walks','strikeouts','intentionalWalks','hitByPitch',
                           'sacrificeHits','sacrificeFlys','gidp']

        def pitchingkeys = ['year','team','wins','losses','games','gamesStarted','completeGames','shutouts','saves','hits','earnedRuns','homeRuns'
                            ,'intentionalWalks','strikeouts','wildPitches','balks']


        League bootstrapleague = new League(drafted: false, name: 'The bootstrap league');
        League sunshineLeague = new League(drafted: false, name: 'Sunshine League');

        def reader = new File("grails-app/conf/resources/Master.csv").toCsvMapReader([batchSize:50])
        reader.each{ batchList ->
           batchList.each { map ->
                if (map['playerID']?.length() > 0 && map['firstName']?.length() > 0 && map['lastName']?.length() > 0 && map['finalGame']?.startsWith("2015")) {
                    //println "saved: " + map.subMap(keys << 'finalGame')
                    def player = new Player(map.subMap(keys)).save(failOnError: true)
                    bootstrapleague.draftPool.addToPlayers(player)

                } else {
                    //println "rejected: " + map.subMap(keys << 'finalGame')
                }
            }
        }
        println "reading batting stats"
        def batReader = new File("grails-app/conf/resources/Batting.csv").toCsvMapReader([batchSize:50])
        batReader.each{ batchList ->
            batchList.each { map ->
                Player player = Player.findByPlayerID( map['playerID'])
                if (player != null) {
                    def bstats = new BattingStats(map.subMap(battingkeys))
                    if (bstats.validate()) {
                        bstats.save(failOnError: true)
                        player.addToBattingStats(bstats)
                        //println "added batting stats: " + map['playerID'] + " : " + bstats
                    } else {
                        println "rejected: " + map
                    }

                } else {
                    //println "couldn't locate " + map['playerID']
                }
            }
        }

        println "reading pitchin stats"
        def pitchingReader = new File("grails-app/conf/resources/Pitching.csv").toCsvMapReader([batchSize:50])
        pitchingReader.each{ batchList ->
            batchList.each { map ->
                Player player = Player.findByPlayerID( map['playerID'])
                if (player != null) {
                    def pstats = new PitchingStats(map.subMap(pitchingkeys))
                    if (pstats.validate()) {
                        pstats.save(failOnError: true)
                        player.addToPitchingStats(pstats)
                        println "added pitching stats: " + map['playerID'] + " : " + pstats

                    } else {
                        pstats.errors.allErrors.each{println it}
                        println "rejected: " + map
                    }

                } else {
                    println "couldn't locate " + map['playerID']
                }
            }
        }

        println "reading fielding stats"
        def fieldingReader = new File("grails-app/conf/resources/Fielding.csv").toCsvMapReader([batchSize:50])
        fieldingReader.each{ batchList ->
            batchList.each { map ->
                if ("2015".equals(map['yearID'])){
                    Player player = Player.findByPlayerID( map['playerID'])
                    if (player) {
                        switch (map['POS']) {
                            case "2B":
                                player.position = Position.SECOND_BASE;
                                break;
                            case "3B":
                                player.position = Position.THIRD_BASE;
                                break;
                            case "1B":
                                player.position = Position.FIRST_BASE;
                                break;
                            case "SS":
                                player.position = Position.SHORT_STOP;
                                break;
                            case "C":
                                player.position = Position.CATCHER;
                                break;
                            case "RF":
                            case "LF":
                            case "CF":
                            case "OF":
                                player.position = Position.OUTFIELD
                                break
                            case "P":
                                player.position = Position.STARTING_PITCHER
                                break
                            default:
                                println "not added " + map['POS']
                                break
                        }

                    } else {
                        //println "couldn't locate " + map['playerID']
                    }
                    player.team = map['teamID']
                }
            }
        }
        println "leage size before pruning batters: " + bootstrapleague.draftPool.players.size();
        bootstrapleague.draftPool.players.removeAll{ it ->
            it.position != Position.STARTING_PITCHER && it.battingStats.find{bs -> bs.year == 2015}.games < 81

        }
        println "leage size after pruning batters: " + bootstrapleague.draftPool.players.size();

        println "leage size before pruning pitchers: " + bootstrapleague.draftPool.players.size();
        bootstrapleague.draftPool.players.removeAll{ it ->
            it.position == Position.STARTING_PITCHER && it.pitchingStats.find{bs -> bs.year == 2015}.gamesStarted < 15

        }
        println "leage size after pruning pitchers: " + bootstrapleague.draftPool.players.size();


        Player.list().each {println it.firstName + it.lastName + it.bats + it.birthYear}

        def adminRole = Role.findOrSaveWhere(authority : "ROLE_ADMIN")
        def adminUser = User.findOrSaveWhere(username: "admin", password: 'admin')

        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create(adminUser, adminRole, true);
        }



        /*Position.each { pos ->
            20.times { idx ->
                Player player = new Player(firstName:  'fn-' + pos + '-' + idx, lastName: 'ln-' + pos + '-' + idx,
                        position: pos, 'playerID': 'pid-'+ pos + '-' + idx)
                player.save(failOnError: true)
                league.draftPool.addToPlayers(player)
            }
        }*/


        def userRole = Role.findOrSaveWhere(authority : "ROLE_USER")
        (1..10).each { it ->
            def testUser = User.findOrSaveWhere(username: "test" + it, password: 'test' + it)

            if (!testUser.authorities.contains(userRole)) {
                UserRole.create(testUser, userRole, true);
            }
            Team team = new Team(owner: testUser, name: 'team' + it, league: bootstrapleague, draftPosition: 1)
            println "copying league draftboard (size:"+bootstrapleague.draftPool.players.size() + ") to team: " + team
            bootstrapleague.draftPool.players.each {team.addToDraftBoard(it)}
            if (it == 1) {
                team.name = "The A's have it"
            } else if (it == 2) {
                team.name = "Lefties first"
                team.draftBoard.sort(true, {a,b ->  a?.throows <=> b?.throows})
            } else if (it == 3) {
                team.name = "Oldies but Goodies"
                team.draftBoard.sort(true, {a,b ->  a?.birthYear <=> b?.birthYear})
            } else if (it == 4) {
                team.name = "Z thing"
                team.draftBoard.reverse(true)
            } else if (it == 5) {
                team.name = "Big Boppers"
                team.draftBoard.sort(true, {a,b -> b?.battingStats.homeRuns.sum() <=> a?.battingStats.homeRuns.sum()})
            } else if (it == 6) {

                team.name = "Boston Strong"
                team.draftBoard.sort(true, {a,b ->
                    //def ateam = a.battingStats.find{bs -> bs.year == 2015}?.team
                    //def bteam = b.battingStats.find{bs -> bs.year == 2015}?.team
                    if ("BOS".equals(a.team) && "BOS".equals(b.team)) 0
                    else if ("BOS".equals(a.team)) 1
                    else if ("BOS".equals(b.team)) -1
                    else  0})
            } else if (it == 7) {
                team.name = "Young n restless"
                team.draftBoard.sort(true, {a,b ->  b?.birthYear <=> a?.birthYear})
            } else if (it == 8) {
                team.name = "Fans dig the long name"
                team.draftBoard.sort(true, {a,b -> b.fullName.length() <=> a.fullName.length()})
            } else if (it == 9) {
                team.name = "Road runners"
                team.draftBoard.sort(true, {a,b -> b?.battingStats?.stolenBases?.sum() <=> a?.battingStats?.stolenBases?.sum()})
            } else if (it == 10) {
                team.name = "Journeymen Players"
                team.draftBoard.sort(true, {a,b -> b?.battingStats?.team?.unique().size() <=> a?.battingStats?.team?.unique().size()})
            }
            bootstrapleague.addToTeams(team)
            bootstrapleague.manager = testUser
        }
        bootstrapleague.draftDate = new Date().next()//ready to be picked up tomorrow
        bootstrapleague.save(failOnError: true)

        sunshineLeague.addToTeams(new Team(owner: User.findByUsername("test1"), name: "60 Feet 6 inches", league: sunshineLeague, draftPosition: 1))
        sunshineLeague.addToTeams(new Team(owner: User.findByUsername("test2"), name: "The Bambino curse is over", league: sunshineLeague, draftPosition: 1))
        sunshineLeague.manager = User.findByUsername("test1")
        sunshineLeague.draftDate = new Date()

        sunshineLeague.teams.each { team ->
            bootstrapleague.draftPool.players.each {team.addToDraftBoard(it)}
            Collections.shuffle(team.draftBoard, new Random())
        }
        sunshineLeague.save(failOnError: true)
        DraftJob.triggerNow()

    }
    def destroy = {
    }
}
