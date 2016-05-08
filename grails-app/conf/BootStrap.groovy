import cscie56.fandraft.League
import cscie56.fandraft.Player
import cscie56.fandraft.Position
import cscie56.fandraft.UserRole
import cscie56.fandraft.Role
import cscie56.fandraft.User
import cscie56.fandraft.Team
import cscie56.fandraft.job.DraftJob
import cscie56.fandraft.stats.BattingStats

import java.awt.Color

class BootStrap {

    def init = { servletContext ->
/*
        def keys = ['playerID','birthYear','firstName','lastName','weight','height','bats','throows']

        def battingkeys = ['year','team','league','games','atBats','runs','hits','doubles','triples','homeRuns',
                           'rbis','stolenBases','caughtStealing','walks','strikeouts','intentionalWalks','hitByPitch',
                           'sacrificeHits','sacrificeFlys','gidp']


        def reader = new File("grails-app/conf/resources/Master.csv").toCsvMapReader([batchSize:50])
        reader.each{ batchList ->
           batchList.each { map ->
                if (map['playerID']?.length() > 0 && map['firstName']?.length() > 0 && map['lastName']?.length() > 0 && map['finalGame']?.startsWith("2015")) {
                    println "saved: " + map.subMap(keys << 'finalGame')
                    new Player(map.subMap(keys)).save(failOnError: true)
                    println "saved: " + map.subMap(keys << 'finalGame')
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
                        println "added batting stats: " + map['playerID'] + " : " + bstats
                    } else {
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
                        println "couldn't locate " + map['playerID']
                    }
                }
            }
        }

        Player.list().each {println it.firstName + it.lastName + it.bats + it.birthYear}
*/
        def adminRole = Role.findOrSaveWhere(authority : "ROLE_ADMIN")
        def adminUser = User.findOrSaveWhere(username: "admin", password: 'admin')

        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create(adminUser, adminRole, true);
        }

        League league = new League(drafted: false, name: 'bootstrap', color: Color.red);

        Position.each { pos ->
            20.times { idx ->
                Player player = new Player(firstName:  'fn-' + pos + '-' + idx, lastName: 'ln-' + pos + '-' + idx,
                        position: pos, 'playerID': 'pid-'+ pos + '-' + idx)
                player.save(failOnError: true)
                league.draftPool.addToPlayers(player)
            }
        }


        def userRole = Role.findOrSaveWhere(authority : "ROLE_USER")
        (1..4).each { it ->
            def testUser = User.findOrSaveWhere(username: "test" + it, password: 'test' + it)

            if (!testUser.authorities.contains(userRole)) {
                UserRole.create(testUser, userRole, true);
            }
            Team team = new Team(owner: testUser, name: 'team' + it, league: league, draftPosition: 1)
            league.draftPool.players.each {team.addToDraftBoard(it)}
            league.addToTeams(team)
            league.manager = testUser
            if (it == 12 || it == 6) {
                team.draftBoard.reverse(true)
            }
        }
        league.draftDate = new Date() //ready to be picked up
        league.save(failOnError: true)

        DraftJob.triggerNow()

    }
    def destroy = {
    }
}
