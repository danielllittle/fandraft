package cscie56.fandraft

import static cscie56.fandraft.Position.*

class League {

    String name;
    int getSize() {teams?.size()};
    User manager;
    Date draftDate;
    boolean drafted;
    def roster = [STARTING_PITCHER, STARTING_PITCHER, STARTING_PITCHER, STARTING_PITCHER, STARTING_PITCHER,
                  /*RELIEF_PITCHER, RELIEF_PITCHER,*/ CATCHER, FIRST_BASE, SECOND_BASE, SHORT_STOP,  THIRD_BASE,
                  OUTFIELD, OUTFIELD, OUTFIELD ]
    DraftPool draftPool = new DraftPool();

    static constraints = {
        name blank: false
        manager nullable: false
        draftDate nullable: true, min: new Date()
    }

    static hasMany = [teams: Team]

    @Override
    String toString() {
        name
    }

}
