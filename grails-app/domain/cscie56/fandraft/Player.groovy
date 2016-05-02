package cscie56.fandraft

class Player {

    String name;
    Position position

    static constraints = {
        name blank: false
        position nullable: false
    }
}
