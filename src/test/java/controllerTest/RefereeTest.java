package controllerTest;

import baseTest.BaseTest;
import dao.AthleteDAO;
import dao.JudgeDAO;
import dao.ParticipateDAO;
import dao.TempScoreDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import po.*;
import vo.AthTempListNormal;
import vo.RefTempListMajor;

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

    private static final double DELTA = 1e-15;


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

    @Test
    public void majorConfirm(){
        int compid = 2,athid =1,refId = 1;
        Judge judge = judgeDAO.getJudgeByRefComp(compid,refId);
        //显示运动员信息 和最终成绩
        Participate par = participateDAO.getSingleAthById(compid, athid);

        List<Referee> referees = judgeDAO.getJudgeByCompGroup(compid,judge.getGroupno());
        List<RefTempListMajor> listMajors = new ArrayList<>();
        RefTempListMajor major = null;
        TempScore t = null;


        for(Referee r:referees){
            major = new RefTempListMajor();
            t = tempScoreDAO.getNewestScoreOfRef(compid,r.getId(),athid);
            if(t != null){
                major.setReferee(r);
                major.setTempScore_id(t.getId());
                major.setScore(t.getScore());
                major.setIsValid(t.getIsValid());

            }else {
                major.setReferee(r);
            }

            listMajors.add(major);
        }

    }

}

