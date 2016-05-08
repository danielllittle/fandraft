package cscie56.fandraft

class Team {

    String name;

    int draftPosition;




    static hasMany = [players : Player, draftBoard : Player]
    List draftBoard



    static belongsTo = [owner: User, league : League]

    static constraints = {
        owner nullable: false
        league nullable: false
        name blank: false
        draftPosition min: 1
    }

    @Override
    public String toString() {
        name
    }
}
