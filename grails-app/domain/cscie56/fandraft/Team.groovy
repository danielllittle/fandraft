package cscie56.fandraft

class Team {

    String name;

    int draftPosition;

    static hasMany = [players : Player]

    static belongsTo = [owner: User, league : League]

    static constraints = {
        owner nullable: false
        league nullable: false
        name blank: false
        draftPosition min: 1
    }
}
