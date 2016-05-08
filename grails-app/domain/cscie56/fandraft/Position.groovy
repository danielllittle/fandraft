package cscie56.fandraft

enum Position {

    CATCHER("C"), FIRST_BASE("1B"),
    SECOND_BASE("2B"), SHORT_STOP("SS"),
    THIRD_BASE("3B"), OUTFIELD("OF"),
    STARTING_PITCHER("SP"), RELIEF_PITCHER("RP")

    private Position(String value) {
        this.value = value
    }

    private final String value

    public String getValue(){
        return value
    }

    @Override
    public String toString() {
        value
    }

    /*static List<Position> getBatters () {
        [CATCHER("C"), FIRST_BASE("1B"),
        SECOND_BASE("2B"), SHORT_STOP("SS"),
        THIRD_BASE("3B"), OUTFIELD("OF")]
    }

    static List<Position> getPitchers() {
        [STARTING_PITCHER("SP"), RELIEF_PITCHER("RP")]
    }*/
}
