package cscie56.fandraft

import cscie56.fandraft.stats.BattingStats
import cscie56.fandraft.stats.PitchingStats

class Player {

    String firstName
    String lastName
    Position position
    String bats
    String birthYear
    String throows
    String playerID
    String weight
    String height;
    String debut;

    static hasMany = [battingStats : BattingStats, pitchingStats : PitchingStats]

    static constraints = {
        birthYear nullable: true
        playerID blank: false, unique: true
        position nullable: true
        debut nullable: true
        bats nullable: true
        height nullable: true
        throows nullable: true
        weight nullable: true

    }

    String getFullName() {
        firstName + " " + lastName
    }
}
