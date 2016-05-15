package cscie56.fandraft.stats

class BattingStats {

    String team
    int year
    int games
    String atBats
    String runs
    String hits
    String league
    String doubles
    String triples
    int homeRuns
    String rbis
    int stolenBases
    String caughtStealing
    String walks
    String strikeouts
    String intentionalWalks
    String hitByPitch
    String sacrificeHits
    String sacrificeFlys
    String gidp

    static constraints = {
    }
    static mapping = {
        cache usage:'read-only'
    }
}
