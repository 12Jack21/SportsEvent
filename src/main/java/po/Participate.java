package po;

public class Participate {
    private int athid;
    private int compid;
    private double score;

    public Participate(int athid, int compid) {
        this.athid = athid;
        this.compid = compid;
    }

    public int getAthid() {
        return athid;
    }

    public void setAthid(int athid) {
        this.athid = athid;
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
}
