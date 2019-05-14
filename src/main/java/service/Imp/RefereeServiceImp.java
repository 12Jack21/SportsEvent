package service.Imp;

import dao.JudgeDAO;
import dao.ParticipateDAO;
import dao.RefereeDAO;
import dao.TempScoreDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.Judge;
import po.Participate;
import po.Referee;
import po.TempScore;
import service.RefereeService;

import java.util.List;

@Service
public class RefereeServiceImp implements RefereeService {
    @Autowired
    private RefereeDAO refereeDAO;
    @Autowired
    private ParticipateDAO participateDAO;
    @Autowired
    private JudgeDAO judgeDAO;
    @Autowired
    private TempScoreDAO tempScoreDAO;


    @Override
    public boolean canLogin(Referee referee) {
        String user = refereeDAO.getUser(referee.getName());
        return user.equals(referee.getUser());
    }

    @Override
    public boolean isMajorReferee(int refid, int compid) {
        int refType = judgeDAO.getReftype(refid, compid);
        return refType != 0;
    }

    @Override
    public Referee getReferee(int refid) {
        return refereeDAO.getReferee(refid);
    }

    @Override
    public List<Judge> getJudges(int refid, int refType) {
        return judgeDAO.getJudgesByRef(refid,refType);
    }

    @Override
    public Judge getJudgeByRefComp(int compid, int refid) {
        return judgeDAO.getJudgeByRefComp(compid, refid);
    }

    @Override
    public boolean addScore(Judge judge, int athid, double score) {
        TempScore t = new TempScore(athid,score,judge);
        return tempScoreDAO.addTempScore(t);
    }

    @Override
    public boolean checkScore(int tempid, int isValid) {
        return tempScoreDAO.updateTempScore(tempid,isValid);
    }

    @Override
    public List<TempScore> getAthleteTempScores(int athid,int compid) {
        return tempScoreDAO.getAthTempScores(athid, compid);
    }

    @Override
    public double figureResultScore(double D, double P, int athid, int compid) {
        Double avgScore = tempScoreDAO.getAthResultScore(athid, compid);
        return avgScore + D - P;
    }

    @Override
    public List<Participate> getAthleteRank(int compid) {
        return participateDAO.getAthletesRankByComp(compid);
    }

    @Override
    /**
    *自定义取前十名参加决赛
    * */
    public List<Participate> getFinalCompAthletes(int compid) {
        List<Participate> participates = participateDAO.getAthletesRankByComp(compid);
        return participates.subList(0,10);//包含0 不包含 10
    }
}
