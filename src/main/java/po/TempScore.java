package po;

public class TempScore {
    private int id;
    private int athid;
    private int refid;
    private int compid;
    private double score;
    private int valid;

    private Athlete athlete;
    private Referee referee;

    public TempScore() {
    }

    public TempScore(int athid, int refid, int compid, double score) {
        this.athid = athid;
        this.refid = refid;
        this.compid = compid;
        this.score = score;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAthid() {
        return athid;
    }

    public void setAthid(int athid) {
        this.athid = athid;
    }

    public int getRefid() {
        return refid;
    }

    public void setRefid(int refid) {
        this.refid = refid;
    }

    public int getCompid() {
        return compid;
    }

    public void setCompid(int compid) {
        this.compid = compid;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public int getValid() {
        return valid;
    }

    public void setValid(int valid) {
        this.valid = valid;
    }

    public Athlete getAthlete() {
        return athlete;
    }

    public void setAthlete(Athlete athlete) {
        this.athlete = athlete;
    }

    public Referee getReferee() {
        return referee;
    }

    public void setReferee(Referee referee) {
        this.referee = referee;
    }
}
