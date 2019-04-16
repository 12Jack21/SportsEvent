package po;

public class TempScore {
    private int id;
    private int refid;
    private int compid;
    private int athid;
    private double score;
    private Integer isValid;

    private Athlete athlete;
    private Referee referee;

    public TempScore() {
    }

    public TempScore(int refid, int compid, int athid, double score) {
        this.refid = refid;
        this.compid = compid;
        this.athid = athid;
        this.score = score;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getAthid() {
        return athid;
    }

    public void setAthid(int athid) {
        this.athid = athid;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public Integer getIsValid() {
        return isValid;
    }

    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
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
