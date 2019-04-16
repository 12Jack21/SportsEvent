package po;

public class Participate {
    /*TODO 是否要添加 participate表的自增主键，以减少tempscore表的外键数量
      TODO 相应的mapper文件也应该修改*/
    private Athlete athlete;
    private Competition competition;
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

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}
