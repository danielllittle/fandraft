package cscie56.fandraft

class League {

    String name;
    User manager;
    Date draftDate;
    boolean drafted;



    static constraints = {
        name blank: false
        manager nullable: false
        draftDate nullable: false
    }

    static hasMany = [teams: Team]


}
