package cscie56.fandraft

class League {

    String name;
    String color;
    int size;
    User manager;
    Date draftDate;
    boolean drafted;
    DraftPool draftPool;



    static constraints = {
        name blank: false
        manager nullable: false
        draftDate nullable: false
        size min: 4, max: 12
    }

    static hasMany = [teams: Team]

}
