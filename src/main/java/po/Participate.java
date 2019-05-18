package po;

import vo.CompetitionVO;

public class Participate {
    private Athlete athlete;
    private Competition competition;
    private CompetitionVO competitionVO;

    private int groupno;
    private Double score;

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

    public CompetitionVO getCompetitionVO() {
        return competitionVO;
    }

    public void setCompetitionVO(CompetitionVO competitionVO) {
        this.competitionVO = competitionVO;
    }

    public int getGroupno() {
        return groupno;
    }

    public void setGroupno(int groupno) {
        this.groupno = groupno;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }
}
