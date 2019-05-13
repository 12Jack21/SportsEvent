package po;

import vo.CompetitionVO;

public class Sign {
    private Competition competition;
    private CompetitionVO competitionVO;
    private Team team;
    private int isSign;

    public Sign() {
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

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public int getIsSign() {
        return isSign;
    }

    public void setIsSign(int isSign) {
        this.isSign = isSign;
    }
}
