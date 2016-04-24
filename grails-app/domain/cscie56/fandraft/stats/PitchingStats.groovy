package cscie56.fandraft.stats

class PitchingStats {

    //playerID,yearID,stint,teamID,lgID,W,L,G,GS,CG,SHO,SV,IPouts,H,ER,HR,BB,SO,BAOpp,ERA,IBB,WP,HBP,BK,BFP,GF,R,SH,SF,GIDP

    int year
    String team
    int wins
    int losses
    int games
    int gamesStarted
    int completeGames
    int shutouts
    int saves
    int hits
    int earnedRuns
    int homeRuns
    int walks
    int strikeouts
    int intentionalWalks
    int wildPitches
    int balks

    static constraints = {
    }
}
