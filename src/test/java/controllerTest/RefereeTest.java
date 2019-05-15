package controllerTest;

import baseTest.BaseTest;
import dao.AthleteDAO;
import dao.JudgeDAO;
import dao.ParticipateDAO;
import dao.TempScoreDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import po.Athlete;
import po.Judge;
import po.TempScore;
import vo.AthTempListNormal;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class RefereeTest extends BaseTest {
    @Autowired
    JudgeDAO judgeDAO;
    @Autowired
    TempScoreDAO tempScoreDAO;
    @Autowired
    ParticipateDAO participateDAO;
    @Autowired
    AthleteDAO athleteDAO;

    @Test
    public void testGetNormalList(){
        int jud_id = 14;
        Judge j = judgeDAO.getJudge(jud_id);
        List<Integer> athIds = participateDAO.getAthByCompGroup(j.getCompetition().getId(),j.getGroupno());

        List<AthTempListNormal> listNormals = new ArrayList<>();
        AthTempListNormal normal = null;
        TempScore t = null;
        for(Integer i:athIds){
            t = tempScoreDAO.getAthScoreListNormal(jud_id,i);
            normal = new AthTempListNormal();
            if(t != null){
                normal.setAthlete(t.getAthlete());
                normal.setScore(t.getScore());
                normal.setIsValid(t.getIsValid());

            }else {
                Athlete a = athleteDAO.getAthlete(i);
                normal.setAthlete(a);
            }
            listNormals.add(normal);

        }
    }

    @Test
    public void getSingleAthLog(){
        int jud_id = 14,athid = 2;

        List<TempScore> logs = tempScoreDAO.getSingleAthTemp(jud_id, athid);


    }
}
