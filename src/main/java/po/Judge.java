package po;

public class Judge {
    private int id;
    private Referee referee;
    private Competition competition;
    private int groupno;
    private int reftype;

    public Judge() {
    }

    public Judge(Referee referee, Competition competition, int groupno, int reftype) {
        this.referee = referee;
        this.competition = competition;
        this.groupno = groupno;
        this.reftype = reftype;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getGroup() {
        return groupno;
    }

    public void setGroup(int groupno) {
        this.groupno = groupno;
    }

    public int getReftype() {
        return reftype;
    }

    public void setReftype(int reftype) {
        this.reftype = reftype;
    }
}
