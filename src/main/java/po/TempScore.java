package po;

public class TempScore {
    private int id;
    private int athid;
    private int jud_id;
    private double score;
    private Integer isValid;

    private Athlete athlete;
    private Judge judge;

    public TempScore() {
    }

    public TempScore(int athid, double score, Judge judge) {
        this.athid = athid;
        this.score = score;
        this.judge = judge;
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

    public int getJud_id() {
        return jud_id;
    }

    public void setJud_id(int jud_id) {
        this.jud_id = jud_id;
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

    public Judge getJudge() {
        return judge;
    }

    public void setJudge(Judge judge) {
        this.judge = judge;
    }

    public Athlete getAthlete() {
        return athlete;
    }

    public void setAthlete(Athlete athlete) {
        this.athlete = athlete;
    }
}
