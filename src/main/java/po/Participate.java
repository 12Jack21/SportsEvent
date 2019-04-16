package po;

public class Participate {
    private Athlete athlete;
    private Competition competition;
    private int groupno;
    private double score;

    public Participate() {
    }

    public Participate(Athlete athlete, Competition competition) {
        this.athlete = athlete;
        this.competition = competition;
    }

    public Athlete getAthlete() {
        return athlete;
    }

    public void setAthlete(Athlete athlete) {
        this.athlete = athlete;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public int getGroupno() {
        return groupno;
    }

    public void setGroupno(int groupno) {
        this.groupno = groupno;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}
