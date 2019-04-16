package po;

public class Judge {
    private Referee referee;
    private Competition competition;
    private int reftype;

    public Judge() {
    }

    public Judge(Referee referee, Competition competition, int reftype) {
        this.referee = referee;
        this.competition = competition;
        this.reftype = reftype;
    }

    public Referee getReferee() {
        return referee;
    }

    public void setReferee(Referee referee) {
        this.referee = referee;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public int getReftype() {
        return reftype;
    }

    public void setReftype(int reftype) {
        this.reftype = reftype;
    }
}
