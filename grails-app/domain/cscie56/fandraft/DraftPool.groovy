package cscie56.fandraft

class DraftPool {

    List players

    static hasMany = [players: Player]

    static belongsTo = [league: League]

    static constraints = {

    }
}
